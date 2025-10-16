# LO-3.2.2.2: Primitive Data Types

## Learning Objectives
- Understand how Robot Framework handles different primitive data types
- Learn the difference between string representations and actual data types
- Master type conversion using `${}` syntax
- Practice working with strings, integers, floats, booleans, and None values
- Understand variable interpolation and concatenation

## Concepts Covered

### 1. Data Types in Robot Framework
Robot Framework supports several primitive data types:
- **Strings** - Default type, any text without `${}`
- **Integers** - Whole numbers using `${number}` syntax
- **Floats** - Decimal numbers using `${number}` syntax
- **Booleans** - True/False values using `${True}` or `${False}`
- **None/Null** - Empty values using `${None}` or `${EMPTY}`

### 2. Type Conversion Syntax
- **String**: `${VAR}` or just `VAR` (default)
- **Integer**: `${42}` converts to integer type
- **Float**: `${3.14}` converts to float type
- **Boolean**: `${True}`, `${False}` (case-insensitive)
- **None**: `${None}` or `${EMPTY}`

### 3. Variable Interpolation
Variables can be embedded within strings for dynamic content:
```robot
${MESSAGE}    The answer is ${42}    # Results in "The answer is 42"
```

## Key Syntax Examples

### String Variables
```robot
${NAME}           John Doe
${GREETING}       Hello World
${EMPTY_STRING}   ${EMPTY}
```

### Numeric Variables
```robot
${AGE}            ${42}         # Integer
${PRICE}          ${19.99}      # Float
${COUNT}          ${0}          # Integer zero
```

### Boolean Variables
```robot
${IS_ACTIVE}      ${True}
${IS_DISABLED}    ${False}
${IS_VISIBLE}     ${TRUE}       # Case-insensitive
```

### Special Values
```robot
${NOTHING}        ${None}
${BLANK}          ${EMPTY}
${SPACE}          ${SPACE}
```

## Running the Demo
```bash
robot demo.robot
```

## Expected Outcomes
After running this demo, you should understand:
- How Robot Framework determines variable types
- When to use `${}` syntax for type conversion
- The difference between string "42" and integer `${42}`
- How to work with boolean values and None
- How variable interpolation works in string contexts

## Best Practices
1. Use `${}` syntax when you need specific data types (numbers, booleans)
2. Keep string variables simple without `${}` unless type conversion is needed
3. Use meaningful variable names that indicate the data type
4. Be consistent with boolean value casing (`${True}` vs `${TRUE}`)
5. Use `${EMPTY}` for explicitly empty strings
6. Use `${None}` for null/undefined values

## Common Pitfalls
- Forgetting that variables without `${}` are always strings
- Using string "True" instead of boolean `${True}`
- Not understanding that "42" ≠ `${42}` (string vs integer)
- Confusion between `${EMPTY}` and `${None}`
- Case sensitivity issues with boolean values
- Mixing string and numeric operations without proper conversion

## Type Checking Tips
Use these keywords to verify data types:
- `Should Be String`
- `Should Be Integer`
- `Should Be Float`
- `Should Be Boolean`
- `Should Be None`

## Next Steps
- LO-3.2.2.3 covers list variables
- LO-3.2.2.4 covers dictionary variables
- LO-3.2.4 covers VAR statement for dynamic typing