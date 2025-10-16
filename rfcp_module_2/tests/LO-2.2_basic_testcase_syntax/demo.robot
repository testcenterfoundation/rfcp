# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Settings ***
Documentation       LO-2.2    K2    Understand the basic syntax of test cases and tasks.
...
...                 Demonstration of basic test case and task syntax in Robot Framework.

Resource            keywords.resource


*** Test Cases ***    # *** Tasks ***
Simple Keyword Call
    [Documentation]    This test demonstrates a simple keyword call.
    Log     Hello, Robot Framework!

Keyword Call With Arguments
    [Documentation]    This test demonstrates a keyword call with arguments.
    Log Many    Hello       from    a test case

Multiline Keyword Call
    [Documentation]    This test demonstrates a multiline keyword call.
    Log Many
    ...         This keyword call
    ...         spans multiple lines

Keyword Call With Assignment
    [Documentation]    This test demonstrates a keyword call with assignment.
    ${result}       Get Result Keyword
    Log             The result was: ${result}

Test Case With Setup And Teardown
    [Documentation]    This test demonstrates setup and teardown usage.

    #testcase specifice keyword
    [Setup]         Setup Keyword
    Log             Running the main body of this test
    [Teardown]      Teardown Keyword

Simple Task Example
    [Documentation]    This task demonstrates a simple task example.
    Log     Executing a task, not a test case.

Task With Continuation And Variables
    [Documentation]    This test demonstrates a task with continuation and variables.
    ${message}      Create Message
    Log
    ...             ${message}
