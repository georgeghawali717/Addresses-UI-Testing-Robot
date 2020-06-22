*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${signed_email}
${url}
*** Keywords ***
sign in test case with empty fields
    [documentation]  Sign in test case
    [tags]  empty fields
    click element  id:sign-in
    wait until element is visible  name:session[email]
    wait until element is visible  name:session[password]
    clear element text  name:session[email]
    clear element text  name:session[password]
    click element  name:commit
    ${url} =   Get Location
    should be equal     ${url}      http://a.testaddressbook.com/session
    title should be  Address Book - Sign In
    page should contain  Bad email or password.
sign in test case with invalid email
    [documentation]  Sign in test case
    [tags]  invalid email
    go to   http://a.testaddressbook.com/
    click element  id:sign-in
    wait until element is visible  name:session[email]
    wait until element is visible  name:session[password]
    input text  name:session[email]     invalid_email@hotmail.com
    input text  name:session[password]  123456789
    click element  name:commit
    ${url} =   Get Location
    should be equal     ${url}      http://a.testaddressbook.com/session
    title should be  Address Book - Sign In
    page should contain  Bad email or password.
sign in test case with valid email invalid password
    [documentation]  Sign in test case
    [tags]  valid email invalid password
    go to   http://a.testaddressbook.com/
    click element  id:sign-in
    wait until element is visible  name:session[email]
    wait until element is visible  name:session[password]
    input text  name:session[email]     george.ghawali@exalt.email
    input text  name:session[password]  12345678
    click element  name:commit
    ${url} =   Get Location
    should be equal     ${url}      http://a.testaddressbook.com/session
    title should be  Address Book - Sign In
    page should contain  Bad email or password.
sign in test case with valid email valid password
    [documentation]  Sign in test case
    [tags]  valid email invalid password
    go to   http://a.testaddressbook.com/
    click element  id:sign-in
    wait until element is visible  name:session[email]
    wait until element is visible  name:session[password]
    input text  name:session[email]     george.ghawali@exalt.email
    set variable    ${signed_email}    name:user[email]
    input text  name:session[password]  123456789
    click element  name:commit
    ${url} =   Get Location
    should be equal     ${url}      http://a.testaddressbook.com/
    title should be  Address Book
    current frame should contain    Sign out
    current frame should contain      Welcome to Address Book
    current frame should contain      A simple web app for showing off your testing
    current frame should contain    ${signed_email}
    current frame should contain    Home
    current frame should contain    Addresses