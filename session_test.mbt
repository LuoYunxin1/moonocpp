///|
test "session matches call result by uniqueId" {
  let session = new_session()
  let req : BootNotificationReq = {
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
  let outbound = unwrap_ocpp(session.send_call(Request::BootNotification(req)))
  assert_eq(session.pending_count(), 1)
  let decoded = unwrap_ocpp(decode_request_call(outbound))
  let conf : BootNotificationConf = {
    current_time: "2013-02-01T20:53:32.486Z",
    interval: 300,
    status: RegistrationStatus::Accepted,
  }
  let reply = unwrap_ocpp(encode_response_result(decoded.unique_id, Response::BootNotification(conf)))
  match unwrap_ocpp(session.receive(reply)) {
    IncomingResult(uid, action, Response::BootNotification(v)) => {
      assert_eq(uid, decoded.unique_id)
      assert_eq(action, "BootNotification")
      assert_eq(v.interval, 300)
    }
    _ => abort("session result")
  }
  assert_eq(session.pending_count(), 0)
}

///|
test "duplicate uniqueId is rejected" {
  let session = new_session()
  unwrap_ocpp(session.track("1", "Heartbeat"))
  match session.track("1", "Heartbeat") {
    Err(UniqueId(_)) => ()
    _ => abort("duplicate")
  }
}
