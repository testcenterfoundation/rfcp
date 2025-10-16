# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-24.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Comments ***
Catch the response of the GET keyword in a variable and use that in a verification to verify the product name.


*** Settings ***
Library             RequestsLibrary
Library             OperatingSystem


*** Test Cases ***
Get Product
    ${RESPONSE}             Get     https://api-v4.practicesoftwaretesting.com/products/2           expected_status=200
    Should Not Be Empty     ${RESPONSE.json()}.name

Multiple Return Example
    ${path}             ${file}     Split Path      server/logs/server.log
    Should Be Equal     ${path}     server/logs
    Should Be Equal     ${file}     server.log
