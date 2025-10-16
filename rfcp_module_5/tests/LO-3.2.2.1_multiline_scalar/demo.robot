# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-24.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Settings ***
Documentation       LO-3.2.2.1-2    K2    Understand how multiple lines can be used to define scalar variables
...
...                 This demo illustrates the powerful multiline variable feature in Robot Framework:
...                 - Defining long text content across multiple lines for better readability
...                 - Using different separators (space vs newline vs custom)
...                 - Practical applications in forms, messages, and configuration

Library             Browser

Test Setup          Open Browser And Set Context


*** Variables ***
# === MULTILINE VARIABLES WITH SPACE SEPARATOR (DEFAULT) ===
# When no separator is specified, parts are joined with single spaces
# This is useful for long sentences or paragraphs that should flow together

${MULTILINE_SPACE}      Value split across
...                     multiple lines
...                     for readability.
# Result: "Value split across multiple lines for readability."

${LONG_PRODUCT_DESC}    This is a comprehensive description of our premium hammer
...                     which features an ergonomic handle design
...                     and a balanced weight distribution
...                     for optimal performance in construction tasks.

# === MULTILINE VARIABLES WITH NEWLINE SEPARATOR ===
# Using separator=\n preserves line breaks in the final text
# This is essential for multi-paragraph content, addresses, or poetry

${MULTILINE_NEWLINE}    Line one
...                     Line two
...                     Line three
...                     Line four with a bit more text
...                     separator=\n

${CONTACT_MESSAGE}      Dear Customer Service Team,
...
...                     I am writing to inquire about the return policy
...                     for the hammer I purchased last week.
...
...                     Please let me know the next steps.
...
...                     Best regards,
...                     John Doe
...                     separator=\n

# === MULTILINE VARIABLES WITH CUSTOM SEPARATORS ===
# Custom separators allow for specific formatting needs

${CSV_PRODUCTS}         Hammer
...                     Screwdriver
...                     Pliers
...                     Wrench
...                     separator=,

${PIPE_SEPARATED}       value1
...                     value2
...                     value3
...                     separator= |

# === MULTILINE VARIABLES WITH NO SEPARATOR ===
# Using empty separator concatenates parts without any separator

${CONCATENATED}         Robot
...                     Framework
...                     Testing
...                     separator=${EMPTY}
# Result: "RobotFrameworkTesting"


*** Test Cases ***
Demonstrate Multiline Variables with Logging
    [Documentation]    This test demonstrates different multiline variable types by logging their values.
    ...
    ...                Learning objectives:
    ...                - Understand how different separators affect the final variable value
    ...                - See practical examples of multiline variable usage
    ...                - Learn when to use each separator type

    Log To Console      \n=== SPACE-SEPARATED MULTILINE VARIABLES ===
    Log To Console      Multiline space: "${MULTILINE_SPACE}"
    Log To Console      Product description: "${LONG_PRODUCT_DESC}"

    Log To Console      \n=== NEWLINE-SEPARATED MULTILINE VARIABLES ===
    Log To Console      Multiline newline:\n${MULTILINE_NEWLINE}
    Log To Console      Contact message:\n${CONTACT_MESSAGE}

    Log To Console      \n=== CUSTOM SEPARATOR EXAMPLES ===
    Log To Console      CSV products: ${CSV_PRODUCTS}
    Log To Console      Pipe separated: ${PIPE_SEPARATED}
    Log To Console      Concatenated: ${CONCATENATED}

Complete Contact Form With Space-Separated Message
    [Documentation]    Use a space-separated multiline variable in a contact form.
    ...                This demonstrates how multiline variables work in real web forms.

    Click                   data-test=nav-contact
    Fill Text               data-test=first-name    John
    Fill Text               data-test=last-name     Doe
    Fill Text               data-test=email         test@example.com
    Select Options By       data-test=subject       text                    Return

    # The multiline variable with space separator creates a flowing paragraph
    Fill Text               data-test=message       ${MULTILINE_SPACE}

    Click                   data-test=contact-submit
    Get Text                .alert-success          contains                Thanks

    Log To Console          \nSubmitted message (space-separated): "${MULTILINE_SPACE}"

Complete Contact Form With Newline-Separated Message
    [Documentation]    Use a newline-separated multiline variable in a contact form.
    ...                This shows how to preserve line breaks in form submissions.

    Click                   data-test=nav-contact
    Fill Text               data-test=first-name    Jane
    Fill Text               data-test=last-name     Smith
    Fill Text               data-test=email         jane@example.com
    Select Options By       data-test=subject       text                    Return

    # The multiline variable with newline separator preserves line structure
    Fill Text               data-test=message       ${CONTACT_MESSAGE}

    Click                   data-test=contact-submit
    Get Text                .alert-success          contains                Thanks

    Log To Console          \nSubmitted message (newline-separated):\n${CONTACT_MESSAGE}

Demonstrate Dynamic Multiline Variable Creation
    [Documentation]    Show how multiline content can be created dynamically during test execution.
    ...                This is useful when content needs to be generated based on test conditions.

    # Create a multiline variable dynamically using VAR statement
    VAR    ${DYNAMIC_MESSAGE}    Thank you for your order!
    ...                          Your order number is: ${12345}
    ...                          Expected delivery: 3-5 business days
    ...                          separator=\n

    Log To Console          \nDynamically created multiline message:\n${DYNAMIC_MESSAGE}

    # Demonstrate building multiline content step by step
    ${LINE1}=               Set Variable    First line of dynamic content
    ${LINE2}=               Set Variable    Second line with timestamp: ${TIMESTAMP}
    ${LINE3}=               Set Variable    Third line with random data: ${RANDOM}

    ${BUILT_MESSAGE}=       Catenate        SEPARATOR=\n
    ...                     ${LINE1}
    ...                     ${LINE2}
    ...                     ${LINE3}

    Log To Console          \nStep-by-step built message:\n${BUILT_MESSAGE}


*** Keywords ***
Open Browser And Set Context
    [Documentation]    Initialize browser context for testing.
    ...                Sets up the browser with appropriate settings for demo visibility.

    New Browser    headless=${False}    slowMo=1s
    New Context
    New Page    https://practicesoftwaretesting.com

    # Create some variables for the dynamic demo
    Set Suite Variable    ${TIMESTAMP}    ${CURTIME}
    ${random_num}=        Evaluate        random.randint(1000, 9999)
    Set Suite Variable    ${RANDOM}       ${random_num}
