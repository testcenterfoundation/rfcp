# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-29.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Settings ***
Documentation       LO-4.2.2-2    K2    Understand when Test|Task Teardown is executed and used

Library             Browser
Library             RequestsLibrary
Library             JSONLibrary

Test Setup          Open Browser and Set Context


*** Test Cases ***
Locked account
    Click           data-test=nav-sign-in
    Login With Credentials              customer@practicesoftwaretesting.com    wrong1
    Login With Credentials              customer@practicesoftwaretesting.com    wrong2
    Login With Credentials              customer@practicesoftwaretesting.com    wrong3
    Login With Credentials              customer@practicesoftwaretesting.com    welcome01
    Get Text        data-test=login-error                   contains            Account locked
    [Teardown]      Unlock account


*** Keywords ***
Open Browser and Set Context
    New Browser    headless=False
    New Context    viewport={"width": 1620, "height": 800}
    New Page    https://practicesoftwaretesting.com

Login With Credentials
    [Arguments]    ${email}    ${password}=welcome01
    Fill Text    data-test=email    ${email}
    Fill Text    data-test=password    ${password}
    Click    data-test=login-submit
    Wait For Response    **/users/login

Unlock account
    ${payload}=    Create Dictionary    email=admin@practicesoftwaretesting.com    password=welcome01
    ${token_response}=    POST    https://api.practicesoftwaretesting.com/users/login    json=${payload}
    Log To Console    ${token_response.json()}

    ${token_header}=    Create Dictionary    Authorization    Bearer ${token_response.json()}[access_token]
    ${response}=    GET    https://api.practicesoftwaretesting.com/users/search
    ...    headers=${token_header}
    ...    params=q=customer%40practicesoftwaretesting.com
    ...    expected_status=200
    @{id}=    Get value from JSON    ${response.json()}    $.data[0].id
    Log To Console    ${id}[0]

    ${update_payload}=    Create Dictionary
    ...    failed_login_attempts=0
    ${token_response}=    PATCH    https://api.practicesoftwaretesting.com/users/${id}[0]
    ...    headers=${token_header}
    ...    json=${update_payload}
    Status Should Be    200
