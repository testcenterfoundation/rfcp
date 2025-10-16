# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Settings ***
Documentation       Login related test cases

Resource            ../Resources/keywords.resource


*** Test Cases ***
Valid Login
    [Documentation]    Test valid login with correct credentials
    Log In With Credentials    demo_user    secret123

Invalid Login
    [Documentation]    Test invalid login with incorrect credentials
    Log In With Credentials    bad_user    wrongpass
