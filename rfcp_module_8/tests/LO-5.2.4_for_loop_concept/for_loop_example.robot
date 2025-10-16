# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-29.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Settings ***
Documentation       LO-5.2.4    K2    Understand the purpose and basic concept of FOR Loops
...
...                 Demonstrates the use of a basic FOR-IN loop to iterate through a list of values.


*** Variables ***
@{FRUITS}       apple    banana    cherry


*** Test Cases ***
Process Each Fruit Using FOR Loop
    [Documentation]    Demonstrates processing each fruit using a FOR loop.
    FOR    ${fruit}    IN    @{FRUITS}
        Log     Processing ${fruit}
    END

Process Each Fruit Without Loop (for comparison)
    [Documentation]    Demonstrates processing each fruit without using a FOR loop.
    Log     Processing apple
    Log     Processing banana
    Log     Processing cherry
