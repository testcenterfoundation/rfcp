# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-24.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Comments ***
Import BrowserLibrary with a specific default browser type and headless mode configuration.

1. Import BrowserLibrary in your settings with enable_presenter_mode enabled.
2. And make sure you highlight the element on failure by setting: highlight_on_failure


*** Variables ***
${EMAIL}        customer@practicesoftwaretesting.com
${PASSWORD}     welcome01


*** Test Cases ***
Login Test
    [Documentation]    Test logging in with valid credentials and verify account page is shown
    Log             Starting login test
    Open Browser    https://practicesoftwaretesting.com
    Click           data-test=nav-sign-in
    Fill Text       data-test=email         ${EMAIL}
    Fill Text       data-test=password      ${PASSWORD}
    Click           data-test=login-submit
    Get Text        data-test=page-title    equals          My account
