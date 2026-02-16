![CI](https://github.com/ylaufer/ai-red-team-case-studies/actions/workflows/ci.yml/badge.svg)

# AI Red Team Case Studies

**Author:** Yanina Laufer  
**Credential:** ISTQB Certified Tester – AI Testing (CT-AI)

---

## Overview

This repository operationalizes adversarial LLM testing as a structured, reproducible engineering process.

Instead of informal prompt experimentation, it provides:

- Structured adversarial case studies
- Quantifiable failure signals
- Automated execution validation
- CI-backed reproducibility
- Version-controlled evaluation logic

The goal is to demonstrate how AI Red Teaming and AI Reliability Engineering can be treated as an engineering discipline rather than manual exploration.

---

## Problem Statement

LLM testing often happens in an unstructured way:

- Prompts are tried manually
- Failures are observed
- Findings are documented informally
- No reproducibility guarantees exist
- No regression detection mechanism is in place

This repository formalizes adversarial testing into:

- Defined test objectives
- Measurable reliability metrics
- Structured failure logging
- Automated validation pipeline

---

## Repository Architecture

The project is organized into distinct evaluation layers.

### 1️⃣ Case Studies Layer (`case-studies/`)

Each Markdown file defines a structured adversarial scenario including:

- **Test objective**
- **Prompt design strategy**
- **Expected policy behavior**
- **Observed behavior**
- **Failure classification**
- **Severity assessment**
- **Risk impact analysis**
- **Reproducibility notes**

Example failure classes:

- Guardrail evasion
- Bias framing disparity
- Confident hallucination

These case studies simulate realistic LLM weaknesses under adversarial pressure.

---

### 2️⃣ Data Layer (`data/`)

The dataset (`sample_runs.csv`) represents structured model evaluation logs.

Each run includes:

- `run_id`
- `timestamp_utc`
- `model`
- `case_id`
- `prompt_id`
- `variation_id`
- `expected_policy`
- `outcome`
- `refusal_style`
- `leakage`
- `hallucination`
- `bias_signal`
- `severity`

This abstraction allows adversarial behavior to be evaluated as structured signals rather than anecdotal observations.

---

### 3️⃣ Metrics Layer (`notebooks/`)

The evaluation notebook computes reliability indicators such as:

- Refusal rate when refusal is expected
- Leakage rate (policy violation rate)
- Hallucination rate
- Bias rate
- Severity distribution

This converts qualitative red team findings into measurable metrics.

The notebook execution is automated and validated in CI to ensure reproducibility.

---

### 4️⃣ Automation & CI Layer

This repository includes a fully automated GitHub Actions pipeline.

On every push or pull request:

1. A Python environment is provisioned.
2. Dependencies are installed via `uv`.
3. The evaluation notebook is executed headlessly.
4. The notebook is exported as an HTML artifact.
5. The workflow fails if execution breaks.

This ensures:

- Reproducible evaluation logic
- Early detection of execution regressions
- Artifact generation for traceability
- Infrastructure-level validation of evaluation methodology

The CI badge in this README reflects pipeline health.

---

## End-to-End Evaluation Flow

1. Define adversarial test scenario.
2. Generate or collect structured evaluation logs.
3. Execute notebook to compute reliability metrics.
4. Export evaluation report.
5. CI validates execution and reproducibility.
6. Failures or metric drift can be detected over time.

---

## Engineering Principles Applied

This repository demonstrates:

- Version-controlled evaluation logic
- Structured failure taxonomy
- Separation of data, logic, and documentation
- Automated reproducibility
- Deterministic execution
- Artifact-based validation

It models how AI reliability testing can evolve from exploratory testing into disciplined engineering practice.

---

## Why This Is Red Teaming (Not Just Analysis)

The cases are adversarial by design.

They aim to:

- Stress policy boundaries
- Exploit ambiguity
- Induce hallucinations
- Surface bias asymmetries
- Trigger guardrail bypass attempts

The objective is not functional correctness.

The objective is controlled failure discovery.

---

## Potential Extensions

This framework can be extended to include:

- Statistical tolerance thresholds (fail CI if leakage > X%)
- Real-time model API integration
- Baseline regression comparisons
- Pytest-based metric assertions
- Longitudinal drift tracking
- Multi-model comparative evaluation

---

## Reproducibility

To execute locally:

```bash
uv venv
uv pip install -r pyproject.toml
uv run jupyter nbconvert --to notebook --execute notebooks/01_analyze_runs.ipynb --inplace
```

To export report:

```bash
uv run jupyter nbconvert --to html notebooks/01_analyze_runs.ipynb --output 01_analyze_runs.html
```

---
## Conclusion
This repository demonstrates how adversarial LLM testing can be transformed into a reproducible, automated evaluation pipeline aligned with AI reliability engineering principles.

It bridges the gap between exploratory red teaming and engineering-grade AI validation.
