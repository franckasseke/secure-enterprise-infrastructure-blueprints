# Lab 04 - Forward pfSense Logs to Splunk

## Objective

Configure pfSense to forward firewall and system logs to Splunk for centralized monitoring.

## Prerequisites

- pfSense VM installed and reachable
- Splunk Enterprise VM reachable from pfSense
- Network routing between pfSense and Splunk
- Syslog input configured or planned on Splunk side

## Implementation checklist

- [ ] Identify Splunk server IP address
- [ ] Configure pfSense remote logging
- [ ] Select log categories to forward
- [ ] Configure Splunk to receive syslog events
- [ ] Validate pfSense logs in Splunk

## Suggested pfSense log categories

- System events
- Firewall events
- DHCP events
- DNS Resolver events
- VPN events if configured later

## Validation in Splunk

Example searches:

```spl
index=* host=<pfsense-hostname>
index=* pfsense
index=* firewall
```

## Troubleshooting

Check in this order:

1. pfSense log settings
2. Network connectivity
3. Firewall rules
4. Splunk listener
5. Index and sourcetype configuration
6. Search time range in Splunk

## Cleanup

Disable remote logging on pfSense if the lab must be reverted.
