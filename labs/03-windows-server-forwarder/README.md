# Lab 03 - Install Splunk Universal Forwarder on Windows Server

## Objective

Install Splunk Universal Forwarder on Windows Server and forward Windows logs to Splunk Enterprise.

## Prerequisites

- Windows Server VM
- Administrator access
- Splunk Universal Forwarder installer for Windows
- Network connectivity to Splunk Enterprise
- Splunk receiving enabled on TCP 9997

## Implementation checklist

- [ ] Install Splunk Universal Forwarder
- [ ] Configure Splunk indexer IP and port 9997
- [ ] Select Windows event logs to monitor
- [ ] Confirm the SplunkForwarder service is running
- [ ] Validate Windows host visibility in Splunk

## Windows logs to collect

Recommended initial sources:

- Application
- Security
- System
- PowerShell logs
- Windows Defender logs if available

## Validation in Splunk

Example searches:

```spl
index=* host=<windows-hostname>
index=* source="WinEventLog:Security"
index=* EventCode=4624
index=* EventCode=4625
```

## Troubleshooting

Check:

- SplunkForwarder service status
- Windows Firewall
- Connectivity to Splunk on TCP 9997
- Hostname visible in Splunk
- inputs.conf and outputs.conf configuration

## Cleanup

Uninstall Splunk Universal Forwarder from Windows Apps & Features, then verify the service has been removed.
