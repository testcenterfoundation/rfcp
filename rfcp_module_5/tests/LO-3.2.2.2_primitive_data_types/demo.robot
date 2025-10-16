# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-24.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Settings ***
Documentation       LO-3.2.2.2    K2    Understand how to access primitive data types
...
...                 This demo explores the fundamental data types in Robot Framework:
...                 - Strings (default type)
...                 - Integers and floats (using ${} conversion syntax)
...                 - Booleans (True/False values)
...                 - None and empty values
...                 - Variable interpolation in strings

Library             BuiltIn


*** Variables ***
# === STRING VARIABLES (DEFAULT TYPE) ===
# Variables without ${} syntax are always treated as strings
# This is the most common variable type in Robot Framework

${NAME}                 John Doe                            # String: "John Doe"
${PROFESSION}           Software Engineer                   # String: "Software Engineer"
${PHONE}                555-123-4567                       # String: "555-123-4567"
${EMAIL}                john.doe@example.com               # String: "john.doe@example.com"

# === STRING REPRESENTATION OF NUMBERS ===
# Without ${} syntax, numbers are stored as strings, not numeric types
${AGE}                  42                                  # String: "42" (NOT integer 42)
${HEIGHT}               5.9                                 # String: "5.9" (NOT float 5.9)
${SCORE}                98.5                                # String: "98.5" (NOT float 98.5)

# === ACTUAL NUMERIC TYPES ===
# Using ${} syntax converts to proper numeric types
${AGE_AS_INTEGER}       ${42}                               # Integer: 42
${HEIGHT_AS_FLOAT}      ${5.9}                              # Float: 5.9
${SCORE_AS_FLOAT}       ${98.5}                             # Float: 98.5
${ZERO}                 ${0}                                # Integer: 0
${PI}                   ${3.14159}                          # Float: 3.14159
${NEGATIVE}             ${-10}                              # Integer: -10

# === BOOLEAN VARIABLES ===
# Boolean values must use ${} syntax and are case-insensitive
${IS_ADULT}             ${True}                             # Boolean: True
${IS_STUDENT}           ${False}                            # Boolean: False
${IS_ACTIVE}            ${TRUE}                             # Boolean: True (case-insensitive)
${IS_DISABLED}          ${false}                            # Boolean: False (case-insensitive)

# === NONE AND EMPTY VALUES ===
# Special values for null and empty states
${HAS_SPOUSE}           ${NONE}                             # None type: None
${MIDDLE_NAME}          ${EMPTY}                            # Empty string: ""
${NOTHING}              ${None}                             # None type: None (case-insensitive)

# === VARIABLE INTERPOLATION ===
# Variables can be embedded within strings for dynamic content
${GREETING}             Hello, ${NAME}!                     # String interpolation
${ANSWER}               The answer is ${AGE_AS_INTEGER}     # Mixed string and integer
${FULL_INFO}            ${NAME} is ${AGE_AS_INTEGER} years old and works as a ${PROFESSION}
${CALCULATION}          Age plus score: ${AGE_AS_INTEGER + SCORE_AS_FLOAT}    # Expression evaluation

# === SPECIAL CHARACTER STRINGS ===
${NEWLINE_STRING}       Line 1\nLine 2\nLine 3             # String with newlines
${TAB_STRING}           Column1\tColumn2\tColumn3           # String with tabs
${QUOTE_STRING}         He said "Hello World"              # String with quotes
${PATH_STRING}          C:\\Users\\John\\Documents          # String with backslashes


*** Test Cases ***
Demonstrate String Variables
    [Documentation]    Show how string variables work and their characteristics.
    ...
    ...                String variables are the default type in Robot Framework.
    ...                They don't require special syntax and can contain any text.

    Log To Console      \n=== STRING VARIABLES ===
    Log To Console      Name: ${NAME}
    Log To Console      Profession: ${PROFESSION}
    Log To Console      Phone: ${PHONE}
    Log To Console      Email: ${EMAIL}

    # Show that numbers without ${} are strings
    Log To Console      \n=== STRING REPRESENTATIONS OF NUMBERS ===
    Log To Console      Age (as string): "${AGE}"
    Log To Console      Height (as string): "${HEIGHT}"
    Log To Console      Score (as string): "${SCORE}"

    # Verify these are actually strings
    ${age_type}=        Evaluate    type($AGE).__name__
    ${height_type}=     Evaluate    type($HEIGHT).__name__
    Log To Console      Age variable type: ${age_type}
    Log To Console      Height variable type: ${height_type}

Demonstrate Numeric Variables
    [Documentation]    Show how to create and use actual numeric types.
    ...
    ...                Using ${} syntax converts strings to appropriate numeric types.
    ...                This is essential for mathematical operations.

    Log To Console      \n=== NUMERIC VARIABLES ===
    Log To Console      Age (as integer): ${AGE_AS_INTEGER}
    Log To Console      Height (as float): ${HEIGHT_AS_FLOAT}
    Log To Console      Score (as float): ${SCORE_AS_FLOAT}
    Log To Console      Zero: ${ZERO}
    Log To Console      Pi: ${PI}
    Log To Console      Negative: ${NEGATIVE}

    # Verify these are actually numbers
    ${age_int_type}=    Evaluate    type($AGE_AS_INTEGER).__name__
    ${height_float_type}=    Evaluate    type($HEIGHT_AS_FLOAT).__name__
    Log To Console      Age integer type: ${age_int_type}
    Log To Console      Height float type: ${height_float_type}

    # Demonstrate mathematical operations
    ${sum}=             Evaluate    ${AGE_AS_INTEGER} + ${HEIGHT_AS_FLOAT}
    ${product}=         Evaluate    ${AGE_AS_INTEGER} * ${SCORE_AS_FLOAT}
    Log To Console      \n=== MATHEMATICAL OPERATIONS ===
    Log To Console      Age + Height: ${sum}
    Log To Console      Age * Score: ${product}

Demonstrate Boolean Variables
    [Documentation]    Show how boolean variables work in Robot Framework.
    ...
    ...                Boolean values must use ${} syntax and can be used in
    ...                conditional logic and assertions.

    Log To Console      \n=== BOOLEAN VARIABLES ===
    Log To Console      Is adult: ${IS_ADULT}
    Log To Console      Is student: ${IS_STUDENT}
    Log To Console      Is active: ${IS_ACTIVE}
    Log To Console      Is disabled: ${IS_DISABLED}

    # Verify these are actually booleans
    ${adult_type}=      Evaluate    type($IS_ADULT).__name__
    ${student_type}=    Evaluate    type($IS_STUDENT).__name__
    Log To Console      Adult variable type: ${adult_type}
    Log To Console      Student variable type: ${student_type}

    # Demonstrate boolean operations
    IF    ${IS_ADULT}
        Log To Console      Person is an adult - can vote
    ELSE
        Log To Console      Person is a minor
    END

    IF    ${IS_STUDENT} and ${IS_ADULT}
        Log To Console      Adult student - eligible for student discounts
    ELSE IF    ${IS_STUDENT}
        Log To Console      Minor student
    ELSE
        Log To Console      Not a student
    END

Demonstrate None and Empty Values
    [Documentation]    Show how to work with None and empty values.
    ...
    ...                These are useful for representing missing or undefined data.

    Log To Console      \n=== NONE AND EMPTY VALUES ===
    Log To Console      Has spouse: ${HAS_SPOUSE}
    Log To Console      Middle name: "${MIDDLE_NAME}"
    Log To Console      Nothing: ${NOTHING}

    # Check types of None and empty values
    ${spouse_type}=     Evaluate    type($HAS_SPOUSE).__name__
    ${middle_type}=     Evaluate    type($MIDDLE_NAME).__name__
    Log To Console      Spouse variable type: ${spouse_type}
    Log To Console      Middle name variable type: ${middle_type}

    # Demonstrate conditional logic with None and empty
    IF    $HAS_SPOUSE is None
        Log To Console      Marital status: Single
    ELSE
        Log To Console      Marital status: Married to ${HAS_SPOUSE}
    END

    IF    "${MIDDLE_NAME}" == ""
        Log To Console      No middle name provided
    ELSE
        Log To Console      Middle name: ${MIDDLE_NAME}
    END

Demonstrate Variable Interpolation
    [Documentation]    Show how variables can be embedded within strings.
    ...
    ...                This is a powerful feature for creating dynamic content.

    Log To Console      \n=== VARIABLE INTERPOLATION ===
    Log To Console      Greeting: ${GREETING}
    Log To Console      Answer: ${ANSWER}
    Log To Console      Full info: ${FULL_INFO}
    Log To Console      Calculation: ${CALCULATION}

    # Create dynamic messages using interpolation
    ${status_message}=  Set Variable    User ${NAME} (${AGE_AS_INTEGER}) is ${IS_ACTIVE ? 'active' : 'inactive'}
    Log To Console      Status: ${status_message}

    # Demonstrate special characters
    Log To Console      \n=== SPECIAL CHARACTERS ===
    Log To Console      Newlines:\n${NEWLINE_STRING}
    Log To Console      Tabs: ${TAB_STRING}
    Log To Console      Quotes: ${QUOTE_STRING}
    Log To Console      Path: ${PATH_STRING}

Type Comparison and Validation
    [Documentation]    Demonstrate type checking and validation techniques.
    ...
    ...                It's important to understand the actual types of your variables
    ...                for proper test logic and assertions.

    Log To Console      \n=== TYPE VALIDATION ===

    # Use built-in type checking keywords
    Should Be String    ${NAME}
    Should Be String    ${AGE}              # String representation
    Should Be Integer   ${AGE_AS_INTEGER}   # Actual integer
    Should Be Float     ${HEIGHT_AS_FLOAT}  # Actual float
    Should Be Boolean   ${IS_ADULT}         # Actual boolean

    # Demonstrate type conversion issues
    TRY
        ${invalid_math}=    Evaluate    ${AGE} + ${HEIGHT}    # String concatenation, not addition
        Log To Console      String math result: ${invalid_math}    # Will be "425.9"
    EXCEPT
        Log To Console      Cannot perform math on string variables
    END

    # Correct mathematical operation
    ${correct_math}=    Evaluate    ${AGE_AS_INTEGER} + ${HEIGHT_AS_FLOAT}
    Log To Console      Numeric math result: ${correct_math}    # Will be 47.9

    # Show length operations
    ${name_length}=     Get Length    ${NAME}
    ${age_length}=      Get Length    ${AGE}
    Log To Console      Name length: ${name_length}
    Log To Console      Age string length: ${age_length}
