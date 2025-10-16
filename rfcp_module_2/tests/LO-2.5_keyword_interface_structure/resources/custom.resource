# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Settings ***
Documentation       Resource file containing custom user keywords with documentation.
Library             String

*** Keywords ***
Custom Convert To Uppercase
    [Arguments]             ${text}
    [Documentation]    Converts the given text to uppercase using the String library.
    ${upper}                Convert To Uppercase    ${text}
    RETURN                  ${upper}

Append Suffix
    [Arguments]             ${base}                 ${suffix}=SUFFIX
    [Documentation]    Appends a suffix to the base string. Default suffix is 'SUFFIX'.
    RETURN                  ${base}${suffix}
