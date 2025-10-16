# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Settings ***
Documentation       LO-2.5.2.9    K2    Understand the concept of return type hints.

Library             CustomKeywords.py


*** Test Cases ***
Demo Return Type Hint
    ${number}=      Get Number With Hint
    Log             Number with hint is: ${number}
    Should Be Equal As Integers             ${number}               42

Demo Without Return Type Hint
    ${text}=            Get Text Without Hint
    Log                 Text without hint is: ${text}
    Should Be Equal     ${text}     Hello, Robot Framework!

Demo Multiple Return Type Hints
    ${value}            ${number}=      Get Multiple Values
    Log                 Value: ${value}, Number: ${number}
    Should Be Equal     ${value}        Value
    Should Be Equal As Integers         ${number}               99
