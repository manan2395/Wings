*** Settings ***
Documentation           This is a simple test with Robot Framework
Library                 Selenium2Library

*** Variables ***
${BROWSER}          chrome
${URL}              https:/sammy:admin@maxput.tech/oops
${Pass}             welcome@321
${Sign-inEmail}     sk@maxput.com
${Password}         nopass
@{Example}          HighSpirits TheGrogBog  Toddie’sTonics  OnTheRocksLiquor  LagunaLiquor  LavishLiquors  SanguineSpirits  Spirits&Scallywags  SiduriSpirits  Pan’sPrecious Beverages  Brandy’s Bourbon  Kahlua&Schnapps  Sam’sSambuca  Scotch&Sizzle  WhiskeyOnTheWind  Drinks&Delight  Mama’sMartinis  Bits&Barley  Growlers&Goods  Chum’sRums

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Enter Pass code
    Input Text   id=siteToken   ${Pass}
    Click Button  xpath=//*[@id="app"]/app-site-lock/div/div/mat-card/form/mat-card-content/div/button
    sleep   05
    Page Should Contain Image  xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/mat-toolbar/mat-toolbar-row/div[1]/a/img
    sleep   02
    #Click element   xpath=//*[@id="ngx-popover-0"]/div[2]/div[2]/button/strong

Click On My Account
   Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/mat-toolbar/mat-toolbar-row/div[4]/app-top-menu/div/a
   Click element   xpath=//*[@id="mat-menu-panel-0"]/div/span/button[1]
   sleep    05

Enter value in login field
    Click element  xpath=//*[@id="email"]
    input text      id=email    ${Sign-inEmail}
    Click element  xpath=//*[@id="password"]
    input text      id=password     ${Password}
    sleep  05
    Click button  xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-sign-in/mat-card/div[2]/div[1]/form/div/div[1]/div/button
    sleep  08

Product Actions
#    Click element   xpath=//a[@href='/wishlist']
    Click element   xpath=//a[@href="/quotes"]
    sleep   03
    #Enter value in login field
    #sleep   08
    #Add Wishlist

Add Wishlist
    #category
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-home/div[2]/div[1]/button
    Sleep   05
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-products/mat-sidenav-container/mat-sidenav-content/div[2]/div[1]/div/app-product-template/div/mat-card/div/div[2]/div[4]/app-controls/div[2]/div[2]/button[1]
    sleep   05
    Click element   xpath=/html/body/modal-container/div/div/div[2]/div/form/div[1]/div/div[2]/button
    Click element   xpath=/html/body/modal-container/div/div/div[2]/div/form/div/div/mat-form-field/div/div[1]/div
    ${wishlist}=  Evaluate  random.choice($example)  random
    input text      xpath=//input[@formcontrolname='wishlist_name']     ${wishlist}
    Click element   xpath=/html/body/modal-container/div/div/div[2]/div/form/div/div/button[1]
    sleep   02
    #submit wishlist
    Click button    xpath=//*[@class='mat-focus-indicator mr-1 mat-raised-button mat-button-base mat-primary']
    Click element   xpath=//a[@href='/wishlist']
    sleep   02
    #Add Order Quantity With Pluse
    FOR    ${i}    IN RANGE    5
        Exit For Loop If    ${i} == 3
        Click element   xpath=//button[@mattooltip="Add"]
        Click button    xpath=//button[@mattooltip="Add"]
    END
    sleep   03
    Click element   xpath=//button[@mattooltip="Remove"]
    Click button    xpath=//button[@mattooltip="Remove"]
#    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-wishlist/div/mat-card/div[2]/div[2]/div[7]/div/button[1]
#    sleep   02
#    Click element   xpath=//a[@href="/quotes"]
#    sleep   02
#    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-quotes/mat-card/div/div[2]/div[3]/app-controls/div[3]/span/button[2]
#    sleep   05
#    Click element   xpath=//a[@href='/wishlist']
#   Remove from wish list
#    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-wishlist/div/mat-card/div[2]/div[2]/div[7]/div/button[2]/div[1]
    Click element  xpath=//body/app-root[1]/div[1]/app-pages[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-wishlist[1]/div[1]/mat-card[1]/div[2]/div[2]/div[7]/div[1]/button[2]
    #Click button   xpath=//body/app-root[1]/div[1]/app-pages[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-wishlist[1]/div[1]/mat-card[1]/div[2]/div[2]/div[7]/div[1]/button[2]
    sleep   02
    Click element   xpath=/html/body/div[5]/div/div[3]/button[1]
    Click element   xpath=//*[@id="header"]/mat-toolbar/a[1]

Quote List
    Click element   xpath=//*[@id="header"]/mat-toolbar/a[1]
    sleep   02
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-home/div[2]/div[1]/button
    sleep   05
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-products/mat-sidenav-container/mat-sidenav-content/div[2]/div[1]/div/app-product-template/div/mat-card/div/div[2]/div[4]/app-controls/div[2]/div[1]/span/button[3]
#    Click Button    xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-products/mat-sidenav-container/mat-sidenav-content/div[2]/div[1]/div/app-product-template/div/mat-card/div/div[2]/div[4]/app-controls/div[2]/div[1]/span/button[3]/div[1]
    sleep   05
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-products/mat-sidenav-container/mat-sidenav-content/div[2]/div[2]/div/app-product-template/div/mat-card/div/div[2]/div[4]/app-controls/div[2]/div[1]/span/button[3]
#    Click Button    xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-products/mat-sidenav-container/mat-sidenav-content/div[2]/div[2]/div/app-product-template/div/mat-card/div/div[2]/div[4]/app-controls/div[2]/div[1]/span/button[3]/div[1]
    sleep   05

*** Test Cases ***
TC 1
    Open Browser To Login Page
    Enter Pass code
    Click On My Account
    Enter value in login field
    Product Actions
#    Add Wishlist
    Quote List
