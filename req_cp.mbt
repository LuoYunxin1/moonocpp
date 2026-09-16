///|
/// Charge-point originated OCPP 1.6 CALL payloads, plus DataTransfer.

///|
/// Authorize.req

///|
pub(all) struct AuthorizeReq {
  id_tag : String
} derive(Eq, Debug)

///|
pub fn AuthorizeReq::to_json(self : AuthorizeReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "idTag", self.id_tag)
  Json::object(obj)
}

///|
pub fn AuthorizeReq::from_json(json : Json) -> Result[AuthorizeReq, OcppError] {
  let obj = match expect_object(json, "AuthorizeReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let id_tag : String = match req_str(obj, "idTag") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ id_tag: id_tag })
}

///|
/// BootNotification.req

///|
pub(all) struct BootNotificationReq {
  charge_point_model : String
  charge_point_vendor : String
  charge_box_serial_number : String?
  charge_point_serial_number : String?
  firmware_version : String?
  iccid : String?
  imsi : String?
  meter_serial_number : String?
  meter_type : String?
} derive(Eq, Debug)

///|
pub fn BootNotificationReq::to_json(self : BootNotificationReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "chargePointModel", self.charge_point_model)
  put_str(obj, "chargePointVendor", self.charge_point_vendor)
  put_opt_str(obj, "chargeBoxSerialNumber", self.charge_box_serial_number)
  put_opt_str(obj, "chargePointSerialNumber", self.charge_point_serial_number)
  put_opt_str(obj, "firmwareVersion", self.firmware_version)
  put_opt_str(obj, "iccid", self.iccid)
  put_opt_str(obj, "imsi", self.imsi)
  put_opt_str(obj, "meterSerialNumber", self.meter_serial_number)
  put_opt_str(obj, "meterType", self.meter_type)
  Json::object(obj)
}

///|
pub fn BootNotificationReq::from_json(json : Json) -> Result[BootNotificationReq, OcppError] {
  let obj = match expect_object(json, "BootNotificationReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let charge_point_model : String = match req_str(obj, "chargePointModel") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let charge_point_vendor : String = match req_str(obj, "chargePointVendor") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let charge_box_serial_number : String? = match opt_str(obj, "chargeBoxSerialNumber") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let charge_point_serial_number : String? = match opt_str(obj, "chargePointSerialNumber") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let firmware_version : String? = match opt_str(obj, "firmwareVersion") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let iccid : String? = match opt_str(obj, "iccid") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let imsi : String? = match opt_str(obj, "imsi") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let meter_serial_number : String? = match opt_str(obj, "meterSerialNumber") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let meter_type : String? = match opt_str(obj, "meterType") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ charge_point_model: charge_point_model, charge_point_vendor: charge_point_vendor, charge_box_serial_number: charge_box_serial_number, charge_point_serial_number: charge_point_serial_number, firmware_version: firmware_version, iccid: iccid, imsi: imsi, meter_serial_number: meter_serial_number, meter_type: meter_type })
}

///|
/// DiagnosticsStatusNotification.req

///|
pub(all) struct DiagnosticsStatusNotificationReq {
  status : DiagnosticsStatus
} derive(Eq, Debug)

///|
pub fn DiagnosticsStatusNotificationReq::to_json(self : DiagnosticsStatusNotificationReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  Json::object(obj)
}

///|
pub fn DiagnosticsStatusNotificationReq::from_json(json : Json) -> Result[DiagnosticsStatusNotificationReq, OcppError] {
  let obj = match expect_object(json, "DiagnosticsStatusNotificationReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : DiagnosticsStatus = match req_DiagnosticsStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status })
}

///|
/// FirmwareStatusNotification.req

///|
pub(all) struct FirmwareStatusNotificationReq {
  status : FirmwareStatus
} derive(Eq, Debug)

///|
pub fn FirmwareStatusNotificationReq::to_json(self : FirmwareStatusNotificationReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  Json::object(obj)
}

///|
pub fn FirmwareStatusNotificationReq::from_json(json : Json) -> Result[FirmwareStatusNotificationReq, OcppError] {
  let obj = match expect_object(json, "FirmwareStatusNotificationReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : FirmwareStatus = match req_FirmwareStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status })
}

///|
/// LogStatusNotification.req

///|
pub(all) struct LogStatusNotificationReq {
  status : UploadLogStatus
  request_id : Int
} derive(Eq, Debug)

///|
pub fn LogStatusNotificationReq::to_json(self : LogStatusNotificationReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  put_int(obj, "requestId", self.request_id)
  Json::object(obj)
}

///|
pub fn LogStatusNotificationReq::from_json(json : Json) -> Result[LogStatusNotificationReq, OcppError] {
  let obj = match expect_object(json, "LogStatusNotificationReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : UploadLogStatus = match req_UploadLogStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let request_id : Int = match req_int(obj, "requestId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status, request_id: request_id })
}

///|
/// MeterValues.req

///|
pub(all) struct MeterValuesReq {
  connector_id : Int
  meter_value : Array[MeterValue]
  transaction_id : Int?
} derive(Eq, Debug)

///|
pub fn MeterValuesReq::to_json(self : MeterValuesReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_int(obj, "connectorId", self.connector_id)
  {
    let arr : Array[Json] = []
    for i in 0..<self.meter_value.length() {
      arr.push(self.meter_value[i].to_json())
    }
    put_json(obj, "meterValue", Json::array(arr))
  }
  put_opt_int(obj, "transactionId", self.transaction_id)
  Json::object(obj)
}

///|
pub fn MeterValuesReq::from_json(json : Json) -> Result[MeterValuesReq, OcppError] {
  let obj = match expect_object(json, "MeterValuesReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let connector_id : Int = match req_int(obj, "connectorId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let raw_meter_value = match req_array(obj, "meterValue") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let meter_value : Array[MeterValue] = []
  for i in 0..<raw_meter_value.length() {
    match MeterValue::from_json(raw_meter_value[i]) {
      Ok(v) => meter_value.push(v)
      Err(e) => return Err(e)
    }
  }
  let transaction_id : Int? = match opt_int(obj, "transactionId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ connector_id: connector_id, meter_value: meter_value, transaction_id: transaction_id })
}

///|
/// SecurityEventNotification.req

///|
pub(all) struct SecurityEventNotificationReq {
  type_ : String
  timestamp : String
  tech_info : String?
} derive(Eq, Debug)

///|
pub fn SecurityEventNotificationReq::to_json(self : SecurityEventNotificationReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "type", self.type_)
  put_str(obj, "timestamp", self.timestamp)
  put_opt_str(obj, "techInfo", self.tech_info)
  Json::object(obj)
}

///|
pub fn SecurityEventNotificationReq::from_json(json : Json) -> Result[SecurityEventNotificationReq, OcppError] {
  let obj = match expect_object(json, "SecurityEventNotificationReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let type_ : String = match req_str(obj, "type") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let timestamp : String = match req_str(obj, "timestamp") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let tech_info : String? = match opt_str(obj, "techInfo") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ type_: type_, timestamp: timestamp, tech_info: tech_info })
}

///|
/// SignCertificate.req

///|
pub(all) struct SignCertificateReq {
  csr : String
} derive(Eq, Debug)

///|
pub fn SignCertificateReq::to_json(self : SignCertificateReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "csr", self.csr)
  Json::object(obj)
}

///|
pub fn SignCertificateReq::from_json(json : Json) -> Result[SignCertificateReq, OcppError] {
  let obj = match expect_object(json, "SignCertificateReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let csr : String = match req_str(obj, "csr") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ csr: csr })
}

///|
/// SignedFirmwareStatusNotification.req

///|
pub(all) struct SignedFirmwareStatusNotificationReq {
  status : FirmwareStatus
  request_id : Int
} derive(Eq, Debug)

///|
pub fn SignedFirmwareStatusNotificationReq::to_json(self : SignedFirmwareStatusNotificationReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "status", self.status.to_wire())
  put_int(obj, "requestId", self.request_id)
  Json::object(obj)
}

///|
pub fn SignedFirmwareStatusNotificationReq::from_json(json : Json) -> Result[SignedFirmwareStatusNotificationReq, OcppError] {
  let obj = match expect_object(json, "SignedFirmwareStatusNotificationReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : FirmwareStatus = match req_FirmwareStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let request_id : Int = match req_int(obj, "requestId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ status: status, request_id: request_id })
}

///|
/// StartTransaction.req

///|
pub(all) struct StartTransactionReq {
  connector_id : Int
  id_tag : String
  meter_start : Int
  timestamp : String
  reservation_id : Int?
} derive(Eq, Debug)

///|
pub fn StartTransactionReq::to_json(self : StartTransactionReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_int(obj, "connectorId", self.connector_id)
  put_str(obj, "idTag", self.id_tag)
  put_int(obj, "meterStart", self.meter_start)
  put_str(obj, "timestamp", self.timestamp)
  put_opt_int(obj, "reservationId", self.reservation_id)
  Json::object(obj)
}

///|
pub fn StartTransactionReq::from_json(json : Json) -> Result[StartTransactionReq, OcppError] {
  let obj = match expect_object(json, "StartTransactionReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let connector_id : Int = match req_int(obj, "connectorId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let id_tag : String = match req_str(obj, "idTag") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let meter_start : Int = match req_int(obj, "meterStart") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let timestamp : String = match req_str(obj, "timestamp") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let reservation_id : Int? = match opt_int(obj, "reservationId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ connector_id: connector_id, id_tag: id_tag, meter_start: meter_start, timestamp: timestamp, reservation_id: reservation_id })
}

///|
/// StopTransaction.req

///|
pub(all) struct StopTransactionReq {
  meter_stop : Int
  timestamp : String
  transaction_id : Int
  reason : Reason?
  id_tag : String?
  transaction_data : Array[MeterValue]?
} derive(Eq, Debug)

///|
pub fn StopTransactionReq::to_json(self : StopTransactionReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_int(obj, "meterStop", self.meter_stop)
  put_str(obj, "timestamp", self.timestamp)
  put_int(obj, "transactionId", self.transaction_id)
  match self.reason {
    Some(v) => put_str(obj, "reason", v.to_wire())
    None => ()
  }
  put_opt_str(obj, "idTag", self.id_tag)
  match self.transaction_data {
    None => ()
    Some(items) => {
      let arr : Array[Json] = []
      for i in 0..<items.length() {
        arr.push(items[i].to_json())
      }
      put_json(obj, "transactionData", Json::array(arr))
    }
  }
  Json::object(obj)
}

///|
pub fn StopTransactionReq::from_json(json : Json) -> Result[StopTransactionReq, OcppError] {
  let obj = match expect_object(json, "StopTransactionReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let meter_stop : Int = match req_int(obj, "meterStop") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let timestamp : String = match req_str(obj, "timestamp") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let transaction_id : Int = match req_int(obj, "transactionId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let reason : Reason? = match opt_Reason(obj, "reason") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let id_tag : String? = match opt_str(obj, "idTag") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let transaction_data : Array[MeterValue]? = match opt_array(obj, "transactionData") {
    Err(e) => return Err(e)
    Ok(None) => None
    Ok(Some(arr)) => {
      let items : Array[MeterValue] = []
      for i in 0..<arr.length() {
        match MeterValue::from_json(arr[i]) {
          Ok(v) => items.push(v)
          Err(e) => return Err(e)
        }
      }
      Some(items)
    }
  }
  Ok({ meter_stop: meter_stop, timestamp: timestamp, transaction_id: transaction_id, reason: reason, id_tag: id_tag, transaction_data: transaction_data })
}

///|
/// StatusNotification.req

///|
pub(all) struct StatusNotificationReq {
  connector_id : Int
  error_code : ChargePointErrorCode
  status : ChargePointStatus
  timestamp : String?
  info : String?
  vendor_id : String?
  vendor_error_code : String?
} derive(Eq, Debug)

///|
pub fn StatusNotificationReq::to_json(self : StatusNotificationReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_int(obj, "connectorId", self.connector_id)
  put_str(obj, "errorCode", self.error_code.to_wire())
  put_str(obj, "status", self.status.to_wire())
  put_opt_str(obj, "timestamp", self.timestamp)
  put_opt_str(obj, "info", self.info)
  put_opt_str(obj, "vendorId", self.vendor_id)
  put_opt_str(obj, "vendorErrorCode", self.vendor_error_code)
  Json::object(obj)
}

///|
pub fn StatusNotificationReq::from_json(json : Json) -> Result[StatusNotificationReq, OcppError] {
  let obj = match expect_object(json, "StatusNotificationReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let connector_id : Int = match req_int(obj, "connectorId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let error_code : ChargePointErrorCode = match req_ChargePointErrorCode(obj, "errorCode") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let status : ChargePointStatus = match req_ChargePointStatus(obj, "status") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let timestamp : String? = match opt_str(obj, "timestamp") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let info : String? = match opt_str(obj, "info") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let vendor_id : String? = match opt_str(obj, "vendorId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let vendor_error_code : String? = match opt_str(obj, "vendorErrorCode") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ connector_id: connector_id, error_code: error_code, status: status, timestamp: timestamp, info: info, vendor_id: vendor_id, vendor_error_code: vendor_error_code })
}

///|
/// DataTransfer.req

///|
pub(all) struct DataTransferReq {
  vendor_id : String
  message_id : String?
  data : String?
} derive(Eq, Debug)

///|
pub fn DataTransferReq::to_json(self : DataTransferReq) -> Json {
  let obj : Map[String, Json] = Map([])
  put_str(obj, "vendorId", self.vendor_id)
  put_opt_str(obj, "messageId", self.message_id)
  put_opt_str(obj, "data", self.data)
  Json::object(obj)
}

///|
pub fn DataTransferReq::from_json(json : Json) -> Result[DataTransferReq, OcppError] {
  let obj = match expect_object(json, "DataTransferReq") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let vendor_id : String = match req_str(obj, "vendorId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let message_id : String? = match opt_str(obj, "messageId") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let data : String? = match opt_str(obj, "data") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ vendor_id: vendor_id, message_id: message_id, data: data })
}
