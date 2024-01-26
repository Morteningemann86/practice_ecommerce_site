*** Settings ***
Library         RPA.Browser.Playwright    AS    PLAY
Library         String
Library    Collections
Variables       variables.py


*** Keywords ***
Open E-Commerce Site
    Open Browser    ${URL_ECOMMERCE_SITE}
    Wait For Elements State    xpath=//*[@id="login-button"]

Get Usernames and Password From Login Page
    ${usernames}    get text    xpath=//*[@id="login_credentials"]
    ${usernames_list}    Split String    ${usernames}    \n
    Remove From List    ${usernames_list}    0
    ${password}    Get Text    xpath=//*[@class="login_password"]
    ${password_list}    Split String    ${password}    \n
    Remove From List    ${password_list}    0

    RETURN    ${usernames_list}    ${password_list}

Login to E-Commerce Site
    [Arguments]    ${username}    ${password}
    Fill Text    xpath=//*[@id="user-name"]    ${username}
    Fill Text    xpath=//*[@id="password"]    ${password}
    Click    xpath=//*[@id="login-button"]

    Wait For Elements State    xpath=//*[@class="title"]

Scrape Product Data
    