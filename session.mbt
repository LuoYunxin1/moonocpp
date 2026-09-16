///|
/// Pending CALL uniqueId matching for one OCPP 1.6 JSON peer.

///|
pub(all) struct PendingCall {
  unique_id : String
  action : String
} derive(Eq, Debug)

///|
pub(all) struct Session {
  mut next_seq : Int
  mut pending : Array[PendingCall]
}

///|
pub fn new_session() -> Session {
  { next_seq: 1, pending: [] }
}

///|
pub fn Session::pending_count(self : Session) -> Int {
  self.pending.length()
}

///|
pub fn Session::allocate_unique_id(self : Session) -> String {
  let n = self.next_seq
  self.next_seq = n + 1
  n.to_string()
}

///|
pub fn Session::track(self : Session, unique_id : String, action : String) -> Result[Unit, OcppError] {
  match require_unique_id(unique_id) {
    Err(e) => return Err(e)
    Ok(_) => ()
  }
  if !known_action(action) {
    return Err(UnknownAction(action))
  }
  for i in 0..<self.pending.length() {
    if self.pending[i].unique_id == unique_id {
      return Err(UniqueId("duplicate uniqueId"))
    }
  }
  self.pending.push({ unique_id, action })
  Ok(())
}

///|
pub fn Session::take(self : Session, unique_id : String) -> Result[PendingCall, OcppError] {
  for i in 0..<self.pending.length() {
    if self.pending[i].unique_id == unique_id {
      let item = self.pending[i]
      self.pending.remove(i) |> ignore
      return Ok(item)
    }
  }
  Err(UniqueId("unknown uniqueId"))
}

///|
pub fn Session::send_call(self : Session, request : Request) -> Result[String, OcppError] {
  match validate_request(request) {
    Err(e) => return Err(e)
    Ok(_) => ()
  }
  let unique_id = self.allocate_unique_id()
  match self.track(unique_id, request.action()) {
    Err(e) => return Err(e)
    Ok(_) => ()
  }
  encode_request_call(unique_id, request)
}

///|
pub(all) enum Incoming {
  IncomingCall(DecodedCall)
  IncomingResult(String, String, Response)
  IncomingError(CallErrorMessage)
} derive(Eq, Debug)

///|
pub fn Session::receive(self : Session, text : String) -> Result[Incoming, OcppError] {
  match decode_envelope(text) {
    Err(e) => Err(e)
    Ok(Call(msg)) => {
      match decode_request(msg.action, msg.payload) {
        Err(e) => Err(e)
        Ok(request) => {
          match validate_request(request) {
            Err(e) => Err(e)
            Ok(_) => Ok(IncomingCall({ unique_id: msg.unique_id, request: request }))
          }
        }
      }
    }
    Ok(CallResult(msg)) => {
      match self.take(msg.unique_id) {
        Err(e) => Err(e)
        Ok(pending) => {
          match decode_response(pending.action, msg.payload) {
            Ok(response) => Ok(IncomingResult(msg.unique_id, pending.action, response))
            Err(e) => Err(e)
          }
        }
      }
    }
    Ok(CallError(msg)) => {
      match self.take(msg.unique_id) {
        Err(e) => Err(e)
        Ok(_) => Ok(IncomingError(msg))
      }
    }
  }
}
