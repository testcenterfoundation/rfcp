# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-29.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Settings ***
Documentation       LO-5.1.1    K2    Understand the difference between statically defined and dynamically created variables in Robot Framework


*** Test Cases ***
Test With Local Variable Only
    [Documentation]    Demonstrates use of a local variable within a test case.
    VAR    ${LOCAL_ONLY}    I am local
    Log To Console      In test: ${LOCAL_ONLY}

Test With Scoped Variables
    [Documentation]    Demonstrates use of test, suite, and global scoped variables.
    VAR    ${TEST_VAR}    I live in this test    scope=TEST
    VAR    ${SUITE_VAR}    I live in this suite    scope=SUITE
    VAR    ${GLOBAL_VAR}    I live everywhere    scope=GLOBAL
    Call Keyword
    Log To Console      After keyword:
    Log To Console      Test: ${TEST_VAR}
    Log To Console      Suite: ${SUITE_VAR}
    Log To Console      Global: ${GLOBAL_VAR}

Another Test To Show Global Only
    [Documentation]    Demonstrates that only global variables are accessible in this test case.
    [Tags]              failonpurpose
    Log To Console      Accessing global: ${GLOBAL_VAR}
    Run Keyword And Expect Error            *                   Log                 Accessing test var: ${TEST_VAR}
    Run Keyword And Expect Error            *                   Log                 Accessing suite var: ${SUITE_VAR}


*** Keywords ***
Call Keyword
    [Documentation]    Demonstrates variable scope inside a user keyword.
    Log To Console    --- Inside keyword ---
    Run Keyword And Expect Error    *    Log    Local: ${LOCAL_ONLY}
    Log To Console    Test: ${TEST_VAR}
    Log To Console    Suite: ${SUITE_VAR}
    Log To Console    Global: ${GLOBAL_VAR}
