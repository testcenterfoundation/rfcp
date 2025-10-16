# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-24.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Settings ***
Documentation       LO-3.2-1    K2    Understand how variables in Robot Framework are used to store and manage data
...
...                 This demo showcases the fundamental concepts of variable usage in Robot Framework:
...                 - Variables from the *** Variables *** section (suite scope)
...                 - Dynamic variable assignment using Set Variable keyword
...                 - Using variables as keyword arguments
...                 - Capturing return values from keywords
...                 - Variable interpolation in strings

Library             Browser


*** Variables ***
# === SUITE-LEVEL VARIABLES ===
# These variables are available throughout the entire test suite
# They are defined at suite startup and maintain their values across all test cases

${BASE_URL}         https://practicesoftwaretesting.com    # Base URL for the application under test
${EMAIL}            customer@practicesoftwaretesting.com   # Default email for login scenarios
${PASSWORD}         welcome01                              # Default password for login scenarios
${BROWSER}          chromium                               # Browser type to use for testing
${TIMEOUT}          10s                                    # Default timeout for operations


*** Test Cases ***
Demonstrate Variable Usage In Robot Framework
    [Documentation]    This test case demonstrates different ways variables are created and used.
    ...
    ...                Learning objectives:
    ...                - Use suite-level variables from *** Variables *** section
    ...                - Create variables dynamically during test execution
    ...                - Pass variables as arguments to keywords
    ...                - Capture and use return values from keywords
    ...                - Understand variable scope and lifetime

    # === STEP 1: Using Suite-Level Variables ===
    # Variables defined in *** Variables *** section are immediately available
    # No special syntax needed beyond the ${variable} reference
    Log To Console      \nUsing suite-level variables:
    Log To Console      Browser: ${BROWSER}
    Log To Console      Base URL: ${BASE_URL}
    Log To Console      Email: ${EMAIL}

    # Initialize browser with suite-level variable
    New Browser         ${BROWSER}              headless=${False}
    New Context
    New Page            ${BASE_URL}

    # === STEP 2: Dynamic Variable Assignment ===
    # Variables can be created during test execution using assignment syntax
    # The '=' syntax assigns the return value of a keyword to a variable
    ${LOGIN_URL}=       Set Variable            ${BASE_URL}/auth/login
    ${USER_AGENT}=      Set Variable            Robot Framework Test Bot
    ${TIMESTAMP}=       Get Time                epoch

    Log To Console      \nDynamically created variables:
    Log To Console      Login URL: ${LOGIN_URL}
    Log To Console      User Agent: ${USER_AGENT}
    Log To Console      Timestamp: ${TIMESTAMP}

    # Navigate using the dynamically created variable
    Go To               ${LOGIN_URL}

    # === STEP 3: Variables as Keyword Arguments ===
    # Variables can be passed as arguments to any keyword
    # This makes tests more maintainable and reusable
    Fill Text           data-test=email         ${EMAIL}
    Fill Text           data-test=password      ${PASSWORD}
    Click               data-test=login-submit

    # === STEP 4: Capturing Return Values ===
    # Many keywords return values that can be captured into variables
    # This allows you to use the results in subsequent steps
    ${page_title}=      Get Text                data-test=page-title
    ${current_url}=     Get Url
    ${page_source}=     Get Page Source

    Log To Console      \nCaptured return values:
    Log To Console      Page title: ${page_title}
    Log To Console      Current URL: ${current_url}
    Log To Console      Page source length: ${page_source.__len__()}

    # === STEP 5: Variable Interpolation ===
    # Variables can be embedded within strings for dynamic messages
    ${success_message}= Set Variable            Login successful for user: ${EMAIL}
    Log                 ${success_message}

    # Variables can also be used in assertions
    Should Contain      ${page_title}           account     ignore_case=True
    Should Contain      ${current_url}          practicesoftwaretesting.com

Demonstrate Variable Scope and Lifetime
    [Documentation]    This test demonstrates variable scope concepts.
    ...
    ...                Variables created in one test case are not automatically
    ...                available in other test cases (test scope isolation).

    # This test case cannot access the ${LOGIN_URL} variable from the previous test
    # because it was created with test case scope, not suite scope

    Log To Console      \nTesting variable scope:
    Log To Console      Suite variable BASE_URL is available: ${BASE_URL}

    # Create a new test-scoped variable
    ${TEST_SPECIFIC_VAR}=    Set Variable    Only available in this test
    Log To Console      Test-scoped variable: ${TEST_SPECIFIC_VAR}

    # Demonstrate that suite variables can be modified at test level
    ${MODIFIED_URL}=    Set Variable    ${BASE_URL}/modified
    Log To Console      Modified URL (test scope): ${MODIFIED_URL}

    # The original suite variable remains unchanged
    Log To Console      Original suite URL unchanged: ${BASE_URL}
