# LO-3.4: Data-Driven Testing Basics

## Learning Objectives
- Understand the concept of data-driven testing
- Learn to use Test Templates for parameterized tests
- Master the separation of test logic from test data
- Practice creating scalable test suites with minimal code duplication
- Understand when and how to apply data-driven approaches

## Concepts Covered

### 1. Data-Driven Testing Concept
Data-driven testing separates test logic from test data:
- **Test Template**: Defines the test logic once
- **Test Cases**: Provide different data sets
- **Parameterization**: Same logic, different inputs/expectations

### 2. Test Template Syntax
```robot
*** Settings ***
Test Template    My Test Keyword

*** Test Cases ***
Test Case 1    arg1    arg2    expected_result
Test Case 2    arg3    arg4    expected_result
```

### 3. Benefits
- Reduced code duplication
- Easy to add new test scenarios
- Clear separation of test logic and data
- Maintainable test suites
- Comprehensive test coverage with minimal effort

## Key Syntax Examples

### Basic Test Template
```robot
*** Settings ***
Test Template    Login User

*** Test Cases ***
Valid Admin Login      admin@example.com    password123    Success
Valid User Login       user@example.com     userpass       Success
Invalid Password       admin@example.com    wrongpass      Failed
```

### Template with Multiple Keywords
```robot
*** Keywords ***
Complete User Journey
    [Arguments]    ${username}    ${action}    ${expected}
    Login User            ${username}
    Perform Action        ${action}
    Verify Result         ${expected}
```

## Running the Demo
```bash
robot demo.robot
```

## Expected Outcomes
After running this demo, you should understand:
- How Test Templates eliminate code duplication
- When data-driven testing is most beneficial
- How to structure test data for templates
- Best practices for template keyword design
- How to handle different result expectations

## Best Practices
1. Keep template keywords focused and atomic
2. Use descriptive test case names that indicate the scenario
3. Structure test data logically (inputs first, expectations last)
4. Handle both positive and negative test cases
5. Use meaningful variable names in template keywords
6. Document template keyword parameters clearly

## Common Pitfalls
- Making template keywords too complex
- Not handling error cases in templates
- Poor test case naming (generic names like "Test 1")
- Mixing different types of tests in one template
- Not validating template arguments properly

## When to Use Data-Driven Testing
- Testing the same functionality with different inputs
- Boundary value testing
- User credential validation
- Form validation with various data combinations
- API testing with different parameters

## Next Steps
- LO-3.4.1-1 covers advanced test template definition
- External data sources (CSV, JSON, databases)
- Complex data-driven scenarios and patterns