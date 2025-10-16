*** Comments ***
# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
Instructions: The following test has very long lines that are hard to read. Use Robot Framework's continuation syntax to break them into multiple lines for better readability.

1. Use ... (three dots) at the beginning of continuation lines
2. Continuation lines should be indented more than the original line
3. Break long strings logically as variables
4. Maintain proper spacing between arguments


*** Settings ***
Library             Browser

Test Setup          Open Browser    https://practicesoftwaretesting.com    headless=${False}


*** Test Cases ***
Complete Contact Form
    Click                   data-test=nav-contact
    Fill Text               data-test=first-name    John
    Fill Text               data-test=last-name     Doe
    Fill Text               data-test=email         john.doe@example.com
    Select Options By       data-test=subject
    ...                     text
    ...                     Return
    Fill Text
    ...                     data-test=message
    ...                     This is a pretty long message, because short messages don't pass the validation. Hopefully this long message does.
    Click                   data-test=contact-submit
    Get Element States      .alert-success
    ...                     contains
    ...                     visible
    ...                     enabled
    ...                     attached
    ...                     defocused
    ...                     message=Green success box is visible
    Get Text
    ...                     .alert-success
    ...                     equals
    ...                     Thanks for your message! We will contact you shortly.
