# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Settings ***
Documentation       LO-2.2.5    K2    Understand the structure of a basic suite file.
...
...                 A suite for valid and invalid login tests.
...                 Keywords are imported from the resource file.

Resource            keywords.resource


*** Test Cases ***
Login User With Password
    Connect To Server
    Login User              ironman         1234567890  # Login with valid credentials
    Verify Valid Login      Tony Stark  # Verify that the login was successful
    Close Server Connection

Denied Login With Wrong Password
    Connect To Server
    Run Keyword And Expect Error
    ...                     *Invalid Password*  # Error message expected
    ...                     Login User
    ...                     ironman
    ...                     123#wrong  # Not a comment; part of the password string
    Verify Unauthorized Access
    Close Server Connection


