# LO-3.2.4: VAR Statement Usage

## Learning Objectives
- Understand the VAR statement for dynamic variable creation
- Learn the difference between VAR and traditional assignment (=)
- Master creating different variable types with VAR
- Practice conditional and loop-based variable creation
- Understand scope control with VAR statement

## Concepts Covered

### 1. VAR Statement Syntax
The VAR statement provides a modern way to create variables during execution:
```robot
VAR    ${variable_name}    value
VAR    @{list_name}       item1    item2    item3
VAR    &{dict_name}       key1=value1    key2=value2
```

### 2. VAR vs Assignment Operator
- **VAR statement**: `VAR ${var} value` - explicit variable creation
- **Assignment operator**: `${var}= keyword` - captures return value
- **Scope**: VAR can specify scope (SUITE, TEST, TASK, LOCAL)

### 3. Variable Types with VAR
- **Scalar**: `VAR ${scalar} value`
- **List**: `VAR @{list} item1 item2`
- **Dictionary**: `VAR &{dict} key=value`

## Key Syntax Examples

### Basic VAR Usage
```robot
VAR    ${message}     Hello World
VAR    @{fruits}      apple    banana    orange
VAR    &{config}      host=localhost    port=${8080}
```

### Conditional VAR
```robot
IF    ${condition}
    VAR    ${result}    success
ELSE
    VAR    ${result}    failure
END
```

### VAR with Scope
```robot
VAR    ${suite_var}    value    scope=SUITE
VAR    ${test_var}     value    scope=TEST
VAR    ${local_var}    value    scope=LOCAL
```

## Running the Demo
```bash
robot demo.robot
```

## Expected Outcomes
After running this demo, you should understand:
- When to use VAR vs assignment operator
- How to create different variable types with VAR
- How scope affects variable lifetime and accessibility
- How to use VAR in conditional and loop contexts
- Best practices for dynamic variable creation

## Best Practices
1. Use VAR for explicit variable creation in complex logic
2. Use assignment operator for capturing keyword return values
3. Specify scope when variables need to persist beyond local context
4. Use VAR in conditional blocks for clarity
5. Consider VAR for multiline variable definitions

## Common Pitfalls
- Confusing VAR syntax with assignment operator syntax
- Not understanding scope implications
- Using VAR unnecessarily when assignment would be clearer
- Forgetting that VAR creates new variables, doesn't modify existing ones
- Scope conflicts when creating variables with same names

## VAR vs Traditional Methods
```robot
# Traditional assignment
${value}=    Some Keyword    argument

# VAR statement
VAR    ${value}    direct_value

# Traditional list
@{LIST}    item1    item2    # In Variables section

# VAR list
VAR    @{dynamic_list}    item1    item2    # In execution
```

## Next Steps
- LO-3.2.5 covers variable scope in detail
- LO-3.3.x series covers keyword arguments and user keywords
- Advanced variable manipulation techniques