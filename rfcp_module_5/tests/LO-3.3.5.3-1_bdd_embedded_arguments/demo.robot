# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-24.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Settings ***
Documentation       LO-3.3.5.3-1    K2    Describe how embedded arguments are replaced by actual values during keyword execution

Library             Browser

Test Setup          Open Browser And Set Context
Test Teardown       Close Browser


*** Test Cases ***
BDD Style Login Test
    Given the user is on the login page
    When the user logs in with email 'customer@practicesoftwaretesting.com' and password 'welcome01'
    Then the user should see the account page


*** Keywords ***
Open Browser And Set Context
    New Browser    headless=${False}    slowMo=1s
    New Context
    New Page    https://practicesoftwaretesting.com

the user is on the login page
    Click    data-test=nav-sign-in

the user logs in with email '${email}' and password '${password}'
    Fill Text    data-test=email    ${email}
    Fill Text    data-test=password    ${password}
    Click    data-test=login-submit

the user should see the account page
    Get Text    data-test=page-title    contains    My account
