# Consultant Deliverables

This document explains how to transform the homelab into professional deliverables.

## 1. Purpose

The goal is to document the lab as if it were a small consulting mission for a client. This improves technical clarity and makes the project credible for recruiters.

## 2. Recommended deliverables

| Deliverable | Purpose |
|---|---|
| HLD - High Level Design | Explain the global architecture and business value |
| LLD - Low Level Design | Detail IPs, ports, services, flows, and configurations |
| Installation Guide | Explain how each component was installed |
| Operations Runbook | Explain how to operate and troubleshoot the platform |
| Security Monitoring Use Cases | Show what can be detected or investigated |
| Evidence Pack | Screenshots and command outputs proving the implementation |

## 3. HLD content

The HLD should explain:

- Business context
- Objectives
- High-level architecture
- Main components
- Security monitoring value
- Limitations
- Future improvements

## 4. LLD content

The LLD should include:

- VM inventory
- IP plan
- Ports and protocols
- Data flows
- User accounts and roles
- Configuration files
- Validation commands

## 5. Operations runbook content

The runbook should include:

- How to start/stop services
- How to validate log ingestion
- How to troubleshoot forwarders
- How to check firewall and network connectivity
- How to document incidents

## 6. Evidence pack

Evidence should be stored in `assets/screenshots/` and referenced from documentation.

Recommended evidence:

- Splunk login page
- Splunk receiving port enabled
- Linux logs visible in Splunk
- Windows events visible in Splunk
- pfSense remote logging screen
- Terminal outputs proving services and ports

## 7. Recruiter narrative

A strong way to present this project:

> I designed and implemented a small enterprise security monitoring platform using Splunk, pfSense, Linux, and Windows Server. I configured log forwarding, validated ingestion, documented the architecture, and produced operational runbooks similar to consulting deliverables.

## 8. What this proves

This project proves ability in:

- Infrastructure documentation
- Linux operations
- Windows Server log collection
- SIEM foundations
- Network troubleshooting
- Security monitoring methodology
- Consultant-style delivery
