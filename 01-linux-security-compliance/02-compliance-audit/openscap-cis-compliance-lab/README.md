# OpenSCAP CIS Compliance Lab

## 1. Context

This project demonstrates how to perform a Linux compliance audit using OpenSCAP in an enterprise-style environment.

The objective is to assess the security posture of a Linux server against a recognized compliance baseline, generate evidence, identify failed controls, and prepare a controlled remediation approach.

## 2. Objectives

- Install and validate OpenSCAP tooling.
- Identify available SCAP security profiles.
- Run a compliance scan against a Linux server.
- Generate HTML and XML evidence.
- Analyze failed controls.
- Prepare remediation artifacts without applying them blindly.
- Document findings, limitations, and next steps.

## 3. Architecture and Environment

| Component | Role | Description |
|---|---|---|
| aegis-audit-01 | Audit server | Used to run OpenSCAP commands and store reports |
| aegis-app-01 | Audited server | Linux server assessed for compliance |
| OpenSCAP | Compliance scanner | Performs XCCDF compliance evaluation |
| SCAP Security Guide | Security content | Provides security profiles and rules |

## 4. Security Controls

This project focuses on compliance-oriented Linux security controls:

- System configuration baseline
- SSH security posture
- Password and authentication settings
- Package and service configuration
- Audit and logging controls
- File permissions and system hardening indicators

## 5. Implementation

Implementation steps will include:

1. Installing OpenSCAP packages.
2. Locating the SCAP datastream file.
3. Listing available profiles.
4. Selecting a compliance profile.
5. Running a local or remote compliance scan.
6. Saving results under the `evidence/` directory.
7. Reviewing failed rules.
8. Generating remediation material for review.

## 6. Validation Evidence

Expected evidence:

- OpenSCAP version output
- Available profiles list
- HTML compliance report
- XML scan result
- Summary of passed, failed, and not applicable rules
- Screenshots or command outputs

Evidence will be stored in:

```text
evidence/reports/
evidence/results/
evidence/screenshots/
