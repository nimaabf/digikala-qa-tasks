*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}      https://www.digikala.com/users/login/?backUrl=/
${VALID_EMAIL}    nima.ab.graphic@gmail.com
${VALID_PASS}     Abc@1234
${INVALID_PASS}   wrong_password
${CLOSE_POPUP_BTN}    xpath=//button[contains(., 'نه')]

*** Test Cases ***

Valid Login Should Succeed
    Open Browser    ${LOGIN_URL}    Chrome
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@name='username']    timeout=10
    Input Text    xpath=//input[@name='username']    ${VALID_EMAIL}
    Click Button    xpath=//button[@type='submit' and @data-cro-id='login-register']
    Wait Until Element Is Visible    xpath=//input[@name='password']    timeout=10
    Input Text    xpath=//input[@name='password']    ${VALID_PASS}
    Click Button    xpath=//button[@type='submit']
    Wait Until Element Is Visible    ${CLOSE_POPUP_BTN}    10s
    Click Element   ${CLOSE_POPUP_BTN}
    Wait Until Element Is Visible    xpath=//div[@data-cro-id='HP-profile-header']    timeout=10
    [Teardown]    Close Browser

Invalid Login Should Show Error
    Open Browser    ${LOGIN_URL}    Chrome
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@name='username']    timeout=10
    Input Text    xpath=//input[@name='username']    ${VALID_EMAIL}
    Click Button    xpath=//button[@type='submit' and @data-cro-id='login-register']
    Wait Until Element Is Visible    xpath=//input[@name='password']    timeout=10
    Input Text    xpath=//input[@name='password']    ${INVALID_PASS}
    Click Button    xpath=//button[@type='submit']
    Wait Until Page Contains    اطلاعات کاربری نادرست است    timeout=10
    [Teardown]    Close Browser
