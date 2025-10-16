# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Test Cases ***
Escaping Hash Character
    [Documentation]    LO-2.2.4    K2    Understand how to escape control characters in Robot Framework.
    ...
    ...    Demonstrates escaping the hash (#) character to prevent comments.
    Log     \# This is not a comment  # Logs: "# This is not a comment"

Escaping Variable Interpolation
    [Documentation]    Demonstrates escaping variable syntax to prevent interpolation.
    Log     \${NOT_A_VARIABLE}  # Logs: "${NOT_A_VARIABLE}"

Escaping Multiple Spaces
    [Documentation]    Demonstrates escaping multiple spaces to prevent collapsing.
    Log     Word\ \ \Spacing  # Logs: "Word  Spacing"

Escaping Equal Sign
    [Documentation]    Demonstrates escaping the equal sign (=) to use as a literal.
    Log     key\=value  # Logs: "key=value"

Escaping Backslash
    [Documentation]    Demonstrates escaping the backslash character.
    Log     Path with double backslashes: C:\\Users\\Trainer  # Logs: "Path with double backslashes: C:\Users\Trainer"

Using Forward Slashes in Paths
    [Documentation]    Demonstrates using forward slashes for file paths.
    Log     Path with forward slashes: C:/Users/Trainer  # Logs: "Path with forward slashes: C:/Users/Trainer"

Escaping Leading and Trailing Spaces
    [Documentation]    Demonstrates escaping leading and trailing spaces.
    Log     \ \ \ \ spaced out\  # Four leading, one trailing space
    # Logs: "    spaced out "

Using SPACE Variable for Indentation
    [Documentation]    Demonstrates using the ${SPACE} variable for visible spaces.
    Log     ${SPACE}${SPACE}Indented Line  # Logs: "  Indented Line"
    Log     ${2*SPACE}Indented Line  # Logs: "  Indented Line"

Mixing Escapes and Variables
    [Documentation]    Demonstrates mixing escapes and variables in a string.
    ${text}=        Set Variable    Hello\ ${SPACE}World!
    Log         ${text}  # Logs: "Hello World!"
