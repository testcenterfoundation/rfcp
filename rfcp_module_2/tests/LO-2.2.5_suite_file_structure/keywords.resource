# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Keywords ***
Connect To Server
    [Documentation]    Connects to the server.
    Log    Connecting to the server...

Login User
    [Documentation]    Logs in a user with the provided username and password.
    [Arguments]    ${username}    ${password}
    IF    '${password}' != '1234567890'
        Fail    Invalid Password for user ${username}
    END
    Log    User ${username} logged in successfully

Verify Valid Login
    [Documentation]    Verifies that the logged-in user's name matches the expected name.
    [Arguments]    ${expected_name}
    Log    Verifying user is ${expected_name}
    Should Be Equal    ${expected_name}    Tony Stark

Verify Unauthorized Access
    [Documentation]    Verifies that unauthorized access is correctly denied.
    Log    Verifying that login attempt was denied
    # Simulate a failed login state
    Pass Execution    Login was correctly denied

Close Server Connection
    [Documentation]    Closes the connection to the server.
    Log    Closing the server connection...


# libdoc rfcp_module_2/tests/LO-2.2.5_suite_file_structure/keywords.resource  keywords.html om document aan te maaken 