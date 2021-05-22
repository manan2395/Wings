*** Settings ***
Documentation           This is a simple test with Robot Framework
Library                 Selenium2Library
*** Variables ***
${BROWSER}           chrome
${URL}               https:/sammy:admin@maxput.tech/oops
${Pass}              welcome@321
${Search_Product}    Ammonium Sulphate
${Sign-inEmail}     manan+32@maxput.com
${Password}         123456
${warehouse}        Effingham, IL, USA
${Fill}             2

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Enter Pass code
    Input Text   id=siteToken   ${Pass}
    Click Button  Xpath=//*[@id="app"]/app-site-lock/div/div/mat-card/form/mat-card-content/div/button
    sleep    05
    Page Should Contain Image  xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/mat-toolbar/mat-toolbar-row/div[1]/a/img

Select Warehouse
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/mat-toolbar/mat-toolbar-row/div[3]/a
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-location/mat-card/div[1]/form/div/div[1]/mat-form-field/div/div[1]/div
    Input Text      xpath=//html[1]/body[1]/app-root[1]/div[1]/app-pages[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-location[1]/mat-card[1]/div[1]/form[1]/div[1]/div[1]/mat-form-field[1]/div[1]/div[1]/div[1]/input[1]    ${warehouse}
    sleep   02
    Press Keys      xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-location/mat-card/div[1]/form/div/div[1]/mat-form-field/div/div[1]/div  \ue015
    Press Keys      xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-location/mat-card/div[1]/form/div/div[1]/mat-form-field/div/div[1]/div  \ue007
    sleep   05
    Click button    xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-location/mat-card/div[3]/div[1]/div/div[1]/button
    sleep   04
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-home/div[3]/app-banners/div/div[1]/div[1]/div/div/a
    sleep   05
    Click element   xpath=//*[@id="ngx-popover-0"]/div[2]/div[2]/button/strong
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-products/mat-sidenav-container/mat-sidenav-content/div[2]/div[1]/div/app-product-template/div/mat-card/div/div[2]/div[4]/app-controls/div[2]/div[1]/span/button[3]
    #Click element   xpath=//a[@mattooltip='Cart']
    Click element   xpath=//a[@href='/cart']
    #Click element   xpath=//a[@href='/compare']
    #Click element   xpath=//a[@href='/cart']
    sleep   04
    #Add Order Quantity With Pluse
    FOR    ${i}    IN RANGE    5
        Exit For Loop If    ${i} == 3
        Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-cart/mat-card/div/div[2]/div[3]/app-controls/div[3]/span/button[2]
    END
    sleep   05
    #Minus Quantity
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-cart/mat-card/div/div[2]/div[3]/app-controls/div[3]/span/input
    input text      xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-cart/mat-card/div/div[2]/div[3]/app-controls/div[3]/span/input     ${Fill}
    #Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-cart/mat-card/div/div[2]/div[3]/app-controls/div[3]/span/button[1]
    sleep   03
    #Click On checkout button
    Click element   xpath=//a[@href='/checkout']
    Click element   id=email
    input text      id=email    ${Sign-inEmail}
    Click element   id=password
    input text      id=password    ${Password}
    sleep   03
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-sign-in/mat-card/div[2]/div[1]/form/mat-form-field[2]/div/div[1]/div[2]/mat-icon
    sleep   03
    Click Button    xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-sign-in/mat-card/div[2]/div[1]/form/div/div[1]/div/button

Verify login
    Click element  xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/mat-toolbar/mat-toolbar-row/div[4]/app-top-menu/div/a
    sleep  05
    Page Should Contain Element  xpath=//*[@id="mat-menu-panel-0"]/div/span/button

*** Test Cases ***
TC 1
    Open Browser To Login Page
    Enter Pass code
    Select Warehouse
    #Verify login