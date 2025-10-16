# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-24.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Comments ***
Instructions: You are testing a register form. The following test cases have hardcoded values that make it difficult to maintain. Create a Variables section and move all the hardcoded values into variables with meaningful names.

1. Create a *** Variables *** section at the top of your file
2. Use ${VARIABLE_NAME} format for scalar variables (single values)
3. Variable names should be descriptive and in UPPER_CASE
4. Replace all hardcoded values in the test with your variables
5. Use at least 2 spaces between variable name and value


*** Settings ***
Library         Browser
Library         FakerLibrary
Test Setup      Open Browser    https://practicesoftwaretesting.com    headless=${False}

*** Test Cases ***
Valid Account Registration
    ${email}                FakerLibrary.Email
    Click                   data-test=nav-sign-in
    Click                   data-test=register-link
    Fill Text               data-test=first-name    John
    Fill Text               data-test=last-name     test
    Fill Text               data-test=dob           2000-01-10
    Fill Text               data-test=street        sesamstreet
    Fill Text               data-test=postal_code                           1234nl
    Fill Text               data-test=city          city
    Fill Text               data-test=state         state
    Select Options By       data-test=country       text                    Nepal
    Fill Text               data-test=phone         0987654321    
    Fill Text               data-test=email         ${email}
    Fill Text               data-test=password      W3lctree01!
    Click                   data-test=register-submit
    Get Text                h3                      equal                   Login

Invalid Account Registration (too young)
    ${email}                FakerLibrary.Email
    Click                   data-test=nav-sign-in
    Click                   data-test=register-link
    Fill Text               data-test=first-name    John
    Fill Text               data-test=last-name     test
    Fill Text               data-test=dob           2015-01-10
    Fill Text               data-test=street        sesamstreet
    Fill Text               data-test=postal_code                           1234nl
    Fill Text               data-test=city          city
    Fill Text               data-test=state         state
    Select Options By       data-test=country       text                    Nepal
    Fill Text               data-test=phone         0987654321    
    Fill Text               data-test=email         ${email}
    Fill Text               data-test=password      W3lctree01!
    Click                   data-test=register-submit
    Get Text                data-test=register-error                        equal                   Customer must be 18 years old.