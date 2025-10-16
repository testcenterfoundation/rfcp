# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Settings ***
Documentation       LO-1.3.3    K2    Explain the difference between User Keywords and Library Keywords
...
...                 This suite demonstrates the difference between Library Keywords and User Keywords.
...                 The first test case uses only Library Keywords (e.g. Open Browser, Click, Fill Text)
...                 to perform a login. The second test case uses a custom User Keyword called 'Login',
...                 which combines multiple Library Keywords to make the test more readable and reusable.

# Import Browser library for web automation
# The presenter mode highlights elements being interacted with (useful for teaching)
Library             String
Library             Browser    enable_presenter_mode={"duration": "1 seconds", "width": "2px", "style": "dotted", "color": "blue"}


*** Test Cases ***
Login success using library keywords
    [Documentation]    Perform login using only library keywords.
    ...    This approach uses individual Library Keywords for each action.
    ...    Notice how we need multiple lines to accomplish the login task.

    # Step 1: Open the browser and navigate to the website
    Open Browser    https://practicesoftwaretesting.com

    # Step 2: Click on the sign-in navigation link
    Click           data-test=nav-sign-in

    # Step 3: Create a variable for email (demonstrates variable usage)
    VAR    ${EMAIL}    customer@practicesoftwaretesting.com

    # Step 4: Fill in the login form fields
    Fill Text       data-test=email         ${EMAIL}
    Fill Text       data-test=password      welcome01

    # Step 5: Submit the form
    Click           data-test=login-submit

    # Step 6: Verify successful login by checking page title
    Get Text        data-test=page-title    contains        My account

Login success using user keywords
    [Documentation]    Perform login using the custom 'Login' user keyword.
    ...    This approach uses a User Keyword to encapsulate the login logic.
    ...    Notice how much cleaner and more readable the test becomes.

    # Same setup steps
    Open Browser    https://practicesoftwaretesting.com
    Click           data-test=nav-sign-in

    # Use our custom Login keyword - abstracts away the implementation details
    # This makes the test more readable and business-focused
    Login           customer@practicesoftwaretesting.com                welcome01

    # Same verification
    Get Text        data-test=page-title    contains    My account


*** Keywords ***
# User Keywords section - where we define our custom keywords

The Page Title Should Be
    [Documentation]    Example of a simple User Keyword that logs information.
    ...    This keyword demonstrates how to accept arguments.
    [Arguments]    ${exp_title}    # Arguments make keywords flexible and reusable
    Log To Console    Expected title: ${exp_title}

Login
    [Documentation]    Custom User Keyword that encapsulates the login process.
    ...    This combines multiple Library Keywords into a single, reusable action.
    ...    Benefits: Reusability, Maintainability, Readability
    [Arguments]    ${email}    ${password}    # Accept credentials as parameters

    # These are Library Keywords from the Browser library
    # Notice how we're building a higher-level abstraction
    Fill Text    data-test=email    ${email}
    Fill Text    data-test=password    ${password}
    Click    data-test=login-submit

    # We could add more steps here like waiting for login to complete
    # or checking for error messages, making this keyword more robust
