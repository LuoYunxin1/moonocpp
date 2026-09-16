///|
/// OCPP 1.6 JSON datatypes used by Core and extension payloads.

///|
/// IdTagInfo

///|
pub(all) struct IdTagInfo {
  status : AuthorizationStatus
  parent_id_tag : String?
  expiry_date : String?
} derive(Eq, Debug)

///|
pub fn IdTagInfo::to_json(self : IdTagInfo) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  put_opt_str(obj, "parentIdTag", self.parent_id_tag)
  put_opt_str(obj, "expiryDate", self.expiry_date)
  Json::object(obj)
}

///|
pub fn IdTagInfo::from_json(json : Json) -> Result[IdTagInfo, OcppError] {
  let obj = match expect_object(json, "IdTagInfo") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : AuthorizationStatus = match req_AuthorizationStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let parent_id_tag : String? = match opt_str(obj, "parentIdTag") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let expiry_date : String? = match opt_str(obj, "expiryDate") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status, parent_id_tag: parent_id_tag, expiry_date: expiry_date })
}

///|
/// AuthorizationData

///|
pub(all) struct AuthorizationData {
  id_tag : String
  id_tag_info : IdTagInfo?
} derive(Eq, Debug)

///|
pub fn AuthorizationData::to_json(self : AuthorizationData) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "idTag", self.id_tag)
  match self.id_tag_info {
    Some(v) => put_json(obj, "idTagInfo", v.to_json())
    None => ()
  }
  Json::object(obj)
}

///|
pub fn AuthorizationData::from_json(json : Json) -> Result[AuthorizationData, OcppError] {
  let obj = match expect_object(json, "AuthorizationData") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let id_tag : String = match req_str(obj, "idTag") {
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
  Ok({ id_tag: id_tag, id_tag_info: id_tag_info })
}

///|
/// ChargingSchedulePeriod

///|
pub(all) struct ChargingSchedulePeriod {
  start_period : Int
  limit : Double
  number_phases : Int?
} derive(Eq, Debug)

///|
pub fn ChargingSchedulePeriod::to_json(self : ChargingSchedulePeriod) -> Json {
  let obj : Map[String, Json] = Map([])
  put_int(obj, "startPeriod", self.start_period)
  put_float(obj, "limit", self.limit)
  put_opt_int(obj, "numberPhases", self.number_phases)
  Json::object(obj)
}

///|
pub fn ChargingSchedulePeriod::from_json(json : Json) -> Result[ChargingSchedulePeriod, OcppError] {
  let obj = match expect_object(json, "ChargingSchedulePeriod") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let start_period : Int = match req_int(obj, "startPeriod") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let limit : Double = match req_float(obj, "limit") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let number_phases : Int? = match opt_int(obj, "numberPhases") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ start_period: start_period, limit: limit, number_phases: number_phases })
}

///|
/// ChargingSchedule

///|
pub(all) struct ChargingSchedule {
  charging_rate_unit : ChargingRateUnitType
  charging_schedule_period : Array[ChargingSchedulePeriod]
  duration : Int?
  start_schedule : String?
  min_charging_rate : Double?
} derive(Eq, Debug)

///|
pub fn ChargingSchedule::to_json(self : ChargingSchedule) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "chargingRateUnit", self.charging_rate_unit.to_wire())
  {
    let arr : Array[Json] = []
    for i in 0..<self.charging_schedule_period.length() {
      arr.push(self.charging_schedule_period[i].to_json())
    }
    put_json(obj, "chargingSchedulePeriod", Json::array(arr))
  }
  put_opt_int(obj, "duration", self.duration)
  put_opt_str(obj, "startSchedule", self.start_schedule)
  put_opt_float(obj, "minChargingRate", self.min_charging_rate)
  Json::object(obj)
}

///|
pub fn ChargingSchedule::from_json(json : Json) -> Result[ChargingSchedule, OcppError] {
  let obj = match expect_object(json, "ChargingSchedule") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let charging_rate_unit : ChargingRateUnitType = match req_ChargingRateUnitType(obj, "chargingRateUnit") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let raw_charging_schedule_period = match req_array(obj, "chargingSchedulePeriod") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let charging_schedule_period : Array[ChargingSchedulePeriod] = []
  for i in 0..<raw_charging_schedule_period.length() {
    match ChargingSchedulePeriod::from_json(raw_charging_schedule_period[i]) {
      Ok(v) => charging_schedule_period.push(v)
      Err(e) => return Err(e)
    }
  }
  let duration : Int? = match opt_int(obj, "duration") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let start_schedule : String? = match opt_str(obj, "startSchedule") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let min_charging_rate : Double? = match opt_float(obj, "minChargingRate") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ charging_rate_unit: charging_rate_unit, charging_schedule_period: charging_schedule_period, duration: duration, start_schedule: start_schedule, min_charging_rate: min_charging_rate })
}

///|
/// ChargingProfile

///|
pub(all) struct ChargingProfile {
  charging_profile_id : Int
  stack_level : Int
  charging_profile_purpose : ChargingProfilePurposeType
  charging_profile_kind : ChargingProfileKindType
  charging_schedule : ChargingSchedule
  transaction_id : Int?
  recurrency_kind : RecurrencyKind?
  valid_from : String?
  valid_to : String?
} derive(Eq, Debug)

///|
pub fn ChargingProfile::to_json(self : ChargingProfile) -> Json {
  let obj : Map[String, Json] = Map([])
  put_int(obj, "chargingProfileId", self.charging_profile_id)
  put_int(obj, "stackLevel", self.stack_level)
  put_str(obj, "chargingProfilePurpose", self.charging_profile_purpose.to_wire())
  put_str(obj, "chargingProfileKind", self.charging_profile_kind.to_wire())
  put_json(obj, "chargingSchedule", self.charging_schedule.to_json())
  put_opt_int(obj, "transactionId", self.transaction_id)
  match self.recurrency_kind {
    Some(v) => put_str(obj, "recurrencyKind", v.to_wire())
    None => ()
  }
  put_opt_str(obj, "validFrom", self.valid_from)
  put_opt_str(obj, "validTo", self.valid_to)
  Json::object(obj)
}

///|
pub fn ChargingProfile::from_json(json : Json) -> Result[ChargingProfile, OcppError] {
  let obj = match expect_object(json, "ChargingProfile") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let charging_profile_id : Int = match req_int(obj, "chargingProfileId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let stack_level : Int = match req_int(obj, "stackLevel") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let charging_profile_purpose : ChargingProfilePurposeType = match req_ChargingProfilePurposeType(obj, "chargingProfilePurpose") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let charging_profile_kind : ChargingProfileKindType = match req_ChargingProfileKindType(obj, "chargingProfileKind") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let raw_charging_schedule = match req_object(obj, "chargingSchedule") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let charging_schedule : ChargingSchedule = match ChargingSchedule::from_json(raw_charging_schedule) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let transaction_id : Int? = match opt_int(obj, "transactionId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let recurrency_kind : RecurrencyKind? = match opt_RecurrencyKind(obj, "recurrencyKind") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let valid_from : String? = match opt_str(obj, "validFrom") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let valid_to : String? = match opt_str(obj, "validTo") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ charging_profile_id: charging_profile_id, stack_level: stack_level, charging_profile_purpose: charging_profile_purpose, charging_profile_kind: charging_profile_kind, charging_schedule: charging_schedule, transaction_id: transaction_id, recurrency_kind: recurrency_kind, valid_from: valid_from, valid_to: valid_to })
}

///|
/// KeyValue

///|
pub(all) struct KeyValue {
  key : String
  readonly_ : Bool
  value : String?
} derive(Eq, Debug)

///|
pub fn KeyValue::to_json(self : KeyValue) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "key", self.key)
  put_bool(obj, "readonly", self.readonly_)
  put_opt_str(obj, "value", self.value)
  Json::object(obj)
}

///|
pub fn KeyValue::from_json(json : Json) -> Result[KeyValue, OcppError] {
  let obj = match expect_object(json, "KeyValue") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let key : String = match req_str(obj, "key") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let readonly_ : Bool = match req_bool(obj, "readonly") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let value : String? = match opt_str(obj, "value") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ key: key, readonly_: readonly_, value: value })
}

///|
/// SampledValue

///|
pub(all) struct SampledValue {
  value : String
  context : ReadingContext?
  format_ : ValueFormat?
  measurand : Measurand?
  phase : Phase?
  location : Location?
  unit : UnitOfMeasure?
} derive(Eq, Debug)

///|
pub fn SampledValue::to_json(self : SampledValue) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "value", self.value)
  match self.context {
    Some(v) => put_str(obj, "context", v.to_wire())
    None => ()
  }
  match self.format_ {
    Some(v) => put_str(obj, "format", v.to_wire())
    None => ()
  }
  match self.measurand {
    Some(v) => put_str(obj, "measurand", v.to_wire())
    None => ()
  }
  match self.phase {
    Some(v) => put_str(obj, "phase", v.to_wire())
    None => ()
  }
  match self.location {
    Some(v) => put_str(obj, "location", v.to_wire())
    None => ()
  }
  match self.unit {
    Some(v) => put_str(obj, "unit", v.to_wire())
    None => ()
  }
  Json::object(obj)
}

///|
pub fn SampledValue::from_json(json : Json) -> Result[SampledValue, OcppError] {
  let obj = match expect_object(json, "SampledValue") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let value : String = match req_str(obj, "value") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let context : ReadingContext? = match opt_ReadingContext(obj, "context") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let format_ : ValueFormat? = match opt_ValueFormat(obj, "format") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let measurand : Measurand? = match opt_Measurand(obj, "measurand") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let phase : Phase? = match opt_Phase(obj, "phase") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let location : Location? = match opt_Location(obj, "location") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let unit : UnitOfMeasure? = match opt_UnitOfMeasure(obj, "unit") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ value: value, context: context, format_: format_, measurand: measurand, phase: phase, location: location, unit: unit })
}

///|
/// MeterValue

///|
pub(all) struct MeterValue {
  timestamp : String
  sampled_value : Array[SampledValue]
} derive(Eq, Debug)

///|
pub fn MeterValue::to_json(self : MeterValue) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "timestamp", self.timestamp)
  {
    let arr : Array[Json] = []
    for i in 0..<self.sampled_value.length() {
      arr.push(self.sampled_value[i].to_json())
    }
    put_json(obj, "sampledValue", Json::array(arr))
  }
  Json::object(obj)
}

///|
pub fn MeterValue::from_json(json : Json) -> Result[MeterValue, OcppError] {
  let obj = match expect_object(json, "MeterValue") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let timestamp : String = match req_str(obj, "timestamp") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let raw_sampled_value = match req_array(obj, "sampledValue") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let sampled_value : Array[SampledValue] = []
  for i in 0..<raw_sampled_value.length() {
    match SampledValue::from_json(raw_sampled_value[i]) {
      Ok(v) => sampled_value.push(v)
      Err(e) => return Err(e)
    }
  }
  Ok({ timestamp: timestamp, sampled_value: sampled_value })
}

///|
/// CertificateHashData

///|
pub(all) struct CertificateHashData {
  hash_algorithm : HashAlgorithm
  issuer_name_hash : String
  issuer_key_hash : String
  serial_number : String
} derive(Eq, Debug)

///|
pub fn CertificateHashData::to_json(self : CertificateHashData) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "hashAlgorithm", self.hash_algorithm.to_wire())
  put_str(obj, "issuerNameHash", self.issuer_name_hash)
  put_str(obj, "issuerKeyHash", self.issuer_key_hash)
  put_str(obj, "serialNumber", self.serial_number)
  Json::object(obj)
}

///|
pub fn CertificateHashData::from_json(json : Json) -> Result[CertificateHashData, OcppError] {
  let obj = match expect_object(json, "CertificateHashData") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let hash_algorithm : HashAlgorithm = match req_HashAlgorithm(obj, "hashAlgorithm") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let issuer_name_hash : String = match req_str(obj, "issuerNameHash") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let issuer_key_hash : String = match req_str(obj, "issuerKeyHash") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let serial_number : String = match req_str(obj, "serialNumber") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ hash_algorithm: hash_algorithm, issuer_name_hash: issuer_name_hash, issuer_key_hash: issuer_key_hash, serial_number: serial_number })
}

///|
/// Firmware

///|
pub(all) struct Firmware {
  location : String
  retrieve_date_time : String
  signing_certificate : String
  install_date_time : String?
  signature : String?
} derive(Eq, Debug)

///|
pub fn Firmware::to_json(self : Firmware) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "location", self.location)
  put_str(obj, "retrieveDateTime", self.retrieve_date_time)
  put_str(obj, "signingCertificate", self.signing_certificate)
  put_opt_str(obj, "installDateTime", self.install_date_time)
  put_opt_str(obj, "signature", self.signature)
  Json::object(obj)
}

///|
pub fn Firmware::from_json(json : Json) -> Result[Firmware, OcppError] {
  let obj = match expect_object(json, "Firmware") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let location : String = match req_str(obj, "location") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let retrieve_date_time : String = match req_str(obj, "retrieveDateTime") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let signing_certificate : String = match req_str(obj, "signingCertificate") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let install_date_time : String? = match opt_str(obj, "installDateTime") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let signature : String? = match opt_str(obj, "signature") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ location: location, retrieve_date_time: retrieve_date_time, signing_certificate: signing_certificate, install_date_time: install_date_time, signature: signature })
}

///|
/// LogParameters

///|
pub(all) struct LogParameters {
  remote_location : String
  oldest_timestamp : String?
  latest_timestamp : String?
} derive(Eq, Debug)

///|
pub fn LogParameters::to_json(self : LogParameters) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "remoteLocation", self.remote_location)
  put_opt_str(obj, "oldestTimestamp", self.oldest_timestamp)
  put_opt_str(obj, "latestTimestamp", self.latest_timestamp)
  Json::object(obj)
}

///|
pub fn LogParameters::from_json(json : Json) -> Result[LogParameters, OcppError] {
  let obj = match expect_object(json, "LogParameters") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let remote_location : String = match req_str(obj, "remoteLocation") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let oldest_timestamp : String? = match opt_str(obj, "oldestTimestamp") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let latest_timestamp : String? = match opt_str(obj, "latestTimestamp") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ remote_location: remote_location, oldest_timestamp: oldest_timestamp, latest_timestamp: latest_timestamp })
}
