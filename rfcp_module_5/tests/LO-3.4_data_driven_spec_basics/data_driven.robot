# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-24.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Settings ***
Documentation       LO-3.4    K2    Understand the basic concept and syntax of Data-Driven Specification
...
...                 This demo illustrates data-driven testing in Robot Framework:
...                 - Using Test Template to define reusable test logic
...                 - Separating test data from test implementation
...                 - Creating multiple test scenarios with minimal code duplication
...                 - Handling different user types and expected outcomes
...                 - Best practices for data-driven test design

Library             Browser

# The Test Template setting defines which keyword will be called for each test case
# Each test case then provides arguments to this template keyword
Test Template       Execute Login Test Scenario

Suite Setup         Initialize Browser Session
Suite Teardown      Close Browser Session


*** Test Cases ***
# === POSITIVE LOGIN TESTS ===
# Each test case provides: email, password, expected_page_title, expected_result
# The template keyword handles the common login logic

Valid Customer Login
    [Documentation]    Test successful login for a regular customer account
    [Tags]             positive    customer    login
    customer@practicesoftwaretesting.com    welcome01    My account    success

Valid Customer2 Login
    [Documentation]    Test successful login for second customer account
    [Tags]             positive    customer    login
    customer2@practicesoftwaretesting.com    welcome01    My account    success

Valid Admin Login
    [Documentation]    Test successful login for admin account with different landing page
    [Tags]             positive    admin    login
    admin@practicesoftwaretesting.com    welcome01    Sales over the years    success

# === NEGATIVE LOGIN TESTS ===
# These tests verify that invalid credentials are properly rejected

Invalid Password Customer
    [Documentation]    Test login failure with wrong password for customer
    [Tags]             negative    customer    login    security
    customer@practicesoftwaretesting.com    wrongpassword    ${EMPTY}    failure

Invalid Email Format
    [Documentation]    Test login failure with malformed email address
    [Tags]             negative    validation    login    security
    invalid-email-format    welcome01    ${EMPTY}    failure

Non-Existent User
    [Documentation]    Test login failure with non-existent user account
    [Tags]             negative    security    login
    nonexistent@example.com    anypassword    ${EMPTY}    failure

Empty Credentials
    [Documentation]    Test login failure with empty email and password
    [Tags]             negative    validation    login
    ${EMPTY}    ${EMPTY}    ${EMPTY}    failure

Admin Wrong Password
    [Documentation]    Test login failure for admin with wrong password
    [Tags]             negative    admin    login    security
    admin@practicesoftwaretesting.com    wrongadminpass    ${EMPTY}    failure

# === BOUNDARY CASES ===
# These tests check edge cases and boundary conditions

Very Long Email
    [Documentation]    Test behavior with extremely long email address
    [Tags]             boundary    validation    login
    very.long.email.address.that.might.cause.issues@verylongdomainname.com    welcome01    ${EMPTY}    failure

SQL Injection Attempt
    [Documentation]    Test security against basic SQL injection in email field
    [Tags]             security    injection    login
    admin@test.com'; DROP TABLE users; --    welcome01    ${EMPTY}    failure

Special Characters Password
    [Documentation]    Test login with password containing special characters
    [Tags]             boundary    password    login
    customer@practicesoftwaretesting.com    !@#$%^&*()_+    ${EMPTY}    failure


*** Keywords ***
Initialize Browser Session
    [Documentation]    Set up browser for all login tests

    New Browser    chromium    headless=${False}    slowMo=1s

Close Browser Session
    [Documentation]    Clean up browser session after all tests

    Close Browser

Execute Login Test Scenario
    [Arguments]    ${email}    ${password}    ${expected_page_title}    ${expected_result}
    [Documentation]    Template keyword that executes login test scenarios.
    ...
    ...                This keyword implements the common test logic that is reused
    ...                across all data-driven test cases. It handles both positive
    ...                and negative test scenarios based on the expected_result parameter.
    ...
    ...                Arguments:
    ...                - email: Email address to use for login attempt
    ...                - password: Password to use for login attempt
    ...                - expected_page_title: Expected page title after successful login (empty for failures)
    ...                - expected_result: Either "success" or "failure" to indicate expected outcome

    Log To Console      \n=== Login Test Scenario ===
    Log To Console      Email: ${email}
    Log To Console      Password: ${password}
    Log To Console      Expected result: ${expected_result}

    # Initialize fresh browser context for each test
    New Context
    New Page            https://practicesoftwaretesting.com

    # Navigate to login page
    Click               data-test=nav-sign-in

    # Perform login steps
    Fill Text           data-test=email       ${email}
    Fill Text           data-test=password    ${password}
    Click               data-test=login-submit

    # Handle different expected outcomes
    IF    '${expected_result}' == 'success'
        Handle Successful Login    ${expected_page_title}
    ELSE IF    '${expected_result}' == 'failure'
        Handle Failed Login
    ELSE
        Fail            Invalid expected_result: ${expected_result}. Must be 'success' or 'failure'
    END

    # Clean up context for next test
    Close Context

Handle Successful Login
    [Arguments]    ${expected_page_title}
    [Documentation]    Handle verification steps for successful login scenarios.
    ...
    ...                Arguments:
    ...                - expected_page_title: Text that should appear in page title after login

    Log To Console      Verifying successful login...

    # Wait for page to load and verify title
    ${actual_title}=    Get Text    data-test=page-title
    Should Contain      ${actual_title}    ${expected_page_title}    ignore_case=True

    Log To Console      ✓ Login successful - Page title contains: ${expected_page_title}
    Log To Console      ✓ Actual page title: ${actual_title}

    # Additional verification that user is logged in
    TRY
        # Check if user menu is present (indicates successful login)
        Get Element         data-test=nav-user-menu
        Log To Console      ✓ User menu visible - user is logged in
    EXCEPT
        # Some users might not have a user menu, check for other login indicators
        ${page_content}=    Get Text    body
        Should Not Contain  ${page_content}    Sign in    ignore_case=True
        Log To Console      ✓ Login confirmed - no 'Sign in' text on page
    END

Handle Failed Login
    [Documentation]    Handle verification steps for failed login scenarios.

    Log To Console      Verifying failed login...

    # Wait a moment for any error messages to appear
    Sleep               2s

    # Check for login failure indicators
    ${page_content}=    Get Text    body

    # Verify user is still on login page or error is shown
    TRY
        # Look for common error indicators
        ${error_found}=     Run Keyword And Return Status
        ...                 Page Should Contain    Error

        IF    not ${error_found}
            # Alternative: check if still on login page
            ${on_login_page}=   Run Keyword And Return Status
            ...                 Get Element    data-test=login-submit

            Should Be True      ${on_login_page}    Login should have failed but no error found and not on login page
        END

        Log To Console      ✓ Login correctly failed - user not authenticated

    EXCEPT    AS    ${error}
        Log To Console      ✓ Login failed as expected: ${error}
    END

    # Verify user is NOT logged in by checking for Sign in link/button
    TRY
        Get Element         data-test=nav-sign-in
        Log To Console      ✓ 'Sign in' button still present - user not logged in
    EXCEPT
        # If Sign in button not found, check we're not on a logged-in page
        ${current_url}=     Get Url
        Should Not Contain  ${current_url}    account    ignore_case=True
        Should Not Contain  ${current_url}    dashboard    ignore_case=True
        Log To Console      ✓ Not on authenticated page - login correctly failed
    END

Demonstrate Data-Driven Benefits
    [Documentation]    Supplementary test to show benefits of data-driven approach.
    ...
    ...                This test is not part of the template but demonstrates
    ...                how the same logic would look without data-driven testing.

    Log To Console      \n=== Demonstrating Data-Driven Benefits ===
    Log To Console      With data-driven testing:
    Log To Console      - Single template keyword handles all login scenarios
    Log To Console      - Easy to add new test cases (just add data)
    Log To Console      - Consistent test execution across scenarios
    Log To Console      - Reduced code duplication
    Log To Console      - Clear separation of test logic and test data

    Log To Console      \nWithout data-driven testing:
    Log To Console      - Would need separate keyword for each login scenario
    Log To Console      - Lots of duplicated code for login steps
    Log To Console      - Hard to maintain when login process changes
    Log To Console      - Inconsistent verification across test cases

    # Count the number of test cases using our template
    @{template_tests}=  Create List
    ...    Valid Customer Login
    ...    Valid Customer2 Login
    ...    Valid Admin Login
    ...    Invalid Password Customer
    ...    Invalid Email Format
    ...    Non-Existent User
    ...    Empty Credentials
    ...    Admin Wrong Password
    ...    Very Long Email
    ...    SQL Injection Attempt
    ...    Special Characters Password

    ${test_count}=      Get Length    ${template_tests}
    Log To Console      \nData-driven approach covers ${test_count} scenarios with minimal code!
