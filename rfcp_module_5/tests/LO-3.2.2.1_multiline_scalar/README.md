# LO-3.2.2.1: Multiline Scalar Variables

## Learning Objectives
- Understand how to define scalar variables across multiple lines
- Learn the difference between space-separated and newline-separated multiline variables
- Practice using multiline variables in real-world scenarios
- Understand when and why to use multiline variable definitions

## Concepts Covered

### 1. Multiline Variable Syntax
Robot Framework allows scalar variables to be defined across multiple lines using the line continuation syntax (`...`):

```robot
${VARIABLE_NAME}    First part of the value
...                 Second part of the value
...                 Third part of the value
```

### 2. Separator Options
- **Default (space)** - Parts are joined with spaces
- **Custom separator** - Use `separator=X` to specify a different separator
- **Newline separator** - Use `separator=\n` for line breaks

### 3. Use Cases
- Long text content (messages, descriptions, SQL queries)
- Multi-paragraph text for form fields
- Configuration strings that are more readable when split
- Documentation strings and help text

## Key Syntax Examples

### Space-Separated Multiline
```robot
${LONG_MESSAGE}     This is a very long message
...                 that spans multiple lines
...                 but will be joined with spaces
```
Result: "This is a very long message that spans multiple lines but will be joined with spaces"

### Newline-Separated Multiline
```robot
${MULTILINE_TEXT}   Line one
...                 Line two
...                 Line three
...                 separator=\n
```
Result: "Line one\nLine two\nLine three"

### Custom Separator
```robot
${CSV_DATA}         value1
...                 value2
...                 value3
...                 separator=,
```
Result: "value1,value2,value3"

## Running the Demo
```bash
robot demo.robot
```

## Expected Outcomes
After running this demo, you should understand:
- How to split long variable definitions across multiple lines
- The difference between space and newline separators
- When multiline variables are more readable than single-line definitions
- How to use multiline variables in form fields and text areas

## Best Practices
1. Use multiline variables for better readability of long content
2. Align continuation lines (`...`) for visual consistency
3. Choose appropriate separators based on the content type
4. Consider using multiline variables for SQL queries, email templates, etc.
5. Use meaningful indentation to show the logical structure

## Common Pitfalls
- Forgetting the `...` continuation syntax
- Not understanding that spaces are the default separator
- Mixing tabs and spaces in continuation lines
- Not realizing that the separator applies to all line breaks
- Forgetting to specify `separator=\n` when line breaks are needed

## Next Steps
- LO-3.2.2.2 covers primitive data types in detail
- LO-3.2.2.3 covers list variables
- LO-3.2.2.4 covers dictionary variables