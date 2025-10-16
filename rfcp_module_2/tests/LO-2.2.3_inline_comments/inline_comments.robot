# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Comments ***
Instructions: Add appropriate in-line comments to the following test case to explain what each step does. Use the # symbol for comments.

1. Add comments using # followed by a space
2. Comments should explain the purpose of each action
3. Keep comments concise but descriptive
4. Comments go at the end of the line after at least 2 spaces


*** Settings ***
Library         Browser
Test Setup      Open Browser    https://practicesoftwaretesting.com    headless=${False}


*** Test Cases ***
Shopping Cart Test
    [Documentation]    Er wordt een 2 producten in de winkelmand gestopt
    Click                   //*[@data-test = 'product-name'][contains(text(), 'Combination Pliers')]
    Click                   data-test=add-to-cart
    Get Text                data-test=cart-quantity                         equal                   1
    Click                   data-test=nav-home
    Click                   //*[@data-test = 'product-name'][contains(text(), 'Bolt Cutters')]
    Click                   data-test=add-to-cart
    Get Text                data-test=cart-quantity                         equal                   2
    Click                   data-test=nav-cart
    Get Text                data-test=cart-total    equals                  $62.56
