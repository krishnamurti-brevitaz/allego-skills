---
name: feature-context-generator
description: Generates a single consolidated, machine-consumable functional feature context from a codebase. Converts raw feature information (Jira tickets, code, notes) into a structured, 7-section AI-optimizable context file.
---

# Feature Context Generator

This skill transforms a codebase and optional feature descriptions into precise, deterministic functional context optimized for AI systems.

## Global Objective

Generate precise functional context by analyzing code as the primary source of truth and Jira/feature descriptions as secondary intent sources. The output is a set of machine-consumable markdown files that define behavior without implementation details.

## Phase Execution Model

You MUST operate in strict sequential phases. Do NOT skip phases.

1. **Scope Identification**: Identify feature boundaries and entry points.
2. **Code Behavior Extraction**: Extract pure functional behavior (triggers, inputs, logic, actions) without technical implementation details.
3. **Behavior Normalization**: Convert extracted behavior into consistent, deterministic IF-THEN rules.
4. **Intent Reconciliation (Optional)**: Compare codebase behavior against stated Jira/description intent.
5. **Functional Context Generation**: Produce the final context in the single-file format.
6. **Validation & Consistency Check**: Ensure all rules, paths, and edge cases are covered and consistent.

## Implementation Details

For detailed procedural rules and requirements for each phase, see the following references:

- **Phase Rules**: [references/generation-instructions.md](references/generation-instructions.md)
- **Output File Requirements**: [references/output-format.md](references/output-format.md)

## Final Output Structure

The skill generates a single consolidated markdown file:

- **Single File**: `/feature-context/<feature-name>.md` containing the 7 requested functional sections.

Always return the content using the `=== <filename> ===` separator format.
