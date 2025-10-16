# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-24.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Comments ***
Create a user keyword named Get Price Without Dollar Sign that:

1. Gets the text of the total price (e.g., $62.56)
2. Strips the dollar sign
3. Returns the numeric value (as a string)

Then you'll assign that return value to a variable and log or verify it in your test.


*** Settings ***
Library             Browser

Test Setup          Open Browser    https://practicesoftwaretesting.com


*** Test Cases ***
Shopping Cart Test
    Click       //*[@data-test = 'product-name'][contains(text(), 'Combination Pliers')]
    Click       data-test=add-to-cart
    Get Text    data-test=cart-quantity             equal       1
    Click       data-test=nav-home
    Click       //*[@data-test = 'product-name'][contains(text(), 'Bolt Cutters')]
    Click       data-test=add-to-cart
    Get Text    data-test=cart-quantity             equal       2
    Click       data-test=nav-cart
    Get Text    data-test=cart-total    equals      $62.56
