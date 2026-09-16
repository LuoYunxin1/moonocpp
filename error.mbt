///|
/// OCPP 1.6 JSON application errors. CallError wire codes keep the 1.6
/// spellings FormationViolation and OccurenceConstraintViolation.
pub(all) enum OcppError {
  JsonParse(String)
  Protocol(String)
  FormationViolation(String)
  PropertyConstraint(String)
  OccurrenceConstraint(String)
  TypeConstraint(String)
  NotImplemented(String)
  UnknownAction(String)
  UniqueId(String)
  Security(String)
  Generic(String)
} derive(Eq, Debug)

///|
pub fn OcppError::message(self : OcppError) -> String {
  match self {
    JsonParse(s) => "json: " + s
    Protocol(s) => "protocol: " + s
    FormationViolation(s) => "formation: " + s
    PropertyConstraint(s) => "property: " + s
    OccurrenceConstraint(s) => "occurrence: " + s
    TypeConstraint(s) => "type: " + s
    NotImplemented(s) => "not-implemented: " + s
    UnknownAction(s) => "unknown-action: " + s
    UniqueId(s) => "unique-id: " + s
    Security(s) => "security: " + s
    Generic(s) => "generic: " + s
  }
}

///|
pub fn OcppError::call_error_code(self : OcppError) -> String {
  match self {
    JsonParse(_) => "FormationViolation"
    Protocol(_) => "ProtocolError"
    FormationViolation(_) => "FormationViolation"
    PropertyConstraint(_) => "PropertyConstraintViolation"
    OccurrenceConstraint(_) => "OccurenceConstraintViolation"
    TypeConstraint(_) => "TypeConstraintViolation"
    NotImplemented(_) => "NotImplemented"
    UnknownAction(_) => "NotSupported"
    UniqueId(_) => "ProtocolError"
    Security(_) => "SecurityError"
    Generic(_) => "GenericError"
  }
}

///|
pub fn call_error_code_known(code : String) -> Bool {
  match code {
    "NotImplemented"
    | "NotSupported"
    | "InternalError"
    | "ProtocolError"
    | "SecurityError"
    | "FormationViolation"
    | "FormatViolation"
    | "PropertyConstraintViolation"
    | "OccurenceConstraintViolation"
    | "OccurrenceConstraintViolation"
    | "TypeConstraintViolation"
    | "GenericError" => true
    _ => false
  }
}

///|
pub fn normalize_call_error_code(code : String) -> String {
  match code {
    "FormatViolation" => "FormationViolation"
    "OccurrenceConstraintViolation" => "OccurenceConstraintViolation"
    other => other
  }
}
