# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
*** Settings ***
# ==============================================================================
# SUITE DOCUMENTATION: Educational Annotation
# ==============================================================================
# The Documentation setting defines this suite's purpose and learning objective.
# This text appears in test reports and helps with suite identification.
# Multi-line documentation uses the '...' continuation marker.

Documentation       LO-2.1    K2    Understand which files and directories are considered suites and how they are structured in a suite tree.
...
...                 A top-level suite that runs after Root Suite


# ==============================================================================
# TEST CASES SECTION: Core Suite Content
# ==============================================================================
# Each suite file contains test cases that verify specific functionality.
# Test cases are the fundamental executable units in Robot Framework.

*** Test Cases ***
Top Level Test
    # Test case documentation explains the specific test purpose
    [Documentation]    This test logs a message indicating it is running.
    ...
    ...                LEARNING POINTS:
    ...                - Test cases are defined under *** Test Cases *** section
    ...                - Each test case must have a unique name within the suite
    ...                - Test steps are indented under the test case name
    ...                - Robot Framework uses keyword-driven test automation

    # The Log keyword is a built-in keyword that outputs messages to the test log
    # This demonstrates the most basic test action in Robot Framework
    Log     Running Top Level Test
