///|
pub fn json_int(n : Int) -> Json {
  Json::number(n.to_double(), repr=n.to_string())
}

///|
pub fn json_float(n : Double) -> Json {
  Json::number(n, repr=n.to_string())
}

///|
pub fn parse_json_text(text : String) -> Result[Json, OcppError] {
  Ok(@json.parse(text)) catch {
    _ => Err(JsonParse("invalid JSON"))
  }
}

///|
pub fn expect_object(json : Json, what : String) -> Result[Map[String, Json], OcppError] {
  match json {
    Object(obj) => Ok(obj)
    _ => Err(TypeConstraint(what + " must be a JSON object"))
  }
}

///|
pub fn expect_array(json : Json, what : String) -> Result[Array[Json], OcppError] {
  match json {
    Array(arr) => Ok(arr)
    _ => Err(TypeConstraint(what + " must be a JSON array"))
  }
}

///|
fn json_to_int(json : Json, what : String) -> Result[Int, OcppError] {
  match json {
    Number(n, ..) => {
      if n != n.floor() {
        return Err(TypeConstraint(what + " must be an integer"))
      }
      let max_ok = 2147483647.0
      let min_ok = -2147483648.0
      if n > max_ok || n < min_ok {
        return Err(PropertyConstraint(what + " integer overflow"))
      }
      Ok(n.to_int())
    }
    _ => Err(TypeConstraint(what + " must be a number"))
  }
}

///|
fn json_to_float(json : Json, what : String) -> Result[Double, OcppError] {
  match json {
    Number(n, ..) => Ok(n)
    _ => Err(TypeConstraint(what + " must be a number"))
  }
}

///|
fn json_to_str(json : Json, what : String) -> Result[String, OcppError] {
  match json {
    String(s) => Ok(s)
    _ => Err(TypeConstraint(what + " must be a string"))
  }
}

///|
fn json_to_bool(json : Json, what : String) -> Result[Bool, OcppError] {
  match json {
    True => Ok(true)
    False => Ok(false)
    _ => Err(TypeConstraint(what + " must be a boolean"))
  }
}

///|
pub fn req_str(obj : Map[String, Json], key : String) -> Result[String, OcppError] {
  match obj.get(key) {
    None => Err(Protocol("missing " + key))
    Some(v) => json_to_str(v, key)
  }
}

///|
pub fn opt_str(obj : Map[String, Json], key : String) -> Result[String?, OcppError] {
  match obj.get(key) {
    None => Ok(None)
    Some(Null) => Ok(None)
    Some(v) => {
      match json_to_str(v, key) {
        Ok(s) => Ok(Some(s))
        Err(e) => Err(e)
      }
    }
  }
}

///|
pub fn req_int(obj : Map[String, Json], key : String) -> Result[Int, OcppError] {
  match obj.get(key) {
    None => Err(Protocol("missing " + key))
    Some(v) => json_to_int(v, key)
  }
}

///|
pub fn opt_int(obj : Map[String, Json], key : String) -> Result[Int?, OcppError] {
  match obj.get(key) {
    None => Ok(None)
    Some(Null) => Ok(None)
    Some(v) => {
      match json_to_int(v, key) {
        Ok(n) => Ok(Some(n))
        Err(e) => Err(e)
      }
    }
  }
}

///|
pub fn req_float(obj : Map[String, Json], key : String) -> Result[Double, OcppError] {
  match obj.get(key) {
    None => Err(Protocol("missing " + key))
    Some(v) => json_to_float(v, key)
  }
}

///|
pub fn opt_float(obj : Map[String, Json], key : String) -> Result[Double?, OcppError] {
  match obj.get(key) {
    None => Ok(None)
    Some(Null) => Ok(None)
    Some(v) => {
      match json_to_float(v, key) {
        Ok(n) => Ok(Some(n))
        Err(e) => Err(e)
      }
    }
  }
}

///|
pub fn req_bool(obj : Map[String, Json], key : String) -> Result[Bool, OcppError] {
  match obj.get(key) {
    None => Err(Protocol("missing " + key))
    Some(v) => json_to_bool(v, key)
  }
}

///|
pub fn opt_bool(obj : Map[String, Json], key : String) -> Result[Bool?, OcppError] {
  match obj.get(key) {
    None => Ok(None)
    Some(Null) => Ok(None)
    Some(v) => {
      match json_to_bool(v, key) {
        Ok(b) => Ok(Some(b))
        Err(e) => Err(e)
      }
    }
  }
}

///|
pub fn req_object(obj : Map[String, Json], key : String) -> Result[Json, OcppError] {
  match obj.get(key) {
    None => Err(Protocol("missing " + key))
    Some(v) => Ok(v)
  }
}

///|
pub fn opt_object(obj : Map[String, Json], key : String) -> Result[Json?, OcppError] {
  match obj.get(key) {
    None => Ok(None)
    Some(Null) => Ok(None)
    Some(v) => Ok(Some(v))
  }
}

///|
pub fn req_array(obj : Map[String, Json], key : String) -> Result[Array[Json], OcppError] {
  match obj.get(key) {
    None => Err(Protocol("missing " + key))
    Some(v) => expect_array(v, key)
  }
}

///|
pub fn opt_array(obj : Map[String, Json], key : String) -> Result[Array[Json]?, OcppError] {
  match obj.get(key) {
    None => Ok(None)
    Some(Null) => Ok(None)
    Some(v) => {
      match expect_array(v, key) {
        Ok(arr) => Ok(Some(arr))
        Err(e) => Err(e)
      }
    }
  }
}

///|
pub fn put_str(obj : Map[String, Json], key : String, value : String) -> Unit {
  obj[key] = Json::string(value)
}

///|
pub fn put_opt_str(obj : Map[String, Json], key : String, value : String?) -> Unit {
  match value {
    Some(s) => obj[key] = Json::string(s)
    None => ()
  }
}

///|
pub fn put_int(obj : Map[String, Json], key : String, value : Int) -> Unit {
  obj[key] = json_int(value)
}

///|
pub fn put_opt_int(obj : Map[String, Json], key : String, value : Int?) -> Unit {
  match value {
    Some(n) => obj[key] = json_int(n)
    None => ()
  }
}

///|
pub fn put_float(obj : Map[String, Json], key : String, value : Double) -> Unit {
  obj[key] = json_float(value)
}

///|
pub fn put_opt_float(obj : Map[String, Json], key : String, value : Double?) -> Unit {
  match value {
    Some(n) => obj[key] = json_float(n)
    None => ()
  }
}

///|
pub fn put_bool(obj : Map[String, Json], key : String, value : Bool) -> Unit {
  obj[key] = Json::boolean(value)
}

///|
pub fn put_opt_bool(obj : Map[String, Json], key : String, value : Bool?) -> Unit {
  match value {
    Some(b) => obj[key] = Json::boolean(b)
    None => ()
  }
}

///|
pub fn put_json(obj : Map[String, Json], key : String, value : Json) -> Unit {
  obj[key] = value
}

///|
pub fn put_opt_json(obj : Map[String, Json], key : String, value : Json?) -> Unit {
  match value {
    Some(v) => obj[key] = v
    None => ()
  }
}

///|
pub fn empty_payload() -> Json {
  Json::empty_object()
}

///|
pub fn ci_len_ok(s : String, max : Int) -> Bool {
  s.length() <= max
}

///|
pub fn require_ci(s : String, max : Int, field : String) -> Result[Unit, OcppError] {
  if s.length() == 0 {
    return Err(PropertyConstraint(field + " must not be empty"))
  }
  if s.length() > max {
    return Err(PropertyConstraint(field + " exceeds CiString" + max.to_string()))
  }
  Ok(())
}

///|
pub fn require_ci_allow_empty(s : String, max : Int, field : String) -> Result[Unit, OcppError] {
  if s.length() > max {
    return Err(PropertyConstraint(field + " exceeds CiString" + max.to_string()))
  }
  Ok(())
}

///|
pub fn require_unique_id(id : String) -> Result[Unit, OcppError] {
  if id.length() == 0 || id.length() > 36 {
    return Err(UniqueId("uniqueId must be 1..36 characters"))
  }
  Ok(())
}

///|
pub fn[T] unwrap_ocpp(result : Result[T, OcppError]) -> T {
  match result {
    Ok(v) => v
    Err(e) => abort(e.message())
  }
}


///|
pub fn req_ci(obj : Map[String, Json], key : String, max : Int) -> Result[String, OcppError] {
  match req_str(obj, key) {
    Err(e) => Err(e)
    Ok(s) => {
      match require_ci(s, max, key) {
        Err(e) => Err(e)
        Ok(_) => Ok(s)
      }
    }
  }
}

///|
pub fn opt_ci(obj : Map[String, Json], key : String, max : Int) -> Result[String?, OcppError] {
  match opt_str(obj, key) {
    Err(e) => Err(e)
    Ok(None) => Ok(None)
    Ok(Some(s)) => {
      match require_ci_allow_empty(s, max, key) {
        Err(e) => Err(e)
        Ok(_) => Ok(Some(s))
      }
    }
  }
}

///|
pub fn encode_str_array(items : Array[String]) -> Json {
  let out : Array[Json] = []
  for i in 0..<items.length() {
    out.push(Json::string(items[i]))
  }
  Json::array(out)
}

///|
pub fn decode_str_array(json : Json, what : String) -> Result[Array[String], OcppError] {
  match expect_array(json, what) {
    Err(e) => Err(e)
    Ok(arr) => {
      let out : Array[String] = []
      for i in 0..<arr.length() {
        match arr[i] {
          String(s) => out.push(s)
          _ => return Err(TypeConstraint(what + " item must be a string"))
        }
      }
      Ok(out)
    }
  }
}
