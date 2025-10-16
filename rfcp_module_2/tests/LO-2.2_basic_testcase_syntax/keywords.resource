# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Keywords ***
Setup Keyword
    Log                     Performing setup steps

Teardown Keyword
    Log                     Performing teardown steps

Get Result Keyword
    [Arguments]             ${input1}=42            ${input2}=8
    ${result}=              Evaluate                ${input1} + ${input2}
    RETURN                  ${result}

Create Message
    [Arguments]             ${name}=Robot
    ${message}=             Catenate                SEPARATOR=              Hello,                  ${name}!
    RETURN                  ${message}
