*** Settings ***
Documentation           This is a simple test with Robot Framework
Library                 Selenium2Library
Library                 DateTime



*** Variables ***
${BROWSER}           chrome
${URL}               https:/sammy:admin@maxput.tech/oops
${Pass}              welcome@321
${Search_Product}    Ammonium Sulphate
${Sign-inEmail}     sk@maxput.com
${Password}         nopass
${firstname}        Steev
${lastname}         jobs
${company}          Maxput
${email}            manan+38@maxput.com
${telephone}        4545454545
${password}         nopass
${confirmpassword}  nopass
${applicationname}  Ro2
${licencenumber}    123456789
${expirationdate}   Get Current Date  result_format=%m-%d-%Y
log(${expirationdate})
*** Keywords ***

Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window


Enter Pass code
    Input Text   id=siteToken   ${Pass}
    Click Button  Xpath=//*[@id="app"]/app-site-lock/div/div/mat-card/form/mat-card-content/div/button
    sleep    05
    Page Should Contain Image  xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/mat-toolbar/mat-toolbar-row/div[1]/a/img

Register new user
    Click element  xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/mat-toolbar/mat-toolbar-row/div[4]/app-top-menu/div/a
    Click element  xpath=//*[@id="mat-menu-panel-0"]/div/span/button[2]
    Sleep  03


Register Form
    Click element   id=firstname
    input text      id=firstname    ${firstname}
    Click element   id=lastname
    input text      id=lastname    ${lastname}
    Click element   id=company
    input text      id=company  ${company}
    Click element   xpath=/html/body/app-root/div/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-sign-up/mat-card/form/div[1]/div[2]/mat-form-field/div/div[1]/div
    Click element   xpath=/html/body/app-root/div/div/div[2]/div/div/div/mat-option[2]/span
    Click element   xpath=/html/body/app-root/div/app-pages/mat-sidenav-container/mat-sidenav-content/div/app-sign-up/mat-card/form/div[1]/div[1]/mat-form-field[4]/div/div[1]/div/mat-select/div/div[1]/span
    Click element   xpath=//*[@id="mat-option-61"]/span
    Click element   id:email
    input text      id:email    ${email}
    Click element   id:telephone
    input text      id:telephone    ${telephone}
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-sign-up/mat-card/form/div[1]/div[1]/mat-form-field[7]/div/div[1]/div
    sleep   02
    Click element   xpath=/html[1]/body[1]/app-root[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/mat-option[14]/span[1]
#    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-sign-up/mat-card/form/div[1]/div[1]/mat-form-field[7]/div/div[1]/div
#    Click element   xpath=//span[contains(text(),'Pratibha Sales')]
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-sign-up/mat-card/form/div[1]/div[1]/mat-form-field[8]/div/div[1]/div
    sleep   02
    Click element     xpath=//span[contains(text(),'Hampton, IA')]
#    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-sign-up/mat-card/form/div[1]/div[1]/mat-form-field[8]
    Click element   id:password
    input text      id:password    ${password}
    sleep   02
    Click element   id:password_confirmation
    input text      id:password_confirmation    ${confirmpassword}
    sleep   02
    Click element   id:application_name
    input text      id=application_name     ${applicationname}
    Click element   id:licence_number
    input text      id=licence_number     ${licencenumber}
    Click element   id=permit_expiration_date
    Click element   id=permit_expiration_date     ${expirationdate}
    sleep   02
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-sign-up/mat-card/form/div[1]/div[2]/div[3]/mat-form-field[1]/div/div[1]/div
    Click element   xpath=//*[@id="mat-option-1"]/span
    Click element   xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-sign-up/mat-card/form/div[1]/div[2]/div[3]/mat-form-field[2]/div/div[1]/div
    Click element   xpath=//span[contains(text(),'Twitter')]
    sleep   01
    Click element   xpath=//*[@id="privacy_policy"]/label/div
    Click button    xpath=//*[@id="app"]/app-pages/mat-sidenav-container/mat-sidenav-content/div[1]/app-sign-up/mat-card/form/div[3]/div/div/button
    sleep   05

*** Test Cases ***
TC 1
    Open Browser To Login Page
    Enter Pass code
    Register new user
    Register Form