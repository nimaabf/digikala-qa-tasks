*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                https://www.digikala.com
${CLOSE_POPUP_BTN}    xpath=//button[contains(., 'فعلا نه')]
${SEARCH_BOX}         xpath=//span[@data-cro-id='searchbox-type']
${SEARCH_INPUT}       xpath=//input[@type='text']
${SEARCH_TEXT}        گوشی موبایل
${PRODUCT_LINK}       xpath=(//div[contains(@class, 'product-list_ProductList__item__LiiNI')])[1]//a
${ADD_TO_CART_BTN}    xpath=//button[@data-cro-id='pdp-add-to-cart']
${CART_PAGE_URL}      https://www.digikala.com/checkout/cart/
${CONTINUE_SHOPPING_BTN}  xpath=//a[@data-cro-id='cart-continue-shopping' and contains(., 'تایید و تکمیل سفارش')]

*** Test Cases ***

Add Product To Cart Without Login
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible   ${CLOSE_POPUP_BTN}    10s
    Click Element   ${CLOSE_POPUP_BTN}
    Wait Until Element Is Visible   ${SEARCH_BOX}    10s
    Click Element   ${SEARCH_BOX}
    Wait Until Element Is Visible   ${SEARCH_INPUT}    10s
    Input Text      ${SEARCH_INPUT}     ${SEARCH_TEXT}
    Press Keys      ${SEARCH_INPUT}     RETURN
    Wait Until Page Contains Element   ${PRODUCT_LINK}    10s
    Click Element   ${PRODUCT_LINK}
    
    ${WINDOWS}=    Get Window Handles
    Switch Window    ${WINDOWS[1]}
    
    Wait Until Element Is Visible   ${ADD_TO_CART_BTN}   20s
    Click Button    ${ADD_TO_CART_BTN}
    Sleep           3s

    Go To    ${CART_PAGE_URL}
    Wait Until Page Contains Element   ${CONTINUE_SHOPPING_BTN}   20s
    Click Element    ${CONTINUE_SHOPPING_BTN}
    Sleep           5s

    [Teardown]      Close Browser
