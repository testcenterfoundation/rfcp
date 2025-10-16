# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-24.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Comments ***
The idea is to turn the repeated contact form steps into a reusable user keyword that requires:
- firstname
- lastname
- email
- subject

1. Define a user keyword called Submit Contact Form that takes four mandatory arguments: first name, last name, email, subject
2. Use this keyword in your test case, providing the required values.
3. Create a second test and provide different values

*** Settings ***
Library         Browser
Test Setup      Open Browser    https://practicesoftwaretesting.com    headless=${False}

*** Test Cases ***
Complete Contact Form
    Click                   data-test=nav-contact
    Fill Text               data-test=first-name    John
    Fill Text               data-test=last-name     Doe
    Fill Text               data-test=email         john.doe@example.com
    Select Options By       data-test=subject       text                    Return
    Fill Text               data-test=message       This is a pretty long message, because short messages don't pass the validation. Hopefully this long message does.
    Click                   data-test=contact-submit
    Get Element States      .alert-success          contains                visible                 enabled                 attached                defocused               message=Green success box is visible
    Get Text                .alert-success          equals                  Thanks for your message! We will contact you shortly.
