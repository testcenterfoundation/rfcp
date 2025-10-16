# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-24.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io

*** Settings ***
Documentation       LO-3.3.5    K2    Understand the purpose and syntax of the [Arguments] setting in User Keywords.
...
...                 This demo showcases user keyword arguments in Robot Framework:
...                 - Basic required arguments with [Arguments] setting
...                 - Optional arguments with default values
...                 - Variable arguments (@{args}) for flexible parameter lists
...                 - Keyword arguments (&{kwargs}) for named parameters
...                 - Argument validation and error handling patterns

Library             Browser

Test Setup          Open Browser And Set Context


*** Test Cases ***
Demonstrate Basic Required Arguments
    [Documentation]    Show how to use keywords with required arguments.
    ...
    ...                Required arguments must be provided when calling the keyword.
    ...                This is the most common pattern for user keywords.

    Log To Console      \n=== BASIC REQUIRED ARGUMENTS ===

    # Navigate to login page
    Click               data-test=nav-sign-in

    # Use keyword with required arguments
    Login User          customer@practicesoftwaretesting.com    welcome01
    Verify Page Title   My account

    # Try different user
    Logout User
    Click               data-test=nav-sign-in
    Login User          admin@practicesoftwaretesting.com       welcome01
    Verify Page Title   Sales

Demonstrate Optional Arguments with Defaults
    [Documentation]    Show how to create keywords with optional arguments.
    ...
    ...                Optional arguments have default values that are used
    ...                when the argument is not provided by the caller.

    Log To Console      \n=== OPTIONAL ARGUMENTS WITH DEFAULTS ===

    # Test with all arguments provided
    Create Test User    John Doe    john@example.com    admin    Development

    # Test with some arguments using defaults
    Create Test User    Jane Smith    jane@example.com    user

    # Test with only required arguments (rest use defaults)
    Create Test User    Bob Johnson    bob@example.com

    # Test navigation with default browser action
    Navigate To Page    https://practicesoftwaretesting.com

    # Test navigation with custom browser action
    Navigate To Page    https://practicesoftwaretesting.com    ${True}

Demonstrate Variable Arguments
    [Documentation]    Show how to handle variable numbers of arguments.
    ...
    ...                Variable arguments (@{args}) allow keywords to accept
    ...                any number of positional arguments.

    Log To Console      \n=== VARIABLE ARGUMENTS ===

    # Test with different numbers of arguments
    Log Multiple Messages    Single message

    Log Multiple Messages    First message    Second message

    Log Multiple Messages    Message 1    Message 2    Message 3    Message 4

    # Search for multiple products
    Search For Products    Hammer
    Search For Products    Hammer    Screwdriver
    Search For Products    Hammer    Screwdriver    Pliers    Wrench

Demonstrate Keyword Arguments
    [Documentation]    Show how to handle named keyword arguments.
    ...
    ...                Keyword arguments (&{kwargs}) allow keywords to accept
    ...                named parameters for flexible configuration.

    Log To Console      \n=== KEYWORD ARGUMENTS ===

    # Configure browser with various options
    Configure Browser Session    browser=chromium    headless=${False}
    Configure Browser Session    browser=firefox     headless=${True}     slowMo=500
    Configure Browser Session    browser=webkit      headless=${False}    timeout=60

    # Create user profiles with different configurations
    Create User Profile    name=Test User 1    email=test1@example.com
    Create User Profile    name=Test User 2    email=test2@example.com    role=admin    active=${True}
    Create User Profile    name=Test User 3    email=test3@example.com    role=user     active=${False}    department=QA

Demonstrate Mixed Argument Types
    [Documentation]    Show how to combine different argument types in one keyword.
    ...
    ...                Real-world keywords often combine required, optional,
    ...                variable, and keyword arguments for maximum flexibility.

    Log To Console      \n=== MIXED ARGUMENT TYPES ===

    # Process order with various configurations
    Process Order       ORD-001    Basic processing
    Process Order       ORD-002    Express processing    priority=high
    Process Order       ORD-003    Bulk processing       expedited=${True}    notifications=${False}
    Process Order       ORD-004    Custom processing     priority=medium    department=shipping    notify_customer=${True}

    # Validate form fields with different approaches
    Validate Form Fields    email    password
    Validate Form Fields    email    password    confirm_password    required=${True}
    Validate Form Fields    email    password    phone             required=${False}    format=standard

Demonstrate Argument Validation
    [Documentation]    Show how to validate arguments in user keywords.
    ...
    ...                Argument validation helps ensure keywords are used correctly
    ...                and provides clear error messages for invalid usage.

    Log To Console      \n=== ARGUMENT VALIDATION ===

    # Valid arguments
    Connect To Database    postgresql    localhost    5432    testdb    testuser    testpass

    # Test validation with different scenarios
    TRY
        Connect To Database    invalid_type    localhost    5432    testdb    testuser    testpass
    EXCEPT    AS    ${error}
        Log To Console      Caught expected validation error: ${error}
    END

    # Test email validation
    Validate Email Address    user@example.com
    Validate Email Address    test.user+tag@domain.co.uk

    TRY
        Validate Email Address    invalid-email
    EXCEPT    AS    ${error}
        Log To Console      Caught email validation error: ${error}
    END

Demonstrate Complex Real-World Scenarios
    [Documentation]    Show practical examples of argument usage in realistic scenarios.

    Log To Console      \n=== REAL-WORLD SCENARIOS ===

    # E-commerce workflow with flexible product selection
    Add Products To Cart    Hammer    Screwdriver
    Update Cart Item        Hammer    quantity=2
    Apply Discount Code     code=SAVE10    percentage=${10}
    Process Checkout        payment_method=credit_card    shipping=express    insurance=${True}


*** Keywords ***
Open Browser And Set Context
    [Documentation]    Initialize browser context for testing.

    New Browser    headless=${False}    slowMo=1s
    New Context
    New Page    https://practicesoftwaretesting.com

Login User
    [Arguments]    ${email}    ${password}
    [Documentation]    Log in a user with email and password.
    ...
    ...                Arguments:
    ...                - email: User's email address (required)
    ...                - password: User's password (required)

    Log To Console      Logging in user: ${email}
    Fill Text           data-test=email       ${email}
    Fill Text           data-test=password    ${password}
    Click               data-test=login-submit

Verify Page Title
    [Arguments]    ${expected_title}
    [Documentation]    Verify the page title contains expected text.
    ...
    ...                Arguments:
    ...                - expected_title: Text that should be in the page title

    ${actual_title}=    Get Text    data-test=page-title
    Should Contain      ${actual_title}    ${expected_title}
    Log To Console      Verified page title contains: ${expected_title}

Logout User
    [Documentation]    Log out the current user if logged in.

    TRY
        Click           data-test=nav-user-menu
        Click           data-test=nav-sign-out
        Log To Console  User logged out successfully
    EXCEPT
        Log To Console  No user to log out (not logged in)
    END

Create Test User
    [Arguments]    ${name}    ${email}    ${role}=user    ${department}=General
    [Documentation]    Create a test user with optional role and department.
    ...
    ...                Arguments:
    ...                - name: Full name of the user (required)
    ...                - email: Email address (required)
    ...                - role: User role (optional, default: user)
    ...                - department: User department (optional, default: General)

    Log To Console      Creating user: ${name}
    Log To Console      Email: ${email}
    Log To Console      Role: ${role}
    Log To Console      Department: ${department}

Navigate To Page
    [Arguments]    ${url}    ${new_tab}=${False}
    [Documentation]    Navigate to a specific URL with optional new tab.
    ...
    ...                Arguments:
    ...                - url: Target URL (required)
    ...                - new_tab: Whether to open in new tab (optional, default: False)

    IF    ${new_tab}
        # Simulate new tab behavior
        Log To Console      Opening ${url} in new tab
    ELSE
        Log To Console      Navigating to ${url} in current tab
        Go To               ${url}
    END

Log Multiple Messages
    [Arguments]    @{messages}
    [Documentation]    Log multiple messages using variable arguments.
    ...
    ...                Arguments:
    ...                - @{messages}: Variable number of messages to log

    ${count}=           Get Length    ${messages}
    Log To Console      Logging ${count} messages:

    FOR    ${index}    ${message}    IN ENUMERATE    @{messages}
        Log To Console      Message ${index + 1}: ${message}
    END

Search For Products
    [Arguments]    @{products}
    [Documentation]    Search for multiple products sequentially.
    ...
    ...                Arguments:
    ...                - @{products}: Variable number of product names to search

    Log To Console      Searching for ${products.__len__()} products
    FOR    ${product}    IN    @{products}
        Log To Console      Searching for: ${product}
        Fill Text           data-test=search-query    ${product}
        Click               data-test=search-submit
        Sleep               1s    # Demo delay
        Fill Text           data-test=search-query    ${EMPTY}    # Clear search
    END

Configure Browser Session
    [Arguments]    &{config}
    [Documentation]    Configure browser session with keyword arguments.
    ...
    ...                Arguments:
    ...                - &{config}: Browser configuration options
    ...                  - browser: Browser type (chromium, firefox, webkit)
    ...                  - headless: Run in headless mode (True/False)
    ...                  - slowMo: Slow motion delay in milliseconds
    ...                  - timeout: Default timeout in seconds

    Log To Console      Configuring browser session:
    FOR    ${key}    ${value}    IN    &{config}
        Log To Console      ${key}: ${value}
    END

    # Simulate configuration application
    ${browser}=         Get From Dictionary    ${config}    browser    default=chromium
    ${headless}=        Get From Dictionary    ${config}    headless   default=${False}
    ${slowMo}=          Get From Dictionary    ${config}    slowMo     default=1000

    Log To Console      Applied configuration: ${browser}, headless=${headless}, slowMo=${slowMo}

Create User Profile
    [Arguments]    &{profile_data}
    [Documentation]    Create user profile with flexible keyword arguments.
    ...
    ...                Arguments:
    ...                - &{profile_data}: User profile data
    ...                  - name: User's full name (required)
    ...                  - email: User's email (required)
    ...                  - role: User role (optional)
    ...                  - active: Account status (optional)
    ...                  - department: User department (optional)

    # Extract required fields
    ${name}=            Get From Dictionary    ${profile_data}    name
    ${email}=           Get From Dictionary    ${profile_data}    email

    Log To Console      Creating profile for: ${name} (${email})

    # Process optional fields
    FOR    ${key}    ${value}    IN    &{profile_data}
        IF    '${key}' not in ['name', 'email']
            Log To Console      Additional field - ${key}: ${value}
        END
    END

Process Order
    [Arguments]    ${order_id}    ${description}    @{items}    &{options}
    [Documentation]    Process order with mixed argument types.
    ...
    ...                Arguments:
    ...                - order_id: Unique order identifier (required)
    ...                - description: Order description (required)
    ...                - @{items}: Variable number of order items
    ...                - &{options}: Additional processing options

    Log To Console      Processing order: ${order_id}
    Log To Console      Description: ${description}

    ${item_count}=      Get Length    ${items}
    IF    ${item_count} > 0
        Log To Console      Order items (${item_count}):
        FOR    ${item}    IN    @{items}
            Log To Console      - ${item}
        END
    END

    IF    ${options}
        Log To Console      Processing options:
        FOR    ${key}    ${value}    IN    &{options}
            Log To Console      - ${key}: ${value}
        END
    END

Validate Form Fields
    [Arguments]    @{field_names}    &{validation_options}
    [Documentation]    Validate form fields with flexible configuration.
    ...
    ...                Arguments:
    ...                - @{field_names}: List of field names to validate
    ...                - &{validation_options}: Validation configuration options

    ${required}=        Get From Dictionary    ${validation_options}    required    default=${True}
    ${format}=          Get From Dictionary    ${validation_options}    format      default=default

    Log To Console      Validating ${field_names.__len__()} fields (required=${required}, format=${format}):
    FOR    ${field}    IN    @{field_names}
        Log To Console      Validating field: ${field}
    END

Connect To Database
    [Arguments]    ${db_type}    ${host}    ${port}    ${database}    ${username}    ${password}
    [Documentation]    Connect to database with argument validation.
    ...
    ...                Arguments:
    ...                - db_type: Database type (postgresql, mysql, oracle)
    ...                - host: Database host
    ...                - port: Database port
    ...                - database: Database name
    ...                - username: Database username
    ...                - password: Database password

    # Validate database type
    @{valid_types}=     Create List    postgresql    mysql    oracle    sqlite
    IF    '${db_type}' not in @{valid_types}
        Fail            Invalid database type: ${db_type}. Valid types: ${valid_types}
    END

    # Validate port is numeric
    TRY
        ${port_int}=    Convert To Integer    ${port}
    EXCEPT
        Fail            Port must be a valid integer: ${port}
    END

    Log To Console      Connecting to ${db_type} database:
    Log To Console      Host: ${host}:${port}
    Log To Console      Database: ${database}
    Log To Console      Username: ${username}

Validate Email Address
    [Arguments]    ${email}
    [Documentation]    Validate email address format.
    ...
    ...                Arguments:
    ...                - email: Email address to validate

    # Simple email validation using regex
    ${is_valid}=        Evaluate    re.match(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$', '${email}')

    IF    not ${is_valid}
        Fail            Invalid email format: ${email}
    END

    Log To Console      Valid email address: ${email}

Add Products To Cart
    [Arguments]    @{products}
    [Documentation]    Add multiple products to shopping cart.

    FOR    ${product}    IN    @{products}
        Log To Console      Adding to cart: ${product}
    END

Update Cart Item
    [Arguments]    ${product}    &{updates}
    [Documentation]    Update cart item with various options.

    Log To Console      Updating cart item: ${product}
    FOR    ${key}    ${value}    IN    &{updates}
        Log To Console      Update ${key} to ${value}
    END

Apply Discount Code
    [Arguments]    &{discount_info}
    [Documentation]    Apply discount code with options.

    ${code}=            Get From Dictionary    ${discount_info}    code
    Log To Console      Applying discount code: ${code}

Process Checkout
    [Arguments]    &{checkout_options}
    [Documentation]    Process checkout with various options.

    Log To Console      Processing checkout with options:
    FOR    ${key}    ${value}    IN    &{checkout_options}
        Log To Console      ${key}: ${value}
    END
