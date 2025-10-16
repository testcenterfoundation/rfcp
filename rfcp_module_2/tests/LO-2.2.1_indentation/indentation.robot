# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Comments ***
Instructions: The following Robot Framework test case has incorrect indentation and separation. Fix the code so it follows proper Robot Framework syntax rules.

1. In Robot Framework, keywords under test cases must be indented with at least 2 spaces
2. All keywords at the same level should have the same indentation
3. Arguments are separated by at least 2 spaces from keywords
4. Fix each line by adding proper spacing


*** Settings ***
Library     Browser


*** Variables ***
${email}     customer@practicesoftwaretesting.com
${password}     welcome01

*** Test Cases ***
Login Test
    Log     Starting login test
    Open Browser    https://practicesoftwaretesting.com     headless=${False}
    Click     data-test=nav-sign-in
    Fill Text     data-test=email     ${email}
    Fill Text     data-test=password     ${password}
    Click     data-test=login-submit
    Get Text     data-test=page-title     equals     My account

