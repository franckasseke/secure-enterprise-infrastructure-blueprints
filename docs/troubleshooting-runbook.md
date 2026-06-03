# Troubleshooting Runbook

This runbook provides a structured troubleshooting method for the homelab.

## 1. Golden troubleshooting order

When logs do not arrive in Splunk, troubleshoot in this order:

```text
1. Host service
2. IP configuration
3. Network connectivity
4. Firewall rules
5. Splunk receiving port
6. Forwarder configuration
7. Index / sourcetype / search time range
```

## 2. Splunk server checks

```bash
sudo systemctl status Splunkd --no-pager
sudo /opt/splunk/bin/splunk status
sudo ss -tulpen | grep -E '8000|8089|9997'
```

Expected result:

- Splunkd is running
- Port 8000 is listening for web UI
- Port 9997 is listening for forwarders

## 3. Linux forwarder checks

```bash
sudo /opt/splunkforwarder/bin/splunk status
sudo /opt/splunkforwarder/bin/splunk list forward-server
sudo /opt/splunkforwarder/bin/splunk list monitor
```

Expected result:

- Forwarder is running
- Splunk server is listed as configured output
- Log files are monitored

## 4. Network checks

```bash
ping <splunk-ip>
nc -vz <splunk-ip> 9997
traceroute <splunk-ip>
```

If `nc` fails, investigate:

- Wrong IP address
- Splunk receiving not enabled
- Local firewall
- pfSense rule
- Routing problem

## 5. Windows forwarder checks

On Windows Server:

```powershell
Get-Service SplunkForwarder
Test-NetConnection <splunk-ip> -Port 9997
```

Expected result:

- SplunkForwarder service is running
- TCP test to 9997 succeeds

## 6. Splunk search checks

Use broad searches first:

```spl
index=*
```

Then filter by host:

```spl
index=* host=<hostname>
```

Then filter by source:

```spl
index=* source="WinEventLog:Security"
index=* source="/var/log/secure"
index=* source="/var/log/messages"
```

## 7. Common mistakes

| Symptom | Possible cause | Fix |
|---|---|---|
| Splunk Web unreachable | Port 8000 blocked or Splunk stopped | Check service and firewall |
| Forwarder installed but no logs | No monitored input | Check inputs.conf |
| Port 9997 not listening | Receiving not enabled | Enable receiving in Splunk |
| Host not visible in search | Wrong time range or index | Search `index=*` over last 24h |
| Windows logs absent | Event logs not selected | Review Windows forwarder inputs |
| pfSense logs absent | Remote syslog not configured | Check pfSense logging settings |

## 8. Consultant discipline

For every incident, document:

- Problem observed
- Hypothesis
- Command executed
- Result
- Fix applied
- Validation evidence
