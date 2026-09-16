# Security

MoonOCPP is an offline codec. It does not implement TLS, WebSocket
authentication, or certificate cryptography. Treat decoded payloads as
untrusted application data and keep uniqueId matching inside one peer.
