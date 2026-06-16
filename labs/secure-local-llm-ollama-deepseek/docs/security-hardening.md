# Security Hardening — Local LLM with Ollama

## Objective

This document defines security controls for running a local LLM workstation with Ollama.

The goal is to avoid transforming a productivity tool into a new attack surface.

---

## Main risk areas

| Risk | Description | Mitigation |
|---|---|---|
| API exposure | Ollama API reachable from another host | Keep access local or restrict with firewall rules |
| Sensitive data leakage | User pastes confidential operational information into prompts | Use synthetic data and redact sensitive values |
| Overtrust | User executes model-generated commands without review | Human validation required |
| Model provenance | Model downloaded from an unclear source | Use documented model sources |
| Disk pressure | Large models fill disk space | Monitor storage and remove unused models |
| Uncontrolled integrations | Tools or agents use the local model without guardrails | Separate lab usage from production automation |

---

## Validate listening sockets

```bash
ss -lntp | grep 11434 || true
```

Expected secure behavior:

```text
The Ollama service should not be exposed to untrusted network interfaces.
```

Also test locally:

```bash
curl http://127.0.0.1:11434/api/tags
```

From another host on the same lab network, test whether the API is reachable:

```bash
curl http://<linux-workstation-ip>:11434/api/tags
```

If it responds from another host and this was not intended, treat it as a security issue.

---

## Firewall example with UFW

Deny inbound access by default:

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
sudo ufw status verbose
```

Do not open port `11434/tcp` unless there is a controlled architecture requiring it.

---

## Firewall example with firewalld

Check active zones:

```bash
sudo firewall-cmd --get-active-zones
```

List open ports:

```bash
sudo firewall-cmd --list-ports
```

If port `11434/tcp` was opened by mistake:

```bash
sudo firewall-cmd --remove-port=11434/tcp --permanent
sudo firewall-cmd --reload
```

---

## Prompt security rules

Do not paste confidential information into prompts.

Examples of values to redact before prompting:

```text
DB_PASSWORD=<REDACTED>
API_TOKEN=<REDACTED>
CUSTOMER_NAME=<CLIENT_A>
PUBLIC_IP=<PUBLIC_IP_1>
SERVER_HOSTNAME=<HOST_A>
```

---

## Safe prompt example

```text
I have a Linux server where SSH is active locally but unreachable remotely.
The service listens on port 2222.
Firewall details are redacted.
Give me a diagnostic checklist using systemctl, ss, firewall-cmd and journalctl.
Do not assume cloud provider access.
```

---

## Output validation policy

Before executing a model-generated command, validate:

1. What does the command do?
2. Does it modify the system?
3. Is it destructive?
4. Does it expose data?
5. Can it be tested safely first?
6. Is there a rollback?

Recommended practice:

```bash
# Read commands before execution
# Prefer dry-runs when available
# Test in a lab VM before production
```

---

## Hardening checklist

- [ ] Ollama installed from documented source.
- [ ] Model list documented.
- [ ] API tested locally.
- [ ] Remote access to port 11434 tested.
- [ ] Firewall reviewed.
- [ ] No confidential data used in prompts.
- [ ] Prompt examples stored in repository.
- [ ] Troubleshooting notes documented.
- [ ] Cleanup script available.
- [ ] Human validation rule documented.

---

## Security conclusion

A local LLM improves confidentiality compared to sending prompts to an external service, but it does not remove all risk.

The engineer remains responsible for data handling, model selection, API exposure, output validation and operational discipline.
