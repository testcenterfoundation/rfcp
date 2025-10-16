# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Settings ***
Documentation       LO-1.4.1    K2    Understand the basic concepts of Keyword-Driven Specification
...
...                 Keyword-Driven Testing focuses on WHAT the system should do, not HOW.
...                 This test case demonstrates keyword-driven specification by using high-level
...                 keywords to describe the login process in a business-readable way.
...                 Notice how the test reads like a specification document.

Library             Browser    # Web automation library


*** Test Cases ***
Successful Customer Login
    [Documentation]    This test verifies that a customer can log in successfully with valid credentials.
    ...                Notice how the test reads like a business specification:
    ...                1. Open the login page
    ...                2. Login with valid credentials
    ...                3. Verify the account page is visible

    # These keywords describe WHAT happens, not HOW
    # They use business language, not technical implementation details
    Open Login Page
    Login With Credentials                  customer@practicesoftwaretesting.com    welcome01
    Account Page Should Be Visible



*** Keywords ***
# Keywords provide the implementation details
# They translate business language into technical actions

Open Login Page
    [Documentation]    Opens the login page for the application.
    ...                This keyword hides the technical details of:
    ...                - Which URL to navigate to
    ...                - Which element to click to reach login

    # Technical implementation hidden from test case
    Open Browser    https://practicesoftwaretesting.com
    Click    data-test=nav-sign-in    # Using data-test selector for stability

Login With Credentials
    [Documentation]    Logs in using the provided email and password.
    ...                Accepts business-level arguments (credentials)
    ...                Hides the technical details of form interaction
    [Arguments]    ${email}    ${password}    # Business-level parameters

    # Implementation details: field selectors, form submission
    Fill Text    data-test=email    ${email}
    Fill Text    data-test=password    ${password}
    Click    data-test=login-submit

Account Page Should Be Visible
    [Documentation]    Verifies that the account page is visible after login.
    ...                This is a verification keyword that checks the expected outcome.
    ...                The keyword name describes the expected state, not the check method.

    # Technical verification hidden behind business language
    Get Text    data-test=page-title    contains    My account

    # Could be extended with additional checks:
    # - User name displayed
    # - Navigation menu updated
    # - Login button hidden
