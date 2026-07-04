# OpenSCAP Scan Summary - AlmaLinux 10 CIS Server Level 1

## Target system

- Hostname: openscap-target-01
- Operating system: AlmaLinux 10.2
- Compliance profile: CIS AlmaLinux OS 10 Benchmark for Level 1 - Server
- Profile ID: xccdf_org.ssgproject.content_profile_cis_server_l1
- SCAP datastream: /usr/share/xml/scap/ssg/content/ssg-almalinux10-ds.xml

## Tooling

- OpenSCAP version: 1.4.4
- SCAP Security Guide version: 0.1.81

## Scan result summary

| Result | Count |
|---|---:|
| Passed rules | 165 |
| Failed rules | 138 |
| Not applicable rules | 20 |

## Exit code interpretation

The OpenSCAP command returned exit code 2.

This means the scan executed and produced evidence, but the evaluated system did not fully comply with the selected security profile.

## Evidence generated

| Evidence | Path |
|---|---|
| HTML report | evidence/reports/almalinux10-cis-server-l1-report.html |
| XML results | evidence/results/almalinux10-cis-server-l1-results.xml |
| Scan log | evidence/logs/almalinux10-cis-server-l1-scan.log |
| Exit code | evidence/logs/scan-exit-code.txt |

## Initial analysis

The system has a significant number of failed controls. This is expected for a freshly installed Linux server that has not yet been hardened against a CIS profile.

The next step is not to apply automatic remediation blindly. Failed controls must first be reviewed, grouped by risk area, and remediated in a controlled way.

## Remediation strategy

The remediation approach will follow this order:

1. Review failed controls.
2. Identify low-risk configuration fixes.
3. Separate disruptive changes from safe changes.
4. Prepare remediation scripts or Ansible tasks.
5. Apply changes in small batches.
6. Re-run OpenSCAP after each remediation phase.
7. Document before/after evidence.

## Conclusion

This first scan establishes the baseline compliance posture of the AlmaLinux 10 server before hardening.
