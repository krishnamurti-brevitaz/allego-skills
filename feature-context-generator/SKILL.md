---
name: feature-context-generator
description: Generates machine-consumable functional feature context from a codebase. Prompts for output format (single file or folder) and converts raw feature information (Jira tickets, code, notes) into structured, AI-optimizable context.
---

# Feature Context Generator

This skill transforms a codebase and optional feature descriptions into precise, deterministic functional context optimized for AI systems.

## Global Objective

Generate precise functional context by analyzing code as the primary source of truth and Jira/feature descriptions as secondary intent sources. The output is a set of machine-consumable markdown files that define behavior without implementation details.

## Phase Execution Model

You MUST operate in strict sequential phases. Do NOT skip phases.

0. **User Preference Selection**: BEFORE starting generation, you MUST use `ask_user` to ask if the output should be a single consolidated file (default) or multiple concern-based files (folder structure).
1. **Scope Identification**: Identify feature boundaries and entry points.
2. **Code Behavior Extraction**: Extract pure functional behavior (triggers, inputs, logic, actions) without technical implementation details.
3. **Behavior Normalization**: Convert extracted behavior into consistent, deterministic IF-THEN rules.
4. **Intent Reconciliation (Optional)**: Compare codebase behavior against stated Jira/description intent.
5. **Functional Context Generation**: Produce the final context based on the user's selected preference.
6. **Validation & Consistency Check**: Ensure all rules, paths, and edge cases are covered and consistent.

## Implementation Details

For detailed procedural rules and requirements for each phase, see the following references:

- **Phase Rules**: [references/generation-instructions.md](references/generation-instructions.md)
- **Output File Requirements**: [references/output-format.md](references/output-format.md)

## Final Output Structure

Depending on user preference, the skill generates either:

- **Single File (Default)**: A single markdown file `/feature-context/<feature-name>.md` containing all sections.
- **Multiple Files (Folder)**: A directory `/feature-context/<feature-name>/` containing 9 discrete markdown files (00_overview.md through 08_invariants.md).

Always return the content using the `=== <filename> ===` separator format.
