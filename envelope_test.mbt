///|
test "call envelope roundtrip uses integer message type id" {
  let payload = empty_payload()
  let text = unwrap_ocpp(encode_call("19223201", "Heartbeat", payload))
  assert_true(text.contains("[2,"))
  assert_false(text.contains("[2.0,"))
  match decode_envelope(text) {
    Ok(Call(msg)) => {
      assert_eq(msg.unique_id, "19223201")
      assert_eq(msg.action, "Heartbeat")
    }
    _ => abort("expected Call")
  }
}

///|
test "call result and call error envelopes" {
  let ok = unwrap_ocpp(encode_call_result("1", empty_payload()))
  assert_true(ok.contains("[3,"))
  match decode_envelope(ok) {
    Ok(CallResult(msg)) => assert_eq(msg.unique_id, "1")
    _ => abort("expected CallResult")
  }
  let err = unwrap_ocpp(
    encode_call_error(
      "1",
      "OccurrenceConstraintViolation",
      "missing field",
      empty_payload(),
    ),
  )
  assert_true(err.contains("OccurenceConstraintViolation"))
  match decode_envelope(err) {
    Ok(CallError(msg)) => {
      assert_eq(msg.error_code, "OccurenceConstraintViolation")
      assert_eq(msg.error_description, "missing field")
    }
    _ => abort("expected CallError")
  }
}

///|
test "uniqueId bounds" {
  match encode_call("", "Heartbeat", empty_payload()) {
    Err(UniqueId(_)) => ()
    _ => abort("empty uniqueId")
  }
  let long = "abcdefghijklmnopqrstuvwxyz0123456789X"
  assert_eq(long.length(), 37)
  match encode_call(long, "Heartbeat", empty_payload()) {
    Err(UniqueId(_)) => ()
    _ => abort("overlong uniqueId")
  }
}
