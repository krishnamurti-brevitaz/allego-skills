# Feature Context Generation Instructions

This reference provides the detailed procedural rules for each phase of the functional feature context generation process.

## PHASE 0 — USER PREFERENCE SELECTION

**TASK:**
- Use `ask_user` to prompt the user for their preferred output format.
- **Options**:
  1. **Single File (Default)**: All context consolidated into one markdown file.
  2. **Multiple Files**: Current structure with 9 concern-based files in a folder.
- Store the preference for Phase 5.

## PHASE 1 — SCOPE IDENTIFICATION

**TASK:**
- Identify feature boundary.
- Detect entry points (controllers, handlers, jobs).
- Identify relevant modules and dependencies.

**OUTPUT (INTERNAL JSON):**
```json
{
  "feature_name": "",
  "entry_points": [],
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
1. Triggers (what starts execution)
2. Inputs (fields, required/optional)
3. Validations (all conditions)
4. Decision branches (if/else logic)
5. Actions (state changes, operations)
6. Outputs (responses/results)
7. Error conditions

**OUTPUT (INTERNAL JSON):**
```json
{
  "feature_name": "",
  "triggers": [],
  "inputs": [],
  "validations": [],
  "flows": [],
  "business_rules": [],
  "outputs": [],
  "errors": [],
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

## PHASE 4 — INTENT RECONCILIATION (OPTIONAL)

**INPUT:**
- Jira / feature description (if provided).

**TASK:**
- Compare code behavior vs stated intent.

**RULES:**
- Codebase = source of truth.
- If mismatch:
  - **STOP EXECUTION.** Do NOT proceed to Phase 5.
  - Present the mismatch to the user (Jira Intent vs. Actual Code Behavior).
  - Ask the user to decide on the next action:
    1. **Update Functional Context**: Documentation will reflect the current code behavior.
    2. **Flag as Defect**: Documentation will reflect the intended behavior (Jira), and a bug should be recorded.
    3. **Research**: Investigate why the code deviates from the intent before proceeding.
    4. **Other**: Provide a custom instruction or alternative decision.

**OUTPUT (INTERNAL JSON):**
```json
{
  "mismatches": [
    {
      "intent": "",
      "actual_behavior": "",
      "impact": ""
    }
  ],
  "user_decision": "pending | context-update | bug-flag | research | custom"
}
```

## PHASE 5 — FUNCTIONAL CONTEXT GENERATION

**OBJECTIVE:**
Convert normalized behavior into structured markdown content.

**STRICT RULES:**
- NO technical details.
- NO implementation references.
- Deterministic language only:
  - Use: "must", "will", "returns".
  - DO NOT use: "should", "might", "can".
- NO pronouns:
  - Avoid "it", "they", "this".

**OUTPUT FORMAT:**
- **If Single File**: Create `/feature-context/<feature-name>.md`. Use H1 for the feature name and H2 headers for each section (Overview, User Flows, etc.).
- **If Multiple Files**: Create `/feature-context/<feature-name>/` and the 9 discrete files as defined in `output-format.md`.

## PHASE 6 — VALIDATION & CONSISTENCY CHECK

**MANDATORY CHECKS:**
- All inputs have validation rules.
- All flows include failure paths.
- No ambiguous language exists.
- Terminology is consistent across files.
- Edge cases cover:
  - missing input
  - invalid input
  - duplicates
  - boundary values
