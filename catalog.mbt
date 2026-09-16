///|
/// Typed OCPP 1.6 request and response catalogs.

pub(all) enum Direction {
  FromChargePoint
  FromCentralSystem
  Both
} derive(Eq, Debug)

///|
pub(all) enum Request {
  Authorize(AuthorizeReq)
  BootNotification(BootNotificationReq)
  DiagnosticsStatusNotification(DiagnosticsStatusNotificationReq)
  FirmwareStatusNotification(FirmwareStatusNotificationReq)
  Heartbeat
  LogStatusNotification(LogStatusNotificationReq)
  MeterValues(MeterValuesReq)
  SecurityEventNotification(SecurityEventNotificationReq)
  SignCertificate(SignCertificateReq)
  SignedFirmwareStatusNotification(SignedFirmwareStatusNotificationReq)
  StartTransaction(StartTransactionReq)
  StopTransaction(StopTransactionReq)
  StatusNotification(StatusNotificationReq)
  DataTransfer(DataTransferReq)
  CancelReservation(CancelReservationReq)
  CertificateSigned(CertificateSignedReq)
  ChangeAvailability(ChangeAvailabilityReq)
  ChangeConfiguration(ChangeConfigurationReq)
  ClearCache
  ClearChargingProfile(ClearChargingProfileReq)
  DeleteCertificate(DeleteCertificateReq)
  ExtendedTriggerMessage(ExtendedTriggerMessageReq)
  GetCompositeSchedule(GetCompositeScheduleReq)
  GetConfiguration(GetConfigurationReq)
  GetDiagnostics(GetDiagnosticsReq)
  GetInstalledCertificateIds(GetInstalledCertificateIdsReq)
  GetLocalListVersion
  GetLog(GetLogReq)
  InstallCertificate(InstallCertificateReq)
  RemoteStartTransaction(RemoteStartTransactionReq)
  RemoteStopTransaction(RemoteStopTransactionReq)
  ReserveNow(ReserveNowReq)
  Reset(ResetReq)
  SendLocalList(SendLocalListReq)
  SetChargingProfile(SetChargingProfileReq)
  SignedUpdateFirmware(SignedUpdateFirmwareReq)
  TriggerMessage(TriggerMessageReq)
  UnlockConnector(UnlockConnectorReq)
  UpdateFirmware(UpdateFirmwareReq)
} derive(Eq, Debug)

///|
pub(all) enum Response {
  Authorize(AuthorizeConf)
  BootNotification(BootNotificationConf)
  DiagnosticsStatusNotification
  FirmwareStatusNotification
  Heartbeat(HeartbeatConf)
  LogStatusNotification
  MeterValues
  SecurityEventNotification
  SignCertificate(SignCertificateConf)
  SignedFirmwareStatusNotification
  StartTransaction(StartTransactionConf)
  StopTransaction(StopTransactionConf)
  StatusNotification
  DataTransfer(DataTransferConf)
  CancelReservation(CancelReservationConf)
  CertificateSigned(CertificateSignedConf)
  ChangeAvailability(ChangeAvailabilityConf)
  ChangeConfiguration(ChangeConfigurationConf)
  ClearCache(ClearCacheConf)
  ClearChargingProfile(ClearChargingProfileConf)
  DeleteCertificate(DeleteCertificateConf)
  ExtendedTriggerMessage(ExtendedTriggerMessageConf)
  GetCompositeSchedule(GetCompositeScheduleConf)
  GetConfiguration(GetConfigurationConf)
  GetDiagnostics(GetDiagnosticsConf)
  GetInstalledCertificateIds(GetInstalledCertificateIdsConf)
  GetLocalListVersion(GetLocalListVersionConf)
  GetLog(GetLogConf)
  InstallCertificate(InstallCertificateConf)
  RemoteStartTransaction(RemoteStartTransactionConf)
  RemoteStopTransaction(RemoteStopTransactionConf)
  ReserveNow(ReserveNowConf)
  Reset(ResetConf)
  SendLocalList(SendLocalListConf)
  SetChargingProfile(SetChargingProfileConf)
  SignedUpdateFirmware(SignedUpdateFirmwareConf)
  TriggerMessage(TriggerMessageConf)
  UnlockConnector(UnlockConnectorConf)
  UpdateFirmware
} derive(Eq, Debug)

///|
pub fn Request::action(self : Request) -> String {
  match self {
    Authorize(_) => "Authorize"
    BootNotification(_) => "BootNotification"
    DiagnosticsStatusNotification(_) => "DiagnosticsStatusNotification"
    FirmwareStatusNotification(_) => "FirmwareStatusNotification"
    Heartbeat => "Heartbeat"
    LogStatusNotification(_) => "LogStatusNotification"
    MeterValues(_) => "MeterValues"
    SecurityEventNotification(_) => "SecurityEventNotification"
    SignCertificate(_) => "SignCertificate"
    SignedFirmwareStatusNotification(_) => "SignedFirmwareStatusNotification"
    StartTransaction(_) => "StartTransaction"
    StopTransaction(_) => "StopTransaction"
    StatusNotification(_) => "StatusNotification"
    DataTransfer(_) => "DataTransfer"
    CancelReservation(_) => "CancelReservation"
    CertificateSigned(_) => "CertificateSigned"
    ChangeAvailability(_) => "ChangeAvailability"
    ChangeConfiguration(_) => "ChangeConfiguration"
    ClearCache => "ClearCache"
    ClearChargingProfile(_) => "ClearChargingProfile"
    DeleteCertificate(_) => "DeleteCertificate"
    ExtendedTriggerMessage(_) => "ExtendedTriggerMessage"
    GetCompositeSchedule(_) => "GetCompositeSchedule"
    GetConfiguration(_) => "GetConfiguration"
    GetDiagnostics(_) => "GetDiagnostics"
    GetInstalledCertificateIds(_) => "GetInstalledCertificateIds"
    GetLocalListVersion => "GetLocalListVersion"
    GetLog(_) => "GetLog"
    InstallCertificate(_) => "InstallCertificate"
    RemoteStartTransaction(_) => "RemoteStartTransaction"
    RemoteStopTransaction(_) => "RemoteStopTransaction"
    ReserveNow(_) => "ReserveNow"
    Reset(_) => "Reset"
    SendLocalList(_) => "SendLocalList"
    SetChargingProfile(_) => "SetChargingProfile"
    SignedUpdateFirmware(_) => "SignedUpdateFirmware"
    TriggerMessage(_) => "TriggerMessage"
    UnlockConnector(_) => "UnlockConnector"
    UpdateFirmware(_) => "UpdateFirmware"
  }
}

///|
pub fn Request::direction(self : Request) -> Direction {
  match self {
    Authorize(_) => FromChargePoint
    BootNotification(_) => FromChargePoint
    DiagnosticsStatusNotification(_) => FromChargePoint
    FirmwareStatusNotification(_) => FromChargePoint
    Heartbeat => FromChargePoint
    LogStatusNotification(_) => FromChargePoint
    MeterValues(_) => FromChargePoint
    SecurityEventNotification(_) => FromChargePoint
    SignCertificate(_) => FromChargePoint
    SignedFirmwareStatusNotification(_) => FromChargePoint
    StartTransaction(_) => FromChargePoint
    StopTransaction(_) => FromChargePoint
    StatusNotification(_) => FromChargePoint
    DataTransfer(_) => Both
    CancelReservation(_) => FromCentralSystem
    CertificateSigned(_) => FromCentralSystem
    ChangeAvailability(_) => FromCentralSystem
    ChangeConfiguration(_) => FromCentralSystem
    ClearCache => FromCentralSystem
    ClearChargingProfile(_) => FromCentralSystem
    DeleteCertificate(_) => FromCentralSystem
    ExtendedTriggerMessage(_) => FromCentralSystem
    GetCompositeSchedule(_) => FromCentralSystem
    GetConfiguration(_) => FromCentralSystem
    GetDiagnostics(_) => FromCentralSystem
    GetInstalledCertificateIds(_) => FromCentralSystem
    GetLocalListVersion => FromCentralSystem
    GetLog(_) => FromCentralSystem
    InstallCertificate(_) => FromCentralSystem
    RemoteStartTransaction(_) => FromCentralSystem
    RemoteStopTransaction(_) => FromCentralSystem
    ReserveNow(_) => FromCentralSystem
    Reset(_) => FromCentralSystem
    SendLocalList(_) => FromCentralSystem
    SetChargingProfile(_) => FromCentralSystem
    SignedUpdateFirmware(_) => FromCentralSystem
    TriggerMessage(_) => FromCentralSystem
    UnlockConnector(_) => FromCentralSystem
    UpdateFirmware(_) => FromCentralSystem
  }
}

///|
pub fn Request::to_json(self : Request) -> Json {
  match self {
    Authorize(v) => v.to_json()
    BootNotification(v) => v.to_json()
    DiagnosticsStatusNotification(v) => v.to_json()
    FirmwareStatusNotification(v) => v.to_json()
    Heartbeat => empty_payload()
    LogStatusNotification(v) => v.to_json()
    MeterValues(v) => v.to_json()
    SecurityEventNotification(v) => v.to_json()
    SignCertificate(v) => v.to_json()
    SignedFirmwareStatusNotification(v) => v.to_json()
    StartTransaction(v) => v.to_json()
    StopTransaction(v) => v.to_json()
    StatusNotification(v) => v.to_json()
    DataTransfer(v) => v.to_json()
    CancelReservation(v) => v.to_json()
    CertificateSigned(v) => v.to_json()
    ChangeAvailability(v) => v.to_json()
    ChangeConfiguration(v) => v.to_json()
    ClearCache => empty_payload()
    ClearChargingProfile(v) => v.to_json()
    DeleteCertificate(v) => v.to_json()
    ExtendedTriggerMessage(v) => v.to_json()
    GetCompositeSchedule(v) => v.to_json()
    GetConfiguration(v) => v.to_json()
    GetDiagnostics(v) => v.to_json()
    GetInstalledCertificateIds(v) => v.to_json()
    GetLocalListVersion => empty_payload()
    GetLog(v) => v.to_json()
    InstallCertificate(v) => v.to_json()
    RemoteStartTransaction(v) => v.to_json()
    RemoteStopTransaction(v) => v.to_json()
    ReserveNow(v) => v.to_json()
    Reset(v) => v.to_json()
    SendLocalList(v) => v.to_json()
    SetChargingProfile(v) => v.to_json()
    SignedUpdateFirmware(v) => v.to_json()
    TriggerMessage(v) => v.to_json()
    UnlockConnector(v) => v.to_json()
    UpdateFirmware(v) => v.to_json()
  }
}

///|
pub fn decode_request(action : String, payload : Json) -> Result[Request, OcppError] {
  match action {
    "Authorize" => {
      match AuthorizeReq::from_json(payload) {
        Ok(v) => Ok(Authorize(v))
        Err(e) => Err(e)
      }
    }
    "BootNotification" => {
      match BootNotificationReq::from_json(payload) {
        Ok(v) => Ok(BootNotification(v))
        Err(e) => Err(e)
      }
    }
    "DiagnosticsStatusNotification" => {
      match DiagnosticsStatusNotificationReq::from_json(payload) {
        Ok(v) => Ok(DiagnosticsStatusNotification(v))
        Err(e) => Err(e)
      }
    }
    "FirmwareStatusNotification" => {
      match FirmwareStatusNotificationReq::from_json(payload) {
        Ok(v) => Ok(FirmwareStatusNotification(v))
        Err(e) => Err(e)
      }
    }
    "Heartbeat" => {
      match expect_object(payload, "Heartbeat") {
        Ok(_) => Ok(Heartbeat)
        Err(e) => Err(e)
      }
    }
    "LogStatusNotification" => {
      match LogStatusNotificationReq::from_json(payload) {
        Ok(v) => Ok(LogStatusNotification(v))
        Err(e) => Err(e)
      }
    }
    "MeterValues" => {
      match MeterValuesReq::from_json(payload) {
        Ok(v) => Ok(MeterValues(v))
        Err(e) => Err(e)
      }
    }
    "SecurityEventNotification" => {
      match SecurityEventNotificationReq::from_json(payload) {
        Ok(v) => Ok(SecurityEventNotification(v))
        Err(e) => Err(e)
      }
    }
    "SignCertificate" => {
      match SignCertificateReq::from_json(payload) {
        Ok(v) => Ok(SignCertificate(v))
        Err(e) => Err(e)
      }
    }
    "SignedFirmwareStatusNotification" => {
      match SignedFirmwareStatusNotificationReq::from_json(payload) {
        Ok(v) => Ok(SignedFirmwareStatusNotification(v))
        Err(e) => Err(e)
      }
    }
    "StartTransaction" => {
      match StartTransactionReq::from_json(payload) {
        Ok(v) => Ok(StartTransaction(v))
        Err(e) => Err(e)
      }
    }
    "StopTransaction" => {
      match StopTransactionReq::from_json(payload) {
        Ok(v) => Ok(StopTransaction(v))
        Err(e) => Err(e)
      }
    }
    "StatusNotification" => {
      match StatusNotificationReq::from_json(payload) {
        Ok(v) => Ok(StatusNotification(v))
        Err(e) => Err(e)
      }
    }
    "DataTransfer" => {
      match DataTransferReq::from_json(payload) {
        Ok(v) => Ok(DataTransfer(v))
        Err(e) => Err(e)
      }
    }
    "CancelReservation" => {
      match CancelReservationReq::from_json(payload) {
        Ok(v) => Ok(CancelReservation(v))
        Err(e) => Err(e)
      }
    }
    "CertificateSigned" => {
      match CertificateSignedReq::from_json(payload) {
        Ok(v) => Ok(CertificateSigned(v))
        Err(e) => Err(e)
      }
    }
    "ChangeAvailability" => {
      match ChangeAvailabilityReq::from_json(payload) {
        Ok(v) => Ok(ChangeAvailability(v))
        Err(e) => Err(e)
      }
    }
    "ChangeConfiguration" => {
      match ChangeConfigurationReq::from_json(payload) {
        Ok(v) => Ok(ChangeConfiguration(v))
        Err(e) => Err(e)
      }
    }
    "ClearCache" => {
      match expect_object(payload, "ClearCache") {
        Ok(_) => Ok(ClearCache)
        Err(e) => Err(e)
      }
    }
    "ClearChargingProfile" => {
      match ClearChargingProfileReq::from_json(payload) {
        Ok(v) => Ok(ClearChargingProfile(v))
        Err(e) => Err(e)
      }
    }
    "DeleteCertificate" => {
      match DeleteCertificateReq::from_json(payload) {
        Ok(v) => Ok(DeleteCertificate(v))
        Err(e) => Err(e)
      }
    }
    "ExtendedTriggerMessage" => {
      match ExtendedTriggerMessageReq::from_json(payload) {
        Ok(v) => Ok(ExtendedTriggerMessage(v))
        Err(e) => Err(e)
      }
    }
    "GetCompositeSchedule" => {
      match GetCompositeScheduleReq::from_json(payload) {
        Ok(v) => Ok(GetCompositeSchedule(v))
        Err(e) => Err(e)
      }
    }
    "GetConfiguration" => {
      match GetConfigurationReq::from_json(payload) {
        Ok(v) => Ok(GetConfiguration(v))
        Err(e) => Err(e)
      }
    }
    "GetDiagnostics" => {
      match GetDiagnosticsReq::from_json(payload) {
        Ok(v) => Ok(GetDiagnostics(v))
        Err(e) => Err(e)
      }
    }
    "GetInstalledCertificateIds" => {
      match GetInstalledCertificateIdsReq::from_json(payload) {
        Ok(v) => Ok(GetInstalledCertificateIds(v))
        Err(e) => Err(e)
      }
    }
    "GetLocalListVersion" => {
      match expect_object(payload, "GetLocalListVersion") {
        Ok(_) => Ok(GetLocalListVersion)
        Err(e) => Err(e)
      }
    }
    "GetLog" => {
      match GetLogReq::from_json(payload) {
        Ok(v) => Ok(GetLog(v))
        Err(e) => Err(e)
      }
    }
    "InstallCertificate" => {
      match InstallCertificateReq::from_json(payload) {
        Ok(v) => Ok(InstallCertificate(v))
        Err(e) => Err(e)
      }
    }
    "RemoteStartTransaction" => {
      match RemoteStartTransactionReq::from_json(payload) {
        Ok(v) => Ok(RemoteStartTransaction(v))
        Err(e) => Err(e)
      }
    }
    "RemoteStopTransaction" => {
      match RemoteStopTransactionReq::from_json(payload) {
        Ok(v) => Ok(RemoteStopTransaction(v))
        Err(e) => Err(e)
      }
    }
    "ReserveNow" => {
      match ReserveNowReq::from_json(payload) {
        Ok(v) => Ok(ReserveNow(v))
        Err(e) => Err(e)
      }
    }
    "Reset" => {
      match ResetReq::from_json(payload) {
        Ok(v) => Ok(Reset(v))
        Err(e) => Err(e)
      }
    }
    "SendLocalList" => {
      match SendLocalListReq::from_json(payload) {
        Ok(v) => Ok(SendLocalList(v))
        Err(e) => Err(e)
      }
    }
    "SetChargingProfile" => {
      match SetChargingProfileReq::from_json(payload) {
        Ok(v) => Ok(SetChargingProfile(v))
        Err(e) => Err(e)
      }
    }
    "SignedUpdateFirmware" => {
      match SignedUpdateFirmwareReq::from_json(payload) {
        Ok(v) => Ok(SignedUpdateFirmware(v))
        Err(e) => Err(e)
      }
    }
    "TriggerMessage" => {
      match TriggerMessageReq::from_json(payload) {
        Ok(v) => Ok(TriggerMessage(v))
        Err(e) => Err(e)
      }
    }
    "UnlockConnector" => {
      match UnlockConnectorReq::from_json(payload) {
        Ok(v) => Ok(UnlockConnector(v))
        Err(e) => Err(e)
      }
    }
    "UpdateFirmware" => {
      match UpdateFirmwareReq::from_json(payload) {
        Ok(v) => Ok(UpdateFirmware(v))
        Err(e) => Err(e)
      }
    }
    other => Err(UnknownAction(other))
  }
}

///|
pub fn Response::action(self : Response) -> String {
  match self {
    Authorize(_) => "Authorize"
    BootNotification(_) => "BootNotification"
    DiagnosticsStatusNotification => "DiagnosticsStatusNotification"
    FirmwareStatusNotification => "FirmwareStatusNotification"
    Heartbeat(_) => "Heartbeat"
    LogStatusNotification => "LogStatusNotification"
    MeterValues => "MeterValues"
    SecurityEventNotification => "SecurityEventNotification"
    SignCertificate(_) => "SignCertificate"
    SignedFirmwareStatusNotification => "SignedFirmwareStatusNotification"
    StartTransaction(_) => "StartTransaction"
    StopTransaction(_) => "StopTransaction"
    StatusNotification => "StatusNotification"
    DataTransfer(_) => "DataTransfer"
    CancelReservation(_) => "CancelReservation"
    CertificateSigned(_) => "CertificateSigned"
    ChangeAvailability(_) => "ChangeAvailability"
    ChangeConfiguration(_) => "ChangeConfiguration"
    ClearCache(_) => "ClearCache"
    ClearChargingProfile(_) => "ClearChargingProfile"
    DeleteCertificate(_) => "DeleteCertificate"
    ExtendedTriggerMessage(_) => "ExtendedTriggerMessage"
    GetCompositeSchedule(_) => "GetCompositeSchedule"
    GetConfiguration(_) => "GetConfiguration"
    GetDiagnostics(_) => "GetDiagnostics"
    GetInstalledCertificateIds(_) => "GetInstalledCertificateIds"
    GetLocalListVersion(_) => "GetLocalListVersion"
    GetLog(_) => "GetLog"
    InstallCertificate(_) => "InstallCertificate"
    RemoteStartTransaction(_) => "RemoteStartTransaction"
    RemoteStopTransaction(_) => "RemoteStopTransaction"
    ReserveNow(_) => "ReserveNow"
    Reset(_) => "Reset"
    SendLocalList(_) => "SendLocalList"
    SetChargingProfile(_) => "SetChargingProfile"
    SignedUpdateFirmware(_) => "SignedUpdateFirmware"
    TriggerMessage(_) => "TriggerMessage"
    UnlockConnector(_) => "UnlockConnector"
    UpdateFirmware => "UpdateFirmware"
  }
}

///|
pub fn Response::to_json(self : Response) -> Json {
  match self {
    Authorize(v) => v.to_json()
    BootNotification(v) => v.to_json()
    DiagnosticsStatusNotification => empty_payload()
    FirmwareStatusNotification => empty_payload()
    Heartbeat(v) => v.to_json()
    LogStatusNotification => empty_payload()
    MeterValues => empty_payload()
    SecurityEventNotification => empty_payload()
    SignCertificate(v) => v.to_json()
    SignedFirmwareStatusNotification => empty_payload()
    StartTransaction(v) => v.to_json()
    StopTransaction(v) => v.to_json()
    StatusNotification => empty_payload()
    DataTransfer(v) => v.to_json()
    CancelReservation(v) => v.to_json()
    CertificateSigned(v) => v.to_json()
    ChangeAvailability(v) => v.to_json()
    ChangeConfiguration(v) => v.to_json()
    ClearCache(v) => v.to_json()
    ClearChargingProfile(v) => v.to_json()
    DeleteCertificate(v) => v.to_json()
    ExtendedTriggerMessage(v) => v.to_json()
    GetCompositeSchedule(v) => v.to_json()
    GetConfiguration(v) => v.to_json()
    GetDiagnostics(v) => v.to_json()
    GetInstalledCertificateIds(v) => v.to_json()
    GetLocalListVersion(v) => v.to_json()
    GetLog(v) => v.to_json()
    InstallCertificate(v) => v.to_json()
    RemoteStartTransaction(v) => v.to_json()
    RemoteStopTransaction(v) => v.to_json()
    ReserveNow(v) => v.to_json()
    Reset(v) => v.to_json()
    SendLocalList(v) => v.to_json()
    SetChargingProfile(v) => v.to_json()
    SignedUpdateFirmware(v) => v.to_json()
    TriggerMessage(v) => v.to_json()
    UnlockConnector(v) => v.to_json()
    UpdateFirmware => empty_payload()
  }
}

///|
pub fn decode_response(action : String, payload : Json) -> Result[Response, OcppError] {
  match action {
    "Authorize" => {
      match AuthorizeConf::from_json(payload) {
        Ok(v) => Ok(Authorize(v))
        Err(e) => Err(e)
      }
    }
    "BootNotification" => {
      match BootNotificationConf::from_json(payload) {
        Ok(v) => Ok(BootNotification(v))
        Err(e) => Err(e)
      }
    }
    "DiagnosticsStatusNotification" => {
      match expect_object(payload, "DiagnosticsStatusNotification") {
        Ok(_) => Ok(DiagnosticsStatusNotification)
        Err(e) => Err(e)
      }
    }
    "FirmwareStatusNotification" => {
      match expect_object(payload, "FirmwareStatusNotification") {
        Ok(_) => Ok(FirmwareStatusNotification)
        Err(e) => Err(e)
      }
    }
    "Heartbeat" => {
      match HeartbeatConf::from_json(payload) {
        Ok(v) => Ok(Heartbeat(v))
        Err(e) => Err(e)
      }
    }
    "LogStatusNotification" => {
      match expect_object(payload, "LogStatusNotification") {
        Ok(_) => Ok(LogStatusNotification)
        Err(e) => Err(e)
      }
    }
    "MeterValues" => {
      match expect_object(payload, "MeterValues") {
        Ok(_) => Ok(MeterValues)
        Err(e) => Err(e)
      }
    }
    "SecurityEventNotification" => {
      match expect_object(payload, "SecurityEventNotification") {
        Ok(_) => Ok(SecurityEventNotification)
        Err(e) => Err(e)
      }
    }
    "SignCertificate" => {
      match SignCertificateConf::from_json(payload) {
        Ok(v) => Ok(SignCertificate(v))
        Err(e) => Err(e)
      }
    }
    "SignedFirmwareStatusNotification" => {
      match expect_object(payload, "SignedFirmwareStatusNotification") {
        Ok(_) => Ok(SignedFirmwareStatusNotification)
        Err(e) => Err(e)
      }
    }
    "StartTransaction" => {
      match StartTransactionConf::from_json(payload) {
        Ok(v) => Ok(StartTransaction(v))
        Err(e) => Err(e)
      }
    }
    "StopTransaction" => {
      match StopTransactionConf::from_json(payload) {
        Ok(v) => Ok(StopTransaction(v))
        Err(e) => Err(e)
      }
    }
    "StatusNotification" => {
      match expect_object(payload, "StatusNotification") {
        Ok(_) => Ok(StatusNotification)
        Err(e) => Err(e)
      }
    }
    "DataTransfer" => {
      match DataTransferConf::from_json(payload) {
        Ok(v) => Ok(DataTransfer(v))
        Err(e) => Err(e)
      }
    }
    "CancelReservation" => {
      match CancelReservationConf::from_json(payload) {
        Ok(v) => Ok(CancelReservation(v))
        Err(e) => Err(e)
      }
    }
    "CertificateSigned" => {
      match CertificateSignedConf::from_json(payload) {
        Ok(v) => Ok(CertificateSigned(v))
        Err(e) => Err(e)
      }
    }
    "ChangeAvailability" => {
      match ChangeAvailabilityConf::from_json(payload) {
        Ok(v) => Ok(ChangeAvailability(v))
        Err(e) => Err(e)
      }
    }
    "ChangeConfiguration" => {
      match ChangeConfigurationConf::from_json(payload) {
        Ok(v) => Ok(ChangeConfiguration(v))
        Err(e) => Err(e)
      }
    }
    "ClearCache" => {
      match ClearCacheConf::from_json(payload) {
        Ok(v) => Ok(ClearCache(v))
        Err(e) => Err(e)
      }
    }
    "ClearChargingProfile" => {
      match ClearChargingProfileConf::from_json(payload) {
        Ok(v) => Ok(ClearChargingProfile(v))
        Err(e) => Err(e)
      }
    }
    "DeleteCertificate" => {
      match DeleteCertificateConf::from_json(payload) {
        Ok(v) => Ok(DeleteCertificate(v))
        Err(e) => Err(e)
      }
    }
    "ExtendedTriggerMessage" => {
      match ExtendedTriggerMessageConf::from_json(payload) {
        Ok(v) => Ok(ExtendedTriggerMessage(v))
        Err(e) => Err(e)
      }
    }
    "GetCompositeSchedule" => {
      match GetCompositeScheduleConf::from_json(payload) {
        Ok(v) => Ok(GetCompositeSchedule(v))
        Err(e) => Err(e)
      }
    }
    "GetConfiguration" => {
      match GetConfigurationConf::from_json(payload) {
        Ok(v) => Ok(GetConfiguration(v))
        Err(e) => Err(e)
      }
    }
    "GetDiagnostics" => {
      match GetDiagnosticsConf::from_json(payload) {
        Ok(v) => Ok(GetDiagnostics(v))
        Err(e) => Err(e)
      }
    }
    "GetInstalledCertificateIds" => {
      match GetInstalledCertificateIdsConf::from_json(payload) {
        Ok(v) => Ok(GetInstalledCertificateIds(v))
        Err(e) => Err(e)
      }
    }
    "GetLocalListVersion" => {
      match GetLocalListVersionConf::from_json(payload) {
        Ok(v) => Ok(GetLocalListVersion(v))
        Err(e) => Err(e)
      }
    }
    "GetLog" => {
      match GetLogConf::from_json(payload) {
        Ok(v) => Ok(GetLog(v))
        Err(e) => Err(e)
      }
    }
    "InstallCertificate" => {
      match InstallCertificateConf::from_json(payload) {
        Ok(v) => Ok(InstallCertificate(v))
        Err(e) => Err(e)
      }
    }
    "RemoteStartTransaction" => {
      match RemoteStartTransactionConf::from_json(payload) {
        Ok(v) => Ok(RemoteStartTransaction(v))
        Err(e) => Err(e)
      }
    }
    "RemoteStopTransaction" => {
      match RemoteStopTransactionConf::from_json(payload) {
        Ok(v) => Ok(RemoteStopTransaction(v))
        Err(e) => Err(e)
      }
    }
    "ReserveNow" => {
      match ReserveNowConf::from_json(payload) {
        Ok(v) => Ok(ReserveNow(v))
        Err(e) => Err(e)
      }
    }
    "Reset" => {
      match ResetConf::from_json(payload) {
        Ok(v) => Ok(Reset(v))
        Err(e) => Err(e)
      }
    }
    "SendLocalList" => {
      match SendLocalListConf::from_json(payload) {
        Ok(v) => Ok(SendLocalList(v))
        Err(e) => Err(e)
      }
    }
    "SetChargingProfile" => {
      match SetChargingProfileConf::from_json(payload) {
        Ok(v) => Ok(SetChargingProfile(v))
        Err(e) => Err(e)
      }
    }
    "SignedUpdateFirmware" => {
      match SignedUpdateFirmwareConf::from_json(payload) {
        Ok(v) => Ok(SignedUpdateFirmware(v))
        Err(e) => Err(e)
      }
    }
    "TriggerMessage" => {
      match TriggerMessageConf::from_json(payload) {
        Ok(v) => Ok(TriggerMessage(v))
        Err(e) => Err(e)
      }
    }
    "UnlockConnector" => {
      match UnlockConnectorConf::from_json(payload) {
        Ok(v) => Ok(UnlockConnector(v))
        Err(e) => Err(e)
      }
    }
    "UpdateFirmware" => {
      match expect_object(payload, "UpdateFirmware") {
        Ok(_) => Ok(UpdateFirmware)
        Err(e) => Err(e)
      }
    }
    other => Err(UnknownAction(other))
  }
}

///|
pub fn action_direction(action : String) -> Result[Direction, OcppError] {
  match action {
    "Authorize" => Ok(FromChargePoint)
    "BootNotification" => Ok(FromChargePoint)
    "DiagnosticsStatusNotification" => Ok(FromChargePoint)
    "FirmwareStatusNotification" => Ok(FromChargePoint)
    "Heartbeat" => Ok(FromChargePoint)
    "LogStatusNotification" => Ok(FromChargePoint)
    "MeterValues" => Ok(FromChargePoint)
    "SecurityEventNotification" => Ok(FromChargePoint)
    "SignCertificate" => Ok(FromChargePoint)
    "SignedFirmwareStatusNotification" => Ok(FromChargePoint)
    "StartTransaction" => Ok(FromChargePoint)
    "StopTransaction" => Ok(FromChargePoint)
    "StatusNotification" => Ok(FromChargePoint)
    "DataTransfer" => Ok(Both)
    "CancelReservation" => Ok(FromCentralSystem)
    "CertificateSigned" => Ok(FromCentralSystem)
    "ChangeAvailability" => Ok(FromCentralSystem)
    "ChangeConfiguration" => Ok(FromCentralSystem)
    "ClearCache" => Ok(FromCentralSystem)
    "ClearChargingProfile" => Ok(FromCentralSystem)
    "DeleteCertificate" => Ok(FromCentralSystem)
    "ExtendedTriggerMessage" => Ok(FromCentralSystem)
    "GetCompositeSchedule" => Ok(FromCentralSystem)
    "GetConfiguration" => Ok(FromCentralSystem)
    "GetDiagnostics" => Ok(FromCentralSystem)
    "GetInstalledCertificateIds" => Ok(FromCentralSystem)
    "GetLocalListVersion" => Ok(FromCentralSystem)
    "GetLog" => Ok(FromCentralSystem)
    "InstallCertificate" => Ok(FromCentralSystem)
    "RemoteStartTransaction" => Ok(FromCentralSystem)
    "RemoteStopTransaction" => Ok(FromCentralSystem)
    "ReserveNow" => Ok(FromCentralSystem)
    "Reset" => Ok(FromCentralSystem)
    "SendLocalList" => Ok(FromCentralSystem)
    "SetChargingProfile" => Ok(FromCentralSystem)
    "SignedUpdateFirmware" => Ok(FromCentralSystem)
    "TriggerMessage" => Ok(FromCentralSystem)
    "UnlockConnector" => Ok(FromCentralSystem)
    "UpdateFirmware" => Ok(FromCentralSystem)
    other => Err(UnknownAction(other))
  }
}

///|
pub fn known_action(action : String) -> Bool {
  match action_direction(action) {
    Ok(_) => true
    Err(_) => false
  }
}

///|
pub fn supported_action_count() -> Int { 39 }

///|
pub fn supported_actions() -> Array[String] {
  [
    "Authorize",
    "BootNotification",
    "DiagnosticsStatusNotification",
    "FirmwareStatusNotification",
    "Heartbeat",
    "LogStatusNotification",
    "MeterValues",
    "SecurityEventNotification",
    "SignCertificate",
    "SignedFirmwareStatusNotification",
    "StartTransaction",
    "StopTransaction",
    "StatusNotification",
    "DataTransfer",
    "CancelReservation",
    "CertificateSigned",
    "ChangeAvailability",
    "ChangeConfiguration",
    "ClearCache",
    "ClearChargingProfile",
    "DeleteCertificate",
    "ExtendedTriggerMessage",
    "GetCompositeSchedule",
    "GetConfiguration",
    "GetDiagnostics",
    "GetInstalledCertificateIds",
    "GetLocalListVersion",
    "GetLog",
    "InstallCertificate",
    "RemoteStartTransaction",
    "RemoteStopTransaction",
    "ReserveNow",
    "Reset",
    "SendLocalList",
    "SetChargingProfile",
    "SignedUpdateFirmware",
    "TriggerMessage",
    "UnlockConnector",
    "UpdateFirmware",
  ]
}

///|
pub fn encode_request_call(unique_id : String, request : Request) -> Result[String, OcppError] {
  encode_call(unique_id, request.action(), request.to_json())
}

///|
pub fn encode_response_result(unique_id : String, response : Response) -> Result[String, OcppError] {
  encode_call_result(unique_id, response.to_json())
}

///|
pub(all) struct DecodedCall {
  unique_id : String
  request : Request
} derive(Eq, Debug)

///|
pub fn decode_request_call(text : String) -> Result[DecodedCall, OcppError] {
  match decode_envelope(text) {
    Err(e) => Err(e)
    Ok(Call(msg)) => {
      match decode_request(msg.action, msg.payload) {
        Ok(request) => Ok({ unique_id: msg.unique_id, request: request })
        Err(e) => Err(e)
      }
    }
    Ok(_) => Err(Protocol("expected Call envelope"))
  }
}
