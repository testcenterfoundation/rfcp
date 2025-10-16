# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-29.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Settings ***
Documentation       LO-4.2.1-2    K2    Understand when Suite Teardown is executed and used

Library             Browser

Suite Teardown      Cleanup Data
Test Setup          Open Browser And Set Context


*** Test Cases ***
Login As Customer
    Click       data-test=nav-sign-in
    Login       customer@practicesoftwaretesting.com                welcome01
    Get Text    data-test=page-title    contains    My account

Login As Customer2
    Click       data-test=nav-sign-in
    Login       customer2@practicesoftwaretesting.com               welcome01
    Get Text    data-test=page-title    contains    My account


*** Keywords ***
Open Browser And Set Context
    New Browser    headless=${False}    slowMo=1s
    New Context
    New Page    https://practicesoftwaretesting.com

Login
    [Arguments]    ${email}    ${password}
    Fill Text    data-test=email    ${email}
    Fill Text    data-test=password    ${password}
    Click    data-test=login-submit

Cleanup Data
    Log To Console    Here you can define some cleanup statements
