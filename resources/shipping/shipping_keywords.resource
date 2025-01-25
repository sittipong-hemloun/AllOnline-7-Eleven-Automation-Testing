*** Settings ***
Resource    shipping_locators.resource
Library     SeleniumLibrary


*** Keywords ***
Perform Shipping Details
    [Documentation]    Fills out shipping information and proceeds.
    Click Element    ${TAB_ADDRESS}
    Wait Until Page Contains Element    ${ADD_ADDRESS_BUTTON}    timeout=10
    Click Element    ${ADD_ADDRESS_BUTTON}
    Wait Until Element Is Visible    ${SHIPPING_HOME_UPDATE_ICON}    timeout=10
    Click Element    ${SHIPPING_HOME_UPDATE_ICON}

    Input Text    ${FIRST_NAME_FIELD}    ชญานิศา
    Input Text    ${LAST_NAME_FIELD}    วงศ์ภักดี
    Input Text    ${MOBILE_FIELD}    0895678912
    Input Text    ${ADDRESS_NO_FIELD}    45/89

    Select Province Option    กรุงเทพมหานคร
    Select District Option    คลองเตย
    Select Subdistrict Option    คลองตัน

    Click Close Button in Modal
    Wait Until Element Is Visible    ${CONTINUE_PAYMENT_BUTTON}    timeout=10
    Click Button    ${CONTINUE_PAYMENT_BUTTON}

Select Province Option
    [Arguments]    ${province_name}
    Click Element    ${PROVINCE_SELECT}
    Wait Until Element Is Visible    //ul[contains(@class, 'select2-results__options')]
    Click Element    //li[contains(@class, 'select2-results__option') and text()='${province_name}']

Select District Option
    [Arguments]    ${district_name}
    Click Element    ${DISTRICT_SELECT}
    Wait Until Element Is Visible    //ul[contains(@class, 'select2-results__options')]
    Click Element    //li[contains(@class, 'select2-results__option') and text()='${district_name}']

Select Subdistrict Option
    [Arguments]    ${subdistrict_name}
    Click Element    ${SUBDISTRICT_SELECT}
    Wait Until Element Is Visible    //ul[contains(@class, 'select2-results__options')]
    Click Element    //li[contains(@class, 'select2-results__option') and text()='${subdistrict_name}']

Click Close Button in Modal
    Wait Until Element Is Visible    ${CLOSE_MAP_MODAL_BUTTON}    timeout=10
    Click Button    ${CLOSE_MAP_MODAL_BUTTON}
