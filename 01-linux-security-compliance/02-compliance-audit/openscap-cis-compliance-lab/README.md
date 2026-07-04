# OpenSCAP CIS Compliance Lab

This project demonstrates a Linux compliance audit using OpenSCAP in an enterprise-style environment.

## Baseline

| Metric | Count |
|---|---:|
| Passed rules | 165 |
| Failed rules | 138 |
| Not applicable rules | 20 |
| OpenSCAP exit code | 2 |

## Low-Risk Remediation Result

A controlled low-risk remediation phase was completed and validated with a second OpenSCAP scan.

| Metric | Baseline | After low-risk remediation | Difference |
|---|---:|---:|---:|
| Passed rules | 165 | 171 | +6 |
| Failed rules | 138 | 132 | -6 |
| Not applicable rules | 20 | 20 | 0 |

Evidence is stored in `evidence/after-low-risk-remediation/`.
