# LO-3.3.5: Arguments Setting for User Keywords

## Learning Objectives
- Understand how to define and use arguments in user keywords
- Learn different argument types (required, optional, keyword-only)
- Master argument handling patterns and best practices
- Practice creating reusable keywords with flexible argument structures
- Understand argument validation and error handling

## Concepts Covered

### 1. [Arguments] Setting
The [Arguments] setting defines what parameters a user keyword accepts:
```robot
My Keyword
    [Arguments]    ${arg1}    ${arg2}    ${arg3}
    Log    ${arg1}, ${arg2}, ${arg3}
```

### 2. Argument Types
- **Required arguments**: Must be provided when calling the keyword
- **Default arguments**: Have default values if not provided
- **Variable arguments**: Accept any number of arguments (*args)
- **Keyword arguments**: Accept named arguments (**kwargs)

### 3. Argument Syntax
- `${arg}` - Required positional argument
- `${arg}=default` - Optional argument with default value
- `@{args}` - Variable number of positional arguments
- `&{kwargs}` - Variable number of keyword arguments

## Key Syntax Examples

### Basic Arguments
```robot
Login User
    [Arguments]    ${username}    ${password}
    Fill Text      id:username    ${username}
    Fill Text      id:password    ${password}
    Click          id:login
```

### Optional Arguments
```robot
Create User
    [Arguments]    ${name}    ${email}    ${role}=user
    Log    Creating ${role}: ${name} (${email})
```

### Variable Arguments
```robot
Log Multiple Values
    [Arguments]    @{values}
    FOR    ${value}    IN    @{values}
        Log    ${value}
    END
```

## Running the Demo
```bash
robot demo.robot
```

## Expected Outcomes
After running this demo, you should understand:
- How to define arguments for user keywords
- When to use required vs optional arguments
- How to handle variable numbers of arguments
- Best practices for argument naming and validation
- How arguments improve keyword reusability

## Best Practices
1. Use descriptive argument names
2. Order arguments logically (required first, optional last)
3. Provide sensible default values
4. Validate arguments when necessary
5. Document argument types and expected values
6. Use type hints when available

## Common Pitfalls
- Forgetting [Arguments] setting when keyword needs parameters
- Incorrect argument order (mixing required and optional)
- Not handling edge cases in argument validation
- Overcomplicating keyword interfaces
- Not documenting argument requirements

## Next Steps
- LO-3.3.5.3-x series covers embedded arguments and BDD patterns
- LO-3.3.6-1 covers return statements and data flow
- Advanced argument patterns and keyword design