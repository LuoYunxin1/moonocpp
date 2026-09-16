///|
pub(all) struct CallMessage {
  unique_id : String
  action : String
  payload : Json
} derive(Eq, Debug)

///|
pub(all) struct CallResultMessage {
  unique_id : String
  payload : Json
} derive(Eq, Debug)

///|
pub(all) struct CallErrorMessage {
  unique_id : String
  error_code : String
  error_description : String
  error_details : Json
} derive(Eq, Debug)

///|
pub(all) enum Envelope {
  Call(CallMessage)
  CallResult(CallResultMessage)
  CallError(CallErrorMessage)
} derive(Eq, Debug)

///|
pub fn Envelope::message_type_id(self : Envelope) -> Int {
  match self {
    Call(_) => 2
    CallResult(_) => 3
    CallError(_) => 4
  }
}

///|
pub fn encode_call(unique_id : String, action : String, payload : Json) -> Result[String, OcppError] {
  match require_unique_id(unique_id) {
    Err(e) => return Err(e)
    Ok(_) => ()
  }
  if action.length() == 0 {
    return Err(Protocol("action must not be empty"))
  }
  Ok(
    Json::array([
        json_int(2),
        Json::string(unique_id),
        Json::string(action),
        payload,
      ],
    ).stringify(),
  )
}

///|
pub fn encode_call_result(unique_id : String, payload : Json) -> Result[String, OcppError] {
  match require_unique_id(unique_id) {
    Err(e) => return Err(e)
    Ok(_) => ()
  }
  Ok(
    Json::array([json_int(3), Json::string(unique_id), payload]).stringify(),
  )
}

///|
pub fn encode_call_error(
  unique_id : String,
  error_code : String,
  error_description : String,
  error_details : Json,
) -> Result[String, OcppError] {
  match require_unique_id(unique_id) {
    Err(e) => return Err(e)
    Ok(_) => ()
  }
  if !call_error_code_known(error_code) {
    return Err(PropertyConstraint("unknown CallError code"))
  }
  Ok(
    Json::array([
        json_int(4),
        Json::string(unique_id),
        Json::string(normalize_call_error_code(error_code)),
        Json::string(error_description),
        error_details,
      ],
    ).stringify(),
  )
}

///|
pub fn encode_envelope(env : Envelope) -> Result[String, OcppError] {
  match env {
    Call(msg) => encode_call(msg.unique_id, msg.action, msg.payload)
    CallResult(msg) => encode_call_result(msg.unique_id, msg.payload)
    CallError(msg) =>
      encode_call_error(
        msg.unique_id,
        msg.error_code,
        msg.error_description,
        msg.error_details,
      )
  }
}

///|
pub fn decode_envelope(text : String) -> Result[Envelope, OcppError] {
  match parse_json_text(text) {
    Err(e) => Err(e)
    Ok(json) => decode_envelope_json(json)
  }
}

///|
pub fn decode_envelope_json(json : Json) -> Result[Envelope, OcppError] {
  match json {
    Array(arr) => {
      if arr.length() < 3 {
        return Err(Protocol("OCPP envelope is too short"))
      }
      match json_type_id(arr[0]) {
        Err(e) => Err(e)
        Ok(2) => decode_call_array(arr)
        Ok(3) => decode_call_result_array(arr)
        Ok(4) => decode_call_error_array(arr)
        Ok(other) =>
          Err(Protocol("unsupported MessageTypeId " + other.to_string()))
      }
    }
    _ => Err(FormationViolation("OCPP envelope must be a JSON array"))
  }
}

///|
fn json_type_id(json : Json) -> Result[Int, OcppError] {
  match json {
    Number(n, ..) => {
      if n != n.floor() {
        return Err(TypeConstraint("MessageTypeId must be an integer"))
      }
      Ok(n.to_int())
    }
    _ => Err(TypeConstraint("MessageTypeId must be a number"))
  }
}

///|
fn decode_call_array(arr : Array[Json]) -> Result[Envelope, OcppError] {
  if arr.length() != 4 {
    return Err(Protocol("Call envelope must have 4 elements"))
  }
  match arr[1] {
    String(uid) => {
      match require_unique_id(uid) {
        Err(e) => return Err(e)
        Ok(_) => ()
      }
      match arr[2] {
        String(action) => {
          if action.length() == 0 {
            return Err(Protocol("Call action must not be empty"))
          }
          match arr[3] {
            Object(_) as payload =>
              Ok(Call({ unique_id: uid, action, payload }))
            _ => Err(TypeConstraint("Call payload must be an object"))
          }
        }
        _ => Err(TypeConstraint("Call action must be a string"))
      }
    }
    _ => Err(TypeConstraint("Call uniqueId must be a string"))
  }
}

///|
fn decode_call_result_array(arr : Array[Json]) -> Result[Envelope, OcppError] {
  if arr.length() != 3 {
    return Err(Protocol("CallResult envelope must have 3 elements"))
  }
  match arr[1] {
    String(uid) => {
      match require_unique_id(uid) {
        Err(e) => return Err(e)
        Ok(_) => ()
      }
      match arr[2] {
        Object(_) as payload => Ok(CallResult({ unique_id: uid, payload }))
        _ => Err(TypeConstraint("CallResult payload must be an object"))
      }
    }
    _ => Err(TypeConstraint("CallResult uniqueId must be a string"))
  }
}

///|
fn decode_call_error_array(arr : Array[Json]) -> Result[Envelope, OcppError] {
  if arr.length() != 5 {
    return Err(Protocol("CallError envelope must have 5 elements"))
  }
  match arr[1] {
    String(uid) => {
      match require_unique_id(uid) {
        Err(e) => return Err(e)
        Ok(_) => ()
      }
      match arr[2] {
        String(code) => {
          if !call_error_code_known(code) {
            return Err(PropertyConstraint("unknown CallError code"))
          }
          match arr[3] {
            String(desc) => {
              match arr[4] {
                Object(_) as details =>
                  Ok(
                    CallError(
                      {
                        unique_id: uid,
                        error_code: normalize_call_error_code(code),
                        error_description: desc,
                        error_details: details,
                      },
                    ),
                  )
                _ => Err(TypeConstraint("CallError details must be an object"))
              }
            }
            _ => Err(TypeConstraint("CallError description must be a string"))
          }
        }
        _ => Err(TypeConstraint("CallError code must be a string"))
      }
    }
    _ => Err(TypeConstraint("CallError uniqueId must be a string"))
  }
}

///|
pub fn envelope_unique_id(env : Envelope) -> String {
  match env {
    Call(msg) => msg.unique_id
    CallResult(msg) => msg.unique_id
    CallError(msg) => msg.unique_id
  }
}
