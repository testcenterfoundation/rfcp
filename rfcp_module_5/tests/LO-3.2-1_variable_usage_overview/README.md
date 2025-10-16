# LO-3.2-1: Variable Usage Overview

## Learning Objectives
- Understand the fundamental concepts of variables in Robot Framework
- Learn different ways to create and assign variables
- Understand variable scope and lifetime
- Practice using variables in test automation scenarios

## Concepts Covered

### 1. Variable Types in Robot Framework
Robot Framework supports several types of variables:
- **Scalar variables** (`${variable}`) - Store single values
- **List variables** (`@{variable}`) - Store multiple values in sequence
- **Dictionary variables** (`&{variable}`) - Store key-value pairs

### 2. Variable Declaration Methods
Variables can be created in multiple ways:
- **Variables section** - Global suite-level variables
- **VAR statement** - Dynamic variable assignment during execution
- **Set Variable keyword** - Assignment using keywords
- **Return values** - Capturing results from keywords

### 3. Variable Scope
- **Suite scope** - Variables defined in *** Variables *** section
- **Test scope** - Variables created within test cases
- **Local scope** - Variables created within keywords

## Key Syntax Examples

### Variables Section
```robot
*** Variables ***
${BASE_URL}     https://example.com
${BROWSER}      chromium
${TIMEOUT}      30s
```

### Dynamic Assignment
```robot
${dynamic_var}=    Set Variable    some value
VAR    ${another_var}    another value
```

### Using Variables
```robot
New Browser         ${BROWSER}
New Page            ${BASE_URL}
Fill Text           id=email    ${EMAIL}
```

## Running the Demo
```bash
robot demo.robot
```

## Expected Outcomes
After running this demo, you should understand:
- How to declare variables in the Variables section
- How to create variables dynamically during test execution
- How to use variables as arguments to keywords
- How to capture return values into variables
- The difference between static and dynamic variable assignment

## Best Practices
1. Use descriptive variable names that clearly indicate their purpose
2. Use UPPER_CASE for constants defined in Variables section
3. Use snake_case for dynamic variables created during execution
4. Group related variables together in the Variables section
5. Document complex variable usage with comments

## Common Pitfalls
- Forgetting the `${}` syntax when referencing scalar variables
- Trying to use local variables outside their scope
- Not understanding the difference between assignment (`=`) and VAR statement
- Mixing up variable types (scalar vs list vs dictionary)

## Next Steps
- LO-3.2.2.x series covers specific variable types in detail
- LO-3.2.4 covers VAR statement usage in depth
- LO-3.2.5 covers variable scope concepts