# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-24.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Settings ***
Documentation       LO-3.2.4    K2    Understand how to create variables using the VAR statement
...
...                 This demo showcases the modern VAR statement in Robot Framework:
...                 - Creating variables dynamically during test execution
...                 - Different variable types (scalar, list, dictionary) with VAR
...                 - Conditional variable creation and scope control
...                 - Comparison between VAR statement and traditional assignment
...                 - Advanced VAR usage patterns and best practices

Library             Browser
Library             DateTime

Suite Setup         Initialize Browser Session
Suite Teardown      Close Browser


*** Test Cases ***
Demonstrate Basic VAR Statement Usage
    [Documentation]    Show fundamental VAR statement syntax for different variable types.
    ...
    ...                The VAR statement provides explicit variable creation with clear syntax
    ...                and scope control capabilities.

    Log To Console      \n=== BASIC VAR STATEMENT USAGE ===

    # Create scalar variables with VAR
    VAR    ${page_title}       Example Domain
    VAR    ${current_year}     ${2024}
    VAR    ${is_demo}          ${True}
    VAR    ${empty_value}      ${EMPTY}

    Log To Console      Page title: ${page_title}
    Log To Console      Current year: ${current_year}
    Log To Console      Is demo: ${is_demo}
    Log To Console      Empty value: "${empty_value}"

    # Create list variables with VAR
    VAR    @{browsers}         chromium    firefox    webkit
    VAR    @{test_data}        ${1}        ${2}       ${3}        ${4}
    VAR    @{empty_list}

    Log To Console      \n=== LIST VARIABLES WITH VAR ===
    Log To Console      Browsers: ${browsers}
    Log To Console      Test data: ${test_data}
    Log To Console      Empty list length: ${empty_list.__len__()}

    # Create dictionary variables with VAR
    VAR    &{config}           host=localhost    port=${8080}    ssl=${False}
    VAR    &{user_prefs}       theme=dark        language=en     notifications=${True}
    VAR    &{empty_dict}

    Log To Console      \n=== DICTIONARY VARIABLES WITH VAR ===
    Log To Console      Config: ${config}
    Log To Console      User preferences: ${user_prefs}
    Log To Console      Empty dict size: ${empty_dict.__len__()}

Demonstrate VAR vs Assignment Operator
    [Documentation]    Show the difference between VAR statement and assignment operator.
    ...
    ...                Understanding when to use each approach is crucial for clean,
    ...                maintainable test code.

    Log To Console      \n=== VAR vs ASSIGNMENT COMPARISON ===

    # Traditional assignment (captures return value)
    ${traditional_title}=       Get Page Title
    ${current_time}=            Get Current Date
    ${calculated_value}=        Evaluate    10 * 5

    Log To Console      Traditional assignment results:
    Log To Console      Title: ${traditional_title}
    Log To Console      Time: ${current_time}
    Log To Console      Calculated: ${calculated_value}

    # VAR statement (explicit value assignment)
    VAR    ${explicit_title}    Example Domain Page
    VAR    ${demo_time}         2024-01-15 10:30:00
    VAR    ${fixed_value}       ${50}

    Log To Console      \nVAR statement results:
    Log To Console      Title: ${explicit_title}
    Log To Console      Time: ${demo_time}
    Log To Console      Fixed: ${fixed_value}

    # Combined approach - capture return value then create related variables
    ${page_content}=            Get Page Content
    VAR    ${content_length}    ${page_content.__len__()}
    VAR    ${content_type}      HTML
    VAR    ${is_valid}          ${content_length > 0}

    Log To Console      \nCombined approach:
    Log To Console      Content length: ${content_length}
    Log To Console      Content type: ${content_type}
    Log To Console      Is valid: ${is_valid}

Demonstrate Conditional VAR Creation
    [Documentation]    Show how VAR works in conditional contexts.
    ...
    ...                VAR statements are particularly useful in IF/ELSE blocks
    ...                for creating variables based on conditions.

    Log To Console      \n=== CONDITIONAL VAR CREATION ===

    # Simple conditional variable creation
    ${user_role}=               Set Variable    admin
    IF    '${user_role}' == 'admin'
        VAR    &{credentials}    username=admin    password=admin123    role=administrator
        VAR    ${access_level}   full
        VAR    @{permissions}    read    write    delete    admin
    ELSE IF    '${user_role}' == 'user'
        VAR    &{credentials}    username=user     password=user123     role=standard
        VAR    ${access_level}   limited
        VAR    @{permissions}    read    write
    ELSE
        VAR    &{credentials}    username=guest    password=${EMPTY}    role=guest
        VAR    ${access_level}   readonly
        VAR    @{permissions}    read
    END

    Log To Console      Credentials: ${credentials}
    Log To Console      Access level: ${access_level}
    Log To Console      Permissions: ${permissions}

    # Environment-based variable creation
    ${environment}=             Set Variable    development
    IF    '${environment}' == 'production'
        VAR    &{db_config}     host=prod-db.example.com    port=${5432}    pool_size=${20}
        VAR    ${debug_mode}    ${False}
        VAR    ${log_level}     ERROR
    ELSE IF    '${environment}' == 'staging'
        VAR    &{db_config}     host=staging-db.example.com    port=${5432}    pool_size=${10}
        VAR    ${debug_mode}    ${False}
        VAR    ${log_level}     WARN
    ELSE
        VAR    &{db_config}     host=localhost    port=${5432}    pool_size=${5}
        VAR    ${debug_mode}    ${True}
        VAR    ${log_level}     DEBUG
    END

    Log To Console      \nEnvironment configuration:
    Log To Console      Database: ${db_config}
    Log To Console      Debug mode: ${debug_mode}
    Log To Console      Log level: ${log_level}

Demonstrate VAR in Loops
    [Documentation]    Show how VAR can be used within loops for dynamic variable creation.
    ...
    ...                This is useful for building collections or creating variables
    ...                based on iteration data.

    Log To Console      \n=== VAR IN LOOPS ===

    # Build configuration dynamically in a loop
    VAR    &{server_config}

    @{config_items}=            Create List
    ...    host=web-server-1.example.com
    ...    port=8080
    ...    ssl=true
    ...    timeout=30
    ...    retries=3

    FOR    ${config_item}    IN    @{config_items}
        ${key}    ${value}=     Split String    ${config_item}    =    1
        # Note: VAR creates new variables, so we build the config step by step
        Set To Dictionary       ${server_config}    ${key}=${value}
    END

    Log To Console      Built server config: ${server_config}

    # Create numbered variables in a loop
    FOR    ${index}    IN RANGE    1    4
        VAR    ${current_item}    Item number ${index}
        VAR    ${item_id}        ID-${index:03d}
        VAR    ${is_active}      ${index % 2 == 1}

        Log To Console      ${current_item}: ${item_id} (active: ${is_active})
    END

    # Build a list of test data using VAR
    VAR    @{test_scenarios}

    @{base_data}=               Create List    login    logout    search    checkout
    FOR    ${scenario}    IN    @{base_data}
        ${test_name}=           Set Variable    Test_${scenario}_functionality
        ${priority}=            Evaluate    random.choice(['high', 'medium', 'low'])

        # Append to list (VAR creates new list each time, so we use traditional approach here)
        Append To List          ${test_scenarios}    ${test_name}
    END

    Log To Console      Generated test scenarios: ${test_scenarios}

Demonstrate VAR Scope Control
    [Documentation]    Show how VAR can control variable scope.
    ...
    ...                VAR allows explicit scope specification which is useful
    ...                for controlling variable lifetime and accessibility.

    Log To Console      \n=== VAR SCOPE CONTROL ===

    # Create variables with different scopes
    VAR    ${local_var}         Local value
    VAR    ${test_var}          Test value        scope=TEST
    VAR    ${suite_var}         Suite value       scope=SUITE

    Log To Console      Local variable: ${local_var}
    Log To Console      Test variable: ${test_var}
    Log To Console      Suite variable: ${suite_var}

    # Demonstrate in a keyword
    Create Variables With Different Scopes

    # Verify suite variable is still accessible
    Log To Console      Suite variable from main test: ${suite_var}

Demonstrate Multiline VAR Statements
    [Documentation]    Show how to create complex variables with VAR across multiple lines.
    ...
    ...                This is particularly useful for lists and dictionaries.

    Log To Console      \n=== MULTILINE VAR STATEMENTS ===

    # Multiline list creation
    VAR    @{website_urls}
    ...    https://example.com
    ...    https://robotframework.org
    ...    https://github.com/robotframework
    ...    https://docs.python.org
    ...    https://selenium.dev

    Log To Console      Website URLs: ${website_urls}

    # Multiline dictionary creation
    VAR    &{application_config}
    ...    app_name=Test Application
    ...    version=${1.2.3}
    ...    debug=${True}
    ...    max_connections=${100}
    ...    timeout=${30}
    ...    retry_attempts=${3}
    ...    log_level=INFO

    Log To Console      Application config: ${application_config}

    # Complex nested structure simulation
    VAR    ${json_like_data}    {
    ...    "users": [
    ...        {"name": "John", "age": 30},
    ...        {"name": "Jane", "age": 25}
    ...    ],
    ...    "settings": {
    ...        "theme": "dark",
    ...        "notifications": true
    ...    }
    ...    }

    Log To Console      JSON-like data: ${json_like_data}

    # FOR loop to process the URLs
    FOR    ${url}    IN    @{website_urls}
        VAR    ${url_status}    active
        VAR    ${check_time}    ${CURTIME}
        Log To Console      Checking ${url} - Status: ${url_status} at ${check_time}
    END

Browser Integration with VAR
    [Documentation]    Practical example of using VAR in browser automation scenarios.

    Log To Console      \n=== BROWSER INTEGRATION WITH VAR ===

    New Context
    New Page            https://example.com

    # Get page information and create related variables
    ${actual_title}=            Get Title
    VAR    ${expected_title}    Example Domain
    VAR    ${title_matches}     ${actual_title == expected_title}
    VAR    ${test_result}       ${'PASS' if $title_matches else 'FAIL'}

    Log To Console      Expected: ${expected_title}
    Log To Console      Actual: ${actual_title}
    Log To Console      Matches: ${title_matches}
    Log To Console      Result: ${test_result}

    # Create test data based on page state
    ${page_text}=               Get Text            body
    VAR    ${word_count}        ${page_text.split().__len__()}
    VAR    ${char_count}        ${page_text.__len__()}
    VAR    ${is_long_page}      ${char_count > 100}

    VAR    &{page_metrics}
    ...    title=${actual_title}
    ...    word_count=${word_count}
    ...    char_count=${char_count}
    ...    is_long=${is_long_page}
    ...    timestamp=${CURTIME}

    Log To Console      Page metrics: ${page_metrics}

    # Conditional navigation based on VAR-created variables
    IF    ${is_long_page}
        VAR    ${scroll_action}    scroll_to_bottom
        VAR    ${read_time}        ${word_count / 200}  # Assume 200 words per minute
    ELSE
        VAR    ${scroll_action}    no_scroll_needed
        VAR    ${read_time}        ${5}  # Minimum 5 seconds
    END

    Log To Console      Recommended action: ${scroll_action}
    Log To Console      Estimated read time: ${read_time} seconds


*** Keywords ***
Initialize Browser Session
    [Documentation]    Set up browser for the demo.

    New Browser    chromium    headless=${False}

Get Page Title
    [Documentation]    Get the current page title.

    ${title}=           Get Text    h1
    RETURN              ${title}

Get Page Content
    [Documentation]    Get the page content for analysis.

    ${content}=         Get Text    body
    RETURN              ${content}

Create Variables With Different Scopes
    [Documentation]    Demonstrate VAR scope in a keyword context.

    Log To Console      \n--- Inside keyword ---

    # Local scope (default) - only available within this keyword
    VAR    ${keyword_local}     Keyword local value

    # Test scope - available in the calling test
    VAR    ${keyword_test}      Keyword test value    scope=TEST

    # Suite scope - available throughout the suite
    VAR    ${keyword_suite}     Keyword suite value   scope=SUITE

    Log To Console      Keyword local: ${keyword_local}
    Log To Console      Keyword test: ${keyword_test}
    Log To Console      Keyword suite: ${keyword_suite}
