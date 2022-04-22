*** Settings ***
Library         SeleniumLibrary

*** Test Cases ***
Scroll
    Open Browser   https://demo.spreecommerce.org/    Chrome
    Maximize Browser Window
    #Scroll Element Into View     xpath://a[normalize-space()='Start your free trial']
    Scroll Element Into View     link=Spark Solutions
    Sleep   5s
    Click link      link=Spark Solutions
    Sleep   5s
    Close All Browsers
