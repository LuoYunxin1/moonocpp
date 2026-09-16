# MoonOCPP

纯 MoonBit 的 OCPP 1.6 JSON 应用层编解码库：Call / CallResult / CallError 信封、39 个动作的 camelCase 载荷、CiString 约束，以及 pending uniqueId 匹配。

它不实现 WebSocket/TLS，也不实现 OCPP 2.x、SOAP 1.6、ISO 15118 或充电桩业务逻辑。

- 包名：`LuoYunxin1/moonocpp`
- 版本：`0.1.0`
- 许可证：MIT
- 参考：mobilityhouse/ocpp v2.1.0（MIT）

## 安装

```text
moon add LuoYunxin1/moonocpp
```

尚未发布到 mooncakes.io 时，请依赖 Git 仓库。可运行入口：

```text
moon run cmd/main --target wasm-gc
```

## 三个示例

与 `cmd/main/main.mbt` 中的验收场景一致。

### 1. 充电桩上线：BootNotification 后心跳

桩侧上报厂商与型号，可选字段不出现在 JSON 中；随后发送空载荷 Heartbeat。

```moonbit
let boot = encode_request_call("19223201", Request::BootNotification(req))
let hb = encode_request_call("0", Request::Heartbeat)
```

期望信封：

```text
[2,"19223201","BootNotification",{"chargePointModel":"SingleSocketCharger","chargePointVendor":"VendorX"}]
[2,"0","Heartbeat",{}]
```

### 2. 本地刷卡：StartTransaction / StopTransaction

一次交易用同一 `idTag` 开始和结束，开始报文不含 `reservationId`。

```moonbit
let start_text = encode_request_call("tx-1", Request::StartTransaction(start))
let stop_text = encode_request_call("tx-2", Request::StopTransaction(stop))
```

### 3. CSMS 下发智能充电曲线

`SetChargingProfile` 嵌套 `chargingSchedulePeriod`，电流单位为 `A`。

```moonbit
let profile_text = encode_request_call("cp-1", Request::SetChargingProfile(setp))
```

Demo 预期最后一行：

```text
MoonOCPP acceptance: 3 scenarios passed
```

## 测试

```text
moon check --target wasm-gc --deny-warn
moon test --target wasm-gc --deny-warn
moon run cmd/main --target wasm-gc
```

## 边界

- 不是 WebSocket 客户端或 CSMS
- 不是 OCPP 2.0.1 / 2.1
- 不是 ISO 15118 或 OCPI
- CallError 保留 1.6 拼写 `FormationViolation` / `OccurenceConstraintViolation`

## License

MIT. 移植说明见 `NOTICE` 与 `docs/upstream.md`。
