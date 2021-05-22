*** Settings ***
Documentation           This is a simple test with Robot Framework
Library                 Selenium2Library

*** Variables ***
${BROWSER}          chrome
${URL}              https://admin.tonysbarsupply.shop/
${Email}            vana@maxput.com
${Password}         vanaadmin


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Signin With Tony Page
    Click element   xpath=//input[@id='email']
    Input Text      xpath=//input[@id='email']      ${Email}
    Click element   xpath=//input[@id='password']
    Input Text      xpath=//input[@id='password']   ${Password}
    Sleep   03
    Click Button    xpath=//button[normalize-space()='Sign in']
    Sleep   05

Signout with Tony Page
    Click element   xpath=//div[@class='avatar-content ng-star-inserted']
    Sleep   02
    Click element   xpath=//span[@class='pull-left']

*** Test Cases ***
TC 1
    Open Browser To Login Page
    Signin With Tony Page
    Signout with Tony Page