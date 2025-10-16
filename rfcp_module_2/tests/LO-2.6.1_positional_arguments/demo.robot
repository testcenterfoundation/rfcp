# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Settings ***
Documentation       LO-2.6.1    K2    Understand the concept of how to set argument values positionally.

Library             Process


*** Test Cases ***
Positional Argument Example - Login
    [Documentation]    Demonstrates usage of positional and named arguments in the Login User keyword.
    # Arguments set positionally
    Login User      ironman             1234567890

    # More readable using named arguments
    Login User      username=ironman    password=1234567890

Positional vs Named - Coordinate Click
    [Documentation]    Demonstrates the difference between positional and named arguments in the Click On Coordinates keyword.
    # Positional call
    Click On Coordinates    82      70

    # Named arguments improve clarity
    Click On Coordinates    x=82    y=70

Variable Positional Args - Run Process
    [Documentation]    Demonstrates usage of variable positional arguments with the Run Process keyword.
    [Tags]      failonpurpose
    # No arguments, just command
    ${dir}      Run Process         command=dir
    Log         ${dir.stdout}

    # Variable number of args, all after command are positional
    ${ping}     Run Process         ping            -c      2       127.0.0.1
    Log         ${ping.stdout}

    # Custom keyword using variable positional args
    Describe Process Call           ping            -c      1       127.0.0.1


*** Keywords ***
Login User
    [Documentation]    Logs in a user with the given username and password.
    [Arguments]    ${username}    ${password}
    Log    Logging in with user: ${username}

Click On Coordinates
    [Documentation]    Clicks at the specified (x, y) screen coordinates.
    [Arguments]    ${x}    ${y}
    Log    Clicking at coordinates: (${x}, ${y})

Describe Process Call
    [Documentation]    Runs a process with the given command and arguments, then logs the output.
    [Arguments]    ${command}    @{args}
    ${result}    Run Process    ${command}    @{args}
    Log    Command Output:\n${result.stdout}
