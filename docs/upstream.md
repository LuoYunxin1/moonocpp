# Upstream mapping

MoonOCPP ports the OCPP 1.6 JSON *application* layer of
[mobilityhouse/ocpp](https://github.com/mobilityhouse/ocpp) v2.1.0.

| Upstream | MoonOCPP |
| --- | --- |
| `Call` / `CallResult` / `CallError` | `envelope.mbt` |
| `ocpp.v16.enums` | `enums.mbt` |
| `ocpp.v16.datatypes` | `datatypes.mbt` |
| `ocpp.v16.call` | `req_cp.mbt`, `req_cs.mbt` |
| `ocpp.v16.call_result` | `conf.mbt` |
| pending uniqueId matching | `session.mbt` |

Out of scope relative to the Python library: WebSocket client/server,
JSON Schema draft-4 validators, OCPP 2.0.1 / 2.1, SOAP 1.6.
