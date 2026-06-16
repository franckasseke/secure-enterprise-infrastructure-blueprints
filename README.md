# Linux Security Monitoring Homelab

Enterprise-style security monitoring and infrastructure lab using **Splunk**, **pfSense**, **Ubuntu Server**, **Rocky Linux**, **Windows Server**, and a local AI workstation with **LM Studio**.

This repository documents the design, deployment, configuration, troubleshooting, and validation of a small enterprise security monitoring environment. The objective is to centralize logs from Linux, Windows, and network security components into Splunk, then use those logs for operational monitoring, troubleshooting, security analysis, and AI-assisted technical documentation.

## Project objectives

- Build a realistic security monitoring homelab.
- Deploy Splunk Enterprise as a central SIEM/log platform.
- Forward logs from Ubuntu Server, Rocky Linux, Windows Server, and pfSense.
- Document the architecture like a professional consulting engagement.
- Produce reusable technical documentation for recruiters, clients, and future projects.
- Explore local AI tooling to support Linux, cloud, security and documentation workflows.

## Target architecture

```text
+-------------------+        +-----------------------+
| pfSense Firewall  | -----> |                       |
| Network Logs      |        |                       |
+-------------------+        |                       |
                             |   Splunk Enterprise   |
+-------------------+        |   Ubuntu Server       |
| Rocky Linux       | -----> |   TCP 9997 / Web 8000 |
| Universal Forwarder|       |                       |
+-------------------+        |                       |
                             |                       |
+-------------------+        |                       |
| Windows Server    | -----> |                       |
| Universal Forwarder|       +-----------------------+
+-------------------+

+-------------------+
| Ubuntu Desktop    |
| LM Studio         |
| Local LLM Testing |
| AI Documentation  |
+-------------------+
```

## Technology stack

| Area | Technologies |
|---|---|
| SIEM / Logs | Splunk Enterprise, Splunk Universal Forwarder |
| Firewall / Network | pfSense |
| Linux Systems | Ubuntu Server, Rocky Linux, Ubuntu Desktop |
| Windows Systems | Windows Server |
| Local AI Workstation | LM Studio, AppImage, local LLM testing |
| Virtualization | KVM / Virt-Manager |
| Documentation | Markdown, architecture notes, implementation guides |

## Repository structure

```text
docs/       Technical documentation and architecture notes
labs/       Step-by-step implementation labs
scripts/    Useful commands and automation helpers
assets/     Diagrams, screenshots, and visual evidence
```

## Current lab scope

- Splunk Enterprise installation on Ubuntu Server.
- Splunk boot-start and systemd service configuration.
- Splunk Universal Forwarder installation on Rocky Linux.
- Splunk Universal Forwarder installation on Windows Server.
- pfSense preparation for log forwarding.
- Validation of Splunk receiving host logs.
- Local AI workstation setup with LM Studio on Ubuntu.
- AppImage and Electron/Chromium sandbox troubleshooting.
- Local LLM model validation with `google/gemma-4-e4b`.

## Labs

| # | Lab | Focus |
|---|---|---|
| 01 | [Splunk Enterprise on Ubuntu](labs/01-splunk-enterprise-ubuntu/) | SIEM deployment and service validation |
| 02 | [Rocky Linux Universal Forwarder](labs/02-rocky-linux-forwarder/) | Linux log forwarding |
| 03 | [Windows Server Universal Forwarder](labs/03-windows-server-forwarder/) | Windows event log forwarding |
| 04 | [pfSense Logs to Splunk](labs/04-pfsense-logs-to-splunk/) | Firewall log collection |
| 05 | [Local AI Workstation on Ubuntu with LM Studio](labs/05-local-ai-workstation-lm-studio/) | Local LLM execution, AppImage troubleshooting and AI-assisted documentation |

## Skills demonstrated

- Linux administration
- Windows Server administration
- SIEM deployment
- Log forwarding
- Network troubleshooting
- Firewall log collection
- AppImage troubleshooting
- Local AI workstation setup
- Technical documentation
- Enterprise documentation
- Security monitoring foundations

## Documentation roadmap

- [x] Architecture design
- [x] Splunk installation guide
- [x] Rocky Linux forwarder guide
- [x] Windows Server forwarder guide
- [x] pfSense log forwarding guide
- [x] Local AI workstation lab with LM Studio
- [ ] Troubleshooting notes
- [ ] Security monitoring use cases
- [ ] Screenshots and diagrams

## Author

**Franck Ake**  
Cloud & Infrastructure Security Architect in progress  
Focus: Linux, Cloud Security, SIEM, Networking, Kubernetes, AI-assisted Infrastructure, and Infrastructure Security.
