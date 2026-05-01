# 🚀 AI Deal Architect - Future Upgrades (Production-Grade Roadmap)

This document outlines the required upgrades to transition the AI Deal Architect from a "Working Prototype" to a "Production-Grade Sales Engine".

## ⚙️ Phase 1: Full Automation (n8n & Webhooks)
- **Goal:** Eliminate manual terminal execution.
- **Implementation:** 
  - Convert Python script into a microservice.
  - Set up n8n workflows to trigger the CrewAI pipeline via Webhooks.
  - Connect a Google Sheet (list of target URLs) as the data source.
  - Automate the dispatch of the generated cold email via Gmail/Outlook integrations in n8n.

## 🧠 Phase 2: Reasoning Guardrails (Evidence-Only Mode)
- **Goal:** Eliminate "light hallucinations" and generic assumptions.
- **Implementation:**
  - Enforce strict prompt constraints requiring the `Intelligence Agent` to cite direct quotes from the scraped content.
  - Add a **Validation Agent (Reality Checker)** before the Closer Agent to verify that every claim in the intelligence brief is backed by scraped evidence.

## 📊 Phase 3: Structured Data Output (JSON)
- **Goal:** Make the output machine-readable for seamless integration with CRMs and databases.
- **Implementation:**
  - Transition from raw text output to strict JSON schemas using CrewAI's output parsing capabilities.
  - Implement scoring mechanisms for leads (e.g., Lead Quality Score: 85/100).
  - Target Schema Example:
    ```json
    {
      "company_name": "...",
      "identified_weaknesses": ["..."],
      "evidence_quotes": ["..."],
      "proposed_automation_opportunities": ["..."]
    }
    ```