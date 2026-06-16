# Secure Local LLM Operations on Linux with Ollama and DeepSeek-R1

## NovaCore AI Lab — Secure Offline LLM Workstation for Linux & Cloud Security Operations

This project documents the deployment of a local Large Language Model environment on Linux using **Ollama** and **DeepSeek-R1** as an experimental reasoning model.

The objective is not only to run a model locally. The objective is to build a secure, reproducible and consultant-ready AI workstation that can assist with Linux administration, security analysis, troubleshooting, scripting and technical documentation without exposing sensitive operational data to external AI platforms.

---

## Professional positioning

This lab is designed for a future **Cloud & Infrastructure Security Architect** profile.

It demonstrates the ability to:

- deploy a local LLM runtime on Linux;
- select and test an experimental reasoning model;
- understand privacy and operational security constraints;
- restrict unnecessary network exposure;
- validate local API behavior;
- build reusable prompts for Linux and cloud security work;
- document the architecture like a consultant deliverable;
- cleanly remove the lab environment when finished.

---

## Lab scenario

A fictional company, **NovaCore Systems**, wants to evaluate whether an internal Linux security consultant can use a local AI assistant during infrastructure missions.

The consultant must build a local LLM workstation able to help with:

- Linux command analysis;
- SSH, firewall and systemd troubleshooting;
- Ansible playbook review;
- incident documentation;
- technical report drafting;
- offline productivity during client missions.

The solution must be deployed locally and must avoid exposing the Ollama service to the public network.

---

## Architecture

```text
+------------------------------------------------------------+
| Linux Workstation / VM                                     |
|                                                            |
|  User shell                                                |
|     |                                                      |
|     | ollama run deepseek-r1:7b                            |
|     v                                                      |
|  Ollama runtime                                            |
|     |                                                      |
|     | Local API: http://127.0.0.1:11434                    |
|     v                                                      |
|  Local model cache                                         |
|     |                                                      |
|     +-- deepseek-r1:7b                                     |
|     +-- qwen2.5:7b                                        |
|     +-- qwen2.5-coder:7b                                  |
|     +-- llama3.2:3b                                       |
|                                                            |
+------------------------------------------------------------+
```

Default security principle: **local first, no unnecessary exposure**.

---

## Recommended lab machine

Minimum for testing:

- Linux workstation or VM;
- 16 GB RAM;
- 4 CPU cores;
- 30 GB free disk space;
- Ubuntu/Debian-based distribution recommended for this lab;
- Internet access only during installation and model download.

Recommended for smoother 7B model usage:

- 32 GB RAM;
- recent CPU;
- NVIDIA GPU optional but useful;
- NVMe storage;
- good cooling, especially on a gaming laptop or workstation.

---

## Model selected

Experimental model used in this lab:

```bash
ollama pull deepseek-r1:7b
```

Reason for selection:

- good reasoning-oriented behavior for technical troubleshooting;
- usable size for a local workstation;
- useful for Linux, scripting and structured analysis exercises;
- good candidate for evaluating local AI workflows before moving toward a secured cloud-hosted private LLM platform.

Additional models used for comparison:

```bash
ollama pull qwen2.5:7b
ollama pull qwen2.5-coder:7b
ollama pull llama3.2:3b
ollama pull deepseek-r1:7b
```

---

## Repository structure

```text
labs/secure-local-llm-ollama-deepseek/
├── README.md
├── docs/
│   ├── architecture.md
│   ├── model-selection.md
│   ├── offline-usage.md
│   ├── security-hardening.md
│   └── troubleshooting.md
├── scripts/
│   ├── install-ollama.sh
│   ├── pull-models.sh
│   └── ollama-healthcheck.sh
├── prompts/
│   ├── documentation-prompts.md
│   ├── linux-security-prompts.md
│   └── troubleshooting-prompts.md
└── cleanup/
    └── cleanup-ollama-lab.sh
```

---

## Build phase

### 1. Install Ollama

Run from the Linux workstation:

```bash
curl -fsSL https://ollama.com/install.sh | sh
```

Validate the installation:

```bash
ollama --version
systemctl status ollama --no-pager
```

Expected result:

```text
Ollama is installed and the ollama service is active.
```

---

### 2. Pull the experimental model

```bash
ollama pull deepseek-r1:7b
```

Validate local model availability:

```bash
ollama list
```

Expected result:

```text
deepseek-r1:7b appears in the local model list.
```

---

### 3. Run the model locally

```bash
ollama run deepseek-r1:7b
```

Test prompt:

```text
You are a Linux security assistant. Explain how to check whether SSH is listening on a server and how to validate firewall access.
```

Expected result:

```text
The model answers from the local machine without requiring a cloud AI interface.
```

---

### 4. Validate the local API

```bash
curl http://127.0.0.1:11434/api/tags
```

Expected result:

```text
The API returns the locally installed models.
```

---

## Break phase

Intentional mistakes to understand operational failure modes:

| Incident | Expected symptom | Diagnostic command | Fix |
|---|---|---|---|
| Ollama service stopped | `connection refused` on port 11434 | `systemctl status ollama` | `sudo systemctl restart ollama` |
| Model not downloaded | `model not found` | `ollama list` | `ollama pull deepseek-r1:7b` |
| API exposed externally | service reachable from another host | `ss -lntp` and remote `curl` | bind to localhost / firewall restriction |
| Disk space insufficient | pull fails or model incomplete | `df -h` | free space or use smaller model |
| Laptop overheating/noisy | high fan speed | `top`, `htop`, GPU tools | smaller model or reduce workload |

---

## Fix phase

Core fixes:

```bash
sudo systemctl restart ollama
ollama list
ollama pull deepseek-r1:7b
curl http://127.0.0.1:11434/api/tags
ss -lntp | grep 11434
```

Security fix principle:

```text
The Ollama API must not be exposed to untrusted networks unless protected by strong network controls, authentication layers, VPN, reverse proxy rules and monitoring.
```

---

## Security hardening checklist

- Keep Ollama bound to localhost unless there is a documented reason to expose it.
- Do not paste real passwords, private keys, customer data or production secrets into prompts.
- Use synthetic data for tests.
- Keep the OS updated.
- Restrict inbound traffic with a firewall.
- Use a dedicated VM or workstation profile for client-sensitive missions.
- Document installed models and their intended use.
- Remove unused models to reduce disk usage and attack surface.
- Validate that the local API is not reachable from another host.
- Treat LLM output as assistance, not as an unquestioned source of truth.

---

## Validation evidence

Collect the following evidence before considering the lab complete:

```bash
ollama --version
ollama list
systemctl status ollama --no-pager
curl http://127.0.0.1:11434/api/tags
ss -lntp | grep 11434
```

Recommended screenshot evidence:

- successful `ollama list` output;
- successful DeepSeek-R1 local prompt;
- local API validation;
- firewall or listening socket validation.

---

## Consultant deliverables

At the end of the lab, produce:

1. a short architecture note;
2. a model selection note;
3. a security hardening note;
4. a troubleshooting report;
5. a cleanup report;
6. a reflection note explaining where local LLMs are useful and where they remain risky.

---

## What this lab proves

This lab proves the ability to:

- deploy a private local AI runtime on Linux;
- understand local inference constraints;
- work with model lifecycle commands;
- evaluate a reasoning model for Linux security tasks;
- apply security controls around a local AI service;
- build reusable prompt libraries;
- document an AI infrastructure project for GitHub and recruiters.

---

## Future evolution

This lab is the foundation for a more advanced project:

```text
Secure Private LLM Platform on Linux Cloud
```

Future scope:

- private VPC/VNet deployment;
- VPN-only access;
- TLS reverse proxy;
- IAM-controlled access;
- monitoring and logging;
- encrypted storage;
- model governance;
- prompt audit trail;
- CI/CD deployment pipeline;
- security review of the AI supply chain.

---

## Official references

- Ollama download page: https://ollama.com/download
- Ollama API documentation: https://docs.ollama.com/api/introduction
- Ollama DeepSeek-R1 model page: https://ollama.com/library/deepseek-r1
