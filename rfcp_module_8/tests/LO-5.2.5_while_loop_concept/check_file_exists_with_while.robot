# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-29.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Settings ***
Documentation       LO-5.2.5    K2    Understand the purpose and basic concept of WHILE Loops

Library             OperatingSystem


*** Variables ***
${FILE_PATH}            tests/k2_demos/LO-5.2.5_while_loop_concept/daily_report.csv
${MAX_ATTEMPTS}         5
${SLEEP_INTERVAL}       2s


*** Test Cases ***
Wait Until File Appears
    [Documentation]    Waits until the specified file appears, retrying for a maximum number of attempts.
    VAR    ${exists}=    ${False}
    VAR    ${attempt}=    0

    WHILE    not ${exists} and ${attempt} < ${MAX_ATTEMPTS}
        ${log_attempt}=     Evaluate                ${attempt} + 1
        Log                 Waiting for file... Attempt ${log_attempt}
        ${exists}=          Run Keyword And Return Status
        ...                 File Should Exist
        ...                 ${FILE_PATH}
        ${attempt}=         Evaluate                ${attempt} + 1
        Sleep               ${SLEEP_INTERVAL}
    END

    Should Be True      ${exists}               File was not found after ${MAX_ATTEMPTS} attempts
