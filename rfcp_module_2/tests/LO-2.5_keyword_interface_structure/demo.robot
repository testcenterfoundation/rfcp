# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Settings ***
Documentation       LO-2.5    K2    Understand the structure of keyword interfaces and how to interpret keyword documentation.

Resource            resources/custom.resource
Library             Process


*** Variables ***
${SAMPLE_TEXT}      hello


*** Test Cases ***
Demonstrate Keyword Interfaces and Documentation
    [Documentation]    Show how keyword documentation and arguments are structured.
    Log                 Input text: ${SAMPLE_TEXT}
    ${upper}            Custom Convert To Uppercase         ${SAMPLE_TEXT}
    Log                 Uppercase result: ${upper}
    ${with_suffix}      Append Suffix       ${upper}        _ADDED
    Log                 With Suffix: ${with_suffix}

    Should Be Equal     ${with_suffix}      HELLO_ADDED
    ${result}           Run Process         echo            ${with_suffix}
    Log                 Output from process: ${result.stdout}
