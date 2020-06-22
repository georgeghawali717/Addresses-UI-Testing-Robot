*** Settings ***
Library  SeleniumLibrary
*** Variables ***
*** Test Cases ***
test_case
    open google
    input text  name:session[email]  george.ghawali@exalt.email
    input text  session[password]   123456789
    click element  name:commit
*** Keywords ***
open google
    open browser  http://a.testaddressbook.com/sign_in   chrome