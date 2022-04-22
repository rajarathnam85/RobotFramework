*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Variables ***
#List Variables
@{search_text}  mobile      tv      ipad

*** Test Cases ***
Search for Product
    Open Browser	https://www.amazon.in/	chrome
    Input Text	id=twotabsearchtextbox	${search_text}[1]
    Click Button	xpath=//input[@value='Go']
    Sleep	5s
    Page Should Contain	results for "${search_text}[1]"
    Close Browser
