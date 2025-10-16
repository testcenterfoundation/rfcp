# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-24.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Settings ***
Documentation       LO-3.2.2.3    K2    Understand how to set and access data in list variables
...
...                 This demo covers all aspects of list variables in Robot Framework:
...                 - Defining lists using @{} syntax (single-line and multi-line)
...                 - Accessing individual list elements using indexing
...                 - Using lists in FOR loops and as keyword arguments
...                 - List slicing and negative indexing
...                 - Dynamic list creation and manipulation

Library             Browser
Library             Collections

Test Setup          Open Browser And Set Context


*** Variables ***
# === SINGLE-LINE LIST DEFINITIONS ===
# All items defined on one line - good for short lists
@{PRODUCTS_ONE_LINE}        Pliers    Hammer    Combination Pliers    Bolt Cutters    Thor Hammer

@{COLORS}                   Red       Blue      Green     Yellow      Purple
@{NUMBERS}                  ${1}      ${2}      ${3}      ${4}        ${5}
@{BOOLEANS}                 ${True}   ${False}  ${True}   ${False}

# === MULTI-LINE LIST DEFINITIONS ===
# Items spread across multiple lines using line continuation (...) - better for long lists
@{PRODUCTS_MULTI_LINE}      Pliers    Hammer
...                         Combination Pliers    Bolt Cutters
...                         Thor Hammer

@{CATEGORIES}               Hand Tools
...                         Power Tools
...                         Garden Tools
...                         Measuring Tools
...                         Safety Equipment

@{MIXED_DATA_TYPES}         Text String
...                         ${42}
...                         ${3.14}
...                         ${True}
...                         ${None}

# === EMPTY LIST ===
@{EMPTY_LIST}

# === LISTS WITH SPECIAL CHARACTERS ===
@{SPECIAL_ITEMS}            Item with spaces
...                         Item-with-dashes
...                         Item_with_underscores
...                         Item.with.dots


*** Test Cases ***
Demonstrate Basic List Access
    [Documentation]    Show how to access individual elements from lists.
    ...
    ...                Lists use zero-based indexing: first element is [0], second is [1], etc.
    ...                Negative indexing is also supported: [-1] is last element, [-2] is second-to-last.

    Log To Console      \n=== BASIC LIST ACCESS ===

    # Access elements from single-line list
    Log To Console      [One-line] First product: ${PRODUCTS_ONE_LINE}[0]
    Log To Console      [One-line] Second product: ${PRODUCTS_ONE_LINE}[1]
    Log To Console      [One-line] Third product: ${PRODUCTS_ONE_LINE}[2]
    Log To Console      [One-line] Fourth product: ${PRODUCTS_ONE_LINE}[3]
    Log To Console      [One-line] Fifth product: ${PRODUCTS_ONE_LINE}[4]

    # Access elements from multi-line list
    Log To Console      [Multi-line] First product: ${PRODUCTS_MULTI_LINE}[0]
    Log To Console      [Multi-line] Second product: ${PRODUCTS_MULTI_LINE}[1]
    Log To Console      [Multi-line] Third product: ${PRODUCTS_MULTI_LINE}[2]
    Log To Console      [Multi-line] Fourth product: ${PRODUCTS_MULTI_LINE}[3]
    Log To Console      [Multi-line] Fifth product: ${PRODUCTS_MULTI_LINE}[4]

    # Demonstrate negative indexing
    Log To Console      \n=== NEGATIVE INDEXING ===
    Log To Console      Last product ([-1]): ${PRODUCTS_ONE_LINE}[-1]
    Log To Console      Second-to-last product ([-2]): ${PRODUCTS_ONE_LINE}[-2]
    Log To Console      Third-to-last product ([-3]): ${PRODUCTS_ONE_LINE}[-3]

Demonstrate List Properties and Information
    [Documentation]    Show how to get information about lists (length, type, etc.).

    Log To Console      \n=== LIST INFORMATION ===

    # Get list lengths
    ${products_length}=     Get Length    ${PRODUCTS_ONE_LINE}
    ${colors_length}=       Get Length    ${COLORS}
    ${empty_length}=        Get Length    ${EMPTY_LIST}

    Log To Console      Products list length: ${products_length}
    Log To Console      Colors list length: ${colors_length}
    Log To Console      Empty list length: ${empty_length}

    # Show entire lists
    Log To Console      \n=== COMPLETE LISTS ===
    Log To Console      All products: ${PRODUCTS_ONE_LINE}
    Log To Console      All colors: ${COLORS}
    Log To Console      All numbers: ${NUMBERS}
    Log To Console      Mixed data types: ${MIXED_DATA_TYPES}

    # Verify list types
    ${products_type}=       Evaluate    type($PRODUCTS_ONE_LINE).__name__
    ${numbers_type}=        Evaluate    type($NUMBERS).__name__
    Log To Console      Products variable type: ${products_type}
    Log To Console      Numbers variable type: ${numbers_type}

Demonstrate List Slicing
    [Documentation]    Show how to extract sublists using slicing syntax.
    ...
    ...                Slicing syntax: [start:end] where start is inclusive, end is exclusive.

    Log To Console      \n=== LIST SLICING ===

    # Basic slicing
    ${first_three}=         Set Variable    ${PRODUCTS_ONE_LINE}[0:3]
    ${last_two}=            Set Variable    ${PRODUCTS_ONE_LINE}[3:5]
    ${middle_items}=        Set Variable    ${PRODUCTS_ONE_LINE}[1:4]

    Log To Console      First three products: ${first_three}
    Log To Console      Last two products: ${last_two}
    Log To Console      Middle items (1-3): ${middle_items}

    # Slicing with negative indices
    ${all_but_first}=       Set Variable    ${COLORS}[1:]
    ${all_but_last}=        Set Variable    ${COLORS}[:-1]
    ${last_three}=          Set Variable    ${COLORS}[-3:]

    Log To Console      All colors except first: ${all_but_first}
    Log To Console      All colors except last: ${all_but_last}
    Log To Console      Last three colors: ${last_three}

Demonstrate List Expansion in Keywords
    [Documentation]    Show the difference between passing entire lists vs expanding list elements.
    ...
    ...                @{list} expands all elements as separate arguments
    ...                ${list} passes the entire list as one argument

    Log To Console      \n=== LIST EXPANSION VS LIST REFERENCE ===

    # Pass entire list as one argument
    Log To Console      Entire list as one argument: ${COLORS}

    # Expand list elements as separate arguments
    Log Many            @{COLORS}
    Log To Console      List expanded as separate arguments (see above Log Many output)

    # Demonstrate in custom keywords
    Process List As Whole    ${PRODUCTS_ONE_LINE}
    Process List Elements    @{PRODUCTS_ONE_LINE}

Demonstrate FOR Loops with Lists
    [Documentation]    Show how to iterate through lists using FOR loops.
    ...
    ...                FOR loops are the primary way to process each element in a list.

    Log To Console      \n=== FOR LOOPS WITH LISTS ===

    # Simple FOR loop through list elements
    FOR    ${product}    IN    @{PRODUCTS_ONE_LINE}
        Log To Console      Processing product: ${product}
    END

    # FOR loop with index and element
    FOR    ${index}    ${color}    IN ENUMERATE    @{COLORS}
        Log To Console      Color ${index + 1}: ${color}
    END

    # FOR loop with multiple lists (zip)
    FOR    ${product}    ${color}    IN ZIP    ${PRODUCTS_ONE_LINE}    ${COLORS}
        Log To Console      ${product} in ${color}
    END

Demonstrate Dynamic List Creation and Manipulation
    [Documentation]    Show how to create and modify lists during test execution.
    ...
    ...                Lists can be created dynamically and modified using various keywords.

    Log To Console      \n=== DYNAMIC LIST OPERATIONS ===

    # Create empty list and add items
    ${dynamic_list}=        Create List
    Append To List         ${dynamic_list}    First Item
    Append To List         ${dynamic_list}    Second Item
    Append To List         ${dynamic_list}    Third Item
    Log To Console          Created list: ${dynamic_list}

    # Create list with initial items
    ${tools_list}=          Create List    Hammer    Screwdriver    Wrench
    Log To Console          Tools list: ${tools_list}

    # Insert item at specific position
    Insert Into List        ${tools_list}    1    Pliers
    Log To Console          After insert: ${tools_list}

    # Remove items
    Remove From List        ${tools_list}    0
    Log To Console          After remove: ${tools_list}

    # Combine lists
    ${combined}=            Combine Lists    ${tools_list}    ${COLORS}
    Log To Console          Combined list: ${combined}

    # Copy and modify
    ${copied_list}=         Copy List    ${PRODUCTS_ONE_LINE}
    Set List Value          ${copied_list}    0    Modified Item
    Log To Console          Original list: ${PRODUCTS_ONE_LINE}
    Log To Console          Modified copy: ${copied_list}

Browser Integration Example With List Items
    [Documentation]    Practical example of using list variables in web automation.
    ...
    ...                This demonstrates real-world usage of lists in test automation scenarios.

    Log To Console      \n=== BROWSER INTEGRATION WITH LISTS ===

    # Test searching for each product in the list
    FOR    ${product}    IN    @{PRODUCTS_ONE_LINE}
        Log To Console      Testing search for: ${product}

        # Navigate to search
        Fill Text           data-test=search-query    ${product}
        Click               data-test=search-submit

        # Verify search term is displayed
        Get Text            data-test=search-term     contains    ${product}

        # Clear search for next iteration
        Fill Text           data-test=search-query    ${EMPTY}

        # Add small delay for demo visibility
        Sleep               1s
    END

    # Demonstrate using list element in form
    ${selected_product}=    Set Variable    ${PRODUCTS_ONE_LINE}[2]
    Log To Console          Using selected product: ${selected_product}

    Fill Text               data-test=search-query    ${selected_product}
    Click                   data-test=search-submit
    Get Text                data-test=search-term     contains    ${selected_product}

List Comparison and Validation
    [Documentation]    Show how to compare and validate lists.

    Log To Console      \n=== LIST VALIDATION ===

    # Check if lists are equal
    ${are_equal}=           Evaluate    $PRODUCTS_ONE_LINE == $PRODUCTS_MULTI_LINE
    Log To Console          One-line and multi-line lists are equal: ${are_equal}

    # Check if item exists in list
    ${contains_hammer}=     Evaluate    'Hammer' in $PRODUCTS_ONE_LINE
    ${contains_drill}=      Evaluate    'Drill' in $PRODUCTS_ONE_LINE
    Log To Console          List contains 'Hammer': ${contains_hammer}
    Log To Console          List contains 'Drill': ${contains_drill}

    # Find index of item
    ${hammer_index}=        Evaluate    $PRODUCTS_ONE_LINE.index('Hammer')
    Log To Console          Index of 'Hammer': ${hammer_index}

    # Use Collections library for advanced validation
    List Should Contain Value    ${PRODUCTS_ONE_LINE}    Hammer
    List Should Not Contain Value    ${PRODUCTS_ONE_LINE}    Drill
    Lists Should Be Equal    ${PRODUCTS_ONE_LINE}    ${PRODUCTS_MULTI_LINE}


*** Keywords ***
Open Browser And Set Context
    [Documentation]    Initialize browser context for testing.

    New Browser    headless=${False}    slowMo=1s
    New Context
    New Page    https://practicesoftwaretesting.com

Process List As Whole
    [Arguments]    ${product_list}
    [Documentation]    Demonstrate receiving entire list as one argument.

    ${list_type}=           Evaluate    type($product_list).__name__
    ${list_length}=         Get Length    ${product_list}
    Log To Console          Received list type: ${list_type}
    Log To Console          Received list length: ${list_length}
    Log To Console          Received list: ${product_list}

Process List Elements
    [Arguments]    @{product_elements}
    [Documentation]    Demonstrate receiving list elements as separate arguments.

    ${elements_count}=      Get Length    ${product_elements}
    Log To Console          Received ${elements_count} separate arguments:
    FOR    ${index}    ${element}    IN ENUMERATE    @{product_elements}
        Log To Console          Argument ${index + 1}: ${element}
    END
