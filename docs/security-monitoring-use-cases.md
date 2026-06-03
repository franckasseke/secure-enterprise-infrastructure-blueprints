# Security Monitoring Use Cases

This document lists practical monitoring use cases to implement after log ingestion is working.

## 1. Authentication monitoring

### Failed Linux SSH logins

```spl
index=* (source="/var/log/secure" OR source="/var/log/auth.log") ("Failed password" OR "authentication failure")
```

Goal:

- Detect brute-force attempts
- Identify repeated failed logins
- Identify targeted accounts

### Successful Linux SSH logins

```spl
index=* (source="/var/log/secure" OR source="/var/log/auth.log") "Accepted"
```

Goal:

- Track who accessed Linux servers
- Identify suspicious remote access

## 2. Windows authentication monitoring

### Successful Windows logons

```spl
index=* source="WinEventLog:Security" EventCode=4624
```

### Failed Windows logons

```spl
index=* source="WinEventLog:Security" EventCode=4625
```

Goal:

- Detect brute-force attempts
- Identify failed logon spikes
- Validate Windows event ingestion

## 3. Privilege escalation monitoring

### Linux sudo usage

```spl
index=* (source="/var/log/secure" OR source="/var/log/auth.log") sudo
```

Goal:

- Track administrative actions
- Detect unexpected privilege usage

### Windows privileged logon

```spl
index=* source="WinEventLog:Security" EventCode=4672
```

Goal:

- Detect special privileges assigned during logon

## 4. Firewall monitoring with pfSense

### Blocked traffic

```spl
index=* pfsense block
```

### Allowed traffic

```spl
index=* pfsense pass
```

Goal:

- Understand network filtering activity
- Identify noisy hosts
- Identify blocked connection attempts

## 5. Operational monitoring

### Host activity overview

```spl
index=* | stats count by host
```

### Source overview

```spl
index=* | stats count by source
```

### Sourcetype overview

```spl
index=* | stats count by sourcetype
```

## 6. Next improvements

- Build dashboards
- Create alerts for repeated failed logins
- Add Linux auditd logs
- Add Sysmon on Windows
- Add pfSense firewall dashboards
- Document investigations as incident reports
