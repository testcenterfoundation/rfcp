# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Settings ***
Documentation       LO-2.3.3.1    K2    Understand when an element is marked as PASS.


*** Variables ***
${VALID_STRING}     Hello, Robot Framework!
${INVALID_INT}      not_a_number


*** Test Cases ***
Test Atomic Keywords Pass
    [Documentation]    Show that atomic keywords PASS when no error is raised
    Log                 This is a PASS log message
    Should Be Equal     5       5

Test Composite User Keyword Pass
    [Documentation]    Show that a User Keyword passes when all its internal steps pass
    Run Verification Steps

Test Run Keyword And Expect Error Pass
    [Documentation]    Demonstrate a PASS even when an inner keyword fails (expectedly)
    [Tags]      failonpurpose
    Run Keyword And Expect Error    ValueError          Convert To Integer                      ${INVALID_INT}

Test Composite Pass With Failing Nested Step
    [Documentation]    Demonstrate that a test can PASS even if a nested step FAILs but is expected
    [Tags]      failonpurpose
    Run Keyword And Expect Error    TypeError           Invalid Keyword Simulation


*** Keywords ***
Run Verification Steps
    [Documentation]    Composite keyword that passes if all internal keywords pass
    Should Contain    ${VALID_STRING}    Robot
    Should Be True    ${VALID_STRING.startswith("Hello")}

Invalid Keyword Simulation
    [Documentation]    Simulate a keyword that fails by raising an unexpected error
    Convert To Integer    ${INVALID_INT}
