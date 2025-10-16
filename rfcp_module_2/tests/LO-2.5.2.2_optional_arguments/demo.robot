# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Settings ***
Documentation       LO-2.5.2.2    K2    Understand the concept of optional arguments and how they are documented.


*** Variables ***
${DEFAULT GREETING}     Hello


*** Test Cases ***
Demonstrate Optional Arguments
    # Call using default greeting
    Greet User          Alice

    # Override the optional greeting argument
    Greet User          Bob         Hi

    # Use named argument to override only part
    Greet User          Charlie     greeting=Welcome

    # Demonstrate built-in keyword with optional arguments
    Should Be Equal     hello       HELLO               ignore_case=True    msg=Custom error if this fails

    # Using *args and **kwargs in a custom keyword
    Log Multiple Messages           First               Second              Third


*** Keywords ***
Greet User
    [Arguments]    ${name}    ${greeting}=${DEFAULT GREETING}
    Log    ${greeting}, ${name}!

Log Multiple Messages
    [Arguments]    @{messages}
    FOR    ${msg}    IN    @{messages}
        Log    ${msg}
    END
