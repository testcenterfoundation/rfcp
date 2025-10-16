# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Settings ***
Documentation       LO-2.5.2.8    K2    Understand the concept of argument types and automatic type conversion.

Library             CustomKeywords.py


*** Test Cases ***
Valid Reminder Scheduling
    [Documentation]    Shows successful conversion of delay_minutes from string to integer.
    Schedule Reminder       Take a break    15

Invalid Reminder Scheduling
    [Documentation]    Shows failure when delay_minutes cannot be converted to an integer.
    [Tags]                  failonpurpose
    Schedule Reminder       Time for lunch      Fifteen
