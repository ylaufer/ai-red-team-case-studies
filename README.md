![CI](../../actions/workflows/ci.yml/badge.svg)

# AI Red Team Case Studies

**Author:** Yanina Laufer  
**Credential:** ISTQB Certified Tester – AI Testing (CT-AI)

---

This repository contains structured adversarial testing case studies designed to evaluate failure modes in large language models (LLMs).

## What each case study includes

- **Test objective**
- **Prompt design strategy**
- **Observed behavior**
- **Failure classification**
- **Reproducibility notes**
- **Severity assessment**
- **Risk impact analysis**
- **Mitigation suggestions**

---

The goal is to demonstrate systematic AI Red Team methodology aligned with formal AI testing principles.

## Setup

```bash
uv venv --clear
uv pip install -r pyproject.toml


Using uv:

uv venv
uv pip install .

Note: On Windows without `make`, run commands directly.
