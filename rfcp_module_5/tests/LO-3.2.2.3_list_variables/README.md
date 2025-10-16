# LO-3.2.2.3: List Variables

## Learning Objectives
- Understand how to create and use list variables in Robot Framework
- Learn different ways to define lists (single-line vs multi-line)
- Master list indexing and element access
- Practice using lists with FOR loops and keyword arguments
- Understand list manipulation and dynamic list creation

## Concepts Covered

### 1. List Variable Syntax
List variables in Robot Framework use the `@{}` syntax:
- **Definition**: `@{LIST_NAME}    item1    item2    item3`
- **Access**: `${LIST_NAME}[index]` for specific elements
- **Expansion**: `@{LIST_NAME}` to pass all elements as separate arguments

### 2. List Definition Methods
- **Single-line**: All items on one line
- **Multi-line**: Items spread across multiple lines using `...`
- **Dynamic**: Created during execution using keywords

### 3. List Operations
- **Indexing**: Access elements by position `[0]`, `[1]`, `[-1]`
- **Slicing**: Extract sublists using `[start:end]`
- **Iteration**: Use in FOR loops
- **Modification**: Add, remove, or change elements

## Key Syntax Examples

### Basic List Definition
```robot
@{FRUITS}    apple    banana    orange
@{NUMBERS}   ${1}     ${2}     ${3}
```

### Multi-line List Definition
```robot
@{LONG_LIST}    item1    item2
...             item3    item4
...             item5    item6
```

### List Element Access
```robot
${first}      ${FRUITS}[0]          # First element
${last}       ${FRUITS}[-1]         # Last element
${subset}     ${FRUITS}[1:3]        # Slice elements
```

### List in Keywords
```robot
Log Many      @{FRUITS}             # Pass all elements as arguments
Log           ${FRUITS}             # Pass the entire list as one argument
```

## Running the Demo
```bash
robot demo.robot
```

## Expected Outcomes
After running this demo, you should understand:
- How to define lists using `@{}` syntax
- The difference between single-line and multi-line list definitions
- How to access individual list elements using indexing
- How to use lists in FOR loops and as keyword arguments
- How to create and modify lists dynamically

## Best Practices
1. Use descriptive names for list variables
2. Choose single-line vs multi-line based on readability
3. Use zero-based indexing consistently
4. Prefer `@{list}` expansion when passing all elements to keywords
5. Use negative indexing `[-1]` to access elements from the end
6. Consider using list comprehensions for dynamic list creation

## Common Pitfalls
- Forgetting the `@{}` syntax when defining lists
- Using `${list}` instead of `@{list}` when expanding all elements
- Index out of bounds errors (accessing non-existent positions)
- Confusing list expansion `@{list}` with list reference `${list}`
- Not understanding that lists are zero-indexed
- Mixing up list slicing syntax

## List vs Scalar Variables
```robot
@{LIST}       item1    item2    item3      # List variable
${LIST_REF}   @{LIST}                      # Scalar containing list reference
```

## Dynamic List Operations
```robot
${new_list}=      Create List      item1    item2
${length}=        Get Length       ${new_list}
Append To List    ${new_list}      item3
```

## Next Steps
- LO-3.2.2.4 covers dictionary variables
- LO-3.2.4 covers VAR statement for dynamic list creation
- LO-5.2.4 covers FOR loops with lists in detail