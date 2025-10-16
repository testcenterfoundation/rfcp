# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-24.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Comments ***
Create a user keyword Login that accepts a mandatory username argument but uses a default password if none is provided.

1. Define a keyword with an optional password argument defaulting to welcome01.
2. Create 2 login test cases. 1 that uses the default password, 1 that overrides the default password with pass123.


*** Settings ***
Library             Browser


*** Test Cases ***
Login With Jane Test
    Log             Starting login test
    Open Browser    https://practicesoftwaretesting.com
    Click           data-test=nav-sign-in
    Fill Text       data-test=email         customer@practicesoftwaretesting.com
    Fill Text       data-test=password      welcome01
    Click           data-test=login-submit
    Get Text        data-test=page-title    equals          My account

Login With Bob Test
    Log             Starting login test
    Open Browser    https://practicesoftwaretesting.com
    Click           data-test=nav-sign-in
    Fill Text       data-test=email         customer3@practicesoftwaretesting.com
    Fill Text       data-test=password      pass123
    Click           data-test=login-submit
    Get Text        data-test=page-title    equals      My account
