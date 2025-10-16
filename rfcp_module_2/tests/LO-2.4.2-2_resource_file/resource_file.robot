# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Comments ***
Instructions: You have been given a resource file with custom keywords. Create a test suite that imports this resource file and uses the keywords provided.

1. Use Resource in the Settings section to import the file
2. Use the exact keyword names as defined in the resource file
3. Remember to pass the required arguments to Complete Login Form

Think of the following cases: Perform Valid Login, Perform Login With Missing Email, Perform Login With Invalid Email, Perform Login With Missing Password

*** Settings ***
Test Setup      Open Browser    https://practicesoftwaretesting.com    headless=${False}

*** Test Cases ***