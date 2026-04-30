# Output File Requirements

The output must be generated as a single consolidated markdown file `/feature-context/<feature-name>.md`.

## Content Structure

The file MUST contain the following 7 sections in order:

### 1. Feature Overview
- **Name**: The functional name of the feature.
- **Problem it solves**: A clear description of the functional gap or requirement addressed.
- **Users / roles**: The primary actors (internal/external) interacting with the feature.

### 2. Entities & Roles
- **Key entities & relationships**: The primary functional objects and how they relate (e.g., "A User has one Profile").
- **Roles + permission matrix**: Definition of roles and their allowed actions within the feature.

### 3. Configuration
- **Tenant/company configs**: System-level or company-level settings that modify behavior.
- **Defaults vs overrides**: Standard functional behavior and how it is explicitly changed by configuration.

### 4. Usage Context
- **Entry points**: Functional triggers such as a Drawer, Room, Channel, or API call.
- **Context-specific behavior**: How the feature adapts depending on where it is triggered from.

### 5. Capabilities
List each discrete capability of the feature:
- **Description**: Functional purpose.
- **Inputs / Outputs**: Data required and returned.
- **Dependencies**: Functional reliance on other features or data states.

### 6. User Flows
- **Primary flows**: Step-by-step numbered sequence for the happy path.
- **Alternate / failure flows**: Functional behavior when validations fail or exceptions occur.

### 7. Business Rules
- **Conditions → behavior**: IF-THEN rules governing functional logic.
- **Exceptions**: Explicit functional cases that diverge from standard rules.

---

**FINAL OUTPUT FORMAT:**
Return the content as a single markdown block using the following header:

=== /feature-context/<feature-name>.md ===
<content>
