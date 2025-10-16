# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Settings ***
Documentation       LO-2.3.4    K2    Understand the difference between log messages and console output.


*** Test Cases ***
Demonstrate Log Messages And Console Output
    [Documentation]    This test demonstrates the difference between log messages and console output.

    Log To Console      This is a console message. You will see this immediately in the terminal.
    Log                 This is a log message. You will NOT see this in the terminal.

    Log To Console      Logging to console is useful for real-time updates.
    Log                 Log messages are stored in output.xml and shown in log.html.

    Log                 This is an INFO level log message.
    Log                 This is a WARN level message.           WARN
    Log                 This is a DEBUG message.                DEBUG
