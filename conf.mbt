///|
/// OCPP 1.6 CALLRESULT payloads.

///|
/// Authorize.conf

///|
pub(all) struct AuthorizeConf {
  id_tag_info : IdTagInfo
} derive(Eq, Debug)

///|
pub fn AuthorizeConf::to_json(self : AuthorizeConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_json(obj, "idTagInfo", self.id_tag_info.to_json())
  Json::object(obj)
}

///|
pub fn AuthorizeConf::from_json(json : Json) -> Result[AuthorizeConf, OcppError] {
  let obj = match expect_object(json, "AuthorizeConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let raw_id_tag_info = match req_object(obj, "idTagInfo") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let id_tag_info : IdTagInfo = match IdTagInfo::from_json(raw_id_tag_info) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ id_tag_info: id_tag_info })
}

///|
/// BootNotification.conf

///|
pub(all) struct BootNotificationConf {
  current_time : String
  interval : Int
  status : RegistrationStatus
} derive(Eq, Debug)

///|
pub fn BootNotificationConf::to_json(self : BootNotificationConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "currentTime", self.current_time)
  put_int(obj, "interval", self.interval)
  put_str(obj, "status", self.status.to_wire())
  Json::object(obj)
}

///|
pub fn BootNotificationConf::from_json(json : Json) -> Result[BootNotificationConf, OcppError] {
  let obj = match expect_object(json, "BootNotificationConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let current_time : String = match req_str(obj, "currentTime") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let interval : Int = match req_int(obj, "interval") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : RegistrationStatus = match req_RegistrationStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ current_time: current_time, interval: interval, status: status })
}

///|
/// Heartbeat.conf

///|
pub(all) struct HeartbeatConf {
  current_time : String
} derive(Eq, Debug)

///|
pub fn HeartbeatConf::to_json(self : HeartbeatConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "currentTime", self.current_time)
  Json::object(obj)
}

///|
pub fn HeartbeatConf::from_json(json : Json) -> Result[HeartbeatConf, OcppError] {
  let obj = match expect_object(json, "HeartbeatConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let current_time : String = match req_str(obj, "currentTime") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ current_time: current_time })
}

///|
/// SignCertificate.conf

///|
pub(all) struct SignCertificateConf {
  status : GenericStatus
} derive(Eq, Debug)

///|
pub fn SignCertificateConf::to_json(self : SignCertificateConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  Json::object(obj)
}

///|
pub fn SignCertificateConf::from_json(json : Json) -> Result[SignCertificateConf, OcppError] {
  let obj = match expect_object(json, "SignCertificateConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : GenericStatus = match req_GenericStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status })
}

///|
/// StartTransaction.conf

///|
pub(all) struct StartTransactionConf {
  transaction_id : Int
  id_tag_info : IdTagInfo
} derive(Eq, Debug)

///|
pub fn StartTransactionConf::to_json(self : StartTransactionConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_int(obj, "transactionId", self.transaction_id)
  put_json(obj, "idTagInfo", self.id_tag_info.to_json())
  Json::object(obj)
}

///|
pub fn StartTransactionConf::from_json(json : Json) -> Result[StartTransactionConf, OcppError] {
  let obj = match expect_object(json, "StartTransactionConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let transaction_id : Int = match req_int(obj, "transactionId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let raw_id_tag_info = match req_object(obj, "idTagInfo") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let id_tag_info : IdTagInfo = match IdTagInfo::from_json(raw_id_tag_info) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ transaction_id: transaction_id, id_tag_info: id_tag_info })
}

///|
/// StopTransaction.conf

///|
pub(all) struct StopTransactionConf {
  id_tag_info : IdTagInfo?
} derive(Eq, Debug)

///|
pub fn StopTransactionConf::to_json(self : StopTransactionConf) -> Json {
  let obj : Map[String, Json] = Map([])
  match self.id_tag_info {
    Some(v) => put_json(obj, "idTagInfo", v.to_json())
    None => ()
  }
  Json::object(obj)
}

///|
pub fn StopTransactionConf::from_json(json : Json) -> Result[StopTransactionConf, OcppError] {
  let obj = match expect_object(json, "StopTransactionConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let id_tag_info : IdTagInfo? = match opt_object(obj, "idTagInfo") {
    Err(e) => return Err(e)
    Ok(None) => None
    Ok(Some(raw)) => {
      match IdTagInfo::from_json(raw) {
        Ok(v) => Some(v)
        Err(e) => return Err(e)
      }
    }
  }
  Ok({ id_tag_info: id_tag_info })
}

///|
/// DataTransfer.conf

///|
pub(all) struct DataTransferConf {
  status : DataTransferStatus
  data : String?
} derive(Eq, Debug)

///|
pub fn DataTransferConf::to_json(self : DataTransferConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  put_opt_str(obj, "data", self.data)
  Json::object(obj)
}

///|
pub fn DataTransferConf::from_json(json : Json) -> Result[DataTransferConf, OcppError] {
  let obj = match expect_object(json, "DataTransferConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : DataTransferStatus = match req_DataTransferStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let data : String? = match opt_str(obj, "data") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status, data: data })
}

///|
/// CancelReservation.conf

///|
pub(all) struct CancelReservationConf {
  status : CancelReservationStatus
} derive(Eq, Debug)

///|
pub fn CancelReservationConf::to_json(self : CancelReservationConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  Json::object(obj)
}

///|
pub fn CancelReservationConf::from_json(json : Json) -> Result[CancelReservationConf, OcppError] {
  let obj = match expect_object(json, "CancelReservationConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : CancelReservationStatus = match req_CancelReservationStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status })
}

///|
/// CertificateSigned.conf

///|
pub(all) struct CertificateSignedConf {
  status : CertificateSignedStatus
} derive(Eq, Debug)

///|
pub fn CertificateSignedConf::to_json(self : CertificateSignedConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  Json::object(obj)
}

///|
pub fn CertificateSignedConf::from_json(json : Json) -> Result[CertificateSignedConf, OcppError] {
  let obj = match expect_object(json, "CertificateSignedConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : CertificateSignedStatus = match req_CertificateSignedStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status })
}

///|
/// ChangeAvailability.conf

///|
pub(all) struct ChangeAvailabilityConf {
  status : AvailabilityStatus
} derive(Eq, Debug)

///|
pub fn ChangeAvailabilityConf::to_json(self : ChangeAvailabilityConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  Json::object(obj)
}

///|
pub fn ChangeAvailabilityConf::from_json(json : Json) -> Result[ChangeAvailabilityConf, OcppError] {
  let obj = match expect_object(json, "ChangeAvailabilityConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : AvailabilityStatus = match req_AvailabilityStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status })
}

///|
/// ChangeConfiguration.conf

///|
pub(all) struct ChangeConfigurationConf {
  status : ConfigurationStatus
} derive(Eq, Debug)

///|
pub fn ChangeConfigurationConf::to_json(self : ChangeConfigurationConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  Json::object(obj)
}

///|
pub fn ChangeConfigurationConf::from_json(json : Json) -> Result[ChangeConfigurationConf, OcppError] {
  let obj = match expect_object(json, "ChangeConfigurationConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : ConfigurationStatus = match req_ConfigurationStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status })
}

///|
/// ClearCache.conf

///|
pub(all) struct ClearCacheConf {
  status : ClearCacheStatus
} derive(Eq, Debug)

///|
pub fn ClearCacheConf::to_json(self : ClearCacheConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  Json::object(obj)
}

///|
pub fn ClearCacheConf::from_json(json : Json) -> Result[ClearCacheConf, OcppError] {
  let obj = match expect_object(json, "ClearCacheConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : ClearCacheStatus = match req_ClearCacheStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status })
}

///|
/// ClearChargingProfile.conf

///|
pub(all) struct ClearChargingProfileConf {
  status : ClearChargingProfileStatus
} derive(Eq, Debug)

///|
pub fn ClearChargingProfileConf::to_json(self : ClearChargingProfileConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  Json::object(obj)
}

///|
pub fn ClearChargingProfileConf::from_json(json : Json) -> Result[ClearChargingProfileConf, OcppError] {
  let obj = match expect_object(json, "ClearChargingProfileConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : ClearChargingProfileStatus = match req_ClearChargingProfileStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status })
}

///|
/// DeleteCertificate.conf

///|
pub(all) struct DeleteCertificateConf {
  status : DeleteCertificateStatus
} derive(Eq, Debug)

///|
pub fn DeleteCertificateConf::to_json(self : DeleteCertificateConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  Json::object(obj)
}

///|
pub fn DeleteCertificateConf::from_json(json : Json) -> Result[DeleteCertificateConf, OcppError] {
  let obj = match expect_object(json, "DeleteCertificateConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : DeleteCertificateStatus = match req_DeleteCertificateStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status })
}

///|
/// ExtendedTriggerMessage.conf

///|
pub(all) struct ExtendedTriggerMessageConf {
  status : TriggerMessageStatus
} derive(Eq, Debug)

///|
pub fn ExtendedTriggerMessageConf::to_json(self : ExtendedTriggerMessageConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  Json::object(obj)
}

///|
pub fn ExtendedTriggerMessageConf::from_json(json : Json) -> Result[ExtendedTriggerMessageConf, OcppError] {
  let obj = match expect_object(json, "ExtendedTriggerMessageConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : TriggerMessageStatus = match req_TriggerMessageStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status })
}

///|
/// GetCompositeSchedule.conf

///|
pub(all) struct GetCompositeScheduleConf {
  status : GetCompositeScheduleStatus
  connector_id : Int?
  schedule_start : String?
  charging_schedule : ChargingSchedule?
} derive(Eq, Debug)

///|
pub fn GetCompositeScheduleConf::to_json(self : GetCompositeScheduleConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  put_opt_int(obj, "connectorId", self.connector_id)
  put_opt_str(obj, "scheduleStart", self.schedule_start)
  match self.charging_schedule {
    Some(v) => put_json(obj, "chargingSchedule", v.to_json())
    None => ()
  }
  Json::object(obj)
}

///|
pub fn GetCompositeScheduleConf::from_json(json : Json) -> Result[GetCompositeScheduleConf, OcppError] {
  let obj = match expect_object(json, "GetCompositeScheduleConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : GetCompositeScheduleStatus = match req_GetCompositeScheduleStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let connector_id : Int? = match opt_int(obj, "connectorId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let schedule_start : String? = match opt_str(obj, "scheduleStart") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let charging_schedule : ChargingSchedule? = match opt_object(obj, "chargingSchedule") {
    Err(e) => return Err(e)
    Ok(None) => None
    Ok(Some(raw)) => {
      match ChargingSchedule::from_json(raw) {
        Ok(v) => Some(v)
        Err(e) => return Err(e)
      }
    }
  }
  Ok({ status: status, connector_id: connector_id, schedule_start: schedule_start, charging_schedule: charging_schedule })
}

///|
/// GetConfiguration.conf

///|
pub(all) struct GetConfigurationConf {
  configuration_key : Array[KeyValue]?
  unknown_key : Array[String]?
} derive(Eq, Debug)

///|
pub fn GetConfigurationConf::to_json(self : GetConfigurationConf) -> Json {
  let obj : Map[String, Json] = Map([])
  match self.configuration_key {
    None => ()
    Some(items) => {
      let arr : Array[Json] = []
      for i in 0..<items.length() {
        arr.push(items[i].to_json())
      }
      put_json(obj, "configurationKey", Json::array(arr))
    }
  }
  match self.unknown_key {
    Some(v) => put_json(obj, "unknownKey", encode_str_array(v))
    None => ()
  }
  Json::object(obj)
}

///|
pub fn GetConfigurationConf::from_json(json : Json) -> Result[GetConfigurationConf, OcppError] {
  let obj = match expect_object(json, "GetConfigurationConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let configuration_key : Array[KeyValue]? = match opt_array(obj, "configurationKey") {
    Err(e) => return Err(e)
    Ok(None) => None
    Ok(Some(arr)) => {
      let items : Array[KeyValue] = []
      for i in 0..<arr.length() {
        match KeyValue::from_json(arr[i]) {
          Ok(v) => items.push(v)
          Err(e) => return Err(e)
        }
      }
      Some(items)
    }
  }
  let unknown_key : Array[String]? = match opt_array(obj, "unknownKey") {
    Err(e) => return Err(e)
    Ok(None) => None
    Ok(Some(arr)) => {
      match decode_str_array(Json::array(arr), "unknownKey") {
        Ok(v) => Some(v)
        Err(e) => return Err(e)
      }
    }
  }
  Ok({ configuration_key: configuration_key, unknown_key: unknown_key })
}

///|
/// GetDiagnostics.conf

///|
pub(all) struct GetDiagnosticsConf {
  file_name : String?
} derive(Eq, Debug)

///|
pub fn GetDiagnosticsConf::to_json(self : GetDiagnosticsConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_opt_str(obj, "fileName", self.file_name)
  Json::object(obj)
}

///|
pub fn GetDiagnosticsConf::from_json(json : Json) -> Result[GetDiagnosticsConf, OcppError] {
  let obj = match expect_object(json, "GetDiagnosticsConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let file_name : String? = match opt_str(obj, "fileName") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ file_name: file_name })
}

///|
/// GetInstalledCertificateIds.conf

///|
pub(all) struct GetInstalledCertificateIdsConf {
  status : GetInstalledCertificateStatus
  certificate_hash_data : Array[CertificateHashData]?
} derive(Eq, Debug)

///|
pub fn GetInstalledCertificateIdsConf::to_json(self : GetInstalledCertificateIdsConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  match self.certificate_hash_data {
    None => ()
    Some(items) => {
      let arr : Array[Json] = []
      for i in 0..<items.length() {
        arr.push(items[i].to_json())
      }
      put_json(obj, "certificateHashData", Json::array(arr))
    }
  }
  Json::object(obj)
}

///|
pub fn GetInstalledCertificateIdsConf::from_json(json : Json) -> Result[GetInstalledCertificateIdsConf, OcppError] {
  let obj = match expect_object(json, "GetInstalledCertificateIdsConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : GetInstalledCertificateStatus = match req_GetInstalledCertificateStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let certificate_hash_data : Array[CertificateHashData]? = match opt_array(obj, "certificateHashData") {
    Err(e) => return Err(e)
    Ok(None) => None
    Ok(Some(arr)) => {
      let items : Array[CertificateHashData] = []
      for i in 0..<arr.length() {
        match CertificateHashData::from_json(arr[i]) {
          Ok(v) => items.push(v)
          Err(e) => return Err(e)
        }
      }
      Some(items)
    }
  }
  Ok({ status: status, certificate_hash_data: certificate_hash_data })
}

///|
/// GetLocalListVersion.conf

///|
pub(all) struct GetLocalListVersionConf {
  list_version : Int
} derive(Eq, Debug)

///|
pub fn GetLocalListVersionConf::to_json(self : GetLocalListVersionConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_int(obj, "listVersion", self.list_version)
  Json::object(obj)
}

///|
pub fn GetLocalListVersionConf::from_json(json : Json) -> Result[GetLocalListVersionConf, OcppError] {
  let obj = match expect_object(json, "GetLocalListVersionConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let list_version : Int = match req_int(obj, "listVersion") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ list_version: list_version })
}

///|
/// GetLog.conf

///|
pub(all) struct GetLogConf {
  status : LogStatus
  filename : String?
} derive(Eq, Debug)

///|
pub fn GetLogConf::to_json(self : GetLogConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  put_opt_str(obj, "filename", self.filename)
  Json::object(obj)
}

///|
pub fn GetLogConf::from_json(json : Json) -> Result[GetLogConf, OcppError] {
  let obj = match expect_object(json, "GetLogConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : LogStatus = match req_LogStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let filename : String? = match opt_str(obj, "filename") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status, filename: filename })
}

///|
/// InstallCertificate.conf

///|
pub(all) struct InstallCertificateConf {
  status : CertificateStatus
} derive(Eq, Debug)

///|
pub fn InstallCertificateConf::to_json(self : InstallCertificateConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  Json::object(obj)
}

///|
pub fn InstallCertificateConf::from_json(json : Json) -> Result[InstallCertificateConf, OcppError] {
  let obj = match expect_object(json, "InstallCertificateConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : CertificateStatus = match req_CertificateStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status })
}

///|
/// RemoteStartTransaction.conf

///|
pub(all) struct RemoteStartTransactionConf {
  status : RemoteStartStopStatus
} derive(Eq, Debug)

///|
pub fn RemoteStartTransactionConf::to_json(self : RemoteStartTransactionConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  Json::object(obj)
}

///|
pub fn RemoteStartTransactionConf::from_json(json : Json) -> Result[RemoteStartTransactionConf, OcppError] {
  let obj = match expect_object(json, "RemoteStartTransactionConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : RemoteStartStopStatus = match req_RemoteStartStopStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status })
}

///|
/// RemoteStopTransaction.conf

///|
pub(all) struct RemoteStopTransactionConf {
  status : RemoteStartStopStatus
} derive(Eq, Debug)

///|
pub fn RemoteStopTransactionConf::to_json(self : RemoteStopTransactionConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  Json::object(obj)
}

///|
pub fn RemoteStopTransactionConf::from_json(json : Json) -> Result[RemoteStopTransactionConf, OcppError] {
  let obj = match expect_object(json, "RemoteStopTransactionConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : RemoteStartStopStatus = match req_RemoteStartStopStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status })
}

///|
/// ReserveNow.conf

///|
pub(all) struct ReserveNowConf {
  status : ReservationStatus
} derive(Eq, Debug)

///|
pub fn ReserveNowConf::to_json(self : ReserveNowConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  Json::object(obj)
}

///|
pub fn ReserveNowConf::from_json(json : Json) -> Result[ReserveNowConf, OcppError] {
  let obj = match expect_object(json, "ReserveNowConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : ReservationStatus = match req_ReservationStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status })
}

///|
/// Reset.conf

///|
pub(all) struct ResetConf {
  status : ResetStatus
} derive(Eq, Debug)

///|
pub fn ResetConf::to_json(self : ResetConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  Json::object(obj)
}

///|
pub fn ResetConf::from_json(json : Json) -> Result[ResetConf, OcppError] {
  let obj = match expect_object(json, "ResetConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : ResetStatus = match req_ResetStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status })
}

///|
/// SendLocalList.conf

///|
pub(all) struct SendLocalListConf {
  status : UpdateStatus
} derive(Eq, Debug)

///|
pub fn SendLocalListConf::to_json(self : SendLocalListConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  Json::object(obj)
}

///|
pub fn SendLocalListConf::from_json(json : Json) -> Result[SendLocalListConf, OcppError] {
  let obj = match expect_object(json, "SendLocalListConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : UpdateStatus = match req_UpdateStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status })
}

///|
/// SetChargingProfile.conf

///|
pub(all) struct SetChargingProfileConf {
  status : ChargingProfileStatus
} derive(Eq, Debug)

///|
pub fn SetChargingProfileConf::to_json(self : SetChargingProfileConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  Json::object(obj)
}

///|
pub fn SetChargingProfileConf::from_json(json : Json) -> Result[SetChargingProfileConf, OcppError] {
  let obj = match expect_object(json, "SetChargingProfileConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : ChargingProfileStatus = match req_ChargingProfileStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status })
}

///|
/// SignedUpdateFirmware.conf

///|
pub(all) struct SignedUpdateFirmwareConf {
  status : UpdateFirmwareStatus
} derive(Eq, Debug)

///|
pub fn SignedUpdateFirmwareConf::to_json(self : SignedUpdateFirmwareConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  Json::object(obj)
}

///|
pub fn SignedUpdateFirmwareConf::from_json(json : Json) -> Result[SignedUpdateFirmwareConf, OcppError] {
  let obj = match expect_object(json, "SignedUpdateFirmwareConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : UpdateFirmwareStatus = match req_UpdateFirmwareStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status })
}

///|
/// TriggerMessage.conf

///|
pub(all) struct TriggerMessageConf {
  status : TriggerMessageStatus
} derive(Eq, Debug)

///|
pub fn TriggerMessageConf::to_json(self : TriggerMessageConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  Json::object(obj)
}

///|
pub fn TriggerMessageConf::from_json(json : Json) -> Result[TriggerMessageConf, OcppError] {
  let obj = match expect_object(json, "TriggerMessageConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : TriggerMessageStatus = match req_TriggerMessageStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status })
}

///|
/// UnlockConnector.conf

///|
pub(all) struct UnlockConnectorConf {
  status : UnlockStatus
} derive(Eq, Debug)

///|
pub fn UnlockConnectorConf::to_json(self : UnlockConnectorConf) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  Json::object(obj)
}

///|
pub fn UnlockConnectorConf::from_json(json : Json) -> Result[UnlockConnectorConf, OcppError] {
  let obj = match expect_object(json, "UnlockConnectorConf") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : UnlockStatus = match req_UnlockStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status })
}
