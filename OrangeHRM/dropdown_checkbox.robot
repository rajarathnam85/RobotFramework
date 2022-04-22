*** Settings ***
Documentation  Handling Dropdown, Checkbox, and Radio Buttons in Robot Framework
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
Validate user can select items from the dropdown
    [documentation]  This test case verifies that the user can select values from the dropdown and verify it
    [tags]  Smoke
    Open Browser  https://the-internet.herokuapp.com/dropdown  Chrome
    Wait Until Element Is Visible  id:dropdown  timeout=5
    #Sleep       5s
    Select From List By Index  id:dropdown  1
    List Selection Should Be  id:dropdown  Option 1
    Select From List By Value  id:dropdown  2
    List Selection Should Be  id:dropdown  Option 2
    Select From List By Label   id:dropdown     Option 1
    List Selection Should Be  id:dropdown  Option 1
    Close Browser

Validate user can check and uncheck checkboxes
    [documentation]  This test case verifies that the user can check and uncheck checkboxes and verify it
    [tags]  Smoke
    Open Browser  https://the-internet.herokuapp.com/checkboxes  Chrome
    Wait Until Element Is Visible  id:checkboxes  timeout=5
    Page Should Contain Checkbox  tag:input
    Checkbox Should Not Be Selected  css:input:nth-child(1)  #Checking checkbox 1 is not selected
    Checkbox Should Be Selected  css:input:nth-child(3)  #Checking checkbox 2 is selected
    Select Checkbox  css:input:nth-child(1)  #select checkbox 1
    Unselect Checkbox  css:input:nth-child(3)  #unselect checkbox 2
    Checkbox Should Be Selected  css:input:nth-child(1)  #Checking checkbox 1 is selected
    Checkbox Should Not Be Selected  css:input:nth-child(3)  #Checking checkbox 2 is not selected
    Close Browser

Test3
    [documentation]  This test case verifies that the user can select radio buttons and verify it
    [tags]  Smoke
    Open Browser    http://secure.smartbearsoftware.com/samples/TestComplete11/WebOrders/Login.aspx     chrome
            Input Text	id=ctl00_MainContent_username	Tester
            Input Text	id=ctl00_MainContent_password	test
            Click Button    id=ctl00_MainContent_login_button
            Sleep   2s
            Element Text Should Be	link=View all orders	View all orders
            Click Link      link=Order
    Wait Until Element Is Visible       ctl00$MainContent$fmwOrder$cardList       timeout=10
    #Page Should Contain Radio Button        id:bmwradio
    #Radio Button Should Not Be Selected     id:bmwradio
    Select Radio Button     ctl00$MainContent$fmwOrder$cardList        Visa
    Sleep	3s
    Select Radio Button     ctl00$MainContent$fmwOrder$cardList        American Express
    Sleep	3s
    Close Browser