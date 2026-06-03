# Documentation Standards

This document defines how the project should be documented like a professional consulting engagement.

## 1. Documentation principles

Every technical action should be documented with:

- Objective
- Context
- Prerequisites
- Commands executed
- Expected result
- Actual result
- Validation evidence
- Troubleshooting notes
- Cleanup steps when applicable

## 2. Recommended lab format

Each lab should follow this structure:

```text
1. Title
2. Business / technical context
3. Objective
4. Architecture overview
5. Prerequisites
6. Step-by-step implementation
7. Validation tests
8. Troubleshooting
9. Cleanup
10. Lessons learned
```

## 3. Evidence format

For each important milestone, keep evidence:

- Screenshot name
- Command output
- Date of execution
- VM concerned
- Observed result

Example:

```text
Evidence: splunk-port-9997-listening.png
Command: ss -tulpen | grep 9997
Result: Splunk is listening on TCP 9997
```

## 4. Naming convention

Recommended names:

| Object | Example |
|---|---|
| Splunk VM | vm-splunk-ubuntu-01 |
| Rocky VM | vm-rocky-forwarder-01 |
| Windows VM | vm-windows-server-01 |
| pfSense VM | vm-pfsense-fw-01 |
| Lab network | net-security-lab-01 |

## 5. Recruiter-oriented documentation

The repository should quickly show:

- What was built
- Why it matters
- Which technologies were used
- How it was validated
- What skills were demonstrated

Avoid dumping raw notes without context. A recruiter or technical lead should understand the value of the project in less than two minutes.
