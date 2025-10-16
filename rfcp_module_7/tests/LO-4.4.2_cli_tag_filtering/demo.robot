# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-29.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Settings ***
Documentation       LO-4.4.2    K2    Understand how to filter tests|tasks using the command-line interface of Robot Framework

Library             Browser

Suite Setup         New Browser
Suite Teardown      Close Browser


*** Test Cases ***
Open Practice Software Testing Homepage
    [Documentation]    Open the homepage and verify the search box is visible.
    [Tags]                  smoke       regression
    New Page                https://practicesoftwaretesting.com
    Get Element States      data-test=search-query      contains        visible

Search For Pliers
    [Documentation]    Search for 'Pliers' and verify the search term is displayed.
    [Tags]          smoke       slow
    New Page        https://practicesoftwaretesting.com
    Fill Text       data-test=search-query      Pliers
    Click           data-test=search-submit
    Get Text        data-test=search-term       contains        Pliers

Check Login Page Accessibility
    [Documentation]    Open the login page and verify the login header is present.
    [Tags]      feature-login       regression
    New Page    https://practicesoftwaretesting.com
    Click       data-test=nav-sign-in
    Get Text    h3                  contains        Login

Old Deprecated Test
    [Documentation]    This test is deprecated and should not be used.
    [Tags]      legacy      feature-login-deprecated
    Log         This is a deprecated test.

Unstable New Feature
    [Documentation]    This test covers a new unstable feature.
    [Tags]      feature-new     unstable
    Log         This is an unstable test for a new feature.
