# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-24.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Comments ***
Instructions: 
For the register test, create an `user` dictionary

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