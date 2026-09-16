///|
/// OCPP 1.6 JSON enumerations. Wire strings follow mobilityhouse/ocpp v16.

///|
pub(all) enum AuthorizationStatus {
  Accepted
  Blocked
  Expired
  Invalid
  ConcurrentTx
} derive(Eq, Debug)

///|
pub fn AuthorizationStatus::to_wire(self : AuthorizationStatus) -> String {
  match self {
    Accepted => "Accepted"
    Blocked => "Blocked"
    Expired => "Expired"
    Invalid => "Invalid"
    ConcurrentTx => "ConcurrentTx"
  }
}

///|
pub fn AuthorizationStatus::from_wire(s : String) -> AuthorizationStatus? {
  match s {
    "Accepted" => Some(Accepted)
    "Blocked" => Some(Blocked)
    "Expired" => Some(Expired)
    "Invalid" => Some(Invalid)
    "ConcurrentTx" => Some(ConcurrentTx)
    _ => None
  }
}

///|
pub fn req_AuthorizationStatus(obj : Map[String, Json], key : String) -> Result[AuthorizationStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match AuthorizationStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_AuthorizationStatus(obj : Map[String, Json], key : String) -> Result[AuthorizationStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match AuthorizationStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum AvailabilityStatus {
  Accepted
  Rejected
  Scheduled
} derive(Eq, Debug)

///|
pub fn AvailabilityStatus::to_wire(self : AvailabilityStatus) -> String {
  match self {
    Accepted => "Accepted"
    Rejected => "Rejected"
    Scheduled => "Scheduled"
  }
}

///|
pub fn AvailabilityStatus::from_wire(s : String) -> AvailabilityStatus? {
  match s {
    "Accepted" => Some(Accepted)
    "Rejected" => Some(Rejected)
    "Scheduled" => Some(Scheduled)
    _ => None
  }
}

///|
pub fn req_AvailabilityStatus(obj : Map[String, Json], key : String) -> Result[AvailabilityStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match AvailabilityStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_AvailabilityStatus(obj : Map[String, Json], key : String) -> Result[AvailabilityStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match AvailabilityStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum AvailabilityType {
  Inoperative
  Operative
} derive(Eq, Debug)

///|
pub fn AvailabilityType::to_wire(self : AvailabilityType) -> String {
  match self {
    Inoperative => "Inoperative"
    Operative => "Operative"
  }
}

///|
pub fn AvailabilityType::from_wire(s : String) -> AvailabilityType? {
  match s {
    "Inoperative" => Some(Inoperative)
    "Operative" => Some(Operative)
    _ => None
  }
}

///|
pub fn req_AvailabilityType(obj : Map[String, Json], key : String) -> Result[AvailabilityType, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match AvailabilityType::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_AvailabilityType(obj : Map[String, Json], key : String) -> Result[AvailabilityType?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match AvailabilityType::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum CancelReservationStatus {
  Accepted
  Rejected
} derive(Eq, Debug)

///|
pub fn CancelReservationStatus::to_wire(self : CancelReservationStatus) -> String {
  match self {
    Accepted => "Accepted"
    Rejected => "Rejected"
  }
}

///|
pub fn CancelReservationStatus::from_wire(s : String) -> CancelReservationStatus? {
  match s {
    "Accepted" => Some(Accepted)
    "Rejected" => Some(Rejected)
    _ => None
  }
}

///|
pub fn req_CancelReservationStatus(obj : Map[String, Json], key : String) -> Result[CancelReservationStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match CancelReservationStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_CancelReservationStatus(obj : Map[String, Json], key : String) -> Result[CancelReservationStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match CancelReservationStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum CertificateSignedStatus {
  Accepted
  Rejected
} derive(Eq, Debug)

///|
pub fn CertificateSignedStatus::to_wire(self : CertificateSignedStatus) -> String {
  match self {
    Accepted => "Accepted"
    Rejected => "Rejected"
  }
}

///|
pub fn CertificateSignedStatus::from_wire(s : String) -> CertificateSignedStatus? {
  match s {
    "Accepted" => Some(Accepted)
    "Rejected" => Some(Rejected)
    _ => None
  }
}

///|
pub fn req_CertificateSignedStatus(obj : Map[String, Json], key : String) -> Result[CertificateSignedStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match CertificateSignedStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_CertificateSignedStatus(obj : Map[String, Json], key : String) -> Result[CertificateSignedStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match CertificateSignedStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum CertificateStatus {
  Accepted
  Rejected
  Failed
} derive(Eq, Debug)

///|
pub fn CertificateStatus::to_wire(self : CertificateStatus) -> String {
  match self {
    Accepted => "Accepted"
    Rejected => "Rejected"
    Failed => "Failed"
  }
}

///|
pub fn CertificateStatus::from_wire(s : String) -> CertificateStatus? {
  match s {
    "Accepted" => Some(Accepted)
    "Rejected" => Some(Rejected)
    "Failed" => Some(Failed)
    _ => None
  }
}

///|
pub fn req_CertificateStatus(obj : Map[String, Json], key : String) -> Result[CertificateStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match CertificateStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_CertificateStatus(obj : Map[String, Json], key : String) -> Result[CertificateStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match CertificateStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum CertificateUse {
  CentralSystemRootCertificate
  ManufacturerRootCertificate
} derive(Eq, Debug)

///|
pub fn CertificateUse::to_wire(self : CertificateUse) -> String {
  match self {
    CentralSystemRootCertificate => "CentralSystemRootCertificate"
    ManufacturerRootCertificate => "ManufacturerRootCertificate"
  }
}

///|
pub fn CertificateUse::from_wire(s : String) -> CertificateUse? {
  match s {
    "CentralSystemRootCertificate" => Some(CentralSystemRootCertificate)
    "ManufacturerRootCertificate" => Some(ManufacturerRootCertificate)
    _ => None
  }
}

///|
pub fn req_CertificateUse(obj : Map[String, Json], key : String) -> Result[CertificateUse, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match CertificateUse::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_CertificateUse(obj : Map[String, Json], key : String) -> Result[CertificateUse?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match CertificateUse::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum ChargePointErrorCode {
  ConnectorLockFailure
  EVCommunicationError
  GroundFailure
  HighTemperature
  InternalError
  LocalListConflict
  NoError
  OtherError
  OverCurrentFailure
  OverVoltage
  PowerMeterFailure
  PowerSwitchFailure
  ReaderFailure
  ResetFailure
  UnderVoltage
  WeakSignal
} derive(Eq, Debug)

///|
pub fn ChargePointErrorCode::to_wire(self : ChargePointErrorCode) -> String {
  match self {
    ConnectorLockFailure => "ConnectorLockFailure"
    EVCommunicationError => "EVCommunicationError"
    GroundFailure => "GroundFailure"
    HighTemperature => "HighTemperature"
    InternalError => "InternalError"
    LocalListConflict => "LocalListConflict"
    NoError => "NoError"
    OtherError => "OtherError"
    OverCurrentFailure => "OverCurrentFailure"
    OverVoltage => "OverVoltage"
    PowerMeterFailure => "PowerMeterFailure"
    PowerSwitchFailure => "PowerSwitchFailure"
    ReaderFailure => "ReaderFailure"
    ResetFailure => "ResetFailure"
    UnderVoltage => "UnderVoltage"
    WeakSignal => "WeakSignal"
  }
}

///|
pub fn ChargePointErrorCode::from_wire(s : String) -> ChargePointErrorCode? {
  match s {
    "ConnectorLockFailure" => Some(ConnectorLockFailure)
    "EVCommunicationError" => Some(EVCommunicationError)
    "GroundFailure" => Some(GroundFailure)
    "HighTemperature" => Some(HighTemperature)
    "InternalError" => Some(InternalError)
    "LocalListConflict" => Some(LocalListConflict)
    "NoError" => Some(NoError)
    "OtherError" => Some(OtherError)
    "OverCurrentFailure" => Some(OverCurrentFailure)
    "OverVoltage" => Some(OverVoltage)
    "PowerMeterFailure" => Some(PowerMeterFailure)
    "PowerSwitchFailure" => Some(PowerSwitchFailure)
    "ReaderFailure" => Some(ReaderFailure)
    "ResetFailure" => Some(ResetFailure)
    "UnderVoltage" => Some(UnderVoltage)
    "WeakSignal" => Some(WeakSignal)
    _ => None
  }
}

///|
pub fn req_ChargePointErrorCode(obj : Map[String, Json], key : String) -> Result[ChargePointErrorCode, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match ChargePointErrorCode::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_ChargePointErrorCode(obj : Map[String, Json], key : String) -> Result[ChargePointErrorCode?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match ChargePointErrorCode::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum ChargePointStatus {
  Available
  Preparing
  Charging
  SuspendedEVSE
  SuspendedEV
  Finishing
  Reserved
  Unavailable
  Faulted
} derive(Eq, Debug)

///|
pub fn ChargePointStatus::to_wire(self : ChargePointStatus) -> String {
  match self {
    Available => "Available"
    Preparing => "Preparing"
    Charging => "Charging"
    SuspendedEVSE => "SuspendedEVSE"
    SuspendedEV => "SuspendedEV"
    Finishing => "Finishing"
    Reserved => "Reserved"
    Unavailable => "Unavailable"
    Faulted => "Faulted"
  }
}

///|
pub fn ChargePointStatus::from_wire(s : String) -> ChargePointStatus? {
  match s {
    "Available" => Some(Available)
    "Preparing" => Some(Preparing)
    "Charging" => Some(Charging)
    "SuspendedEVSE" => Some(SuspendedEVSE)
    "SuspendedEV" => Some(SuspendedEV)
    "Finishing" => Some(Finishing)
    "Reserved" => Some(Reserved)
    "Unavailable" => Some(Unavailable)
    "Faulted" => Some(Faulted)
    _ => None
  }
}

///|
pub fn req_ChargePointStatus(obj : Map[String, Json], key : String) -> Result[ChargePointStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match ChargePointStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_ChargePointStatus(obj : Map[String, Json], key : String) -> Result[ChargePointStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match ChargePointStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum ChargingProfileKindType {
  Absolute
  Recurring
  Relative
} derive(Eq, Debug)

///|
pub fn ChargingProfileKindType::to_wire(self : ChargingProfileKindType) -> String {
  match self {
    Absolute => "Absolute"
    Recurring => "Recurring"
    Relative => "Relative"
  }
}

///|
pub fn ChargingProfileKindType::from_wire(s : String) -> ChargingProfileKindType? {
  match s {
    "Absolute" => Some(Absolute)
    "Recurring" => Some(Recurring)
    "Relative" => Some(Relative)
    _ => None
  }
}

///|
pub fn req_ChargingProfileKindType(obj : Map[String, Json], key : String) -> Result[ChargingProfileKindType, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match ChargingProfileKindType::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_ChargingProfileKindType(obj : Map[String, Json], key : String) -> Result[ChargingProfileKindType?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match ChargingProfileKindType::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum ChargingProfilePurposeType {
  ChargePointMaxProfile
  TxDefaultProfile
  TxProfile
} derive(Eq, Debug)

///|
pub fn ChargingProfilePurposeType::to_wire(self : ChargingProfilePurposeType) -> String {
  match self {
    ChargePointMaxProfile => "ChargePointMaxProfile"
    TxDefaultProfile => "TxDefaultProfile"
    TxProfile => "TxProfile"
  }
}

///|
pub fn ChargingProfilePurposeType::from_wire(s : String) -> ChargingProfilePurposeType? {
  match s {
    "ChargePointMaxProfile" => Some(ChargePointMaxProfile)
    "TxDefaultProfile" => Some(TxDefaultProfile)
    "TxProfile" => Some(TxProfile)
    _ => None
  }
}

///|
pub fn req_ChargingProfilePurposeType(obj : Map[String, Json], key : String) -> Result[ChargingProfilePurposeType, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match ChargingProfilePurposeType::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_ChargingProfilePurposeType(obj : Map[String, Json], key : String) -> Result[ChargingProfilePurposeType?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match ChargingProfilePurposeType::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum ChargingProfileStatus {
  Accepted
  Rejected
  NotSupported
} derive(Eq, Debug)

///|
pub fn ChargingProfileStatus::to_wire(self : ChargingProfileStatus) -> String {
  match self {
    Accepted => "Accepted"
    Rejected => "Rejected"
    NotSupported => "NotSupported"
  }
}

///|
pub fn ChargingProfileStatus::from_wire(s : String) -> ChargingProfileStatus? {
  match s {
    "Accepted" => Some(Accepted)
    "Rejected" => Some(Rejected)
    "NotSupported" => Some(NotSupported)
    _ => None
  }
}

///|
pub fn req_ChargingProfileStatus(obj : Map[String, Json], key : String) -> Result[ChargingProfileStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match ChargingProfileStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_ChargingProfileStatus(obj : Map[String, Json], key : String) -> Result[ChargingProfileStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match ChargingProfileStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum ChargingRateUnitType {
  W
  A
} derive(Eq, Debug)

///|
pub fn ChargingRateUnitType::to_wire(self : ChargingRateUnitType) -> String {
  match self {
    W => "W"
    A => "A"
  }
}

///|
pub fn ChargingRateUnitType::from_wire(s : String) -> ChargingRateUnitType? {
  match s {
    "W" => Some(W)
    "A" => Some(A)
    _ => None
  }
}

///|
pub fn req_ChargingRateUnitType(obj : Map[String, Json], key : String) -> Result[ChargingRateUnitType, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match ChargingRateUnitType::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_ChargingRateUnitType(obj : Map[String, Json], key : String) -> Result[ChargingRateUnitType?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match ChargingRateUnitType::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum ClearCacheStatus {
  Accepted
  Rejected
} derive(Eq, Debug)

///|
pub fn ClearCacheStatus::to_wire(self : ClearCacheStatus) -> String {
  match self {
    Accepted => "Accepted"
    Rejected => "Rejected"
  }
}

///|
pub fn ClearCacheStatus::from_wire(s : String) -> ClearCacheStatus? {
  match s {
    "Accepted" => Some(Accepted)
    "Rejected" => Some(Rejected)
    _ => None
  }
}

///|
pub fn req_ClearCacheStatus(obj : Map[String, Json], key : String) -> Result[ClearCacheStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match ClearCacheStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_ClearCacheStatus(obj : Map[String, Json], key : String) -> Result[ClearCacheStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match ClearCacheStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum ClearChargingProfileStatus {
  Accepted
  Unknown
} derive(Eq, Debug)

///|
pub fn ClearChargingProfileStatus::to_wire(self : ClearChargingProfileStatus) -> String {
  match self {
    Accepted => "Accepted"
    Unknown => "Unknown"
  }
}

///|
pub fn ClearChargingProfileStatus::from_wire(s : String) -> ClearChargingProfileStatus? {
  match s {
    "Accepted" => Some(Accepted)
    "Unknown" => Some(Unknown)
    _ => None
  }
}

///|
pub fn req_ClearChargingProfileStatus(obj : Map[String, Json], key : String) -> Result[ClearChargingProfileStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match ClearChargingProfileStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_ClearChargingProfileStatus(obj : Map[String, Json], key : String) -> Result[ClearChargingProfileStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match ClearChargingProfileStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum ConfigurationStatus {
  Accepted
  Rejected
  RebootRequired
  NotSupported
} derive(Eq, Debug)

///|
pub fn ConfigurationStatus::to_wire(self : ConfigurationStatus) -> String {
  match self {
    Accepted => "Accepted"
    Rejected => "Rejected"
    RebootRequired => "RebootRequired"
    NotSupported => "NotSupported"
  }
}

///|
pub fn ConfigurationStatus::from_wire(s : String) -> ConfigurationStatus? {
  match s {
    "Accepted" => Some(Accepted)
    "Rejected" => Some(Rejected)
    "RebootRequired" => Some(RebootRequired)
    "NotSupported" => Some(NotSupported)
    _ => None
  }
}

///|
pub fn req_ConfigurationStatus(obj : Map[String, Json], key : String) -> Result[ConfigurationStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match ConfigurationStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_ConfigurationStatus(obj : Map[String, Json], key : String) -> Result[ConfigurationStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match ConfigurationStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum DataTransferStatus {
  Accepted
  Rejected
  UnknownMessageId
  UnknownVendorId
} derive(Eq, Debug)

///|
pub fn DataTransferStatus::to_wire(self : DataTransferStatus) -> String {
  match self {
    Accepted => "Accepted"
    Rejected => "Rejected"
    UnknownMessageId => "UnknownMessageId"
    UnknownVendorId => "UnknownVendorId"
  }
}

///|
pub fn DataTransferStatus::from_wire(s : String) -> DataTransferStatus? {
  match s {
    "Accepted" => Some(Accepted)
    "Rejected" => Some(Rejected)
    "UnknownMessageId" => Some(UnknownMessageId)
    "UnknownVendorId" => Some(UnknownVendorId)
    _ => None
  }
}

///|
pub fn req_DataTransferStatus(obj : Map[String, Json], key : String) -> Result[DataTransferStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match DataTransferStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_DataTransferStatus(obj : Map[String, Json], key : String) -> Result[DataTransferStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match DataTransferStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum DeleteCertificateStatus {
  Accepted
  Failed
  NotFound
} derive(Eq, Debug)

///|
pub fn DeleteCertificateStatus::to_wire(self : DeleteCertificateStatus) -> String {
  match self {
    Accepted => "Accepted"
    Failed => "Failed"
    NotFound => "NotFound"
  }
}

///|
pub fn DeleteCertificateStatus::from_wire(s : String) -> DeleteCertificateStatus? {
  match s {
    "Accepted" => Some(Accepted)
    "Failed" => Some(Failed)
    "NotFound" => Some(NotFound)
    _ => None
  }
}

///|
pub fn req_DeleteCertificateStatus(obj : Map[String, Json], key : String) -> Result[DeleteCertificateStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match DeleteCertificateStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_DeleteCertificateStatus(obj : Map[String, Json], key : String) -> Result[DeleteCertificateStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match DeleteCertificateStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum DiagnosticsStatus {
  Idle
  Uploaded
  UploadFailed
  Uploading
} derive(Eq, Debug)

///|
pub fn DiagnosticsStatus::to_wire(self : DiagnosticsStatus) -> String {
  match self {
    Idle => "Idle"
    Uploaded => "Uploaded"
    UploadFailed => "UploadFailed"
    Uploading => "Uploading"
  }
}

///|
pub fn DiagnosticsStatus::from_wire(s : String) -> DiagnosticsStatus? {
  match s {
    "Idle" => Some(Idle)
    "Uploaded" => Some(Uploaded)
    "UploadFailed" => Some(UploadFailed)
    "Uploading" => Some(Uploading)
    _ => None
  }
}

///|
pub fn req_DiagnosticsStatus(obj : Map[String, Json], key : String) -> Result[DiagnosticsStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match DiagnosticsStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_DiagnosticsStatus(obj : Map[String, Json], key : String) -> Result[DiagnosticsStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match DiagnosticsStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum FirmwareStatus {
  Downloaded
  DownloadFailed
  Downloading
  Idle
  InstallationFailed
  Installing
  Installed
  DownloadScheduled
  DownloadPaused
  InstallRebooting
  InstallScheduled
  InstallVerificationFailed
  InvalidSignature
  SignatureVerified
} derive(Eq, Debug)

///|
pub fn FirmwareStatus::to_wire(self : FirmwareStatus) -> String {
  match self {
    Downloaded => "Downloaded"
    DownloadFailed => "DownloadFailed"
    Downloading => "Downloading"
    Idle => "Idle"
    InstallationFailed => "InstallationFailed"
    Installing => "Installing"
    Installed => "Installed"
    DownloadScheduled => "DownloadScheduled"
    DownloadPaused => "DownloadPaused"
    InstallRebooting => "InstallRebooting"
    InstallScheduled => "InstallScheduled"
    InstallVerificationFailed => "InstallVerificationFailed"
    InvalidSignature => "InvalidSignature"
    SignatureVerified => "SignatureVerified"
  }
}

///|
pub fn FirmwareStatus::from_wire(s : String) -> FirmwareStatus? {
  match s {
    "Downloaded" => Some(Downloaded)
    "DownloadFailed" => Some(DownloadFailed)
    "Downloading" => Some(Downloading)
    "Idle" => Some(Idle)
    "InstallationFailed" => Some(InstallationFailed)
    "Installing" => Some(Installing)
    "Installed" => Some(Installed)
    "DownloadScheduled" => Some(DownloadScheduled)
    "DownloadPaused" => Some(DownloadPaused)
    "InstallRebooting" => Some(InstallRebooting)
    "InstallScheduled" => Some(InstallScheduled)
    "InstallVerificationFailed" => Some(InstallVerificationFailed)
    "InvalidSignature" => Some(InvalidSignature)
    "SignatureVerified" => Some(SignatureVerified)
    _ => None
  }
}

///|
pub fn req_FirmwareStatus(obj : Map[String, Json], key : String) -> Result[FirmwareStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match FirmwareStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_FirmwareStatus(obj : Map[String, Json], key : String) -> Result[FirmwareStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match FirmwareStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum GenericStatus {
  Accepted
  Rejected
} derive(Eq, Debug)

///|
pub fn GenericStatus::to_wire(self : GenericStatus) -> String {
  match self {
    Accepted => "Accepted"
    Rejected => "Rejected"
  }
}

///|
pub fn GenericStatus::from_wire(s : String) -> GenericStatus? {
  match s {
    "Accepted" => Some(Accepted)
    "Rejected" => Some(Rejected)
    _ => None
  }
}

///|
pub fn req_GenericStatus(obj : Map[String, Json], key : String) -> Result[GenericStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match GenericStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_GenericStatus(obj : Map[String, Json], key : String) -> Result[GenericStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match GenericStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum GetCompositeScheduleStatus {
  Accepted
  Rejected
} derive(Eq, Debug)

///|
pub fn GetCompositeScheduleStatus::to_wire(self : GetCompositeScheduleStatus) -> String {
  match self {
    Accepted => "Accepted"
    Rejected => "Rejected"
  }
}

///|
pub fn GetCompositeScheduleStatus::from_wire(s : String) -> GetCompositeScheduleStatus? {
  match s {
    "Accepted" => Some(Accepted)
    "Rejected" => Some(Rejected)
    _ => None
  }
}

///|
pub fn req_GetCompositeScheduleStatus(obj : Map[String, Json], key : String) -> Result[GetCompositeScheduleStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match GetCompositeScheduleStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_GetCompositeScheduleStatus(obj : Map[String, Json], key : String) -> Result[GetCompositeScheduleStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match GetCompositeScheduleStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum GetInstalledCertificateStatus {
  Accepted
  NotFound
} derive(Eq, Debug)

///|
pub fn GetInstalledCertificateStatus::to_wire(self : GetInstalledCertificateStatus) -> String {
  match self {
    Accepted => "Accepted"
    NotFound => "NotFound"
  }
}

///|
pub fn GetInstalledCertificateStatus::from_wire(s : String) -> GetInstalledCertificateStatus? {
  match s {
    "Accepted" => Some(Accepted)
    "NotFound" => Some(NotFound)
    _ => None
  }
}

///|
pub fn req_GetInstalledCertificateStatus(obj : Map[String, Json], key : String) -> Result[GetInstalledCertificateStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match GetInstalledCertificateStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_GetInstalledCertificateStatus(obj : Map[String, Json], key : String) -> Result[GetInstalledCertificateStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match GetInstalledCertificateStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum HashAlgorithm {
  SHA256
  SHA384
  SHA512
} derive(Eq, Debug)

///|
pub fn HashAlgorithm::to_wire(self : HashAlgorithm) -> String {
  match self {
    SHA256 => "SHA256"
    SHA384 => "SHA384"
    SHA512 => "SHA512"
  }
}

///|
pub fn HashAlgorithm::from_wire(s : String) -> HashAlgorithm? {
  match s {
    "SHA256" => Some(SHA256)
    "SHA384" => Some(SHA384)
    "SHA512" => Some(SHA512)
    _ => None
  }
}

///|
pub fn req_HashAlgorithm(obj : Map[String, Json], key : String) -> Result[HashAlgorithm, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match HashAlgorithm::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_HashAlgorithm(obj : Map[String, Json], key : String) -> Result[HashAlgorithm?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match HashAlgorithm::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum Location {
  Inlet
  Outlet
  Body
  Cable
  EV
} derive(Eq, Debug)

///|
pub fn Location::to_wire(self : Location) -> String {
  match self {
    Inlet => "Inlet"
    Outlet => "Outlet"
    Body => "Body"
    Cable => "Cable"
    EV => "EV"
  }
}

///|
pub fn Location::from_wire(s : String) -> Location? {
  match s {
    "Inlet" => Some(Inlet)
    "Outlet" => Some(Outlet)
    "Body" => Some(Body)
    "Cable" => Some(Cable)
    "EV" => Some(EV)
    _ => None
  }
}

///|
pub fn req_Location(obj : Map[String, Json], key : String) -> Result[Location, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match Location::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_Location(obj : Map[String, Json], key : String) -> Result[Location?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match Location::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum LogKind {
  DiagnosticsLog
  SecurityLog
} derive(Eq, Debug)

///|
pub fn LogKind::to_wire(self : LogKind) -> String {
  match self {
    DiagnosticsLog => "DiagnosticsLog"
    SecurityLog => "SecurityLog"
  }
}

///|
pub fn LogKind::from_wire(s : String) -> LogKind? {
  match s {
    "DiagnosticsLog" => Some(DiagnosticsLog)
    "SecurityLog" => Some(SecurityLog)
    _ => None
  }
}

///|
pub fn req_LogKind(obj : Map[String, Json], key : String) -> Result[LogKind, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match LogKind::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_LogKind(obj : Map[String, Json], key : String) -> Result[LogKind?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match LogKind::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum LogStatus {
  Accepted
  Rejected
  AcceptedCanceled
} derive(Eq, Debug)

///|
pub fn LogStatus::to_wire(self : LogStatus) -> String {
  match self {
    Accepted => "Accepted"
    Rejected => "Rejected"
    AcceptedCanceled => "AcceptedCanceled"
  }
}

///|
pub fn LogStatus::from_wire(s : String) -> LogStatus? {
  match s {
    "Accepted" => Some(Accepted)
    "Rejected" => Some(Rejected)
    "AcceptedCanceled" => Some(AcceptedCanceled)
    _ => None
  }
}

///|
pub fn req_LogStatus(obj : Map[String, Json], key : String) -> Result[LogStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match LogStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_LogStatus(obj : Map[String, Json], key : String) -> Result[LogStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match LogStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum Measurand {
  CurrentExport
  CurrentImport
  CurrentOffered
  EnergyActiveExportRegister
  EnergyActiveImportRegister
  EnergyReactiveExportRegister
  EnergyReactiveImportRegister
  EnergyActiveExportInterval
  EnergyActiveImportInterval
  EnergyReactiveExportInterval
  EnergyReactiveImportInterval
  Frequency
  PowerActiveExport
  PowerActiveImport
  PowerFactor
  PowerOffered
  PowerReactiveExport
  PowerReactiveImport
  RPM
  SoC
  Temperature
  Voltage
} derive(Eq, Debug)

///|
pub fn Measurand::to_wire(self : Measurand) -> String {
  match self {
    CurrentExport => "Current.Export"
    CurrentImport => "Current.Import"
    CurrentOffered => "Current.Offered"
    EnergyActiveExportRegister => "Energy.Active.Export.Register"
    EnergyActiveImportRegister => "Energy.Active.Import.Register"
    EnergyReactiveExportRegister => "Energy.Reactive.Export.Register"
    EnergyReactiveImportRegister => "Energy.Reactive.Import.Register"
    EnergyActiveExportInterval => "Energy.Active.Export.Interval"
    EnergyActiveImportInterval => "Energy.Active.Import.Interval"
    EnergyReactiveExportInterval => "Energy.Reactive.Export.Interval"
    EnergyReactiveImportInterval => "Energy.Reactive.Import.Interval"
    Frequency => "Frequency"
    PowerActiveExport => "Power.Active.Export"
    PowerActiveImport => "Power.Active.Import"
    PowerFactor => "Power.Factor"
    PowerOffered => "Power.Offered"
    PowerReactiveExport => "Power.Reactive.Export"
    PowerReactiveImport => "Power.Reactive.Import"
    RPM => "RPM"
    SoC => "SoC"
    Temperature => "Temperature"
    Voltage => "Voltage"
  }
}

///|
pub fn Measurand::from_wire(s : String) -> Measurand? {
  match s {
    "Current.Export" => Some(CurrentExport)
    "Current.Import" => Some(CurrentImport)
    "Current.Offered" => Some(CurrentOffered)
    "Energy.Active.Export.Register" => Some(EnergyActiveExportRegister)
    "Energy.Active.Import.Register" => Some(EnergyActiveImportRegister)
    "Energy.Reactive.Export.Register" => Some(EnergyReactiveExportRegister)
    "Energy.Reactive.Import.Register" => Some(EnergyReactiveImportRegister)
    "Energy.Active.Export.Interval" => Some(EnergyActiveExportInterval)
    "Energy.Active.Import.Interval" => Some(EnergyActiveImportInterval)
    "Energy.Reactive.Export.Interval" => Some(EnergyReactiveExportInterval)
    "Energy.Reactive.Import.Interval" => Some(EnergyReactiveImportInterval)
    "Frequency" => Some(Frequency)
    "Power.Active.Export" => Some(PowerActiveExport)
    "Power.Active.Import" => Some(PowerActiveImport)
    "Power.Factor" => Some(PowerFactor)
    "Power.Offered" => Some(PowerOffered)
    "Power.Reactive.Export" => Some(PowerReactiveExport)
    "Power.Reactive.Import" => Some(PowerReactiveImport)
    "RPM" => Some(RPM)
    "SoC" => Some(SoC)
    "Temperature" => Some(Temperature)
    "Voltage" => Some(Voltage)
    _ => None
  }
}

///|
pub fn req_Measurand(obj : Map[String, Json], key : String) -> Result[Measurand, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match Measurand::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_Measurand(obj : Map[String, Json], key : String) -> Result[Measurand?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match Measurand::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum MessageTrigger {
  BootNotification
  FirmwareStatusNotification
  Heartbeat
  MeterValues
  StatusNotification
  DiagnosticsStatusNotification
  LogStatusNotification
  SignChargePointCertificate
} derive(Eq, Debug)

///|
pub fn MessageTrigger::to_wire(self : MessageTrigger) -> String {
  match self {
    BootNotification => "BootNotification"
    FirmwareStatusNotification => "FirmwareStatusNotification"
    Heartbeat => "Heartbeat"
    MeterValues => "MeterValues"
    StatusNotification => "StatusNotification"
    DiagnosticsStatusNotification => "DiagnosticsStatusNotification"
    LogStatusNotification => "LogStatusNotification"
    SignChargePointCertificate => "SignChargePointCertificate"
  }
}

///|
pub fn MessageTrigger::from_wire(s : String) -> MessageTrigger? {
  match s {
    "BootNotification" => Some(BootNotification)
    "FirmwareStatusNotification" => Some(FirmwareStatusNotification)
    "Heartbeat" => Some(Heartbeat)
    "MeterValues" => Some(MeterValues)
    "StatusNotification" => Some(StatusNotification)
    "DiagnosticsStatusNotification" => Some(DiagnosticsStatusNotification)
    "LogStatusNotification" => Some(LogStatusNotification)
    "SignChargePointCertificate" => Some(SignChargePointCertificate)
    _ => None
  }
}

///|
pub fn req_MessageTrigger(obj : Map[String, Json], key : String) -> Result[MessageTrigger, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match MessageTrigger::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_MessageTrigger(obj : Map[String, Json], key : String) -> Result[MessageTrigger?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match MessageTrigger::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum Phase {
  L1
  L2
  L3
  N
  L1N
  L2N
  L3N
  L1L2
  L2L3
  L3L1
} derive(Eq, Debug)

///|
pub fn Phase::to_wire(self : Phase) -> String {
  match self {
    L1 => "L1"
    L2 => "L2"
    L3 => "L3"
    N => "N"
    L1N => "L1-N"
    L2N => "L2-N"
    L3N => "L3-N"
    L1L2 => "L1-L2"
    L2L3 => "L2-L3"
    L3L1 => "L3-L1"
  }
}

///|
pub fn Phase::from_wire(s : String) -> Phase? {
  match s {
    "L1" => Some(L1)
    "L2" => Some(L2)
    "L3" => Some(L3)
    "N" => Some(N)
    "L1-N" => Some(L1N)
    "L2-N" => Some(L2N)
    "L3-N" => Some(L3N)
    "L1-L2" => Some(L1L2)
    "L2-L3" => Some(L2L3)
    "L3-L1" => Some(L3L1)
    _ => None
  }
}

///|
pub fn req_Phase(obj : Map[String, Json], key : String) -> Result[Phase, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match Phase::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_Phase(obj : Map[String, Json], key : String) -> Result[Phase?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match Phase::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum ReadingContext {
  InterruptionBegin
  InterruptionEnd
  Other
  SampleClock
  SamplePeriodic
  TransactionBegin
  TransactionEnd
  Trigger
} derive(Eq, Debug)

///|
pub fn ReadingContext::to_wire(self : ReadingContext) -> String {
  match self {
    InterruptionBegin => "Interruption.Begin"
    InterruptionEnd => "Interruption.End"
    Other => "Other"
    SampleClock => "Sample.Clock"
    SamplePeriodic => "Sample.Periodic"
    TransactionBegin => "Transaction.Begin"
    TransactionEnd => "Transaction.End"
    Trigger => "Trigger"
  }
}

///|
pub fn ReadingContext::from_wire(s : String) -> ReadingContext? {
  match s {
    "Interruption.Begin" => Some(InterruptionBegin)
    "Interruption.End" => Some(InterruptionEnd)
    "Other" => Some(Other)
    "Sample.Clock" => Some(SampleClock)
    "Sample.Periodic" => Some(SamplePeriodic)
    "Transaction.Begin" => Some(TransactionBegin)
    "Transaction.End" => Some(TransactionEnd)
    "Trigger" => Some(Trigger)
    _ => None
  }
}

///|
pub fn req_ReadingContext(obj : Map[String, Json], key : String) -> Result[ReadingContext, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match ReadingContext::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_ReadingContext(obj : Map[String, Json], key : String) -> Result[ReadingContext?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match ReadingContext::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum Reason {
  EmergencyStop
  EVDisconnected
  HardReset
  Local
  Other
  PowerLoss
  Reboot
  Remote
  SoftReset
  UnlockCommand
  DeAuthorized
} derive(Eq, Debug)

///|
pub fn Reason::to_wire(self : Reason) -> String {
  match self {
    EmergencyStop => "EmergencyStop"
    EVDisconnected => "EVDisconnected"
    HardReset => "HardReset"
    Local => "Local"
    Other => "Other"
    PowerLoss => "PowerLoss"
    Reboot => "Reboot"
    Remote => "Remote"
    SoftReset => "SoftReset"
    UnlockCommand => "UnlockCommand"
    DeAuthorized => "DeAuthorized"
  }
}

///|
pub fn Reason::from_wire(s : String) -> Reason? {
  match s {
    "EmergencyStop" => Some(EmergencyStop)
    "EVDisconnected" => Some(EVDisconnected)
    "HardReset" => Some(HardReset)
    "Local" => Some(Local)
    "Other" => Some(Other)
    "PowerLoss" => Some(PowerLoss)
    "Reboot" => Some(Reboot)
    "Remote" => Some(Remote)
    "SoftReset" => Some(SoftReset)
    "UnlockCommand" => Some(UnlockCommand)
    "DeAuthorized" => Some(DeAuthorized)
    _ => None
  }
}

///|
pub fn req_Reason(obj : Map[String, Json], key : String) -> Result[Reason, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match Reason::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_Reason(obj : Map[String, Json], key : String) -> Result[Reason?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match Reason::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum RecurrencyKind {
  Daily
  Weekly
} derive(Eq, Debug)

///|
pub fn RecurrencyKind::to_wire(self : RecurrencyKind) -> String {
  match self {
    Daily => "Daily"
    Weekly => "Weekly"
  }
}

///|
pub fn RecurrencyKind::from_wire(s : String) -> RecurrencyKind? {
  match s {
    "Daily" => Some(Daily)
    "Weekly" => Some(Weekly)
    _ => None
  }
}

///|
pub fn req_RecurrencyKind(obj : Map[String, Json], key : String) -> Result[RecurrencyKind, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match RecurrencyKind::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_RecurrencyKind(obj : Map[String, Json], key : String) -> Result[RecurrencyKind?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match RecurrencyKind::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum RegistrationStatus {
  Accepted
  Pending
  Rejected
} derive(Eq, Debug)

///|
pub fn RegistrationStatus::to_wire(self : RegistrationStatus) -> String {
  match self {
    Accepted => "Accepted"
    Pending => "Pending"
    Rejected => "Rejected"
  }
}

///|
pub fn RegistrationStatus::from_wire(s : String) -> RegistrationStatus? {
  match s {
    "Accepted" => Some(Accepted)
    "Pending" => Some(Pending)
    "Rejected" => Some(Rejected)
    _ => None
  }
}

///|
pub fn req_RegistrationStatus(obj : Map[String, Json], key : String) -> Result[RegistrationStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match RegistrationStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_RegistrationStatus(obj : Map[String, Json], key : String) -> Result[RegistrationStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match RegistrationStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum RemoteStartStopStatus {
  Accepted
  Rejected
} derive(Eq, Debug)

///|
pub fn RemoteStartStopStatus::to_wire(self : RemoteStartStopStatus) -> String {
  match self {
    Accepted => "Accepted"
    Rejected => "Rejected"
  }
}

///|
pub fn RemoteStartStopStatus::from_wire(s : String) -> RemoteStartStopStatus? {
  match s {
    "Accepted" => Some(Accepted)
    "Rejected" => Some(Rejected)
    _ => None
  }
}

///|
pub fn req_RemoteStartStopStatus(obj : Map[String, Json], key : String) -> Result[RemoteStartStopStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match RemoteStartStopStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_RemoteStartStopStatus(obj : Map[String, Json], key : String) -> Result[RemoteStartStopStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match RemoteStartStopStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum ReservationStatus {
  Accepted
  Faulted
  Occupied
  Rejected
  Unavailable
} derive(Eq, Debug)

///|
pub fn ReservationStatus::to_wire(self : ReservationStatus) -> String {
  match self {
    Accepted => "Accepted"
    Faulted => "Faulted"
    Occupied => "Occupied"
    Rejected => "Rejected"
    Unavailable => "Unavailable"
  }
}

///|
pub fn ReservationStatus::from_wire(s : String) -> ReservationStatus? {
  match s {
    "Accepted" => Some(Accepted)
    "Faulted" => Some(Faulted)
    "Occupied" => Some(Occupied)
    "Rejected" => Some(Rejected)
    "Unavailable" => Some(Unavailable)
    _ => None
  }
}

///|
pub fn req_ReservationStatus(obj : Map[String, Json], key : String) -> Result[ReservationStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match ReservationStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_ReservationStatus(obj : Map[String, Json], key : String) -> Result[ReservationStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match ReservationStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum ResetStatus {
  Accepted
  Rejected
} derive(Eq, Debug)

///|
pub fn ResetStatus::to_wire(self : ResetStatus) -> String {
  match self {
    Accepted => "Accepted"
    Rejected => "Rejected"
  }
}

///|
pub fn ResetStatus::from_wire(s : String) -> ResetStatus? {
  match s {
    "Accepted" => Some(Accepted)
    "Rejected" => Some(Rejected)
    _ => None
  }
}

///|
pub fn req_ResetStatus(obj : Map[String, Json], key : String) -> Result[ResetStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match ResetStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_ResetStatus(obj : Map[String, Json], key : String) -> Result[ResetStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match ResetStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum ResetType {
  Hard
  Soft
} derive(Eq, Debug)

///|
pub fn ResetType::to_wire(self : ResetType) -> String {
  match self {
    Hard => "Hard"
    Soft => "Soft"
  }
}

///|
pub fn ResetType::from_wire(s : String) -> ResetType? {
  match s {
    "Hard" => Some(Hard)
    "Soft" => Some(Soft)
    _ => None
  }
}

///|
pub fn req_ResetType(obj : Map[String, Json], key : String) -> Result[ResetType, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match ResetType::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_ResetType(obj : Map[String, Json], key : String) -> Result[ResetType?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match ResetType::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum TriggerMessageStatus {
  Accepted
  Rejected
  NotImplemented
} derive(Eq, Debug)

///|
pub fn TriggerMessageStatus::to_wire(self : TriggerMessageStatus) -> String {
  match self {
    Accepted => "Accepted"
    Rejected => "Rejected"
    NotImplemented => "NotImplemented"
  }
}

///|
pub fn TriggerMessageStatus::from_wire(s : String) -> TriggerMessageStatus? {
  match s {
    "Accepted" => Some(Accepted)
    "Rejected" => Some(Rejected)
    "NotImplemented" => Some(NotImplemented)
    _ => None
  }
}

///|
pub fn req_TriggerMessageStatus(obj : Map[String, Json], key : String) -> Result[TriggerMessageStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match TriggerMessageStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_TriggerMessageStatus(obj : Map[String, Json], key : String) -> Result[TriggerMessageStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match TriggerMessageStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum UnitOfMeasure {
  Wh
  KWh
  Varh
  KVarh
  W
  KW
  VA
  KVA
  Var
  KVar
  A
  V
  Celsius
  Fahrenheit
  K
  Percent
} derive(Eq, Debug)

///|
pub fn UnitOfMeasure::to_wire(self : UnitOfMeasure) -> String {
  match self {
    Wh => "Wh"
    KWh => "kWh"
    Varh => "varh"
    KVarh => "kvarh"
    W => "W"
    KW => "kW"
    VA => "VA"
    KVA => "kVA"
    Var => "var"
    KVar => "kvar"
    A => "A"
    V => "V"
    Celsius => "Celsius"
    Fahrenheit => "Fahrenheit"
    K => "K"
    Percent => "Percent"
  }
}

///|
pub fn UnitOfMeasure::from_wire(s : String) -> UnitOfMeasure? {
  match s {
    "Wh" => Some(Wh)
    "kWh" => Some(KWh)
    "varh" => Some(Varh)
    "kvarh" => Some(KVarh)
    "W" => Some(W)
    "kW" => Some(KW)
    "VA" => Some(VA)
    "kVA" => Some(KVA)
    "var" => Some(Var)
    "kvar" => Some(KVar)
    "A" => Some(A)
    "V" => Some(V)
    "Celsius" => Some(Celsius)
    "Fahrenheit" => Some(Fahrenheit)
    "K" => Some(K)
    "Percent" => Some(Percent)
    _ => None
  }
}

///|
pub fn req_UnitOfMeasure(obj : Map[String, Json], key : String) -> Result[UnitOfMeasure, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match UnitOfMeasure::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_UnitOfMeasure(obj : Map[String, Json], key : String) -> Result[UnitOfMeasure?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match UnitOfMeasure::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum UnlockStatus {
  Unlocked
  UnlockFailed
  NotSupported
} derive(Eq, Debug)

///|
pub fn UnlockStatus::to_wire(self : UnlockStatus) -> String {
  match self {
    Unlocked => "Unlocked"
    UnlockFailed => "UnlockFailed"
    NotSupported => "NotSupported"
  }
}

///|
pub fn UnlockStatus::from_wire(s : String) -> UnlockStatus? {
  match s {
    "Unlocked" => Some(Unlocked)
    "UnlockFailed" => Some(UnlockFailed)
    "NotSupported" => Some(NotSupported)
    _ => None
  }
}

///|
pub fn req_UnlockStatus(obj : Map[String, Json], key : String) -> Result[UnlockStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match UnlockStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_UnlockStatus(obj : Map[String, Json], key : String) -> Result[UnlockStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match UnlockStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum UpdateFirmwareStatus {
  Accepted
  Rejected
  AcceptedCanceled
  InvalidCertificate
  RevokedCertificate
} derive(Eq, Debug)

///|
pub fn UpdateFirmwareStatus::to_wire(self : UpdateFirmwareStatus) -> String {
  match self {
    Accepted => "Accepted"
    Rejected => "Rejected"
    AcceptedCanceled => "AcceptedCanceled"
    InvalidCertificate => "InvalidCertificate"
    RevokedCertificate => "RevokedCertificate"
  }
}

///|
pub fn UpdateFirmwareStatus::from_wire(s : String) -> UpdateFirmwareStatus? {
  match s {
    "Accepted" => Some(Accepted)
    "Rejected" => Some(Rejected)
    "AcceptedCanceled" => Some(AcceptedCanceled)
    "InvalidCertificate" => Some(InvalidCertificate)
    "RevokedCertificate" => Some(RevokedCertificate)
    _ => None
  }
}

///|
pub fn req_UpdateFirmwareStatus(obj : Map[String, Json], key : String) -> Result[UpdateFirmwareStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match UpdateFirmwareStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_UpdateFirmwareStatus(obj : Map[String, Json], key : String) -> Result[UpdateFirmwareStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match UpdateFirmwareStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum UploadLogStatus {
  BadMessage
  Idle
  NotSupportedOperation
  PermissionDenied
  Uploaded
  UploadFailure
  Uploading
} derive(Eq, Debug)

///|
pub fn UploadLogStatus::to_wire(self : UploadLogStatus) -> String {
  match self {
    BadMessage => "BadMessage"
    Idle => "Idle"
    NotSupportedOperation => "NotSupportedOperation"
    PermissionDenied => "PermissionDenied"
    Uploaded => "Uploaded"
    UploadFailure => "UploadFailure"
    Uploading => "Uploading"
  }
}

///|
pub fn UploadLogStatus::from_wire(s : String) -> UploadLogStatus? {
  match s {
    "BadMessage" => Some(BadMessage)
    "Idle" => Some(Idle)
    "NotSupportedOperation" => Some(NotSupportedOperation)
    "PermissionDenied" => Some(PermissionDenied)
    "Uploaded" => Some(Uploaded)
    "UploadFailure" => Some(UploadFailure)
    "Uploading" => Some(Uploading)
    _ => None
  }
}

///|
pub fn req_UploadLogStatus(obj : Map[String, Json], key : String) -> Result[UploadLogStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match UploadLogStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_UploadLogStatus(obj : Map[String, Json], key : String) -> Result[UploadLogStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match UploadLogStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum UpdateStatus {
  Accepted
  Failed
  NotSupported
  VersionMismatch
} derive(Eq, Debug)

///|
pub fn UpdateStatus::to_wire(self : UpdateStatus) -> String {
  match self {
    Accepted => "Accepted"
    Failed => "Failed"
    NotSupported => "NotSupported"
    VersionMismatch => "VersionMismatch"
  }
}

///|
pub fn UpdateStatus::from_wire(s : String) -> UpdateStatus? {
  match s {
    "Accepted" => Some(Accepted)
    "Failed" => Some(Failed)
    "NotSupported" => Some(NotSupported)
    "VersionMismatch" => Some(VersionMismatch)
    _ => None
  }
}

///|
pub fn req_UpdateStatus(obj : Map[String, Json], key : String) -> Result[UpdateStatus, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match UpdateStatus::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_UpdateStatus(obj : Map[String, Json], key : String) -> Result[UpdateStatus?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match UpdateStatus::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum UpdateType {
  Differential
  Full
} derive(Eq, Debug)

///|
pub fn UpdateType::to_wire(self : UpdateType) -> String {
  match self {
    Differential => "Differential"
    Full => "Full"
  }
}

///|
pub fn UpdateType::from_wire(s : String) -> UpdateType? {
  match s {
    "Differential" => Some(Differential)
    "Full" => Some(Full)
    _ => None
  }
}

///|
pub fn req_UpdateType(obj : Map[String, Json], key : String) -> Result[UpdateType, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match UpdateType::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_UpdateType(obj : Map[String, Json], key : String) -> Result[UpdateType?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match UpdateType::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub(all) enum ValueFormat {
  Raw
  SignedData
} derive(Eq, Debug)

///|
pub fn ValueFormat::to_wire(self : ValueFormat) -> String {
  match self {
    Raw => "Raw"
    SignedData => "SignedData"
  }
}

///|
pub fn ValueFormat::from_wire(s : String) -> ValueFormat? {
  match s {
    "Raw" => Some(Raw)
    "SignedData" => Some(SignedData)
    _ => None
  }
}

///|
pub fn req_ValueFormat(obj : Map[String, Json], key : String) -> Result[ValueFormat, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match ValueFormat::from_wire(s) {
        Some(v) => Ok(v)
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

///|
pub fn opt_ValueFormat(obj : Map[String, Json], key : String) -> Result[ValueFormat?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match ValueFormat::from_wire(s) {
        Some(v) => Ok(Some(v))
        None => Err(PropertyConstraint("invalid " + key))
      }
    }
  }
}

