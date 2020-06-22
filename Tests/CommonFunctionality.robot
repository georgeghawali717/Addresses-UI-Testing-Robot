*** Settings ***
Library  SeleniumLibrary
*** Keywords ***
open browser for all cases
    open browser    http://a.testaddressbook.com/    gc
close browser connection
    close browser
