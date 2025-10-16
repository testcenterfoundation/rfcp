# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Keywords ***
Log In With Credentials
    [Documentation]    Logs in using the provided username and password.
    [Arguments]    ${username}    ${password}
    Log    Logging in with user ${username} and password ${password}

Log Out User
    [Documentation]    Logs out the current user.
    Log    Logging out the current user
