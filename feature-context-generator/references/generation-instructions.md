# Feature Context Generation Instructions

This reference provides the detailed procedural rules for each phase of the functional feature context generation process.

## PHASE 1 — SCOPE IDENTIFICATION

**TASK:**
- Identify feature boundary.
- Detect entry points (controllers, handlers, jobs).
- Identify usage contexts (e.g., Drawer, Room, Channel, API).
- Identify relevant modules and dependencies.

**OUTPUT (INTERNAL JSON):**
```json
{
  "feature_name": "",
  "entry_points": [],
  "usage_contexts": [],
  "relevant_components": [],
  "excluded_components": []
}
```

**RULES:**
- Focus only on code paths relevant to the feature.
- Avoid scanning entire repository blindly.

## PHASE 2 — CODE BEHAVIOR EXTRACTION

**OBJECTIVE:**
Extract PURE FUNCTIONAL BEHAVIOR from code.

**STRICT RULES:**
- DO NOT mention:
  - class names
  - method names
  - frameworks
  - database schema

**EXTRACT:**
1. **Entities & Relationships**: Functional objects (Users, Deals, Assets) and their cardinality/connections.
2. **Roles & Permissions**: Who can do what (e.g., Admin can delete, User can only view).
3. **Configurations**: Tenant or Company level settings (defaults vs overrides).
4. **Context Behavior**: Differences in behavior based on entry point (Drawer vs Room).
5. **Triggers**: What starts the execution.
6. **Inputs**: Fields, required vs optional, data types.
7. **Validations**: All functional constraints and rules.
8. **Actions**: State changes, side-effects, operations.
9. **Outputs**: Responses, notifications, results.
10. **Error Conditions**: Functional failures and exceptions.

**OUTPUT (INTERNAL JSON):**
```json
{
  "feature_name": "",
  "entities": [],
  "roles": [],
  "configurations": [],
  "context_behavior": [],
  "triggers": [],
  "inputs": [],
  "validations": [],
  "flows": [],
  "business_rules": [],
  "outputs": [],
  "errors": [],
  "dependencies": [],
  "confidence": "high | medium | low"
}
```

## PHASE 3 — BEHAVIOR NORMALIZATION

**OBJECTIVE:**
Convert raw extracted behavior into consistent, deterministic format.

**TASKS:**
- Normalize terminology (use consistent naming).
- Remove duplicates.
- Break compound logic into atomic rules.
- Ensure each rule is explicit.

**RULES:**
- Replace vague statements with explicit conditions.
- Convert implicit logic into IF → THEN rules.
- Ensure no ambiguity remains.

## PHASE 4 — FUNCTIONAL CONTEXT GENERATION

**OBJECTIVE:**
Convert normalized behavior into the structured 7-section single-file format.

**STRICT RULES:**
- NO technical details.
- NO implementation references.
- Deterministic language only:
  - Use: "must", "will", "returns".
  - DO NOT use: "should", "might", "can".
- NO pronouns:
  - Avoid "it", "they", "this".

**OUTPUT FORMAT:**
Create a single markdown file `/feature-context/<feature-name>.md` following the structure in `output-format.md`.

## PHASE 5 — VALIDATION & CONSISTENCY CHECK

**MANDATORY CHECKS:**
- All inputs have validation rules.
- All flows include failure paths.
- No ambiguous language exists.
- Terminology is consistent across the document.
- Edge cases cover:
  - missing input
  - invalid input
  - duplicates
  - boundary values
