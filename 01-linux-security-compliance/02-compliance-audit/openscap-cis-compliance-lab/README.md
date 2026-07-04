# OpenSCAP CIS Compliance Lab

## 1. Context

This project demonstrates how to perform a Linux compliance audit using OpenSCAP in an enterprise-style environment.

The objective is to assess the security posture of an AlmaLinux server against a CIS security baseline, generate audit evidence, identify failed controls, and prepare a controlled remediation strategy.

This is not a tutorial-only lab. It is documented as a small professional compliance assessment with evidence, findings, and remediation planning.

## 2. Objectives

- Deploy a dedicated Linux VM for compliance assessment.
- Install and validate OpenSCAP tooling.
- Identify available SCAP security profiles.
- Run a CIS Level 1 Server compliance scan.
- Generate HTML, XML, and log evidence.
- Extract failed rules for analysis.
- Prepare a remediation strategy without applying automatic remediation blindly.
- Store all useful evidence in a GitHub-ready structure.

## 3. Architecture and Environment

| Component | Role | Description |
|---|---|---|
| openscap-target-01 | Audited server | AlmaLinux 10.2 VM assessed with OpenSCAP |
| OpenSCAP | Compliance scanner | Performs XCCDF compliance evaluation |
| SCAP Security Guide | Security content | Provides AlmaLinux 10 CIS profiles and rules |
| CIS Server Level 1 | Compliance profile | Baseline used for the first scan |

## 4. Target System

| Item | Value |
|---|---|
| Hostname | openscap-target-01 |
| OS | AlmaLinux 10.2 |
| Platform | EL10 |
| OpenSCAP version | 1.4.4 |
| SCAP Security Guide version | 0.1.81 |
| Datastream | `/usr/share/xml/scap/ssg/content/ssg-almalinux10-ds.xml` |
| Profile | `xccdf_org.ssgproject.content_profile_cis_server_l1` |

## 5. Scan Summary

| Result | Count |
|---|---:|
| Passed rules | 165 |
| Failed rules | 138 |
| Not applicable rules | 20 |
| OpenSCAP exit code | 2 |

The scan executed successfully and generated evidence. The exit code indicates that the system did not fully comply with the selected CIS profile.

## 6. Evidence

| Evidence | Path |
|---|---|
| Scan summary | `scan-summary.md` |
| Top 20 failed rules | `failed-rules-top20.txt` |
| HTML report | `evidence/reports/almalinux10-cis-server-l1-report.html` |
| XML results | `evidence/results/almalinux10-cis-server-l1-results.xml.gz` |
| Scan log | `evidence/logs/almalinux10-cis-server-l1-scan.log` |
| Exit code | `evidence/logs/scan-exit-code.txt` |

## 7. Initial Findings

The first scan shows that the freshly deployed AlmaLinux 10.2 server is not compliant with the CIS Level 1 Server profile.

The first failed controls include:

- AIDE installation and configuration
- CIS crypto policy configuration
- `/tmp` partition separation
- GNOME-related hardening rules
- sudo hardening
- local and remote login banners

These findings are useful because they show the gap between a default Linux installation and a hardened enterprise baseline.

## 8. Remediation Strategy

Automatic remediation is not applied blindly.

The remediation approach is:

1. Review failed controls.
2. Group findings by risk area.
3. Separate low-risk changes from disruptive changes.
4. Prepare remediation scripts or Ansible tasks.
5. Apply changes in small batches.
6. Re-run OpenSCAP after each remediation phase.
7. Compare before/after evidence.

## 9. Troubleshooting Notes

Issues to watch during this type of project:

- Wrong SCAP datastream path
- Wrong profile ID
- Missing `scap-security-guide` package
- Large XML result files
- Exit code confusion
- Over-aggressive remediation
- Rules not applicable to minimal servers

## 10. Conclusion

This project establishes a baseline compliance posture for an AlmaLinux 10 server using OpenSCAP and the CIS Level 1 Server profile.

The next phase would be controlled remediation followed by a second compliance scan.
