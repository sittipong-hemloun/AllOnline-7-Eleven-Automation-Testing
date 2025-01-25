*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${BASE_URL}     https://www.allonline.7eleven.co.th
${BROWSER}      chrome


*** Keywords ***
Open Maximized Browser And Navigate To
    [Arguments]    ${url}
    Open Browser    ${BASE_URL}${url}    ${BROWSER}
    Maximize Browser Window
