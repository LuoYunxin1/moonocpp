# Architecture

1. JSON helpers decode required/optional camelCase fields and emit integers with a decimal-free `repr`.
2. Enumerations map 1.6 wire strings, including dotted measurands and `W`/`A` units.
3. Datatypes and action structs encode by omitting `None` keys.
4. `catalog.mbt` dispatches 39 actions to typed `Request` / `Response` values.
5. `validate.mbt` enforces CiString bounds and simple occurrence rules.
6. `session.mbt` allocates uniqueIds and matches CALLRESULT/CALLERROR to the pending action.
