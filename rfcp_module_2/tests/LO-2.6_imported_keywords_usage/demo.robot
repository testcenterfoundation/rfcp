# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Settings ***
Documentation       LO-2.6    K2    Understand how to call imported keywords and how to structure keyword calls.


*** Test Cases ***
# Basic usage with only positional arguments
Positional Arguments Demo
    [Documentation]    Demonstrates calling a keyword using only positional arguments
    Should Be Equal     5       5

# Using a mix of mandatory and optional positional arguments

Mixed Positional Arguments Demo
    [Documentation]    Demonstrates calling a keyword with both mandatory and optional arguments using positional syntax.
    Should Be Equal     hello       HELLO       Values are case-insensitive NOT equal           True        True

# Using named arguments only

Named Arguments Demo
    [Documentation]    Demonstrates clarity by using named arguments in any order
    Should Be Equal     first=hello     second=HELLO    ignore_case=True    msg=Values are case-insensitive NOT equal

# Using both positional and named arguments

Mixed Named and Positional Arguments Demo
    [Documentation]    Demonstrates a combination of positional and named arguments. First two arguments are positional.
    Should Be Equal
    ...                 \ hello \ spaces \
    ...                 HELLO \ SPACES
    ...                 ignore_case=True
    ...                 strip_spaces=True
    ...                 msg=Values are case-insensitive NOT equal

# Calling a keyword defined in a resource file or user keyword

Call User Defined Keyword Demo
    [Documentation]    Demonstrates calling a user-defined keyword from the same suite
    Log Hello       Robot Framework Learner


*** Keywords ***
Log Hello
    [Arguments]    ${name}
    Log    Hello, ${name}!
