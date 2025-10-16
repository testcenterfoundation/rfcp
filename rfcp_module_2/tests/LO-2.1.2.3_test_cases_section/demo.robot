# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Comments ***
Run this script with the following command: robot tests/k2_demos/LO-2.1.2.3_test_cases_section/demo.robot


*** Settings ***
Documentation       LO-2.1.2.3    K2    Understand the purpose of the *** Test Cases *** or *** Tasks *** section.
...
...                 This suite demonstrates login test cases with valid and invalid credentials.


*** Variables ***
${USERNAME}     demo_user
${PASSWORD}     1234


*** Test Cases ***
Login With Valid Credentials
    [Documentation]    This test verifies that login succeeds with valid credentials.
    [Setup]             Log     Opening the login page
    Log                 Entering username: ${USERNAME}
    Log                 Entering password: ${PASSWORD}
    Log                 Submitting the login form
    Log To Console      Page Should Contain Welcome
    [Teardown]          Log     Close Browser

Login With Invalid Credentials
    [Documentation]    This test checks login failure with incorrect credentials.
    [Tags]              negative    login
    [Timeout]           1 minute
    [Setup]             Log         Opening the login page
    Log                 Entering username: invalid_user
    Log                 Entering password: wrong_pass
    Log                 Submitting the login form
    Log To Console      Page Should Contain Invalid username or password
    [Teardown]          Log         Close Browser
