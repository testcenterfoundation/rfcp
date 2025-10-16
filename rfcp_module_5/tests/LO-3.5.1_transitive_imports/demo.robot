# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-24.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Settings ***
Documentation       LO-3.5.1    K2    Understand how transitive imports of resource files and libraries work.

Resource            resources/functional_keywords.resource


*** Test Cases ***
Demo Transitive Imports
    [Documentation]    This test verifies transitive imports by opening and navigating.
    Open And Navigate
