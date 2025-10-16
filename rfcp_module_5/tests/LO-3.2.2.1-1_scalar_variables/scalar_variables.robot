# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-24.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Comments ***
Assign scalar variables for the base URL and the Prodct ID in the variables section.


*** Settings ***
Library     RequestsLibrary

*** Test Cases ***
Get Product
    Get                     https://api-v4.practicesoftwaretesting.com/products/2                   expected_status=200