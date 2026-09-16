///|
fn boot_req() -> @ocpp.BootNotificationReq {
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
fn main {
  // 1. Charge point boots and then heartbeats.
  let boot = @ocpp.unwrap_ocpp(
    @ocpp.encode_request_call("19223201", @ocpp.Request::BootNotification(boot_req())),
  )
  let hb = @ocpp.unwrap_ocpp(@ocpp.encode_request_call("0", @ocpp.Request::Heartbeat))
  if !boot.contains("BootNotification") || !hb.contains("Heartbeat") {
    abort("boot/heartbeat example failed")
  }
  println("BOOT: " + boot)
  println("HEARTBEAT: " + hb)

  // 2. Start and stop a local authorization transaction.
  let start : @ocpp.StartTransactionReq = {
    connector_id: 1,
    id_tag: "04B4D3A1",
    meter_start: 20,
    timestamp: "2020-01-01T00:00:00Z",
    reservation_id: None,
  }
  let stop : @ocpp.StopTransactionReq = {
    meter_stop: 40,
    timestamp: "2020-01-01T01:00:00Z",
    transaction_id: 44,
    reason: Some(@ocpp.Reason::Local),
    id_tag: Some("04B4D3A1"),
    transaction_data: None,
  }
  let start_text = @ocpp.unwrap_ocpp(
    @ocpp.encode_request_call("tx-1", @ocpp.Request::StartTransaction(start)),
  )
  let stop_text = @ocpp.unwrap_ocpp(
    @ocpp.encode_request_call("tx-2", @ocpp.Request::StopTransaction(stop)),
  )
  if !start_text.contains("StartTransaction") || !stop_text.contains("StopTransaction") {
    abort("transaction example failed")
  }
  println("START: " + start_text)
  println("STOP: " + stop_text)

  // 3. CSMS installs a relative smart-charging profile.
  let period : @ocpp.ChargingSchedulePeriod = {
    start_period: 0,
    limit: 12.0,
    number_phases: Some(3),
  }
  let schedule : @ocpp.ChargingSchedule = {
    charging_rate_unit: @ocpp.ChargingRateUnitType::A,
    charging_schedule_period: [period],
    duration: Some(3600),
    start_schedule: None,
    min_charging_rate: None,
  }
  let profile : @ocpp.ChargingProfile = {
    charging_profile_id: 1,
    stack_level: 0,
    charging_profile_purpose: @ocpp.ChargingProfilePurposeType::TxDefaultProfile,
    charging_profile_kind: @ocpp.ChargingProfileKindType::Relative,
    charging_schedule: schedule,
    transaction_id: None,
    recurrency_kind: None,
    valid_from: None,
    valid_to: None,
  }
  let setp : @ocpp.SetChargingProfileReq = {
    connector_id: 1,
    cs_charging_profiles: profile,
  }
  let profile_text = @ocpp.unwrap_ocpp(
    @ocpp.encode_request_call("cp-1", @ocpp.Request::SetChargingProfile(setp)),
  )
  if !profile_text.contains("csChargingProfiles") {
    abort("charging profile example failed")
  }
  println("PROFILE: " + profile_text)
  println("MoonOCPP acceptance: 3 scenarios passed")
}
