# Learning Objective: LO-5.2.6 BREAK and CONTINUE Usage

## Overview
This demo teaches the use of BREAK and CONTINUE statements in Robot Framework loops. These control flow statements allow you to exit loops early (BREAK) or skip to the next iteration (CONTINUE) based on conditions.

## Key Concepts
- **BREAK**: Immediately exits the loop, continuing with code after the loop
- **CONTINUE**: Skips the rest of the current iteration and moves to the next
- **Conditional Logic**: Using IF statements to control BREAK/CONTINUE
- **Loop Control**: Managing loop execution flow for efficiency

## Prerequisites
- Robot Framework installed (`pip install robotframework`)
- Collections library (built-in with Robot Framework)

## Files in This Demo
- `loop_control_examples.robot` - Demonstrates BREAK and CONTINUE with practical examples
- `disable_all_users_except_admin.robot` - Real-world scenario using loop control

## How to Run

### Basic Execution
```bash
# Run the main examples
robot loop_control_examples.robot

# Run the practical scenario
robot disable_all_users_except_admin.robot

# Run from project root
robot tests/k2_demos/LO-5.2.6_break_continue_usage/

# Run with console output for debugging
robot --loglevel DEBUG loop_control_examples.robot
```

### Expected Output
- Two test cases demonstrating CONTINUE and BREAK
- Console output showing which items were processed/skipped
- All tests should pass

## Learning Points

### 1. CONTINUE Statement (Lines 31-42)
CONTINUE skips unwanted items in a loop:
```robotframework
FOR    ${item}    IN    @{items}
    IF    ${is_expired}    CONTINUE    # Skip this iteration
    # Process valid items only
END
```

### 2. BREAK Statement (Lines 45-58)
BREAK exits the loop when a condition is met:
```robotframework
FOR    ${item}    IN    @{items}
    IF    ${is_out_of_stock}
        BREAK    # Stop processing completely
    END
    # Process items until condition met
END
```

### 3. Practical Applications
- **CONTINUE**: Filter out invalid/unwanted items
- **BREAK**: Stop when target found or error encountered

## Control Flow Comparison

### Without Control Statements:
```robotframework
FOR    ${item}    IN    @{items}
    # Must process every item
    # Cannot skip or exit early
    Process Item    ${item}
END
```

### With CONTINUE:
```robotframework
FOR    ${item}    IN    @{items}
    ${is_valid}=    Check Validity    ${item}
    IF    not ${is_valid}    CONTINUE
    Process Item    ${item}    # Only valid items
END
```

### With BREAK:
```robotframework
FOR    ${item}    IN    @{items}
    ${found}=    Check Item    ${item}
    IF    ${found}
        Log    Target found!
        BREAK    # Stop searching
    END
END
```

## Real-World Use Cases

### 1. Data Validation (CONTINUE)
- Skip invalid records in data processing
- Ignore expired items in inventory
- Filter out test accounts from reports

### 2. Search Operations (BREAK)
- Stop when target element found
- Exit on first error in validation
- Halt processing when limit reached

### 3. Optimization
- Avoid unnecessary iterations
- Reduce execution time
- Improve test performance

## Common Pitfalls
- **Forgetting END**: BREAK/CONTINUE must be properly nested in IF blocks
- **Logic Errors**: Ensure conditions are correct to avoid skipping valid items
- **Infinite Loops**: Be careful with WHILE loops and ensure BREAK conditions are reachable
- **Order Matters**: CONTINUE before important logic will skip that logic

## Practice Exercises
1. Create a loop that finds the first prime number in a list and stops
2. Write a keyword that processes files but skips those with specific extensions
3. Implement a retry mechanism that breaks after max attempts
4. Build a search that continues past empty results but breaks on error

## Advanced Patterns

### Nested Loop Control:
```robotframework
FOR    ${outer}    IN    @{outer_list}
    FOR    ${inner}    IN    @{inner_list}
        IF    ${condition}    CONTINUE    # Continues inner loop
        IF    ${break_all}    BREAK       # Breaks inner loop only
    END
    IF    ${break_all}    BREAK           # Also break outer loop
END
```

### Counter with BREAK:
```robotframework
${count}=    Set Variable    0
FOR    ${item}    IN    @{items}
    ${count}=    Evaluate    ${count} + 1
    IF    ${count} > 10    BREAK    # Process max 10 items
    Process Item    ${item}
END
```

## Further Reading
- [Robot Framework User Guide - FOR Loops](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#for-loops)
- [Control Structures Documentation](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#conditional-execution)