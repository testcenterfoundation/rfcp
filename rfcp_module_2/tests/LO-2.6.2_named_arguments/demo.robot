# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Settings ***
Documentation       LO-2.6.2    K2    Understand the concept of named arguments and how to set argument values by their name.


*** Test Cases ***
Simple Greeting With Positional Arguments
    [Documentation]    Demonstrates greeting with all positional arguments.
    Greet Person    Hi      Alice       .

Greeting Using Named Arguments
    [Documentation]    Demonstrates using named arguments to skip optional ones.
    Greet Person    name=Bob    punctuation=.

Greeting With Mixed Arguments
    [Documentation]    Demonstrates mixing positional and named arguments.
    Greet Person    Hi      name=Eve

Escaped Equal Signs In Arguments
    [Documentation]    Demonstrates handling of equal signs in argument values.
    Compare Strings     first\=1    First\=1    ignore_case=True

# Invalid Named Argument Before Positional (will cause error)
#    [Documentation]    This test demonstrates an invalid use of named arguments before positional arguments.
#    Greet Person    name=Carol    Hey


*** Keywords ***
Greet Person
    [Documentation]    Greets a person with a customizable greeting, name, and punctuation.
    [Arguments]    ${greeting}=Hello    ${name}=Robot    ${punctuation}=!
    VAR    ${message}    ${greeting}, ${name}${punctuation}
    Log    ${message}

Compare Strings
    [Documentation]    Compares two strings for equality, optionally ignoring case.
    [Arguments]    ${str1}    ${str2}    ${ignore_case}=False
    Should Be Equal    ${str1}    ${str2}    ignore_case=${ignore_case}
