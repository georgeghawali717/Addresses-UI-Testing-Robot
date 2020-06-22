*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${signed_email}
${url}
*** Keywords ***

sign up test case with empty fields
    [documentation]  Sign up test case
    [tags]  empty fields
    go to   http://a.testaddressbook.com/
    click link  Sign out
    wait until element is visible  id:sign-in
    click element  id:sign-in
    wait until element is visible  link:Sign up
    click link      Sign up
    wait until element is visible  name:user[email]
    wait until element is visible  name:user[password]
    clear element text  name:user[email]
    clear element text  name:user[password]
    click element  name:commit
    ${url} =   Get Location
    should not be equal     ${url}      http://a.testaddressbook.com/sign_up
    title should be  Address Book - Sign Up
sign up test case with exsisting email
    [documentation]  Sign up test case
    [tags]  exsisting email
    go to   http://a.testaddressbook.com/
    wait until element is visible  id:sign-in
    click element  id:sign-in
    wait until element is visible  link:Sign up
    click link      Sign up
    wait until element is visible  name:user[email]
    wait until element is visible  name:user[password]
    input text  name:user[email]    george.ghawali@exalt.email
    input text  name:user[password]     123456789
    click element  name:commit
    ${url} =   Get Location
    should not be equal     ${url}      http://a.testaddressbook.com/sign_up
    title should be  Address Book - Sign Up
sign up test case with invalid email
    [documentation]  Sign up test case
    [tags]  invalid email
    go to   http://a.testaddressbook.com/
    wait until element is visible  id:sign-in
    click element  id:sign-in
    wait until element is visible  link:Sign up
    click link      Sign up
    wait until element is visible  name:user[email]
    wait until element is visible  name:user[password]
    input text  name:user[email]    invalid email
    input text  name:user[password]     123456789
    click element  name:commit
    title should be  Address Book - Sign Up
    ${url} =   Get Location
    should be equal     ${url}      http://a.testaddressbook.com/sign_up
sign up test case with new email
    [documentation]  Sign up test case
    [tags]  invalid email
    go to   http://a.testaddressbook.com/
    wait until element is visible  id:sign-in
    click element  id:sign-in
    wait until element is visible  link:Sign up
    click link      Sign up
    wait until element is visible  name:user[email]
    wait until element is visible  name:user[password]
    input text  name:user[email]    new_email_45@hotmail.com
    input text  name:user[password]     123456789
    set variable    ${signed_email}    name:user[email]
    click element  name:commit
    ${url} =   Get Location
    should not be equal   ${url}      http://a.testaddressbook.com/sign_up
    title should be  Address Book
    current frame should contain    Sign out
    current frame should contain      Welcome to Address Book
    current frame should contain      A simple web app for showing off your testing
    current frame should contain    ${signed_email}
    current frame should contain    Home
    current frame should contain    Addresses
