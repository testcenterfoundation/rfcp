# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Comments ***
Run this script with the following command: robot tests/k2_demos/LO-2.1.2.4_keywords_section/demo.robot


*** Settings ***
Documentation       LO-2.1.2.4    K2    Understand the purpose and limitations of the *** Keywords *** section.


*** Variables ***
${USERNAME}     demo_user
${PASSWORD}     1234


*** Test Cases ***
Login With Valid Credentials
    [Documentation]    This test verifies that login succeeds with valid credentials.
    [Setup]             Open Login Page
    Enter Username      ${USERNAME}
    Enter Password      ${PASSWORD}
    Submit Login
    Log To Console      Page Should Contain Welcome
    [Teardown]          Close Browser

Login With Invalid Credentials
    [Documentation]    This test checks login failure with incorrect credentials.
    [Tags]              negative            login
    [Timeout]           1 minute
    [Setup]             Open Login Page
    Enter Username      invalid_user
    Enter Password      wrong_pass
    Submit Login
    Log To Console      Page Should Contain Invalid username or password
    [Teardown]          Close Browser


*** Keywords ***
Open Login Page
    Log    Opening the login page
    # Simulate opening a login page (placeholder)

Enter Username
    [Arguments]    ${username}
    Log    Entering username: ${username}

Enter Password
    [Arguments]    ${password}
    Log    Entering password: ${password}

Submit Login
    Log    Submitting the login form

Close Browser
    Log    Closing the browser
