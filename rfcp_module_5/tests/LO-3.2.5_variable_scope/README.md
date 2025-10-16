# LO-3.2.5: Variable Scope

## Learning Objectives
- Understand different variable scopes in Robot Framework
- Learn how scope affects variable accessibility and lifetime
- Master scope isolation between tests and keywords
- Practice scope management in complex test scenarios
- Understand the difference between suite, test, and local scope

## Concepts Covered

### 1. Variable Scope Levels
Robot Framework has several scope levels:
- **Suite scope**: Variables section, available to all tests
- **Test scope**: Variables created in test cases
- **Local scope**: Variables created within keywords
- **Global scope**: Available across all suites (less common)

### 2. Scope Rules
- Lower scopes can access higher scope variables
- Higher scopes cannot access lower scope variables
- Variables can be promoted to higher scopes using keywords
- Scope isolation prevents accidental variable conflicts

### 3. Scope Management Keywords
- `Set Suite Variable`: Promote to suite scope
- `Set Test Variable`: Promote to test scope
- `Set Global Variable`: Promote to global scope

## Key Concepts

### Suite Scope (Variables Section)
```robot
*** Variables ***
${SUITE_VAR}    Available to all tests
```

### Test Scope
```robot
*** Test Cases ***
My Test
    ${test_var}=    Set Variable    Only in this test
```

### Local Scope (Keywords)
```robot
*** Keywords ***
My Keyword
    ${local_var}=    Set Variable    Only in this keyword
```

## Running the Demo
```bash
robot demo.robot
```

## Expected Outcomes
After running this demo, you should understand:
- How variable scope affects accessibility
- Why scope isolation is important for test reliability
- When and how to promote variables to higher scopes
- How to debug scope-related issues
- Best practices for scope management

## Best Practices
1. Use suite scope for configuration and constants
2. Keep test-specific data in test scope
3. Use local scope by default in keywords
4. Promote scope only when necessary
5. Use descriptive names to indicate scope intent
6. Avoid global scope unless absolutely necessary

## Common Pitfalls
- Expecting local variables to be accessible outside their scope
- Accidentally overriding suite variables in tests
- Creating unintended global variables
- Not understanding scope promotion effects
- Scope confusion in complex keyword hierarchies

## Scope Debugging Tips
- Use logging to verify variable values at different scopes
- Check the Robot Framework log for variable creation and access
- Use meaningful variable names that indicate intended scope
- Test scope isolation explicitly in your test cases

## Next Steps
- LO-3.3.x series covers keyword arguments and user keywords
- Advanced scope management techniques
- Resource file scope considerations