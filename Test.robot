*** Settings ***
Documentation           This is a simple test with Robot Framework
Library                 Selenium2Library

*** Variables ***
${BROWSER}           chrome
${URL}               https:/sammy:admin@maxput.tech/oops
${Pass}              welcome@321
${Search_Product}    Ammonium Sulphate
${Search_Product_by_all}
${Sign-inEmail}     sk@maxput.com
${Password}         nopass


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Enter Pass code
    Input Text   id=siteToken   ${Pass}
    Click Button  Xpath=//*[@id="app"]/app-site-lock/div/div/mat-card/form/mat-card-content/div/button
    sleep   05
    Page Should Contain Image  xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/mat-toolbar/mat-toolbar-row/div[1]/a/img

Click On My Account
   Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/mat-toolbar/mat-toolbar-row/div[4]/app-top-menu/div/a
   Click element   xpath=//*[@id="mat-menu-panel-0"]/div/span/button[1]
   sleep    05

Enter value in login field
    Click element   xpath=//*[@id="email"]
    input text      id=email    ${Sign-inEmail}
    Click element   xpath=//*[@id="password"]
    input text      id=password     ${Password}
    sleep  05
    Click button    xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-sign-in/mat-card/div[2]/div[1]/form/div/div[1]/div/button
    sleep  08

Verify login
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/mat-toolbar/mat-toolbar-row/div[4]/app-top-menu/div/a
    sleep  05
    Page Should Contain Element  xpath=//*[@id="mat-menu-panel-0"]/div/span/button

Search Product
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/mat-toolbar/mat-toolbar-row/div[2]/form/div/div
    Click element   xpath=//input[@id='product_name']
    Input Text      xpath=//input[@id='product_name']   ${Search_Product}
    sleep   03
    Press Keys      xpath=//input[@id='product_name']  \ue015
    Press Keys      xpath=//input[@id='product_name']  \ue007
    sleep   05
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/mat-toolbar/mat-toolbar-row/div[4]/app-top-menu/div/a
#    Press Keys      xpath=//span[normalize-space()='Sign Out']  \ue015
#    Press Keys      xpath=//span[normalize-space()='Sign Out']  \ue007

Search Product By All
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/mat-toolbar/mat-toolbar-row/div[2]/form/div/div
    Click element   xpath=//input[@id='product_name']
    Input Text      xpath=//input[@id='product_name']   ${Search_Product_by_all}
    sleep   03
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/mat-toolbar/mat-toolbar-row/div[2]/form/div/div/button
    sleep   05

Sign out
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/mat-toolbar/mat-toolbar-row/div[4]/app-top-menu/div/a/span
    Click element   xpath=//*[@id="mat-menu-panel-0"]/div/span/button
    sleep   05



*** Test Cases ***
TC 1
    Open Browser To Login Page
    Enter Pass code
    Click On My Account
    Enter value in login field
    #Verify login
    Sign out
    Search Product By All
    Search Product