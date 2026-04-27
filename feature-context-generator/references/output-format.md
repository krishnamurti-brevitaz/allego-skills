# Output File Requirements

The output must be generated as either a single consolidated markdown file or a set of structured markdown files in a directory.

## Multiple Files Structure (Folder)

Generated in `/feature-context/<feature-name>/`:

### 00_overview.md
- **Purpose**: High-level description of what the feature does.
- **Actors**: Users or systems that interact with the feature.
- **Trigger**: The event that starts the execution.
- **Outcome**: The expected final state or result.

### 01_user_flows.md
- **Content**: Numbered steps representing the interaction.
- **Paths**: Include both success and failure paths.
- **Granularity**: Each step must be a single, discrete action.

### 02_business_rules.md
- **Format**: One rule per line.
- **Structure**: IF → THEN format for conditional logic.

### 03_data_contract.md
- **Content**: Input/output tables.
- **Detail**: Field-level definitions, types, and constraints.
- **Enumerations**: Explicit lists of allowed values where applicable.

### 04_edge_cases.md
- **Content**: Exhaustive list of edge conditions.
- **Definition**: Clear system behavior defined for each edge case.

### 05_constraints.md
- **Content**: Functional constraints only (e.g., idempotency, ordering).

### 06_examples.md
- **Requirement**: Minimum of 3 examples.
  1. Valid case
  2. Invalid case
  3. Edge case

### 07_non_goals.md
- **Content**: Explicit exclusions (what the feature does NOT do).

### 08_invariants.md
- **Content**: Conditions that must always hold true throughout the execution.

## Single File Structure (Consolidated)

Generated as `/feature-context/<feature-name>.md`.

- **H1 Header**: Feature Name
- **H2 Headers**: For each of the sections listed above (Overview, User Flows, Business Rules, Data Contract, Edge Cases, Constraints, Examples, Non-Goals, Invariants).
- **Horizontal Rule**: Use `---` between sections if it improves readability.

---

**FINAL OUTPUT FORMAT:**
Return the content using the `=== <filename> ===` separator format.
