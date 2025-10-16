# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Comments ***
Run this script with the following command: robot tests/k2_demos/LO-2.1.2.1-2_suite_settings_concepts/demo.robot


*** Settings ***
Documentation       LO-2.1.2.1-2    K2    Understand the concepts of suite settings and how to define them.
...
...                 This suite demonstrates various suite settings for training purposes.
Metadata            Author    Robot Framework Trainer
Metadata            Version    1.0
Metadata            Objective LO-2.1.2.1-2 Suite Settings Demo

Library             OperatingSystem

Suite Setup         Log Suite Is Starting
Suite Teardown      Log Suite Is Ending
Test Setup          Log Test Is Starting
Test Teardown       Log Test Is Ending
Test Timeout        1 minute
Test Template       Example Template Keyword

Test Tags           demo    suite-settings

Name                Fourth Suite


*** Test Cases ***
Default Template Usage
    Hello from template
Another Template Test
    Another line of test data
Local Overrides Test
    [Tags]    critical    custom-tag
    [Timeout]    10 seconds
    [Setup]    Local Setup Keyword
    This test overrides suite-level settings.
    [Teardown]    Local Teardown Keyword
Test Without Template
    [Template]    NONE
    Log    Running without a template.


*** Keywords ***
Log Suite Is Starting
    [Documentation]    Logs a message indicating the suite setup is starting.
    Log    === SUITE SETUP: Starting the suite ===

Log Suite Is Ending
    [Documentation]    Logs a message indicating the suite teardown is ending.
    Log    === SUITE TEARDOWN: Finishing the suite ===

Log Test Is Starting
    [Documentation]    Logs a message indicating the test setup is starting.
    Log    --- TEST SETUP: Beginning test case ---

Log Test Is Ending
    [Documentation]    Logs a message indicating the test teardown is ending.
    Log    --- TEST TEARDOWN: Ending test case ---

Local Setup Keyword
    [Documentation]    Logs a message indicating the local test setup is running.
    Log    >>> LOCAL SETUP <<<

Local Teardown Keyword
    [Documentation]    Logs a message indicating the local test teardown is running.
    Log    <<< LOCAL TEARDOWN >>>

Example Template Keyword
    [Documentation]    Logs a message provided as an argument using the template.
    [Arguments]    ${msg}
    Log    Template says: ${msg}
    
