*** Settings ***
Resource    payment_locators.resource
Library     SeleniumLibrary


*** Keywords ***
Select Cash Payment
    [Documentation]    Selects cash payment at 7-Eleven store option.
    Click Element    ${CASH_COUNTERSERVICE_TAB}

Verify Shipping Info
    [Documentation]    Verifies name, phone, and address info on the payment page.
    Element Should Contain    ${ADDRESS_INFO_FIELD}    ชญานิศา วงศ์ภักดี
    Element Should Contain    ${ADDRESS_INFO_FIELD}    0895678912
    Element Should Contain    ${ADDRESS_INFO_FIELD}    45/89 , คลองตัน คลองเตย กรุงเทพมหานคร 10110

Verify Product Info
    [Documentation]    Verifies product name, quantity, and price on the payment summary.
    [Arguments]    ${product1}    ${product2}    ${product3}

    # First product
    Element Text Should Be    ${AMARIT_NAME_CELL}    ${product1}
    Element Text Should Be    //tbody/tr[3]/td[3]    1
    Element Text Should Be    ${AMARIT_PRICE_CELL}    ฿ 119

    # Second product
    Element Text Should Be    //td[contains(text(),'แอคเน่-เอด ไฟว์ อิน วัน วอช ออยล์ คอนโทรล 100 มล.')]    ${product2}
    Element Text Should Be    //tbody/tr[6]/td[3]    1
    Element Text Should Be    //td[contains(text(),'฿ 149')]    ฿ 149

    # Third product
    Element Text Should Be    //td[contains(text(),'มาลี น้ำส้มแมนดาริน 100% 1,000 มล.')]    ${product3}
    Element Text Should Be    //tbody/tr[9]/td[3]    1
    Element Text Should Be    //td[contains(text(),'฿ 149')]    ฿ 149

    # Totals
    Element Text Should Be    //b[contains(text(),'฿ 417')]    ฿ 417
    Element Text Should Be    //b[contains(text(),'฿ 50')]    ฿ 50
    Element Text Should Be    //span[@id='totalAmount']    ฿ 467
    Element Text Should Be    //b[@class='font-normal font-Online']    123

Confirm Payment
    [Documentation]    Clicks to confirm payment.
    Click Button    ${PAYMENT_BUTTON}

Verify Payment Page
    [Documentation]    Verifies that the payment barcode and invoice number appear.
    Page Should Contain    ${BARCODE_LABEL}
    Page Should Contain    ${INVOICE_LABEL}
