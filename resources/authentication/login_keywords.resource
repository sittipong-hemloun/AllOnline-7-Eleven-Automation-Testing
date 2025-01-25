*** Settings ***
Library     SeleniumLibrary
Resource    login_locators.resource
Resource    ../commons/browser.resource


*** Keywords ***
Perform Login
    [Arguments]    ${username}    ${password}
    Open Login Page
    Login with user and password    ${username}    ${password}

Open Login Page
    [Documentation]    Opens the Login page using the base URL.
    # Open Maximized Browser And Navigate To    /
    Click Element    //a[@class='btn-allmember-login nopd onLine']

Login with user and password
    [Arguments]    ${username}    ${password}
    Enter Credentials    ${username}    ${password}
    Click Login Button

Enter Credentials
    [Arguments]    ${username}    ${password}
    Input Text    ${USERNAME_FIELD}    ${username}
    Input Text    ${PASSWORD_FIELD}    ${password}

Click Login Button
    [Documentation]    Clicks the login button.
    Click Element    ${LOGIN_BUTTON}

Click Logout
    [Documentation]    Clicks the logout button.
    Click Link    ${LOGOUT_BUTTON}

Validate Message
    [Documentation]    Validates that a message is displayed.
    [Arguments]    ${expected_message}
    Element Should Contain    ${MESSAGE}    ${expected_message}
