# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Settings ***
Documentation       LO-2.4.3    K2    Understand the different types of paths that can be used to import libraries and resource files.

Library             ../libs/CustomLib.py
Resource            ../resources/common.resource


*** Test Cases ***
Using Relative Imports
    Print Custom Message
    Greet Person            Robot Framework



*** Keywords ***
Greet Person
    [Arguments]    ${name}
    Greet    ${name}
