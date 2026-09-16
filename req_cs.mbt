///|
/// Central-system originated OCPP 1.6 CALL payloads.

///|
/// CancelReservation.req

///|
pub(all) struct CancelReservationReq {
  reservation_id : Int
} derive(Eq, Debug)

///|
pub fn CancelReservationReq::to_json(self : CancelReservationReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_int(obj, "reservationId", self.reservation_id)
  Json::object(obj)
}

///|
pub fn CancelReservationReq::from_json(json : Json) -> Result[CancelReservationReq, OcppError] {
  let obj = match expect_object(json, "CancelReservationReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let reservation_id : Int = match req_int(obj, "reservationId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ reservation_id: reservation_id })
}

///|
/// CertificateSigned.req

///|
pub(all) struct CertificateSignedReq {
  certificate_chain : String
} derive(Eq, Debug)

///|
pub fn CertificateSignedReq::to_json(self : CertificateSignedReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "certificateChain", self.certificate_chain)
  Json::object(obj)
}

///|
pub fn CertificateSignedReq::from_json(json : Json) -> Result[CertificateSignedReq, OcppError] {
  let obj = match expect_object(json, "CertificateSignedReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let certificate_chain : String = match req_str(obj, "certificateChain") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ certificate_chain: certificate_chain })
}

///|
/// ChangeAvailability.req

///|
pub(all) struct ChangeAvailabilityReq {
  connector_id : Int
  type_ : AvailabilityType
} derive(Eq, Debug)

///|
pub fn ChangeAvailabilityReq::to_json(self : ChangeAvailabilityReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_int(obj, "connectorId", self.connector_id)
  put_str(obj, "type", self.type_.to_wire())
  Json::object(obj)
}

///|
pub fn ChangeAvailabilityReq::from_json(json : Json) -> Result[ChangeAvailabilityReq, OcppError] {
  let obj = match expect_object(json, "ChangeAvailabilityReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let connector_id : Int = match req_int(obj, "connectorId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let type_ : AvailabilityType = match req_AvailabilityType(obj, "type") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ connector_id: connector_id, type_: type_ })
}

///|
/// ChangeConfiguration.req

///|
pub(all) struct ChangeConfigurationReq {
  key : String
  value : String
} derive(Eq, Debug)

///|
pub fn ChangeConfigurationReq::to_json(self : ChangeConfigurationReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "key", self.key)
  put_str(obj, "value", self.value)
  Json::object(obj)
}

///|
pub fn ChangeConfigurationReq::from_json(json : Json) -> Result[ChangeConfigurationReq, OcppError] {
  let obj = match expect_object(json, "ChangeConfigurationReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let key : String = match req_str(obj, "key") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let value : String = match req_str(obj, "value") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ key: key, value: value })
}

///|
/// ClearChargingProfile.req

///|
pub(all) struct ClearChargingProfileReq {
  id : Int?
  connector_id : Int?
  charging_profile_purpose : ChargingProfilePurposeType?
  stack_level : Int?
} derive(Eq, Debug)

///|
pub fn ClearChargingProfileReq::to_json(self : ClearChargingProfileReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_opt_int(obj, "id", self.id)
  put_opt_int(obj, "connectorId", self.connector_id)
  match self.charging_profile_purpose {
    Some(v) => put_str(obj, "chargingProfilePurpose", v.to_wire())
    None => ()
  }
  put_opt_int(obj, "stackLevel", self.stack_level)
  Json::object(obj)
}

///|
pub fn ClearChargingProfileReq::from_json(json : Json) -> Result[ClearChargingProfileReq, OcppError] {
  let obj = match expect_object(json, "ClearChargingProfileReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let id : Int? = match opt_int(obj, "id") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let connector_id : Int? = match opt_int(obj, "connectorId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let charging_profile_purpose : ChargingProfilePurposeType? = match opt_ChargingProfilePurposeType(obj, "chargingProfilePurpose") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let stack_level : Int? = match opt_int(obj, "stackLevel") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ id: id, connector_id: connector_id, charging_profile_purpose: charging_profile_purpose, stack_level: stack_level })
}

///|
/// DeleteCertificate.req

///|
pub(all) struct DeleteCertificateReq {
  certificate_hash_data : CertificateHashData
} derive(Eq, Debug)

///|
pub fn DeleteCertificateReq::to_json(self : DeleteCertificateReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_json(obj, "certificateHashData", self.certificate_hash_data.to_json())
  Json::object(obj)
}

///|
pub fn DeleteCertificateReq::from_json(json : Json) -> Result[DeleteCertificateReq, OcppError] {
  let obj = match expect_object(json, "DeleteCertificateReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let raw_certificate_hash_data = match req_object(obj, "certificateHashData") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let certificate_hash_data : CertificateHashData = match CertificateHashData::from_json(raw_certificate_hash_data) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ certificate_hash_data: certificate_hash_data })
}

///|
/// ExtendedTriggerMessage.req

///|
pub(all) struct ExtendedTriggerMessageReq {
  requested_message : MessageTrigger
  connector_id : Int?
} derive(Eq, Debug)

///|
pub fn ExtendedTriggerMessageReq::to_json(self : ExtendedTriggerMessageReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "requestedMessage", self.requested_message.to_wire())
  put_opt_int(obj, "connectorId", self.connector_id)
  Json::object(obj)
}

///|
pub fn ExtendedTriggerMessageReq::from_json(json : Json) -> Result[ExtendedTriggerMessageReq, OcppError] {
  let obj = match expect_object(json, "ExtendedTriggerMessageReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let requested_message : MessageTrigger = match req_MessageTrigger(obj, "requestedMessage") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let connector_id : Int? = match opt_int(obj, "connectorId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ requested_message: requested_message, connector_id: connector_id })
}

///|
/// GetCompositeSchedule.req

///|
pub(all) struct GetCompositeScheduleReq {
  connector_id : Int
  duration : Int
  charging_rate_unit : ChargingRateUnitType?
} derive(Eq, Debug)

///|
pub fn GetCompositeScheduleReq::to_json(self : GetCompositeScheduleReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_int(obj, "connectorId", self.connector_id)
  put_int(obj, "duration", self.duration)
  match self.charging_rate_unit {
    Some(v) => put_str(obj, "chargingRateUnit", v.to_wire())
    None => ()
  }
  Json::object(obj)
}

///|
pub fn GetCompositeScheduleReq::from_json(json : Json) -> Result[GetCompositeScheduleReq, OcppError] {
  let obj = match expect_object(json, "GetCompositeScheduleReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let connector_id : Int = match req_int(obj, "connectorId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let duration : Int = match req_int(obj, "duration") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let charging_rate_unit : ChargingRateUnitType? = match opt_ChargingRateUnitType(obj, "chargingRateUnit") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ connector_id: connector_id, duration: duration, charging_rate_unit: charging_rate_unit })
}

///|
/// GetConfiguration.req

///|
pub(all) struct GetConfigurationReq {
  key : Array[String]?
} derive(Eq, Debug)

///|
pub fn GetConfigurationReq::to_json(self : GetConfigurationReq) -> Json {
  let obj : Map[String, Json] = Map([])
  match self.key {
    Some(v) => put_json(obj, "key", encode_str_array(v))
    None => ()
  }
  Json::object(obj)
}

///|
pub fn GetConfigurationReq::from_json(json : Json) -> Result[GetConfigurationReq, OcppError] {
  let obj = match expect_object(json, "GetConfigurationReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let key : Array[String]? = match opt_array(obj, "key") {
    Err(e) => return Err(e)
    Ok(None) => None
    Ok(Some(arr)) => {
      match decode_str_array(Json::array(arr), "key") {
        Ok(v) => Some(v)
        Err(e) => return Err(e)
      }
    }
  }
  Ok({ key: key })
}

///|
/// GetDiagnostics.req

///|
pub(all) struct GetDiagnosticsReq {
  location : String
  retries : Int?
  retry_interval : Int?
  start_time : String?
  stop_time : String?
} derive(Eq, Debug)

///|
pub fn GetDiagnosticsReq::to_json(self : GetDiagnosticsReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "location", self.location)
  put_opt_int(obj, "retries", self.retries)
  put_opt_int(obj, "retryInterval", self.retry_interval)
  put_opt_str(obj, "startTime", self.start_time)
  put_opt_str(obj, "stopTime", self.stop_time)
  Json::object(obj)
}

///|
pub fn GetDiagnosticsReq::from_json(json : Json) -> Result[GetDiagnosticsReq, OcppError] {
  let obj = match expect_object(json, "GetDiagnosticsReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let location : String = match req_str(obj, "location") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let retries : Int? = match opt_int(obj, "retries") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let retry_interval : Int? = match opt_int(obj, "retryInterval") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let start_time : String? = match opt_str(obj, "startTime") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let stop_time : String? = match opt_str(obj, "stopTime") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ location: location, retries: retries, retry_interval: retry_interval, start_time: start_time, stop_time: stop_time })
}

///|
/// GetInstalledCertificateIds.req

///|
pub(all) struct GetInstalledCertificateIdsReq {
  certificate_type : CertificateUse
} derive(Eq, Debug)

///|
pub fn GetInstalledCertificateIdsReq::to_json(self : GetInstalledCertificateIdsReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "certificateType", self.certificate_type.to_wire())
  Json::object(obj)
}

///|
pub fn GetInstalledCertificateIdsReq::from_json(json : Json) -> Result[GetInstalledCertificateIdsReq, OcppError] {
  let obj = match expect_object(json, "GetInstalledCertificateIdsReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let certificate_type : CertificateUse = match req_CertificateUse(obj, "certificateType") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ certificate_type: certificate_type })
}

///|
/// GetLog.req

///|
pub(all) struct GetLogReq {
  log : LogParameters
  log_type : LogKind
  request_id : Int
  retries : Int?
  retry_interval : Int?
} derive(Eq, Debug)

///|
pub fn GetLogReq::to_json(self : GetLogReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_json(obj, "log", self.log.to_json())
  put_str(obj, "logType", self.log_type.to_wire())
  put_int(obj, "requestId", self.request_id)
  put_opt_int(obj, "retries", self.retries)
  put_opt_int(obj, "retryInterval", self.retry_interval)
  Json::object(obj)
}

///|
pub fn GetLogReq::from_json(json : Json) -> Result[GetLogReq, OcppError] {
  let obj = match expect_object(json, "GetLogReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let raw_log = match req_object(obj, "log") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let log : LogParameters = match LogParameters::from_json(raw_log) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let log_type : LogKind = match req_LogKind(obj, "logType") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let request_id : Int = match req_int(obj, "requestId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let retries : Int? = match opt_int(obj, "retries") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let retry_interval : Int? = match opt_int(obj, "retryInterval") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ log: log, log_type: log_type, request_id: request_id, retries: retries, retry_interval: retry_interval })
}

///|
/// InstallCertificate.req

///|
pub(all) struct InstallCertificateReq {
  certificate_type : CertificateUse
  certificate : String
} derive(Eq, Debug)

///|
pub fn InstallCertificateReq::to_json(self : InstallCertificateReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "certificateType", self.certificate_type.to_wire())
  put_str(obj, "certificate", self.certificate)
  Json::object(obj)
}

///|
pub fn InstallCertificateReq::from_json(json : Json) -> Result[InstallCertificateReq, OcppError] {
  let obj = match expect_object(json, "InstallCertificateReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let certificate_type : CertificateUse = match req_CertificateUse(obj, "certificateType") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let certificate : String = match req_str(obj, "certificate") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ certificate_type: certificate_type, certificate: certificate })
}

///|
/// RemoteStartTransaction.req

///|
pub(all) struct RemoteStartTransactionReq {
  id_tag : String
  connector_id : Int?
  charging_profile : ChargingProfile?
} derive(Eq, Debug)

///|
pub fn RemoteStartTransactionReq::to_json(self : RemoteStartTransactionReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "idTag", self.id_tag)
  put_opt_int(obj, "connectorId", self.connector_id)
  match self.charging_profile {
    Some(v) => put_json(obj, "chargingProfile", v.to_json())
    None => ()
  }
  Json::object(obj)
}

///|
pub fn RemoteStartTransactionReq::from_json(json : Json) -> Result[RemoteStartTransactionReq, OcppError] {
  let obj = match expect_object(json, "RemoteStartTransactionReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let id_tag : String = match req_str(obj, "idTag") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let connector_id : Int? = match opt_int(obj, "connectorId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let charging_profile : ChargingProfile? = match opt_object(obj, "chargingProfile") {
    Err(e) => return Err(e)
    Ok(None) => None
    Ok(Some(raw)) => {
      match ChargingProfile::from_json(raw) {
        Ok(v) => Some(v)
        Err(e) => return Err(e)
      }
    }
  }
  Ok({ id_tag: id_tag, connector_id: connector_id, charging_profile: charging_profile })
}

///|
/// RemoteStopTransaction.req

///|
pub(all) struct RemoteStopTransactionReq {
  transaction_id : Int
} derive(Eq, Debug)

///|
pub fn RemoteStopTransactionReq::to_json(self : RemoteStopTransactionReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_int(obj, "transactionId", self.transaction_id)
  Json::object(obj)
}

///|
pub fn RemoteStopTransactionReq::from_json(json : Json) -> Result[RemoteStopTransactionReq, OcppError] {
  let obj = match expect_object(json, "RemoteStopTransactionReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let transaction_id : Int = match req_int(obj, "transactionId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ transaction_id: transaction_id })
}

///|
/// ReserveNow.req

///|
pub(all) struct ReserveNowReq {
  connector_id : Int
  expiry_date : String
  id_tag : String
  reservation_id : Int
  parent_id_tag : String?
} derive(Eq, Debug)

///|
pub fn ReserveNowReq::to_json(self : ReserveNowReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_int(obj, "connectorId", self.connector_id)
  put_str(obj, "expiryDate", self.expiry_date)
  put_str(obj, "idTag", self.id_tag)
  put_int(obj, "reservationId", self.reservation_id)
  put_opt_str(obj, "parentIdTag", self.parent_id_tag)
  Json::object(obj)
}

///|
pub fn ReserveNowReq::from_json(json : Json) -> Result[ReserveNowReq, OcppError] {
  let obj = match expect_object(json, "ReserveNowReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let connector_id : Int = match req_int(obj, "connectorId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let expiry_date : String = match req_str(obj, "expiryDate") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let id_tag : String = match req_str(obj, "idTag") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let reservation_id : Int = match req_int(obj, "reservationId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let parent_id_tag : String? = match opt_str(obj, "parentIdTag") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ connector_id: connector_id, expiry_date: expiry_date, id_tag: id_tag, reservation_id: reservation_id, parent_id_tag: parent_id_tag })
}

///|
/// Reset.req

///|
pub(all) struct ResetReq {
  type_ : ResetType
} derive(Eq, Debug)

///|
pub fn ResetReq::to_json(self : ResetReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "type", self.type_.to_wire())
  Json::object(obj)
}

///|
pub fn ResetReq::from_json(json : Json) -> Result[ResetReq, OcppError] {
  let obj = match expect_object(json, "ResetReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let type_ : ResetType = match req_ResetType(obj, "type") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ type_: type_ })
}

///|
/// SendLocalList.req

///|
pub(all) struct SendLocalListReq {
  list_version : Int
  update_type : UpdateType
  local_authorization_list : Array[AuthorizationData]
} derive(Eq, Debug)

///|
pub fn SendLocalListReq::to_json(self : SendLocalListReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_int(obj, "listVersion", self.list_version)
  put_str(obj, "updateType", self.update_type.to_wire())
  {
    let arr : Array[Json] = []
    for i in 0..<self.local_authorization_list.length() {
      arr.push(self.local_authorization_list[i].to_json())
    }
    put_json(obj, "localAuthorizationList", Json::array(arr))
  }
  Json::object(obj)
}

///|
pub fn SendLocalListReq::from_json(json : Json) -> Result[SendLocalListReq, OcppError] {
  let obj = match expect_object(json, "SendLocalListReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let list_version : Int = match req_int(obj, "listVersion") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let update_type : UpdateType = match req_UpdateType(obj, "updateType") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let raw_local_authorization_list = match req_array(obj, "localAuthorizationList") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let local_authorization_list : Array[AuthorizationData] = []
  for i in 0..<raw_local_authorization_list.length() {
    match AuthorizationData::from_json(raw_local_authorization_list[i]) {
      Ok(v) => local_authorization_list.push(v)
      Err(e) => return Err(e)
    }
  }
  Ok({ list_version: list_version, update_type: update_type, local_authorization_list: local_authorization_list })
}

///|
/// SetChargingProfile.req

///|
pub(all) struct SetChargingProfileReq {
  connector_id : Int
  cs_charging_profiles : ChargingProfile
} derive(Eq, Debug)

///|
pub fn SetChargingProfileReq::to_json(self : SetChargingProfileReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_int(obj, "connectorId", self.connector_id)
  put_json(obj, "csChargingProfiles", self.cs_charging_profiles.to_json())
  Json::object(obj)
}

///|
pub fn SetChargingProfileReq::from_json(json : Json) -> Result[SetChargingProfileReq, OcppError] {
  let obj = match expect_object(json, "SetChargingProfileReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let connector_id : Int = match req_int(obj, "connectorId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let raw_cs_charging_profiles = match req_object(obj, "csChargingProfiles") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let cs_charging_profiles : ChargingProfile = match ChargingProfile::from_json(raw_cs_charging_profiles) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ connector_id: connector_id, cs_charging_profiles: cs_charging_profiles })
}

///|
/// SignedUpdateFirmware.req

///|
pub(all) struct SignedUpdateFirmwareReq {
  request_id : Int
  firmware : Firmware
  retries : Int?
  retry_interval : Int?
} derive(Eq, Debug)

///|
pub fn SignedUpdateFirmwareReq::to_json(self : SignedUpdateFirmwareReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_int(obj, "requestId", self.request_id)
  put_json(obj, "firmware", self.firmware.to_json())
  put_opt_int(obj, "retries", self.retries)
  put_opt_int(obj, "retryInterval", self.retry_interval)
  Json::object(obj)
}

///|
pub fn SignedUpdateFirmwareReq::from_json(json : Json) -> Result[SignedUpdateFirmwareReq, OcppError] {
  let obj = match expect_object(json, "SignedUpdateFirmwareReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let request_id : Int = match req_int(obj, "requestId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let raw_firmware = match req_object(obj, "firmware") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let firmware : Firmware = match Firmware::from_json(raw_firmware) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let retries : Int? = match opt_int(obj, "retries") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let retry_interval : Int? = match opt_int(obj, "retryInterval") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ request_id: request_id, firmware: firmware, retries: retries, retry_interval: retry_interval })
}

///|
/// TriggerMessage.req

///|
pub(all) struct TriggerMessageReq {
  requested_message : MessageTrigger
  connector_id : Int?
} derive(Eq, Debug)

///|
pub fn TriggerMessageReq::to_json(self : TriggerMessageReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "requestedMessage", self.requested_message.to_wire())
  put_opt_int(obj, "connectorId", self.connector_id)
  Json::object(obj)
}

///|
pub fn TriggerMessageReq::from_json(json : Json) -> Result[TriggerMessageReq, OcppError] {
  let obj = match expect_object(json, "TriggerMessageReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let requested_message : MessageTrigger = match req_MessageTrigger(obj, "requestedMessage") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let connector_id : Int? = match opt_int(obj, "connectorId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ requested_message: requested_message, connector_id: connector_id })
}

///|
/// UnlockConnector.req

///|
pub(all) struct UnlockConnectorReq {
  connector_id : Int
} derive(Eq, Debug)

///|
pub fn UnlockConnectorReq::to_json(self : UnlockConnectorReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_int(obj, "connectorId", self.connector_id)
  Json::object(obj)
}

///|
pub fn UnlockConnectorReq::from_json(json : Json) -> Result[UnlockConnectorReq, OcppError] {
  let obj = match expect_object(json, "UnlockConnectorReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let connector_id : Int = match req_int(obj, "connectorId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ connector_id: connector_id })
}

///|
/// UpdateFirmware.req

///|
pub(all) struct UpdateFirmwareReq {
  location : String
  retrieve_date : String
  retries : Int?
  retry_interval : Int?
} derive(Eq, Debug)

///|
pub fn UpdateFirmwareReq::to_json(self : UpdateFirmwareReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "location", self.location)
  put_str(obj, "retrieveDate", self.retrieve_date)
  put_opt_int(obj, "retries", self.retries)
  put_opt_int(obj, "retryInterval", self.retry_interval)
  Json::object(obj)
}

///|
pub fn UpdateFirmwareReq::from_json(json : Json) -> Result[UpdateFirmwareReq, OcppError] {
  let obj = match expect_object(json, "UpdateFirmwareReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let location : String = match req_str(obj, "location") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let retrieve_date : String = match req_str(obj, "retrieveDate") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let retries : Int? = match opt_int(obj, "retries") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let retry_interval : Int? = match opt_int(obj, "retryInterval") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ location: location, retrieve_date: retrieve_date, retries: retries, retry_interval: retry_interval })
}
