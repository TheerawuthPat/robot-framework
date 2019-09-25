*** Settings ***
Library  SeleniumLibrary
Test Teardown  Close Browser

*** Variables ***

*** Test Cases ***
Upload 3 files
    go to upload file page
    
    choose file ROBOT1.png
    choose file ROBOT2.png
    choose file ROBOT3.png
    
    validate file
    
    upload file ROBOT1 should be success
    upload file ROBOT2 should be success
    upload file ROBOT3 should be success

*** Keywords ***
go to upload file page
    Open Browser    https://goo.gl/YE27iy    browser=chrome

choose file ROBOT1.png
    Choose File    xpath:/*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]    ${CURDIR}/data-test/ROBOT1.png
choose file ROBOT2.png
    Choose File    xpath://*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]    ${CURDIR}/data-test/ROBOT2.png
choose file ROBOT3.png
    Choose File    xpath://*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]    ${CURDIR}/data-test/ROBOT3.png

upload file ROBOT1 should be success
    Click Element    xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr/td[5]/button[1]
    Wait Until Page Contains Element    xpath://div[@style="width: 33%;"]
upload file ROBOT2 should be success
    Click Element    xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[2]/td[5]/button[1]
    Wait Until Page Contains Element    xpath://div[@style="width: 67%;"]
upload file ROBOT3 should be success
    Click Element    xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[3]/td[5]/button[1]
    Wait Until Page Contains Element    xpath://div[@style="width: 100%;"]

validate file
    Wait Until Element Contains    xpath://*[@id="ng-app"]/body/div/div[2]/div[2]    Queue length: 3