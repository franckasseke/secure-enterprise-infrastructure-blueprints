# OpenSCAP After Low-Risk Remediation Summary

## Target system

- Hostname: openscap-target-01
- Operating system: AlmaLinux 10.2
- Compliance profile: CIS AlmaLinux OS 10 Benchmark for Level 1 - Server
- Profile ID: xccdf_org.ssgproject.content_profile_cis_server_l1

## Baseline result

| Result | Count |
|---|---:|
| Passed rules | 165 |
| Failed rules | 138 |
| Not applicable rules | 20 |

## After low-risk remediation

| Result | Count |
|---|---:|
| Passed rules | 171 |
| Failed rules | 132 |
| Not applicable rules | 20 |
| OpenSCAP exit code | 2 |

## Improvement

| Metric | Before | After | Difference |
|---|---:|---:|---:|
| Passed rules | 165 | 171 | +6 |
| Failed rules | 138 | 132 | -6 |
| Not applicable rules | 20 | 20 | 0 |

## Low-risk remediations applied

The following low-risk controls were remediated:

- Local login banner configured in `/etc/issue`
- Remote login banner configured in `/etc/issue.net`
- sudo `use_pty` configured
- sudo logfile configured at `/var/log/sudo.log`
- AIDE package installed
- AIDE database initialized
- AIDE periodic check configured with cron

## Validation

Validation evidence includes:

- Updated OpenSCAP HTML report
- Updated OpenSCAP XML results
- Scan log
- Exit code file
- AIDE check result
- sudo log validation
- banner validation

## Conclusion

The low-risk remediation phase improved the compliance posture from 165 passed rules to 171 passed rules and reduced failed rules from 138 to 132.

The remaining failed controls require deeper review because some may involve disruptive changes such as filesystem partitioning, crypto policy changes, authentication policy changes, or desktop-related controls.
