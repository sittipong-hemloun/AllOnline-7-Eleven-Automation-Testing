*** Settings ***
Documentation       This test suite contains test cases for invalid login scenarios.

Library             SeleniumLibrary
Resource            ../resources/authentication/login_keywords.resource

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
    [Documentation]    Customers order products, choose delivery according to their address, and pay in cash at 7-Eleven stores.
    [Tags]    smoke

    Perform Login Test    ${username}    ${password}


    # Homw Page
    # Wait unitl page load
    Wait Until Page Contains Element    //input[@placeholder='ค้นหาชื่อสินค้าหรือแบรนด์']    timeout=10
    Click Element    //div[@id='alert-cookie-gdpr-allonline__button']

    # search for products
    Input Text    //input[@placeholder='ค้นหาชื่อสินค้าหรือแบรนด์']    ${product_name1}
    Click Element    //button[@class='btn btn-default search']//span[@class='glyphicon glyphicon-icon-search']
    Click Element    (//a[contains(@title, '${product_name1}')])[1]
    Wait Until Page Contains Element
    ...    //button[@class='btn btn-addtocart btn-green gradient broad add-to-cart add-to-cart-cls-mobile']
    Click Element    //button[@class='btn btn-addtocart btn-green gradient broad add-to-cart add-to-cart-cls-mobile']

    Input Text    //input[@placeholder='ค้นหาชื่อสินค้าหรือแบรนด์']    ${product_name2}
    Click Element    //button[@class='btn btn-default search']//span[@class='glyphicon glyphicon-icon-search']
    Click Element    (//a[contains(@title, '${product_name2}')])[1]
    Wait Until Page Contains Element
    ...    //button[@class='btn btn-addtocart btn-green gradient broad add-to-cart add-to-cart-cls-mobile']
    Click Element    //button[@class='btn btn-addtocart btn-green gradient broad add-to-cart add-to-cart-cls-mobile']

    Input Text    //input[@placeholder='ค้นหาชื่อสินค้าหรือแบรนด์']    ${product_name3}
    Click Element    //button[@class='btn btn-default search']//span[@class='glyphicon glyphicon-icon-search']
    Click Element    (//a[contains(@title, '${product_name3}')])[1]
    Wait Until Page Contains Element
    ...    //button[@class='btn btn-addtocart btn-green gradient broad add-to-cart add-to-cart-cls-mobile']
    Click Element    //button[@class='btn btn-addtocart btn-green gradient broad add-to-cart add-to-cart-cls-mobile']

    Wait Until Page Contains Element
    ...    //a[@class='btn btn-confirm btn-green gradient wide btn-half pull-right proceed']
    ...    timeout=10
    Click Element    //a[@class='btn btn-confirm btn-green gradient wide btn-half pull-right proceed']

    # Shipping Page
    Wait Until Page Contains Element    //a[@class='tab-address']
    Click Element    //a[@class='tab-address']

    Wait Until Page Contains Element    //div[normalize-space()='+']
    Click Element    //div[normalize-space()='+']

    Wait Until Element Is Visible
    ...    //div[@class='dropdown address-dropdown address-0-book']//div//div[@class='shipping-home-update']//img[@loading='lazy']
    Click Element
    ...    //div[@class='dropdown address-dropdown address-0-book']//div//div[@class='shipping-home-update']//img[@loading='lazy']

    Perform Shipping Details

    Click Element    //div[contains(@class,'payment-option-tab COUNTERSERVICE_CASH-tab')]//div[2]

    # Payment Page
    Element Should Contain    //span[contains(@class,'address ellipsis-full')]    ชญานิศา วงศ์ภักดี
    Element Should Contain    //span[contains(@class,'address ellipsis-full')]    0895678912
    Element Should Contain
    ...    //span[contains(@class,'address ellipsis-full')]
    ...    45/89 , คลองตัน คลองเตย กรุงเทพมหานคร 10110

    Element Text Should Be    //td[contains(text(),'AMARIT คอลลาเจน 30 แคปซูล')]    ${product_name1}
    Element Text Should Be    //tbody/tr[3]/td[3]    1
    Element Text Should Be    //td[contains(text(),'฿ 119')]    ฿ 119

    Element Text Should Be
    ...    //td[contains(text(),'แอคเน่-เอด ไฟว์ อิน วัน วอช ออยล์ คอนโทรล 100 มล.')]
    ...    ${product_name2}
    Element Text Should Be    //tbody/tr[6]/td[3]    1
    Element Text Should Be    //td[contains(text(),'฿ 149')]    ฿ 149

    Element Text Should Be    //td[contains(text(),'มาลี น้ำส้มแมนดาริน 100% 1,000 มล.')]    ${product_name3}
    Element Text Should Be    //tbody/tr[9]/td[3]    1
    Element Text Should Be    //td[contains(text(),'฿ 149')]    ฿ 149

    Element Text Should Be    //b[contains(text(),'฿ 417')]    ฿ 417
    Element Text Should Be    //b[contains(text(),'฿ 50')]    ฿ 50
    Element Text Should Be    //span[@id='totalAmount']    ฿ 467
    Element Text Should Be    //b[@class='font-normal font-Online']    123

    Click Button
    ...    //button[@class='btn js-pdbc btn-proceed btn-green gradient btn-lg btn-half wide pull-right space-down continue-payment-btn continue-payment-btn-popup']

    Page Should Contain    //div[contains(text(),'ชำระด้วยบาร์โค้ดผ่าน')]
    Page Should Contain    //td[contains(text(),'เลขที่ใบแจ้งสินค้า')]


*** Keywords ***
Perform Login Test
    [Arguments]    ${username}    ${password}
    Open Login Page
    When Login with user and password    username=${username}    password=${password}

Perform Shipping Details
    # Shipping Page
    [Documentation]    Perform shipping details.

    Input Text    //input[@id='new-address-name']    ชญานิศา
    Input Text    //input[@id='new-address-lastname']    วงศ์ภักดี
    Input Text    //input[@id='new-address-mobile']    0895678912
    Input Text    //input[@id='new-address-addrno']    45/89

    Select Province Option    กรุงเทพมหานคร
    Select District Option    คลองเตย
    Select Subdistrict Option    คลองตัน

    Click Close Button in Modal

    Wait Until Element Is Visible    //button[@id='continue-payment-btn']

    Click Button    //button[@id='continue-payment-btn']

Select Province Option
    [Arguments]    ${province_name}
    Click Element    //span[@id='select2-new-address-province-container']
    Wait Until Element Is Visible    //ul[contains(@class, 'select2-results__options')]
    Click Element    //li[contains(@class, 'select2-results__option') and text()='${province_name}']

Select District Option
    [Arguments]    ${district_name}
    Click Element    //span[@id='select2-new-address-district-container']
    Wait Until Element Is Visible    //ul[contains(@class, 'select2-results__options')]
    Click Element    //li[contains(@class, 'select2-results__option') and text()='${district_name}']

Select Subdistrict Option
    [Arguments]    ${subdistrict_name}
    Click Element    //span[@id='select2-new-address-sub-district-container']
    Wait Until Element Is Visible    //ul[contains(@class, 'select2-results__options')]
    Click Element    //li[contains(@class, 'select2-results__option') and text()='${subdistrict_name}']

Click Close Button in Modal
    Wait Until Element Is Visible    //div[@id='gcp-map']//button[@type='button'][normalize-space()='x']
    Click Button    //div[@id='gcp-map']//button[@type='button'][normalize-space()='x']
