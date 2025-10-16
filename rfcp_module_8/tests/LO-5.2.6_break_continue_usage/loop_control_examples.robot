# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-29.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Settings ***
Documentation       LO-5.2.6    K2    Understand the purpose and basic concept of the BREAK and CONTINUE statements
...
...                 CONTINUE: Skips the rest of the current iteration and moves to the next
...                 BREAK: Immediately exits the loop entirely
...                 These statements help optimize loops and handle special cases efficiently.

Library             Collections    # For list manipulation


*** Variables ***
# Sample data representing shopping cart with some invalid items
@{CART_ITEMS}           Apple    Banana    Expired Milk    Orange    Damaged Cereal

# Inventory with an out-of-stock item in the middle
@{INVENTORY_ITEMS}      Apple    Banana    Grapes    Out Of Stock – Watermelon    Orange


*** Test Cases ***
Continue Example – Only Process Good Items
    [Documentation]    This test shows how CONTINUE can be used to skip expired or damaged items in a cart.
    ...                CONTINUE allows the loop to skip unwanted items and process only valid ones.
    ...                Real-world use: Data filtering, validation, cleaning operations.

    # Process the cart items, skipping invalid ones
    ${processed}        Process Valid Cart Items                @{CART_ITEMS}

    # Display the results
    Log To Console      \nProcessed Items: ${processed}

    # Verify that only valid items were processed
    List Should Contain Value               ${processed}        Apple
    List Should Contain Value               ${processed}        Banana
    List Should Not Contain Value           ${processed}        Expired Milk      # Skipped by CONTINUE
    List Should Not Contain Value           ${processed}        Damaged Cereal    # Skipped by CONTINUE

Break Example – Stop When Out Of Stock Item Is Found
    [Documentation]    This test shows how BREAK is used to stop checking items once an out-of-stock item is found.
    ...                BREAK immediately exits the loop when a specific condition is met.
    ...                Real-world use: Search operations, error handling, limit enforcement.

    # Scan inventory until we hit an out-of-stock item
    ${scanned}          Stop Processing At Out Of Stock         @{INVENTORY_ITEMS}

    # Display what was scanned before stopping
    Log To Console      \nScanned Items Before Out Of Stock: ${scanned}

    # Verify the loop stopped at the right point
    List Should Contain Value               ${scanned}          Grapes     # Processed before BREAK
    List Should Not Contain Value           ${scanned}          Orange     # Never reached due to BREAK


*** Keywords ***
Process Valid Cart Items
    [Documentation]    Returns a list of valid cart items, skipping expired or damaged items.
    ...                Demonstrates CONTINUE statement to filter items during iteration.
    [Arguments]    @{items}    # Accept list of items to process

    # Initialize empty list for valid items
    ${valid_items}    Create List

    # Iterate through all items
    FOR    ${item}    IN    @{items}
        # Check if item is expired
        ${is_expired}    Evaluate    "${item}".startswith("Expired")
        IF    ${is_expired}
            Log    Skipping expired item: ${item}
            CONTINUE    # Skip to next iteration
        END

        # Check if item is damaged
        ${is_damaged}    Evaluate    "${item}".startswith("Damaged")
        IF    ${is_damaged}
            Log    Skipping damaged item: ${item}
            CONTINUE    # Skip to next iteration
        END

        # If we reach here, item is valid
        Log    Adding valid item to cart: ${item}
        Append To List    ${valid_items}    ${item}
    END

    RETURN    ${valid_items}

Stop Processing At Out Of Stock
    [Documentation]    Returns a list of items scanned until an out-of-stock item is found, then stops processing.
    ...                Demonstrates BREAK statement to exit loop early when condition is met.
    [Arguments]    @{items}    # Accept list of inventory items

    # Initialize list for scanned items
    ${scanned_items}    Create List

    # Iterate through inventory
    FOR    ${item}    IN    @{items}
        # Check if current item is out of stock
        ${is_out_of_stock}    Evaluate    "${item}".startswith("Out Of Stock")

        IF    ${is_out_of_stock}
            # Found out-of-stock item - stop processing immediately
            Log    \nFound out-of-stock item: ${item} — stopping inventory scan.
            BREAK    # Exit the loop entirely
        END

        # Item is in stock - add to scanned list
        Log    Scanning in-stock item: ${item}
        Append To List    ${scanned_items}    ${item}
    END

    # Return all items scanned before the break
    RETURN    ${scanned_items}
