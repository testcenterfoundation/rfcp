# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-29.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Settings ***
Documentation       LO-5.2.6    K2    Understand the purpose and basic concept of the BREAK and CONTINUE statements

Library             RequestsLibrary
Library             Collections


*** Variables ***
${BASE_URL}         https://api.practicesoftwaretesting.com
${ADMIN_USER}       admin@practicesoftwaretesting.com
${ADMIN_PASS}       welcome01


*** Test Cases ***
Disable All Non-Admin Users
    ${payload}=         Create Dictionary       email=admin@practicesoftwaretesting.com     password=welcome01
    ${response}=        POST
    ...                 https://api.practicesoftwaretesting.com/users/login
    ...                 json=${payload}

    ${auth_header}=     Create Dictionary       Authorization=Bearer ${response.json()}[access_token]
    ${resp}=            GET
    ...                 https://api.practicesoftwaretesting.com/users
    ...                 headers=${auth_header}
    ${body}=            Convert To Dictionary                       ${resp.json()}
    ${users}=           Get From Dictionary     ${body}             data

    FOR    ${user}    IN    @{users}
        ${role}=            Get From Dictionary     ${user}             role
        ${user_id}=         Get From Dictionary     ${user}             id
        Log To Console      ${role}
        IF    '${role}' == 'admin'    CONTINUE

        Log To Console          🔒 Disabling user ${user_id}
        &{payload}=             Create Dictionary       enabled=${False}
        ${patch}=               Patch
        ...                     https://api.practicesoftwaretesting.com/users/${user_id}
        ...                     json=${payload}
        ...                     headers=${auth_header}
        Should Be Equal As Integers                     ${patch.status_code}    200
        Log To Console          ${patch.request.headers}
        Log To Console          ${patch.request.body}
        Log To Console          ${patch.json()}

        Log To Console          ✅ Non-admin users disabled successfully
    END
