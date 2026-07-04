# OpenSCAP Remediation Plan - AlmaLinux 10 CIS Server Level 1

## 1. Purpose

This document defines a controlled remediation strategy after the initial OpenSCAP CIS Level 1 Server baseline scan.

The objective is not to fix all failed controls blindly. The objective is to classify findings, identify low-risk remediations, isolate disruptive changes, and prepare a safe hardening roadmap.

## 2. Baseline Scan Result

| Result | Count |
|---|---:|
| Passed rules | 165 |
| Failed rules | 138 |
| Not applicable rules | 20 |
| OpenSCAP exit code | 2 |

The scan completed successfully and produced evidence. The system is not fully compliant with the selected CIS profile.

## 3. Remediation Principles

Remediation must follow these principles:

1. Do not apply automatic remediation blindly.
2. Review each failed rule before applying changes.
3. Separate low-risk fixes from disruptive changes.
4. Apply changes in small batches.
5. Take a VM snapshot before remediation.
6. Re-run OpenSCAP after each remediation phase.
7. Document before and after results.
8. Keep rollback notes for every change.

## 4. Finding Families

The first failed rules show several remediation families.

| Family | Examples | Risk Level | Remediation Priority |
|---|---|---|---|
| File integrity monitoring | AIDE installation, AIDE database, AIDE audit tool checks | Low to Medium | High |
| Crypto policy | CIS custom crypto policy | Medium to High | Medium |
| Filesystem partitioning | Separate /tmp partition | High | Deferred |
| Desktop / GNOME hardening | GNOME screensaver, automount, login banner | Low to Medium | Conditional |
| Sudo hardening | use_pty, sudo logfile, re-authentication | Low | High |
| Login banners | /etc/issue, /etc/issue.net | Low | High |
| Audit and logging | audit-related controls | Medium | High |
| Package and service baseline | Required packages, disabled services | Low to Medium | Medium |

## 5. Low-Risk Remediation Candidates

These controls are good candidates for an initial remediation phase:

- Install AIDE.
- Build the AIDE database.
- Configure periodic AIDE checks.
- Configure sudo use_pty.
- Configure a sudo logfile.
- Configure local login banner.
- Configure remote login banner.

These changes are usually reversible and do not require repartitioning or major service redesign.

## 6. Deferred or High-Risk Remediation

These controls should not be applied casually on an existing system:

- Separate /tmp partition.
- Crypto policy changes that could affect application compatibility.
- Broad authentication policy changes.
- Service hardening that could break remote access.
- GUI/GNOME controls on servers where no GUI should exist.

These controls require architecture review, maintenance window planning, and rollback preparation.

## 7. Proposed Remediation Phases

### Phase 1 - Safe baseline hardening

Scope:

- Login banners.
- sudo hardening.
- AIDE package installation.
- AIDE database initialization.

Expected risk: low.

### Phase 2 - Audit and logging controls

Scope:

- Audit service validation.
- Audit rules review.
- Logging retention and forwarding strategy.

Expected risk: medium.

### Phase 3 - Crypto and authentication controls

Scope:

- CIS crypto policy.
- Password policy.
- PAM-related controls.

Expected risk: medium to high.

### Phase 4 - Filesystem and partition controls

Scope:

- Separate /tmp.
- Mount options.
- Filesystem layout review.

Expected risk: high on existing systems.

## 8. Rollback Strategy

Before applying remediation:

1. Create a VM snapshot.
2. Save current configuration files.
3. Apply changes in small batches.
4. Keep a list of modified files.
5. Validate SSH access before closing the session.
6. Reboot only when required.
7. Re-run OpenSCAP after validation.

## 9. Evidence to Produce After Remediation

The next remediation iteration should produce:

- Remediation script or Ansible tasks.
- Before/after OpenSCAP scan summary.
- Updated failed rule count.
- Updated HTML report.
- Updated XML result archive.
- Remediation notes.
- Rollback notes.

## 10. Conclusion

The initial scan provides the baseline posture. The next step is to remediate selected low-risk controls first, then progressively address more sensitive controls with proper change management.
