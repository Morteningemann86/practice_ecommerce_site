*** Settings ***
Library    RPA.Browser.Playwright    AS    PLAY
Variables    variables.py

*** Keywords ***
Open E-Commerce Site
    PLAY.Open Browser    ${URL_ECOMMERCE_SITE}
    PLAY.Wait For Elements State    xpath=//*[@id="login-button"]    