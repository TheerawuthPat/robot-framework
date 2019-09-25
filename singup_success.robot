*** Settings ***
# Library    FakerLibrary   # เอาไว้  Fake ข้อมูล Test
Library  SeleniumLibrary
Suite Setup  Open Signup Page
Suite Teardown  Close Browser

*** Variables ***
${URL}    https://goo.gl/iCce7C

*** Test Cases ***
นายธีระวุฒิทำการสมัครเป็นสมาชิกใหม่ของระบบ
    กรอกชื่อ "Theerawuth" นามสกุล "Pat"
    กรอกข้อมูลที่อยู่ "Bangkok, Thailand" "10600"
    Submit
    ผลการสมัครสำเร็จ แสดงคำว่า Thank you

*** Keywords ***
Open Signup Page
    Open Browser    ${URL}    browser=chrome

กรอกชื่อ "${firstname}" นามสกุล "${lastname}"
    Input Text    id:firstname    ${firstname}
    Input Text    id:lastname    ${lastname}

กรอกข้อมูลที่อยู่ "${address}" "${zipcode}"
    Input Text    id:address    ${address}
    Input Text    id:zipcode    ${zipcode}

Submit
    Click Button    id:signup

ผลการสมัครสำเร็จ แสดงคำว่า Thank you
    Wait Until Page Contains    Thank you!