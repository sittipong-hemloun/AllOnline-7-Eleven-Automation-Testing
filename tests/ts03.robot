*** Settings ***
Documentation       This test suite contains test cases for an order flow.

Library             SeleniumLibrary
Resource            ../resources/authentication/login_keywords.resource
Resource            ../resources/home/home_keywords.resource
Resource            ../resources/shipping/shipping_keywords.resource
Resource            ../resources/payment/payment_keywords.resource

Test Setup          Open Maximized Browser And Navigate To    /
Test Teardown       Close Browser


*** Variables ***
${username}             ong22280@gmail.com
${password}             OngAng300%
${expected_message}     Invalid username or password
${product_name1}        AMARIT คอลลาเจน 30 แคปซูล
${product_name2}        แอคเน่-เอด ไฟว์ อิน วัน วอช ออยล์ คอนโทรล 100 มล.
${product_name3}        มาลี น้ำส้มแมนดาริน 100% 1,000 มล.
${BASKET_ITEMS}         //*[@id="mini-basket"]/a/span[1]


*** Test Cases ***
TS03 - The Customer Has Successfully Placed An Order
    [Documentation]    Customers order products, choose delivery, and pay in cash at 7-Eleven stores.
    [Tags]    smoke

    Perform Login    ${username}    ${password}

    Close Cookie Banner
    Search and Add Product to Cart    ${product_name1}
    Search and Add Product to Cart    ${product_name2}
    Search and Add Product to Cart    ${product_name3}
    Proceed to Checkout

    Perform Shipping Details

    Select Cash Payment
    Verify Shipping Info
    Verify Product Info    ${product_name1}    ${product_name2}    ${product_name3}

    Confirm Payment
    Verify Payment Page
