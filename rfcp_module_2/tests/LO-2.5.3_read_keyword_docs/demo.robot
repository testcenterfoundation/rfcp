# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Comments ***
# In this test, the goal is to teach how the keyword documentation lists examples:
# - Required and optional arguments
# - Positional and named arguments
# - Interpreting how optional arguments modify behavior
# - Copying patterns from documentation into working code


*** Settings ***
Documentation       LO-2.5.3    K2    Understand how to read keyword documentation and how to interpret the examples.


*** Variables ***
${ACTUAL}       Hello
${EXPECTED}     Hello
${WRONG}        hi
${LOWER}        hello


*** Test Cases ***
Understanding Keyword Documentation Demo
    # The following lines demonstrate how to interpret the documentation examples for `Should Be Equal`.

    # Basic usage (required arguments only):
    Should Be Equal     ${ACTUAL}               ${EXPECTED}

    # Custom error message
    Should Be Equal     ${ACTUAL}               ${EXPECTED}     Values do not match!

    # Custom message + optional named argument `values=False`
    # This disables showing values in the failure message.
    Run Keyword And Expect Error
    ...                 Values do not match!
    ...                 Should Be Equal
    ...                 ${ACTUAL}
    ...                 ${WRONG}
    ...                 Values do not match!
    ...                 values=False

    # Named argument: ignore_case
    # Case-insensitive comparison
    Should Be Equal     ${ACTUAL}               ${LOWER}        ignore_case=True

    # Named argument: formatter
    # Customizes how values are formatted in error messages.
    Run Keyword And Expect Error
    ...                 *
    ...                 Should Be Equal         ${ACTUAL}       ${WRONG}                formatter=repr

    # Each of the above lines comes from understanding the code block-style documentation:
    # Should Be Equal    ${x}    expected
    # Should Be Equal    ${x}    expected    Custom error message
    # Should Be Equal    ${x}    expected    Custom message    values=False
    # Should Be Equal    ${x}    expected    ignore_case=True    formatter=repr
