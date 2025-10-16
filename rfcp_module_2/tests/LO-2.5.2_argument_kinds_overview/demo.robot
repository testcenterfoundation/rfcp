# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Settings ***
Documentation       LO-2.5.2    K2    Understand the difference between argument kinds.

Library             Collections


*** Test Cases ***
Demo Of Argument Kinds
    # Positional arguments
    Keyword With All Argument Kinds                 Alice                   30

    # Named arguments (named only starts after variable-length positional)
    Keyword With All Argument Kinds
    ...                     Alice
    ...                     30
    ...                     reading
    ...                     swimming
    ...                     teaching
    ...                     city=Helsinki

    # Mixing positional and named
    Keyword With All Argument Kinds                 Bob                     25                      city=Oslo

    # Using free named arguments
    Keyword With All Argument Kinds
    ...                     Charlie
    ...                     40
    ...                     biking
    ...                     country=Norway
    ...                     lang=nb


*** Keywords ***
Keyword With All Argument Kinds
    [Arguments]    ${name}    ${age}    @{hobbies}    ${city}=Unknown    &{extra}
    Log To Console    Name: ${name}
    Log To Console    Age: ${age}
    Log To Console    Hobbies: ${hobbies}
    Log To Console    City: ${city}
    Log To Console    Extra: ${extra}
