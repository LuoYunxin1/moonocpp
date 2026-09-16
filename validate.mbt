///|
/// Property constraints that JSON type decoding does not cover.

///|
pub fn require_non_negative(n : Int, field : String) -> Result[Unit, OcppError] {
  if n < 0 {
    return Err(PropertyConstraint(field + " must be >= 0"))
  }
  Ok(())
}

///|
pub fn require_positive(n : Int, field : String) -> Result[Unit, OcppError] {
  if n <= 0 {
    return Err(PropertyConstraint(field + " must be > 0"))
  }
  Ok(())
}

///|
pub fn validate_id_tag_info(info : IdTagInfo) -> Result[Unit, OcppError] {
  match info.parent_id_tag {
    None => ()
    Some(s) => match require_ci_allow_empty(s, 20, "parentIdTag") {
      Err(e) => return Err(e)
      Ok(_) => ()
    }
  }
  Ok(())
}

///|
pub fn validate_key_value(kv : KeyValue) -> Result[Unit, OcppError] {
  match require_ci(kv.key, 50, "key") {
      Err(e) => return Err(e)
      Ok(_) => ()
    }
  match kv.value {
    None => ()
    Some(s) => match require_ci_allow_empty(s, 500, "value") {
      Err(e) => return Err(e)
      Ok(_) => ()
    }
  }
  Ok(())
}

///|
pub fn validate_charging_profile(profile : ChargingProfile) -> Result[Unit, OcppError] {
  match require_non_negative(profile.stack_level, "stackLevel") {
      Err(e) => return Err(e)
      Ok(_) => ()
    }
  if profile.charging_schedule.charging_schedule_period.length() == 0 {
    return Err(OccurrenceConstraint("chargingSchedulePeriod must not be empty"))
  }
  Ok(())
}

///|
pub fn validate_boot_notification(req : BootNotificationReq) -> Result[Unit, OcppError] {
  match require_ci(req.charge_point_model, 20, "chargePointModel") {
      Err(e) => return Err(e)
      Ok(_) => ()
    }
  match require_ci(req.charge_point_vendor, 20, "chargePointVendor") {
      Err(e) => return Err(e)
      Ok(_) => ()
    }
  match req.charge_box_serial_number {
    None => ()
    Some(s) => match require_ci_allow_empty(s, 25, "chargeBoxSerialNumber") {
      Err(e) => return Err(e)
      Ok(_) => ()
    }
  }
  match req.charge_point_serial_number {
    None => ()
    Some(s) => match require_ci_allow_empty(s, 25, "chargePointSerialNumber") {
      Err(e) => return Err(e)
      Ok(_) => ()
    }
  }
  match req.firmware_version {
    None => ()
    Some(s) => match require_ci_allow_empty(s, 50, "firmwareVersion") {
      Err(e) => return Err(e)
      Ok(_) => ()
    }
  }
  match req.iccid {
    None => ()
    Some(s) => match require_ci_allow_empty(s, 20, "iccid") {
      Err(e) => return Err(e)
      Ok(_) => ()
    }
  }
  match req.imsi {
    None => ()
    Some(s) => match require_ci_allow_empty(s, 20, "imsi") {
      Err(e) => return Err(e)
      Ok(_) => ()
    }
  }
  match req.meter_serial_number {
    None => ()
    Some(s) => match require_ci_allow_empty(s, 25, "meterSerialNumber") {
      Err(e) => return Err(e)
      Ok(_) => ()
    }
  }
  match req.meter_type {
    None => ()
    Some(s) => match require_ci_allow_empty(s, 25, "meterType") {
      Err(e) => return Err(e)
      Ok(_) => ()
    }
  }
  Ok(())
}

///|
pub fn validate_start_transaction(req : StartTransactionReq) -> Result[Unit, OcppError] {
  match require_non_negative(req.connector_id, "connectorId") {
      Err(e) => return Err(e)
      Ok(_) => ()
    }
  match require_non_negative(req.meter_start, "meterStart") {
      Err(e) => return Err(e)
      Ok(_) => ()
    }
  match require_ci(req.id_tag, 20, "idTag") {
      Err(e) => return Err(e)
      Ok(_) => ()
    }
  Ok(())
}

///|
pub fn validate_stop_transaction(req : StopTransactionReq) -> Result[Unit, OcppError] {
  match require_non_negative(req.meter_stop, "meterStop") {
      Err(e) => return Err(e)
      Ok(_) => ()
    }
  match req.id_tag {
    None => ()
    Some(s) => match require_ci_allow_empty(s, 20, "idTag") {
      Err(e) => return Err(e)
      Ok(_) => ()
    }
  }
  Ok(())
}

///|
pub fn validate_set_charging_profile(req : SetChargingProfileReq) -> Result[Unit, OcppError] {
  match require_non_negative(req.connector_id, "connectorId") {
      Err(e) => return Err(e)
      Ok(_) => ()
    }
  validate_charging_profile(req.cs_charging_profiles)
}

///|
pub fn validate_request(request : Request) -> Result[Unit, OcppError] {
  match request {
    BootNotification(v) => validate_boot_notification(v)
    StartTransaction(v) => validate_start_transaction(v)
    StopTransaction(v) => validate_stop_transaction(v)
    SetChargingProfile(v) => validate_set_charging_profile(v)
    Authorize(v) => require_ci(v.id_tag, 20, "idTag")
    RemoteStartTransaction(v) => {
      match require_ci(v.id_tag, 20, "idTag") {
      Err(e) => return Err(e)
      Ok(_) => ()
    }
      match v.charging_profile {
        None => Ok(())
        Some(p) => validate_charging_profile(p)
      }
    }
    ChangeConfiguration(v) => {
      match require_ci(v.key, 50, "key") {
      Err(e) => return Err(e)
      Ok(_) => ()
    }
      require_ci(v.value, 500, "value")
    }
    DataTransfer(v) => require_ci(v.vendor_id, 255, "vendorId")
    MeterValues(v) => {
      match require_non_negative(v.connector_id, "connectorId") {
      Err(e) => return Err(e)
      Ok(_) => ()
    }
      if v.meter_value.length() == 0 {
        return Err(OccurrenceConstraint("meterValue must not be empty"))
      }
      Ok(())
    }
    _ => Ok(())
  }
}

///|
pub fn validate_boot_notification_conf(conf : BootNotificationConf) -> Result[Unit, OcppError] {
  require_non_negative(conf.interval, "interval")
}
