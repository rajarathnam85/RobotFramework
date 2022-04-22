*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     OperatingSystem

*** Test Cases ***
Example of how to load JSON
# read the raw data
    #${json}=    Get file    C:/Users/adixit/PycharmProjects/RobotFramework/TestData/login.json
    ${json}=    Get file    TestData/login.json
# convert the data to a python object
    ${object}=  Evaluate    json.loads('''${json}''')   json
    Log to console      ${object}
# Read the data from JSON and pass to application
    Open Browser    ${object["url"]}  headlesschrome
    Maximize Browser Window
    Input Text	name=txtUsername	${object["uname"]}
    Input Text	name=txtPassword	${object["pass"]}
    Click Button    xpath=//input[@id='btnLogin']
    Comment     Element Text Should Be	link=Dashboard	Dashboard
    Close Browser

