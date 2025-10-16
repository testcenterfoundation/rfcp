# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Settings ***
Documentation       LO-1.4.2    K2    Understand the basic concepts of Behavior-Driven Specification
...
...                 BDD uses the Given-When-Then format to describe system behavior in business terms.
...                 This test case demonstrates behavior-driven specification using the Given–When–Then style.
...                 It describes the behavior of a successful login scenario using natural language steps.
...
...                 Given: Sets up the context (preconditions)
...                 When:    Describes the action or event
...                 Then:    Verifies the expected outcome

Library             Browser    # Web automation library


*** Test Cases ***
Customer Can Log In Successfully
    [Documentation]    This test verifies that a customer can log in successfully using valid credentials.
    ...    Written in BDD style to be readable by all stakeholders.
    ...    The scenario describes WHO (customer), WHAT (log in), and the EXPECTED OUTCOME.

    # BDD Format: Given-When-Then
    # This structure makes tests readable as specifications
    Given The Login Page Is Open  # Precondition/Context
    When The Customer Logs In With Valid Credentials  # Action/Event
    Then The Account Page Should Be Displayed  # Expected Outcome/Verification


*** Keywords ***
# BDD Keywords use Given/When/Then prefixes to indicate their purpose
# This creates a natural language flow that non-technical stakeholders can understand

Given The Login Page Is Open
    [Documentation]    GIVEN step: Sets up the initial context.
    ...    This establishes the precondition that the login page must be accessible.
    ...    In BDD, Given steps prepare the system state.

    # Implementation details hidden behind natural language
    Open Browser    https://practicesoftwaretesting.com
    Click    data-test=nav-sign-in

When The Customer Logs In With Valid Credentials
    [Documentation]    WHEN step: Describes the action that triggers the behavior.
    ...    This is the key action being tested - a customer attempting to log in.
    ...    In BDD, When steps describe user actions or system events.

    # The implementation uses specific test data
    # In a real scenario, this could be parameterized
    Fill Text    data-test=email    customer@practicesoftwaretesting.com
    Fill Text    data-test=password    welcome01
    Click    data-test=login-submit

Then The Account Page Should Be Displayed
    [Documentation]    THEN step: Verifies the expected outcome.
    ...    This confirms that the login was successful by checking for the account page.
    ...    In BDD, Then steps assert that the system is in the expected state.
    ...    Note the use of "Should" to indicate an expectation.

    # Verification implementation
    Get Text    data-test=page-title    contains    My account

    # Could include additional verifications:
    # - User menu is visible
    # - Login button is hidden
    # - Welcome message appears
