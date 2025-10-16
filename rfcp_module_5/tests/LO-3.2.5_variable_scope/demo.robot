# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-24.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Settings ***
Documentation       LO-3.2.5    K2    Understand how local and suite scope variables are created
...
...                 This demo explores variable scope concepts in Robot Framework:
...                 - Suite scope variables (Variables section)
...                 - Test scope variables (created within test cases)
...                 - Local scope variables (created within keywords)
...                 - Scope isolation and accessibility rules
...                 - Scope promotion using Set Variable keywords

Library             Browser

Test Setup          Open Browser And Set Context


*** Variables ***
# === SUITE SCOPE VARIABLES ===
# These variables are defined in the *** Variables *** section
# They are available to ALL test cases in this suite
# Suite scope has the longest lifetime - from suite start to suite end

${SUITE_SCOPE_URL}      https://practicesoftwaretesting.com
${SUITE_CONFIG}         Production Configuration
${SUITE_TIMEOUT}        ${30}
${SUITE_BROWSER}        chromium
${SUITE_COUNTER}        ${0}


*** Test Cases ***
Demonstrate Suite Scope Variables
    [Documentation]    Show how suite scope variables work and are accessible everywhere.
    ...
    ...                Suite scope variables are defined in the Variables section
    ...                and are accessible from all test cases and keywords.

    Log To Console      \n=== SUITE SCOPE DEMONSTRATION ===

    # Access suite scope variables
    Log To Console      Suite URL: ${SUITE_SCOPE_URL}
    Log To Console      Suite config: ${SUITE_CONFIG}
    Log To Console      Suite timeout: ${SUITE_TIMEOUT}
    Log To Console      Suite browser: ${SUITE_BROWSER}

    # Use suite variable in browser operations
    New Page            ${SUITE_SCOPE_URL}
    ${title}=           Get Title
    Log To Console      Page title: ${title}
    Should Contain      ${title}    Practice Software Testing

    # Demonstrate suite variable accessibility in keywords
    Access Suite Variables From Keyword

    # Increment suite counter to show it persists
    ${new_counter}=     Evaluate    ${SUITE_COUNTER} + 1
    Set Suite Variable  ${SUITE_COUNTER}    ${new_counter}
    Log To Console      Updated suite counter: ${SUITE_COUNTER}

Demonstrate Test Scope Variables
    [Documentation]    Show how test scope variables work and their limitations.
    ...
    ...                Test scope variables are created within test cases and
    ...                are only accessible within that specific test case.

    Log To Console      \n=== TEST SCOPE DEMONSTRATION ===

    # Create test scope variables
    ${test_url}=        Set Variable    https://v4.practicesoftwaretesting.com
    ${test_data}=       Set Variable    Test specific data
    ${test_counter}=    Set Variable    ${1}

    Log To Console      Test URL: ${test_url}
    Log To Console      Test data: ${test_data}
    Log To Console      Test counter: ${test_counter}

    # Use test scope variable in browser operations
    New Page            ${test_url}
    ${title}=           Get Title
    Log To Console      V4 page title: ${title}
    Should Contain      ${title}    Practice Software Testing

    # Test scope variables are accessible in keywords called from this test
    Access Test Variables From Keyword    ${test_data}    ${test_counter}

    # Verify suite variables are still accessible
    Log To Console      Suite counter from test: ${SUITE_COUNTER}

    # Note: ${test_url}, ${test_data}, ${test_counter} will NOT be accessible
    # in other test cases - they have test scope only

Demonstrate Test Scope Isolation
    [Documentation]    Show that variables from other tests are not accessible.
    ...
    ...                This test demonstrates scope isolation between test cases.

    Log To Console      \n=== TEST SCOPE ISOLATION ===

    # Suite variables are still accessible
    Log To Console      Suite URL still accessible: ${SUITE_SCOPE_URL}
    Log To Console      Suite counter from previous test: ${SUITE_COUNTER}

    # Test variables from previous test are NOT accessible
    # Uncommenting the next line would cause a failure:
    # Log To Console      Previous test URL: ${test_url}  # Would fail!

    # Create new test-specific variables
    ${this_test_var}=   Set Variable    This test only
    ${another_var}=     Set Variable    Also this test only

    Log To Console      This test variable: ${this_test_var}
    Log To Console      Another test variable: ${another_var}

    # Demonstrate that these won't be accessible in the next test
    Store Test Variables For Scope Demo    ${this_test_var}    ${another_var}

Demonstrate Local Scope in Keywords
    [Documentation]    Show how local scope works within keywords.
    ...
    ...                Local scope variables are created within keywords and
    ...                are only accessible within that keyword.

    Log To Console      \n=== LOCAL SCOPE DEMONSTRATION ===

    # Call a keyword that creates local variables
    Create Local Variables

    # Call another keyword to show local variables are not accessible
    Try To Access Local Variables

    # Demonstrate scope promotion
    ${promoted_var}=    Create And Return Local Variable
    Log To Console      Returned (promoted) variable: ${promoted_var}

    # Show how parameters create local scope
    Pass Variables To Keyword    Data 1    Data 2    Data 3

Demonstrate Scope Promotion
    [Documentation]    Show how to promote variables to higher scopes.
    ...
    ...                Variables can be promoted from local to test or suite scope
    ...                using Set Test Variable and Set Suite Variable keywords.

    Log To Console      \n=== SCOPE PROMOTION DEMONSTRATION ===

    # Create a local variable and promote it
    ${local_value}=     Set Variable    Originally local
    Log To Console      Local variable: ${local_value}

    # Promote to test scope
    Set Test Variable   ${promoted_to_test}    ${local_value}
    Log To Console      Promoted to test scope: ${promoted_to_test}

    # Promote to suite scope
    Set Suite Variable  ${promoted_to_suite}   ${local_value}
    Log To Console      Promoted to suite scope: ${promoted_to_suite}

    # Demonstrate promotion in keywords
    Promote Variables From Keyword

    # Verify promoted variables are accessible
    Log To Console      Test variable from keyword: ${keyword_to_test}
    Log To Console      Suite variable from keyword: ${keyword_to_suite}

Demonstrate Complex Scope Scenarios
    [Documentation]    Show complex interactions between different scopes.
    ...
    ...                This test demonstrates real-world scope management scenarios.

    Log To Console      \n=== COMPLEX SCOPE SCENARIOS ===

    # Scenario 1: Counter that persists across test calls
    ${initial_count}=   Set Variable    ${SUITE_COUNTER}
    Process Data And Update Counter    Item 1
    Process Data And Update Counter    Item 2
    Process Data And Update Counter    Item 3

    ${final_count}=     Set Variable    ${SUITE_COUNTER}
    ${processed_items}= Evaluate        ${final_count} - ${initial_count}
    Log To Console      Processed ${processed_items} items

    # Scenario 2: Configuration override
    ${original_timeout}=    Set Variable    ${SUITE_TIMEOUT}
    Log To Console      Original timeout: ${original_timeout}

    # Temporarily override for this test
    ${test_timeout}=    Set Variable    ${60}
    Log To Console      Test-specific timeout: ${test_timeout}

    # Use test-specific value without affecting suite variable
    Wait For Condition With Timeout    ${test_timeout}

    # Verify suite variable unchanged
    Log To Console      Suite timeout still: ${SUITE_TIMEOUT}

Verify Scope Persistence Across Tests
    [Documentation]    Verify that promoted variables persist across test boundaries.
    ...
    ...                This test should run last to verify scope promotion effects.

    Log To Console      \n=== SCOPE PERSISTENCE VERIFICATION ===

    # Verify suite-promoted variables are still accessible
    TRY
        Log To Console      Suite variable from earlier test: ${promoted_to_suite}
        Log To Console      Keyword-promoted suite variable: ${keyword_to_suite}
    EXCEPT
        Log To Console      Some suite variables not accessible (expected if running individual test)
    END

    # Test-promoted variables should NOT be accessible here
    TRY
        Log To Console      This should not work: ${promoted_to_test}
    EXCEPT
        Log To Console      Test-scoped variables correctly not accessible (expected)
    END


*** Keywords ***
Open Browser And Set Context
    [Documentation]    Initialize browser context using suite scope variables.

    # Use suite scope variables in keyword
    New Browser    ${SUITE_BROWSER}    headless=${False}    slowMo=1s
    New Context

Access Suite Variables From Keyword
    [Documentation]    Show that suite variables are accessible from keywords.

    Log To Console      \n--- Accessing suite variables from keyword ---
    Log To Console      Suite URL from keyword: ${SUITE_SCOPE_URL}
    Log To Console      Suite config from keyword: ${SUITE_CONFIG}
    Log To Console      Suite timeout from keyword: ${SUITE_TIMEOUT}

Access Test Variables From Keyword
    [Arguments]    ${test_param1}    ${test_param2}
    [Documentation]    Show that test variables are accessible from keywords called by that test.

    Log To Console      \n--- Accessing test variables from keyword ---
    Log To Console      Test parameter 1: ${test_param1}
    Log To Console      Test parameter 2: ${test_param2}

    # Arguments create local scope within the keyword
    ${local_in_keyword}=    Set Variable    Local to this keyword
    Log To Console      Local in keyword: ${local_in_keyword}

Create Local Variables
    [Documentation]    Create variables with local scope that won't be accessible outside.

    ${local_only}=      Set Variable    I am local to this keyword
    ${another_local}=   Set Variable    Me too!
    ${calculation}=     Evaluate        10 * 5

    Log To Console      \n--- Inside Create Local Variables keyword ---
    Log To Console      Local variable 1: ${local_only}
    Log To Console      Local variable 2: ${another_local}
    Log To Console      Local calculation: ${calculation}

Try To Access Local Variables
    [Documentation]    Attempt to access local variables (will fail).

    Log To Console      \n--- Trying to access local variables ---
    Log To Console      This keyword cannot access variables from Create Local Variables

    # These would fail if uncommented:
    # Log To Console      ${local_only}     # VariableError!
    # Log To Console      ${another_local}  # VariableError!

Create And Return Local Variable
    [Documentation]    Create a local variable and return it (scope promotion).

    ${local_var}=       Set Variable    Created locally, returned globally
    Log To Console      Created local variable: ${local_var}

    # Return value promotes the variable to the calling scope
    RETURN              ${local_var}

Pass Variables To Keyword
    [Arguments]    ${param1}    ${param2}    ${param3}
    [Documentation]    Show how arguments create local scope.

    Log To Console      \n--- Parameters have local scope ---
    Log To Console      Parameter 1: ${param1}
    Log To Console      Parameter 2: ${param2}
    Log To Console      Parameter 3: ${param3}

    # Modify parameter (only affects local copy)
    ${param1}=          Set Variable    Modified locally
    Log To Console      Modified param1: ${param1}

Store Test Variables For Scope Demo
    [Arguments]    ${var1}    ${var2}
    [Documentation]    Store test variables to show they won't persist.

    Log To Console      \n--- Storing test variables ---
    Log To Console      Received var1: ${var1}
    Log To Console      Received var2: ${var2}
    Log To Console      These will not be accessible in other tests

Promote Variables From Keyword
    [Documentation]    Demonstrate promoting variables from keyword scope.

    ${keyword_local}=   Set Variable    Local to keyword

    # Promote to different scopes
    Set Test Variable   ${keyword_to_test}     Promoted from keyword to test
    Set Suite Variable  ${keyword_to_suite}    Promoted from keyword to suite

    Log To Console      \n--- Promoting variables from keyword ---
    Log To Console      Local: ${keyword_local}
    Log To Console      Promoted to test: ${keyword_to_test}
    Log To Console      Promoted to suite: ${keyword_to_suite}

Process Data And Update Counter
    [Arguments]    ${data}
    [Documentation]    Process data and update the suite counter.

    Log To Console      Processing: ${data}

    # Increment suite counter
    ${new_count}=       Evaluate    ${SUITE_COUNTER} + 1
    Set Suite Variable  ${SUITE_COUNTER}    ${new_count}

    Log To Console      Suite counter now: ${SUITE_COUNTER}

Wait For Condition With Timeout
    [Arguments]    ${timeout}
    [Documentation]    Simulate waiting with a specific timeout.

    Log To Console      Waiting with timeout: ${timeout} seconds
    # Simulate some waiting logic
    Sleep               1s
    Log To Console      Wait completed successfully
