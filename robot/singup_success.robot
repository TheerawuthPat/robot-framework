*** Settings ***
# Library    FakerLibrary   # เอาไว้  Fake ข้อมูล Test
Library  SeleniumLibrary
Resource  ../pages/signup_page.robot
Resource  ../pages/thankyou_page.robot
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
กรอกชื่อ "${firstname}" นามสกุล "${lastname}"
    signup_page.Open
    signup_page.Fill in Firstname "${firstname}"
    signup_page.Fill in Lastname "${lastname}"

กรอกข้อมูลที่อยู่ "${address}" "${zipcode}"
    signup_page.Fill in Address "${address}"
    signup_page.Fill in Zipcode "${zipcode}"

Submit
    signup_page.Sign up 

ผลการสมัครสำเร็จ แสดงคำว่า Thank you
    thankyou_page.Thankyou