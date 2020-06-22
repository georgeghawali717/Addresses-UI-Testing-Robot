*** Settings ***
Documentation  Addresses_Test
Resource  CommonFunctionality.robot
Resource  Sign_Up_Test_Cases.robot
Resource  Sign_In_Test_Cases.robot
*** Test Cases ***
test cases for sign in
    open browser for all cases
    sign in test case with empty fields
    sign in test case with invalid email
    sign in test case with valid email invalid password
    sign in test case with valid email valid password
test cases for sign up
    sign up test case with empty fields
    sign up test case with exsisting email
    sign up test case with invalid email
    sign up test case with new email
    close browser connection