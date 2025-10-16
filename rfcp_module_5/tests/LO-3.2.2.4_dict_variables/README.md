# LO-3.2.2.4: Dictionary Variables

## Learning Objectives
- Understand how to create and use dictionary variables in Robot Framework
- Learn different ways to define dictionaries (single-line vs multi-line)
- Master dictionary key access using both bracket and dot notation
- Practice using dictionaries with keyword arguments and FOR loops
- Understand dictionary manipulation and dynamic dictionary creation

## Concepts Covered

### 1. Dictionary Variable Syntax
Dictionary variables in Robot Framework use the `&{}` syntax:
- **Definition**: `&{DICT_NAME}    key1=value1    key2=value2`
- **Bracket access**: `${DICT_NAME}[key]` for specific values
- **Dot access**: `${DICT_NAME.key}` for specific values (attribute-style)
- **Expansion**: `&{DICT_NAME}` to pass all key-value pairs as named arguments

### 2. Dictionary Definition Methods
- **Single-line**: All key-value pairs on one line
- **Multi-line**: Key-value pairs spread across multiple lines using `...`
- **Dynamic**: Created during execution using keywords

### 3. Dictionary Operations
- **Key access**: Get values using keys
- **Dynamic keys**: Use variables as keys
- **Iteration**: Loop through keys, values, or items
- **Modification**: Add, remove, or change key-value pairs

## Key Syntax Examples

### Basic Dictionary Definition
```robot
&{USER}         name=John    age=${30}    active=${True}
&{CONFIG}       host=localhost    port=${8080}    ssl=${False}
```

### Multi-line Dictionary Definition
```robot
&{CUSTOMER}     first_name=Jane
...             last_name=Doe
...             email=jane@example.com
...             phone=555-1234
```

### Dictionary Value Access
```robot
${name}         ${USER}[name]           # Bracket notation
${age}          ${USER.age}             # Dot notation
${key}          Set Variable    name
${value}        ${USER}[${key}]         # Dynamic key access
```

### Dictionary in Keywords
```robot
Log Many        &{USER}                 # Pass all pairs as named arguments
Log             ${USER}                 # Pass the entire dictionary as one argument
```

## Running the Demo
```bash
robot demo.robot
```

## Expected Outcomes
After running this demo, you should understand:
- How to define dictionaries using `&{}` syntax
- The difference between bracket and dot notation for key access
- How to use dictionaries in FOR loops and as keyword arguments
- How to create and modify dictionaries dynamically
- When to use dictionary expansion vs dictionary reference

## Best Practices
1. Use descriptive names for dictionary variables
2. Choose single-line vs multi-line based on readability
3. Use dot notation for static keys, bracket notation for dynamic keys
4. Prefer `&{dict}` expansion when passing all pairs to keywords
5. Use meaningful key names that describe the data
6. Consider using dictionaries for configuration and structured data

## Common Pitfalls
- Forgetting the `&{}` syntax when defining dictionaries
- Using `${dict}` instead of `&{dict}` when expanding all pairs
- Key errors when accessing non-existent keys
- Confusing dictionary expansion `&{dict}` with dictionary reference `${dict}`
- Not understanding the difference between bracket and dot notation
- Mixing up dictionary iteration methods

## Dictionary vs Other Variables
```robot
&{DICT}         key1=value1    key2=value2     # Dictionary variable
${DICT_REF}     &{DICT}                        # Scalar containing dictionary reference
@{KEYS}         key1    key2                   # List of keys
```

## Dynamic Dictionary Operations
```robot
${new_dict}=       Create Dictionary    key1=value1    key2=value2
${value}=          Get From Dictionary  ${new_dict}    key1
Set To Dictionary  ${new_dict}          key3=value3
```

## Next Steps
- LO-3.2.4 covers VAR statement for dynamic dictionary creation
- LO-3.2.5 covers variable scope concepts
- Advanced dictionary operations and nested structures