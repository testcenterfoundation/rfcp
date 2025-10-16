# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Settings ***
Documentation       LO-2.5.2.1    K2    Understand the concept of mandatory arguments and how they are documented.


*** Test Cases ***
Test Passes With All Mandatory Arguments
    [Documentation]    This test passes because both mandatory arguments are provided and are equal.
    Should Be Equal     Hello       Hello

Test Fails With Unequal Arguments
    [Documentation]    This test fails because the two mandatory arguments are not equal.
    [Tags]              failonpurpose
    Should Be Equal     Hello               World

Test Fails Due To Missing Mandatory Argument
    [Documentation]    This test fails before execution due to missing the second mandatory argument.
    [Tags]              failonpurpose
    Should Be Equal     Hello
