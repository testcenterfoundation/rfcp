# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Settings ***
Documentation       LO-2.3.3.2    K2    Understand when an element is marked as FAIL.


*** Test Cases ***
Demonstrate Failure Propagation
    [Documentation]    Demonstrates how a failure in a keyword causes FAIL status to propagate up.
    [Tags]      failonpurpose
    Log         Step 1: Start the test
    Perform Some Valid Check
    Perform Failing Check
    Log         Step 3: This will be skipped due to previous failure


*** Keywords ***
Perform Some Valid Check
    [Documentation]    This is a passing check
    Should Be Equal As Strings    Hello    Hello

Perform Failing Check
    [Documentation]    This keyword will fail due to assertion error
    Should Be Equal As Strings    Expected    Actual
