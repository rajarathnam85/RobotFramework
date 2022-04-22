*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library  Collections

*** Variables ***
@{ExpectedLinkList}  View all orders  View all products  Order  Logout  Check All  Uncheck All

*** Test Cases ***
Launch OrangeHRM Login Page

    Open Browser    http://secure.smartbearsoftware.com/samples/testcomplete11/WebOrders/Default.aspx    Chrome
    Maximize Browser Window
    Input Text    id=ctl00_MainContent_username    Tester
    Input Text    id=ctl00_MainContent_password    test
    Click Button  id=ctl00_MainContent_login_button
    Page Should Contain Button    id=ctl00_MainContent_btnDelete
    ${AllLinksCount}=         Get Element count       xpath=//a
    Log to Console   ${AllLinksCount}
    @{ActualLinkList}=    Create List
    FOR     ${i}  IN RANGE      1   ${AllLinksCount}+1
        ${text}=    Get Text    xpath=(//a)[${i}]
        Log to Console    ${text}
        Append To List  ${ActualLinkList}  ${text}
    END
    Log To Console  \n List from WebPage:
        Log To Console  ${ActualLinkList}
        Log To Console  Our List:
        Log To Console  ${ExpectedLinkList}
        Lists Should Be Equal  ${ActualLinkList}  ${ExpectedLinkList}
    Close Browser
