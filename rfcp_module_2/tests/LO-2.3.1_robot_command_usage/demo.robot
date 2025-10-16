# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Test Cases ***
Login User With Password
    [Documentation]    LO-2.3.1    K2    Understand how to run the robot command and its basic usage.
    ...
    ...    This test verifies successful login with correct password.
    Log     Successful login

Denied Login With Wrong Password
    [Documentation]    This test verifies that login is denied with a wrong password.
    Log     Login denied as expected
