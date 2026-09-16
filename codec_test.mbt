///|
fn sample_boot() -> BootNotificationReq {
  {
    charge_point_model: "SingleSocketCharger",
    charge_point_vendor: "VendorX",
    charge_box_serial_number: None,
    charge_point_serial_number: None,
    firmware_version: None,
    iccid: None,
    imsi: None,
    meter_serial_number: None,
    meter_type: None,
  }
}

///|
test "boot notification omits optional keys and roundtrips" {
  let req = sample_boot()
  let json = req.to_json().stringify()
  assert_true(json.contains("chargePointVendor"))
  assert_false(json.contains("firmwareVersion"))
  let text = unwrap_ocpp(encode_request_call("19223201", Request::BootNotification(req)))
  let decoded = unwrap_ocpp(decode_request_call(text))
  assert_eq(decoded.unique_id, "19223201")
  match decoded.request {
    Request::BootNotification(again) => {
      assert_eq(again.charge_point_vendor, "VendorX")
      assert_eq(again.charge_point_model, "SingleSocketCharger")
    }
    _ => abort("boot")
  }
}

///|
test "heartbeat empty payload" {
  let text = unwrap_ocpp(encode_request_call("0", Request::Heartbeat))
  assert_true(text.contains("{}"))
  let decoded = unwrap_ocpp(decode_request_call(text))
  match decoded.request {
    Request::Heartbeat => ()
    _ => abort("heartbeat")
  }
  let conf : HeartbeatConf = { current_time: "2013-02-01T20:53:32.486Z" }
  let reply = unwrap_ocpp(encode_response_result("0", Response::Heartbeat(conf)))
  let response = unwrap_ocpp(decode_response("Heartbeat", unwrap_ocpp(parse_json_text("{\"currentTime\":\"2013-02-01T20:53:32.486Z\"}"))))
  match response {
    Response::Heartbeat(v) => assert_eq(v.current_time, "2013-02-01T20:53:32.486Z")
    _ => abort("hb conf")
  }
  ignore(reply)
}

///|
test "start and stop transaction with idTagInfo" {
  let start : StartTransactionReq = {
    connector_id: 1,
    id_tag: "04B4D3A1",
    meter_start: 20,
    timestamp: "2020-01-01T00:00:00Z",
    reservation_id: None,
  }
  unwrap_ocpp(validate_start_transaction(start))
  let start_text = unwrap_ocpp(encode_request_call("tx-1", Request::StartTransaction(start)))
  let start_decoded = unwrap_ocpp(decode_request_call(start_text))
  match start_decoded.request {
    Request::StartTransaction(v) => assert_eq(v.meter_start, 20)
    _ => abort("start")
  }
  let info : IdTagInfo = {
    status: AuthorizationStatus::Accepted,
    parent_id_tag: None,
    expiry_date: None,
  }
  let conf : StartTransactionConf = { transaction_id: 44, id_tag_info: info }
  let conf_json = conf.to_json().stringify()
  assert_true(conf_json.contains("idTagInfo"))
  assert_false(conf_json.contains("expiryDate"))
  let stop : StopTransactionReq = {
    meter_stop: 40,
    timestamp: "2020-01-01T01:00:00Z",
    transaction_id: 44,
    reason: Some(Reason::Local),
    id_tag: Some("04B4D3A1"),
    transaction_data: None,
  }
  unwrap_ocpp(validate_stop_transaction(stop))
  let stop_text = unwrap_ocpp(encode_request_call("tx-2", Request::StopTransaction(stop)))
  match unwrap_ocpp(decode_request_call(stop_text)).request {
    Request::StopTransaction(v) => assert_eq(v.transaction_id, 44)
    _ => abort("stop")
  }
}

///|
test "set charging profile nested schedule" {
  let period : ChargingSchedulePeriod = {
    start_period: 0,
    limit: 12.0,
    number_phases: Some(3),
  }
  let schedule : ChargingSchedule = {
    charging_rate_unit: ChargingRateUnitType::A,
    charging_schedule_period: [period],
    duration: Some(3600),
    start_schedule: None,
    min_charging_rate: None,
  }
  let profile : ChargingProfile = {
    charging_profile_id: 1,
    stack_level: 0,
    charging_profile_purpose: ChargingProfilePurposeType::TxDefaultProfile,
    charging_profile_kind: ChargingProfileKindType::Relative,
    charging_schedule: schedule,
    transaction_id: None,
    recurrency_kind: None,
    valid_from: None,
    valid_to: None,
  }
  let req : SetChargingProfileReq = {
    connector_id: 1,
    cs_charging_profiles: profile,
  }
  unwrap_ocpp(validate_set_charging_profile(req))
  let json = req.to_json().stringify()
  assert_true(json.contains("csChargingProfiles"))
  assert_true(json.contains("\"A\""))
  let again = unwrap_ocpp(SetChargingProfileReq::from_json(req.to_json()))
  assert_eq(again.connector_id, 1)
  assert_eq(again.cs_charging_profiles.charging_schedule.charging_schedule_period[0].start_period, 0)
}

///|
test "unknown action and catalog size" {
  assert_eq(supported_action_count(), 39)
  match decode_request("NotAnOcppAction", empty_payload()) {
    Err(UnknownAction(name)) => assert_eq(name, "NotAnOcppAction")
    _ => abort("unknown")
  }
}

///|
test "overlong boot vendor is rejected" {
  let req = sample_boot()
  let bad : BootNotificationReq = {
    charge_point_model: req.charge_point_model,
    charge_point_vendor: "012345678901234567890",
    charge_box_serial_number: None,
    charge_point_serial_number: None,
    firmware_version: None,
    iccid: None,
    imsi: None,
    meter_serial_number: None,
    meter_type: None,
  }
  match validate_boot_notification(bad) {
    Err(PropertyConstraint(_)) => ()
    _ => abort("expected ci overflow")
  }
}
