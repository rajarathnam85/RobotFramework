*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Variables ***
#Dictionary  Variables
&{search_text}  mob=mobile      tv=television      pad=ipad
*** Test Cases ***
Search for Product
    Open Browser	https://www.amazon.in/	chrome
    Input Text	id=twotabsearchtextbox	${search_text.pad}
    Click Button	xpath=//input[@value='Go']
    Sleep	5s
    Page Should Contain	results for "${search_text.pad}"
    close browser