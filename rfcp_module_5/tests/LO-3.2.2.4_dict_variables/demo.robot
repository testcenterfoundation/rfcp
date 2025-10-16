# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-24.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Settings ***
Documentation       LO-3.2.2.4    K2    Understand how to set and access data in dict variables
...
...                 This demo covers all aspects of dictionary variables in Robot Framework:
...                 - Defining dictionaries using &{} syntax (single-line and multi-line)
...                 - Accessing dictionary values using bracket and dot notation
...                 - Using dictionaries in FOR loops and as keyword arguments
...                 - Dynamic key access and dictionary manipulation
...                 - Dictionary expansion and structured data handling

Library             Browser
Library             Collections

Test Setup          Open Browser And Set Context


*** Variables ***
# === SINGLE-LINE DICTIONARY DEFINITIONS ===
# All key-value pairs defined on one line - good for simple dictionaries
&{CUSTOMER1}        email=customer@practicesoftwaretesting.com    password=welcome01    first_name=Jane    last_name=Doe    age=${28}    active=${True}

&{SIMPLE_CONFIG}    host=localhost    port=${8080}    ssl=${False}    timeout=${30}
&{COLORS_RGB}       red=${255}        green=${128}    blue=${64}      alpha=${1.0}

# === MULTI-LINE DICTIONARY DEFINITIONS ===
# Key-value pairs spread across multiple lines using line continuation (...) - better for complex dictionaries
&{CUSTOMER2}        email=customer2@practicesoftwaretesting.com
...                 password=welcome01
...                 first_name=Jack
...                 last_name=Howe
...                 age=${35}
...                 active=${True}
...                 phone=555-0123
...                 address=123 Main St

&{ADMIN}            email=admin@practicesoftwaretesting.com
...                 password=welcome01
...                 first_name=John
...                 last_name=Doe
...                 role=administrator
...                 permissions=all
...                 last_login=2024-01-15

&{DATABASE_CONFIG}  host=db.example.com
...                 port=${5432}
...                 database=testdb
...                 username=testuser
...                 password=secret123
...                 pool_size=${10}
...                 ssl_mode=require

# === NESTED AND COMPLEX DICTIONARIES ===
&{PRODUCT_INFO}     name=Professional Hammer
...                 category=Hand Tools
...                 price=${29.99}
...                 in_stock=${True}
...                 rating=${4.5}
...                 reviews=${127}
...                 manufacturer=ToolCorp
...                 weight=1.2 lbs

# === EMPTY DICTIONARY ===
&{EMPTY_DICT}

# === DICTIONARIES WITH SPECIAL VALUES ===
&{SPECIAL_VALUES}   none_value=${None}
...                 empty_string=${EMPTY}
...                 boolean_true=${True}
...                 boolean_false=${False}
...                 zero_number=${0}
...                 negative_number=${-42}


*** Test Cases ***
Demonstrate Basic Dictionary Access
    [Documentation]    Show how to access dictionary values using different notation styles.
    ...
    ...                Robot Framework supports both bracket notation [key] and dot notation .key
    ...                for accessing dictionary values.

    Log To Console      \n=== BASIC DICTIONARY ACCESS ===

    # Bracket notation access (recommended for dynamic keys)
    Log To Console      Customer 1 email (bracket): ${CUSTOMER1}[email]
    Log To Console      Customer 1 first name (bracket): ${CUSTOMER1}[first_name]
    Log To Console      Customer 1 last name (bracket): ${CUSTOMER1}[last_name]
    Log To Console      Customer 1 age (bracket): ${CUSTOMER1}[age]

    # Dot notation access (convenient for static keys)
    Log To Console      \n=== DOT NOTATION ACCESS ===
    Log To Console      Customer 1 email (dot): ${CUSTOMER1.email}
    Log To Console      Customer 1 first name (dot): ${CUSTOMER1.first_name}
    Log To Console      Customer 1 last name (dot): ${CUSTOMER1.last_name}
    Log To Console      Customer 1 age (dot): ${CUSTOMER1.age}

    # Combining values in expressions
    ${full_name}=       Set Variable    ${CUSTOMER1.first_name} ${CUSTOMER1.last_name}
    ${age_message}=     Set Variable    ${CUSTOMER1.first_name} is ${CUSTOMER1.age} years old
    Log To Console      \n=== COMBINED VALUES ===
    Log To Console      Full name: ${full_name}
    Log To Console      Age message: ${age_message}

Demonstrate Dynamic Key Access
    [Documentation]    Show how to access dictionary values using variables as keys.
    ...
    ...                This is useful when the key name is determined at runtime.

    Log To Console      \n=== DYNAMIC KEY ACCESS ===

    # Use variables as keys
    ${email_key}=       Set Variable    email
    ${name_key}=        Set Variable    first_name
    ${age_key}=         Set Variable    age

    Log To Console      Admin email (dynamic): ${ADMIN}[${email_key}]
    Log To Console      Admin name (dynamic): ${ADMIN}[${name_key}]
    Log To Console      Admin age (dynamic): ${ADMIN}[${age_key}]

    # Dynamic key selection based on conditions
    ${user_type}=       Set Variable    admin
    IF    '${user_type}' == 'admin'
        ${selected_user}=    Set Variable    ${ADMIN}
    ELSE
        ${selected_user}=    Set Variable    ${CUSTOMER1}
    END

    Log To Console      Selected user email: ${selected_user}[email]
    Log To Console      Selected user role: ${selected_user.get('role', 'user')}

Demonstrate Dictionary Properties and Information
    [Documentation]    Show how to get information about dictionaries (keys, values, length, etc.).

    Log To Console      \n=== DICTIONARY INFORMATION ===

    # Get dictionary lengths
    ${customer1_length}=    Get Length    ${CUSTOMER1}
    ${config_length}=       Get Length    ${SIMPLE_CONFIG}
    ${empty_length}=        Get Length    ${EMPTY_DICT}

    Log To Console      Customer1 dictionary size: ${customer1_length}
    Log To Console      Config dictionary size: ${config_length}
    Log To Console      Empty dictionary size: ${empty_length}

    # Show entire dictionaries
    Log To Console      \n=== COMPLETE DICTIONARIES ===
    Log To Console      Customer1: ${CUSTOMER1}
    Log To Console      Simple config: ${SIMPLE_CONFIG}
    Log To Console      Product info: ${PRODUCT_INFO}

    # Get dictionary keys and values
    ${customer_keys}=       Get Dictionary Keys      ${CUSTOMER1}
    ${customer_values}=     Get Dictionary Values    ${CUSTOMER1}
    Log To Console      \n=== KEYS AND VALUES ===
    Log To Console      Customer1 keys: ${customer_keys}
    Log To Console      Customer1 values: ${customer_values}

Demonstrate Dictionary Expansion in Keywords
    [Documentation]    Show the difference between passing entire dictionaries vs expanding key-value pairs.
    ...
    ...                &{dict} expands all key-value pairs as named arguments
    ...                ${dict} passes the entire dictionary as one argument

    Log To Console      \n=== DICTIONARY EXPANSION VS REFERENCE ===

    # Pass entire dictionary as one argument
    Log To Console      Entire dictionary as one argument: ${CUSTOMER1}

    # Demonstrate in custom keywords
    Process Dictionary As Whole     ${CUSTOMER1}
    Process Dictionary Expanded     &{CUSTOMER1}

    # Show how expansion works with keyword arguments
    Create User Account            &{CUSTOMER2}

Demonstrate FOR Loops with Dictionaries
    [Documentation]    Show how to iterate through dictionaries using FOR loops.
    ...
    ...                FOR loops can iterate over keys, values, or key-value pairs.

    Log To Console      \n=== FOR LOOPS WITH DICTIONARIES ===

    # Iterate over dictionary keys
    Log To Console      \n--- Iterating over keys ---
    FOR    ${key}    IN    @{CUSTOMER1}
        ${value}=       Get From Dictionary    ${CUSTOMER1}    ${key}
        Log To Console      Key: ${key}, Value: ${value}
    END

    # Iterate over key-value pairs using dictionary items
    Log To Console      \n--- Iterating over key-value pairs ---
    FOR    ${key}    ${value}    IN    &{PRODUCT_INFO}
        Log To Console      Product ${key}: ${value}
    END

    # Iterate with filtering
    Log To Console      \n--- Filtered iteration ---
    FOR    ${key}    ${value}    IN    &{CUSTOMER2}
        IF    '${key}' not in ['password', 'email']
            Log To Console      Public info - ${key}: ${value}
        END
    END

Demonstrate Dynamic Dictionary Creation and Manipulation
    [Documentation]    Show how to create and modify dictionaries during test execution.
    ...
    ...                Dictionaries can be created dynamically and modified using various keywords.

    Log To Console      \n=== DYNAMIC DICTIONARY OPERATIONS ===

    # Create empty dictionary and add items
    ${dynamic_dict}=        Create Dictionary
    Set To Dictionary      ${dynamic_dict}    name=Dynamic User    age=${25}    city=New York
    Log To Console          Created dictionary: ${dynamic_dict}

    # Create dictionary with initial items
    ${user_prefs}=          Create Dictionary    theme=dark    language=en    notifications=${True}
    Log To Console          User preferences: ${user_prefs}

    # Update existing values
    Set To Dictionary      ${user_prefs}    theme=light    timeout=${300}
    Log To Console          Updated preferences: ${user_prefs}

    # Remove items
    Remove From Dictionary ${user_prefs}    notifications
    Log To Console          After removal: ${user_prefs}

    # Combine dictionaries
    ${combined}=            Create Dictionary    &{SIMPLE_CONFIG}    &{user_prefs}
    Log To Console          Combined dictionary: ${combined}

    # Copy and modify
    ${copied_dict}=         Copy Dictionary    ${CUSTOMER1}
    Set To Dictionary      ${copied_dict}      modified=${True}    copy_date=${CURTIME}
    Log To Console          Original: ${CUSTOMER1}
    Log To Console          Modified copy: ${copied_dict}

Browser Integration Example With Dictionary Data
    [Documentation]    Practical example of using dictionary variables in web automation.
    ...
    ...                This demonstrates real-world usage of dictionaries in test automation scenarios.

    Log To Console      \n=== BROWSER INTEGRATION WITH DICTIONARIES ===

    # Test login with different user dictionaries
    FOR    ${user_type}    ${user_data}    IN
    ...    Customer1      ${CUSTOMER1}
    ...    Customer2      ${CUSTOMER2}
    ...    Admin          ${ADMIN}
        Log To Console      Testing login for: ${user_type}

        # Navigate to login page
        Click               data-test=nav-sign-in

        # Use dictionary values in form fields
        Fill Text           data-test=email       ${user_data}[email]
        Fill Text           data-test=password    ${user_data}[password]
        Click               data-test=login-submit

        # Verify login based on user type
        IF    '${user_type}' == 'Admin'
            Get Text        data-test=page-title    contains    Sales
        ELSE
            Get Text        data-test=page-title    contains    My account
        END

        # Logout for next iteration
        TRY
            Click           data-test=nav-user-menu
            Click           data-test=nav-sign-out
        EXCEPT
            Log To Console  Logout not available, continuing...
        END

        Sleep               1s    # Demo visibility delay
    END

Dictionary Validation and Comparison
    [Documentation]    Show how to compare and validate dictionaries.

    Log To Console      \n=== DICTIONARY VALIDATION ===

    # Check if dictionaries contain specific keys
    ${has_email}=           Evaluate    'email' in $CUSTOMER1
    ${has_role}=            Evaluate    'role' in $CUSTOMER1
    Log To Console          Customer1 has email: ${has_email}
    Log To Console          Customer1 has role: ${has_role}

    # Compare dictionary values
    ${same_password}=       Evaluate    $CUSTOMER1['password'] == $CUSTOMER2['password']
    Log To Console          Customers have same password: ${same_password}

    # Use Collections library for advanced validation
    Dictionary Should Contain Key       ${CUSTOMER1}    email
    Dictionary Should Not Contain Key   ${CUSTOMER1}    role
    Dictionary Should Contain Value     ${CUSTOMER1}    Jane

    # Check dictionary subset/superset relationships
    ${minimal_user}=        Create Dictionary    email=${CUSTOMER1.email}    active=${CUSTOMER1.active}
    ${has_all_keys}=        Evaluate    all(key in $CUSTOMER1 for key in $minimal_user)
    Log To Console          Customer1 contains all minimal keys: ${has_all_keys}

Handle Special Dictionary Values
    [Documentation]    Demonstrate working with None, empty, and special values in dictionaries.

    Log To Console      \n=== SPECIAL VALUES HANDLING ===

    # Access special values
    Log To Console      None value: ${SPECIAL_VALUES.none_value}
    Log To Console      Empty string: "${SPECIAL_VALUES.empty_string}"
    Log To Console      Boolean true: ${SPECIAL_VALUES.boolean_true}
    Log To Console      Boolean false: ${SPECIAL_VALUES.boolean_false}
    Log To Console      Zero: ${SPECIAL_VALUES.zero_number}

    # Handle missing keys safely
    ${missing_key}=         Get From Dictionary    ${CUSTOMER1}    missing_key    default=Not Found
    Log To Console          Missing key result: ${missing_key}

    # Conditional access based on key existence
    IF    'phone' in $CUSTOMER2
        Log To Console      Customer2 phone: ${CUSTOMER2.phone}
    ELSE
        Log To Console      Customer2 phone: Not provided
    END


*** Keywords ***
Open Browser And Set Context
    [Documentation]    Initialize browser context for testing.

    New Browser    headless=${False}    slowMo=1s
    New Context
    New Page    https://practicesoftwaretesting.com

Process Dictionary As Whole
    [Arguments]    ${user_dict}
    [Documentation]    Demonstrate receiving entire dictionary as one argument.

    ${dict_type}=           Evaluate    type($user_dict).__name__
    ${dict_size}=           Get Length    ${user_dict}
    ${dict_keys}=           Get Dictionary Keys    ${user_dict}

    Log To Console          Received dictionary type: ${dict_type}
    Log To Console          Received dictionary size: ${dict_size}
    Log To Console          Received dictionary keys: ${dict_keys}
    Log To Console          Received dictionary: ${user_dict}

Process Dictionary Expanded
    [Arguments]    &{user_data}
    [Documentation]    Demonstrate receiving dictionary as expanded named arguments.

    Log To Console          Received as named arguments:
    FOR    ${key}    ${value}    IN    &{user_data}
        Log To Console          ${key} = ${value}
    END

Create User Account
    [Arguments]    &{account_data}
    [Documentation]    Simulate user account creation using dictionary expansion.

    Log To Console          Creating account with data:
    Log To Console          Name: ${account_data.first_name} ${account_data.last_name}
    Log To Console          Email: ${account_data.email}
    Log To Console          Age: ${account_data.age}

    # Simulate account creation logic
    ${account_id}=          Evaluate    hash('${account_data.email}') % 10000
    Log To Console          Generated account ID: ${account_id}

    RETURN                  ${account_id}
