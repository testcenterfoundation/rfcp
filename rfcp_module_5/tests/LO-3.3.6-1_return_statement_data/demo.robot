# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-24.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Settings ***
Documentation       LO-3.3.6-1    K2    Understand how the RETURN statement passes data between different keywords.

Library             Browser
Library             String
Library             Collections

Suite Setup         New Browser    chromium    slowMo=1s
Suite Teardown      Close Browser


*** Variables ***
${URL}      https://practicesoftwaretesting.com


*** Test Cases ***
Demo RETURN Passing Between Keywords
    New Page            ${URL}
    ${page_title}=      Get Page Title
    Log To Console      Page title is: ${page_title}

    ${host}=            Get Hostname From URL                   ${URL}
    Log To Console      Hostname extracted: ${host}


*** Keywords ***
Get Page Title
    ${title}=    Get Title
    RETURN    ${title}

Get Hostname From URL
    [Arguments]    ${url}
    ${parts}=    Split String    ${url}    //
    ${hostname}=    Get From List    ${parts}    1
    ${hostname}=    Set Variable If    '${hostname}' != ''    ${hostname}    INVALID_URL
    RETURN    ${hostname}
