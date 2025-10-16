# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-29.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Settings ***
Documentation       LO-5.2.1    K2    Understand the purpose and basic concept of IF-Statements
...
...                 This suite demonstrates the use of IF, ELSE IF, ELSE, and inline IF statements
...                 to conditionally control test flow based on variable values.


*** Variables ***
${SCORE}        85
${STATUS}       SUCCESS
${USER}         Admin


*** Test Cases ***
Basic IF Statement Example
    [Documentation]    Demonstrates a basic IF statement checking the STATUS variable.
    IF    '${STATUS}' == 'SUCCESS'    Log    ✅ Operation was successful.

IF / ELSE IF / ELSE Statement Example
    [Documentation]    Demonstrates IF, ELSE IF, and ELSE branches for grading logic.
    IF    ${SCORE} >= 90
        Log     🅰️ Grade A
    ELSE IF    ${SCORE} >= 80
        Log     🅱️ Grade B
    ELSE
        Log     🆇 Grade C or below
    END

Inline IF Statement Example
    [Documentation]    Demonstrates the use of inline IF statements for conditional logging based on USER variable.
    IF    '${USER}' == 'Admin'    Log    👑 Admin access granted.
    IF    '${USER}' != 'Admin'    Log    ❌ Standard user access only.
