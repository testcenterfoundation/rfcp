# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Settings ***
Library     Browser

*** Keywords ***
Navigate To Login Page
    Click                   data-test=nav-sign-in

Complete Login Form
    [Arguments]             ${email}                ${password}
    Fill Text               data-test=email         ${email}
    Fill Text               data-test=password      ${password}
    Click                   data-test=login-submit

Verify Successful Login
    Get Text                data-test=page-title    equal                   My account

Verify Email Required Error
    Get Text                data-test=email-error                           equal                   Email is required

Verify Invalid Email Format Error
    Get Text                data-test=email-error                           equal                   Email format is invalid

Verify Password Required Error
    Get Text                data-test=password-error                        equal                   Password is required

Verify Password Length Error
    Get Text                data-test=password-error                        equal                   Password length is invalid