# Duplicate check — MoonOCPP

- Date: 2026-09-16
- Rechecked: 2026-09-16
- Candidate: MoonOCPP — OCPP 1.6 JSON application-protocol codec (Call / CallResult / CallError + typed action payloads)
- Official assistant: invoked local `$osc2026-guide` project-research / duplication guidance
- `moon search`: unavailable on moon 0.1.20260915 (`moon search` is not a subcommand). MoonCakes evidence uses `%USERPROFILE%\.moon\registry\index\user` (2511 package index files).

## Selected loop

OCPP 1.6 JSON text -> envelope array `[2|3|4, uniqueId, ...]` -> camelCase action payload object -> typed request/response structs (Core + Firmware Management + Local Auth List + Reservation + Smart Charging + Remote Trigger + Security certificate subset) -> CiString / direction / uniqueId validation -> pending-call uniqueId matching. No WebSocket transport.

## MoonCakes / local index keywords

ocpp, ocpp1.6, ocpp2, evse, csms, ocpi, iso15118, chargepoint, charging, bootnotification

Hits: **0** of 2511 local index files contained those tokens.

## Adjacent packages (not the same loop)

| Package | Why adjacent | Why not overlapping |
| --- | --- | --- |
| YOYoung/mqtt, illusory-miao/mqtt_codec | another industrial message codec | MQTT packets, not OCPP actions |
| 668xin/modbus, 668xin/modbus_lint | fieldbus frames | Modbus ADU/PDU, not charge-point JSON |
| clete2/iso8583 | financial envelope | ISO 8583, not OCPP 1.6 |

Occupied but unrelated domains already recorded elsewhere: HTML/XML, JWT, DNS, cron, protobuf, PCAP, Prometheus, NMEA, METAR, geospatial, firmware HEX.

## GitHub

- `LuoYunxin1/moonocpp` did not exist at reservation time
- `gh search repos "ocpp moonbit"` returned no repositories
- `gh search code "ocpp language:MoonBit"` only hit unrelated office/encryption text, not an OCPP library

## Decision

Select MoonOCPP. The core loop is OCPP 1.6 JSON envelopes and action codecs. That loop is absent from MoonCakes and from adjacent MQTT/Modbus/ISO8583 packages.

## Boundary for future work

A later project must not center on OCPP 1.6 JSON Call/CallResult/CallError envelopes, OCPP action payload codecs, or CSMS/charge-point uniqueId session matching. This project does not implement WebSocket/TLS, OCPP 2.0/2.1, OCPP 1.6 SOAP, ISO 15118, OCPI, or charger/CSMS business logic.
