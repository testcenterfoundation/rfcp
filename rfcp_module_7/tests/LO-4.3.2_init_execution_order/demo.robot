# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-29.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Settings ***
Documentation       LO-4.3.2    K2    Understand the execution order of Suite Setup and Suite Teardown in Initialization Files and their sub-suites and tests|tasks

Library             Browser

Suite Setup         New Browser    slowMo=1s
Test Setup          New Page    https://practicesoftwaretesting.com    # New page per test
Test Teardown       Close Page


*** Test Cases ***
Login As Customer
    [Documentation]    Logs in as the default customer and verifies the account page.
    Click       data-test=nav-sign-in
    Login       customer@practicesoftwaretesting.com                welcome01
    Get Text    data-test=page-title    contains    My account

Login As Customer2
    [Documentation]    Logs in as the second customer and verifies the account page.
    Click       data-test=nav-sign-in
    Login       customer2@practicesoftwaretesting.com               welcome01
    Get Text    data-test=page-title    contains    My account


*** Keywords ***
Login
    [Documentation]    Logs in with the provided email and password.
    [Arguments]    ${email}    ${password}
    Fill Text    data-test=email    ${email}
    Fill Text    data-test=password    ${password}
    Click    data-test=login-submit
