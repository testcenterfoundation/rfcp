# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Settings ***
Documentation       Logout related test cases

Resource            ../Resources/keywords.resource


*** Test Cases ***
Basic Logout
    [Documentation]    Logs out the current user
    Log Out User
