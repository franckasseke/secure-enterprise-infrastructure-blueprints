# OpenSCAP CIS Compliance Lab

## 1. Context

This project demonstrates a Linux compliance assessment using OpenSCAP in an enterprise-style environment.

The objective is to assess an AlmaLinux server against a CIS Level 1 Server baseline, generate audit evidence, identify failed controls, and document a controlled improvement process.

This project is documented as a professional compliance assessment, not as a simple tutorial.

## 2. Objectives

- Deploy a dedicated Linux target for compliance assessment.
- Install and validate OpenSCAP tooling.
- Identify the relevant compliance profile.
- Run a CIS Level 1 Server scan.
- Generate HTML, XML, and log evidence.
- Extract failed rules for analysis.
- Plan controlled remediation without applying broad automated changes blindly.
- Re-run the scan after a first low-risk remediation phase.
- Compare before and after results.

## 3. Architecture and Environment

| Component | Role | Description |
|---|---|---|
| openscap-target-01 | Audited server | AlmaLinux 10.2 VM assessed with OpenSCAP |
| OpenSCAP | Compliance scanner | Performs compliance evaluation |
| SCAP Security Guide | Security content | Provides AlmaLinux 10 CIS profiles and rules |
| CIS Server Level 1 | Compliance profile | Baseline used for the assessment |

## 4. Target System

| Item | Value |
|---|---|
| Hostname | openscap-target-01 |
| OS | AlmaLinux 10.2 |
| Platform | EL10 |
| OpenSCAP version | 1.4.4 |
| SCAP Security Guide version | 0.1.81 |
| Profile | CIS AlmaLinux OS 10 Benchmark Level 1 Server |
| Profile ID | `xccdf_org.ssgproject.content_profile_cis_server_l1` |

## 5. Baseline Result

| Metric | Count |
|---|---:|
| Passed rules | 165 |
| Failed rules | 138 |
| Not applicable rules | 20 |
| OpenSCAP exit code | 2 |

The first scan generated a baseline view of the system compliance posture.

## 6. Baseline Evidence

| Evidence | Path |
|---|---|
| Scan summary | `scan-summary.md` |
| Top failed rules | `failed-rules-top20.txt` |
| HTML report | `evidence/reports/almalinux10-cis-server-l1-report.html` |
| XML results | `evidence/results/almalinux10-cis-server-l1-results.xml.gz` |
| Scan log | `evidence/logs/almalinux10-cis-server-l1-scan.log` |
| Exit code | `evidence/logs/scan-exit-code.txt` |

## 7. Initial Findings

The first scan shows the gap between a default Linux installation and an enterprise compliance baseline.

The first failed control families included:

- File integrity monitoring
- Cryptographic policy alignment
- Filesystem layout controls
- Graphical environment controls
- Administration policy controls
- Login warning banners

## 8. Remediation Strategy

The remediation strategy is progressive and evidence-driven.

1. Review failed controls.
2. Group findings by risk area.
3. Separate low-risk changes from disruptive changes.
4. Apply changes in small batches.
5. Re-run OpenSCAP after each remediation phase.
6. Compare before and after evidence.
7. Keep rollback and evidence files available.

## 9. Low-Risk Remediation Result

A first controlled low-risk remediation phase was completed and validated with a second OpenSCAP scan.

Low-risk remediation covered:

- Login banner configuration
- Administration session logging controls
- File integrity monitoring installation
- File integrity database initialization
- Periodic integrity check scheduling

### Before / After

| Metric | Baseline | After low-risk remediation | Difference |
|---|---:|---:|---:|
| Passed rules | 165 | 171 | +6 |
| Failed rules | 138 | 132 | -6 |
| Not applicable rules | 20 | 20 | 0 |

## 10. After-Remediation Evidence

| Evidence | Path |
|---|---|
| After-remediation summary | `evidence/after-low-risk-remediation/after-low-risk-summary.md` |
| After-remediation HTML report | `evidence/after-low-risk-remediation/reports/almalinux10-cis-server-l1-after-low-risk-report.html` |
| After-remediation XML results | `evidence/after-low-risk-remediation/results/almalinux10-cis-server-l1-after-low-risk-results.xml.gz` |
| After-remediation scan log | `evidence/after-low-risk-remediation/logs/almalinux10-cis-server-l1-after-low-risk-scan.log` |
| After-remediation exit code | `evidence/after-low-risk-remediation/logs/scan-exit-code-after-low-risk.txt` |
| Applied remediation notes | `remediation/low-risk-remediation-applied.md` |

## 11. Troubleshooting Notes

Issues to watch during this type of project:

- Wrong SCAP content path
- Wrong profile ID
- Missing SCAP security content
- Large XML result files
- Exit code confusion
- Over-aggressive remediation
- Rules not applicable to minimal servers

## 12. Conclusion

This project establishes a baseline compliance posture for an AlmaLinux 10 server using OpenSCAP and the CIS Level 1 Server profile.

The first remediation phase demonstrates a controlled before and after improvement: passed rules increased from 165 to 171, while failed rules decreased from 138 to 132.
