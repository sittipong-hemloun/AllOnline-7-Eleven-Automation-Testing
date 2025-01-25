*** Settings ***
Resource    ../commons/browser.resource
Resource    home_locators.resource
Library     SeleniumLibrary
Library     String

*** Keywords ***
Close Cookie Banner
    [Documentation]    Closes the GDPR cookie banner if visible.
    Wait Until Page Contains Element    ${COOKIE_GDPR_BUTTON}    timeout=10
    Click Element    ${COOKIE_GDPR_BUTTON}

Search and Add Product to Cart
    [Documentation]    Searches for the given product by name and adds it to the cart.
    [Arguments]        ${product_name}
    Input Text         ${SEARCH_BAR}    ${product_name}
    Click Element      ${SEARCH_BUTTON}
    ${PRODUCT_LINK}=    Replace String    ${PRODUCT_TITLE_LINK}    {PRODUCT_NAME}    ${product_name}
    Click Element      ${PRODUCT_LINK}
    Wait Until Page Contains Element    ${ADD_TO_CART_BUTTON}    timeout=10
    Click Element      ${ADD_TO_CART_BUTTON}

Proceed to Checkout
    [Documentation]    Proceeds to checkout from the cart.
    Wait Until Page Contains Element    ${PROCEED_BUTTON}    timeout=10
    Click Element      ${PROCEED_BUTTON}
