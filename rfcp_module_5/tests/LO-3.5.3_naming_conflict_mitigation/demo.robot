# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-24.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Settings ***
Documentation       LO-3.5.3    K2    Explain how naming conflicts can happen and how to mitigate them.

Library             Browser
Library             libraries/CustomerKeywords.py
Library             libraries/AdminKeywords.py


*** Test Cases ***
Demonstrate Conflict
    AdminKeywords.Login     admin       secret
