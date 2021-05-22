*** Settings ***
Documentation           This is a simple test with Robot Framework
Library                 Selenium2Library

*** Variables ***
${BROWSER}           chrome
${URL}               https:/sammy:admin@maxput.tech/oops
${Pass}              welcome@321
${Search_Product}    Ammonium Sulphate
${Sign-inEmail}     sk@maxput.com
${Password}         nopass

#Address Variables
${Firstname}        Ravi
${Lastname}         patel
${telephone}        4545454545
${company}          Maxput
${AddressLine1}     Mr John Smith. 132
${AddressLine2}     My Street
${City}             Kingston
${Zipcode}          12401

#After Update Address
${EditAddressLine1}     438 West Sutor Court
${EditAddressLine2}
${EditCity}             Miami
${EditZipcode}          33196

#Change Password
${Current Password}     nopass
${New Password}         123456
${Confirm Password}     123456


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
Enter Pass code
    Input Text   id=siteToken   ${Pass}
    Click Button  Xpath=//*[@id="app"]/app-site-lock/div/div/mat-card/form/mat-card-content/div/button
    sleep    05
    Page Should Contain Image  xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/mat-toolbar/mat-toolbar-row/div[1]/a/img

Search Product
    Click element  xpath=//input[@id='product_name']
    Input Text   xpath=//input[@id='product_name']   ${Search_Product}
    sleep  03
    Click element  xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/mat-toolbar/mat-toolbar-row/div[2]/form/div/div/button
    sleep  05


Click On My Account
   Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/mat-toolbar/mat-toolbar-row/div[4]/app-top-menu/div/a
   Click element   xpath=//*[@id="mat-menu-panel-0"]/div/span/button[1]
   sleep   05

Enter value in login field
    Click element  xpath=//*[@id="email"]
    input text      id=email    ${Sign-inEmail}
    Click element  xpath=//*[@id="password"]
    input text      id=password     ${Password}
    sleep  05
    Click button  xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-sign-in/mat-card/div[2]/div[1]/form/div/div[1]/div/button
    sleep  05

Verify login
    Click element   xpath=//*[@id="ngx-popover-0"]/div[2]/div[2]/button/strong
    Click element  xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/mat-toolbar/mat-toolbar-row/div[4]/app-top-menu/div/a
    sleep  05
    Page Should Contain Element  xpath=//*[@id="mat-menu-panel-0"]/div/span/button

Go My Account
    Click element   xpath=//a[@routerlink='account/information']
    sleep  02

Account Address Action
    Click element   xpath=//a[@href='/account/addresses']
    sleep  02
    #Add Address
    #Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-addresses/div[1]/div[2]/button
    #Edit Address
    #Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-addresses/div[2]/div/div[2]/div[17]/div[1]/div/div[2]/button[2]
    Execute JavaScript    window.scrollTo(0, document.body.scrollTOP)
    Click element   xpath=//a[@href='/account/change-password']
    sleep   01
    Click element   xpath=//a[@href='/account/pre-payment']
    sleep   01
    Click element   xpath=//a[@href='/account/payment-method']
    sleep   01
    Click element   xpath=//a[@href='/account/account-settings']

Add Address
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-addresses/div[2]/form/div[1]/div[1]/mat-form-field[1]/div/div[1]/div
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-addresses/div[2]/form/div[1]/div[1]/mat-form-field[1]/div/div[1]/div
    input text      css:input[placeholder="First Name"]     ${Firstname}
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-addresses/div[2]/form/div[1]/div[2]/mat-form-field[1]/div/div[1]/div
    input text      css:input[placeholder="Last Name"]   ${Lastname}
    Click element   id:telephone
    input text      id:telephone    ${telephone}
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-addresses/div[2]/form/div[1]/div[1]/mat-form-field[3]/div/div[1]/div
    Click element   xpath=//*[@id="mat-option-55"]/span
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-addresses/div[2]/form/div[1]/div[2]/mat-form-field[2]/div/div[1]/div
    input text      css:input[placeholder="Company"]    ${company}
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-addresses/div[2]/form/div[1]/div[1]/mat-form-field[4]/div/div[1]/div
    input text      css:input[placeholder="Address Line 1"]     ${AddressLine1}
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-addresses/div[2]/form/div[1]/div[2]/mat-form-field[3]/div/div[1]/div
    input text      css:input[placeholder="Address Line 2"]     ${AddressLine2}
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-addresses/div[2]/form/div[1]/div[1]/mat-form-field[5]/div/div[1]/div
    input text      css:input[placeholder="City"]   ${City}
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-addresses/div[2]/form/div[1]/div[2]/mat-form-field[4]/div/div[1]/div
    Click element   xpath=//span[contains(text(),'New York')]
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-addresses/div[2]/form/div[1]/div[1]/mat-form-field[6]/div/div[1]/div
    input text      css:input[placeholder="Zipcode"]    ${Zipcode}
    Click button    xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-addresses/div[2]/form/div[2]/div/div/button[1]

Edit Address
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-addresses/div[2]/form/div[1]/div[1]/mat-form-field[4]/div/div[1]/div
    input text      css:input[placeholder="Address Line 1"]     ${EditAddressLine1}
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-addresses/div[2]/form/div[1]/div[2]/mat-form-field[3]/div/div[1]/div
    input text      css:input[placeholder="Address Line 2"]     ${EditAddressLine2}
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-addresses/div[2]/form/div[1]/div[1]/mat-form-field[5]/div/div[1]/div
    input text      css:input[placeholder="City"]   ${EditCity}
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-addresses/div[2]/form/div[1]/div[2]/mat-form-field[4]/div/div[1]/div
    Click element   xpath=//span[contains(text(),'Florida')]
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-addresses/div[2]/form/div[1]/div[1]/mat-form-field[6]/div/div[1]/div
    input text      css:input[placeholder="Zipcode"]    ${EditZipcode}
    Click button    xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-addresses/div[2]/form/div[2]/div/div/button[1]

Change Password
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-change-password/div/div/form/mat-form-field[1]/div/div[1]/div
    input text      css:input[placeholder="Current Password"]   ${Current Password}
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-change-password/div/div/form/mat-form-field[2]/div/div[1]/div
    input text      css:input[placeholder="New Password"]   ${New Password}
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-change-password/div/div/form/mat-form-field[3]/div/div[1]/div
    input text      css:input[placeholder="Confirm New Password"]   ${Confirm Password}
    Click button    xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-change-password/div/div/form/div/button

Account List
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-account/mat-sidenav-container/mat-sidenav-content/div[2]/app-account-settings/div/button


*** Test Cases ***
TC 1
    Open Browser To Login Page
    Enter Pass code
    #Search Product
    Click On My Account
    Enter value in login field
    #Verify login
    Go My Account
    Account Address Action
    #Add Address
    #Edit Address
    #Change Password
    Account List

