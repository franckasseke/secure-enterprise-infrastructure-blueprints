# Architecture - Linux Security Monitoring Homelab

## 1. Context

This homelab simulates a small enterprise environment where security and system logs are centralized into Splunk for monitoring, troubleshooting, and investigation.

The environment includes Linux servers, a Windows Server, and a pfSense firewall. Each component represents a common enterprise source of operational or security events.

## 2. High-level design

```text
Internet / Lab Network
        |
        v
+-------------------+
| pfSense Firewall  |
| Firewall / Router |
+-------------------+
        |
        v
+-------------------+       +-----------------------+
| Lab Network       | ----> | Splunk Enterprise     |
| Linux + Windows   |       | Central Log Platform  |
+-------------------+       +-----------------------+
```

## 3. Main components

| Component | Role |
|---|---|
| Splunk Enterprise | Central log indexing and search platform |
| Splunk Universal Forwarder | Lightweight agent forwarding logs to Splunk |
| Ubuntu Server | Splunk Enterprise host |
| Rocky Linux | Linux endpoint monitored by Splunk |
| Windows Server | Windows endpoint monitored by Splunk |
| pfSense | Firewall and network log source |

## 4. Network ports

| Port | Protocol | Purpose |
|---|---|---|
| 8000 | TCP | Splunk Web interface |
| 8089 | TCP | Splunk management port |
| 9997 | TCP | Splunk receiving port for forwarders |
| 514 | UDP/TCP | Common syslog port for network devices |

## 5. Security monitoring logic

The lab follows a simple enterprise pattern:

1. Systems generate logs.
2. Forwarders or syslog transport the logs.
3. Splunk receives and indexes the logs.
4. The consultant validates data ingestion.
5. Searches, dashboards, and alerts can be built on top of the indexed data.

## 6. Evidence to capture

During the lab, capture screenshots or notes proving:

- Splunk service is running.
- Port 9997 is listening.
- Universal Forwarder is installed and running.
- Forwarder can reach Splunk.
- Hosts appear in Splunk search results.
- pfSense log forwarding is enabled.

## 7. Consultant notes

This architecture is intentionally simple, but it represents a strong foundation for real enterprise security monitoring projects. The value is not only in installing tools, but in proving that logs are collected, searchable, and documented.
