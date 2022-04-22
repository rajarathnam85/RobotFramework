*** Settings ***
Documentation  Handling Dropdown, Checkbox, and Radio Buttons in Robot Framework
Library  SeleniumLibrary
Library  String


*** Variables ***

*** Test Cases ***
Verify that user is able to Login with valid credentials
    [Tags]    DEBUG
    open browser        https://opensource-demo.orangehrmlive.com/index.php/auth/login      chrome
    input text      id=txtUsername      abhi1
    input text      id=txtPassword      admin123
    click button        id=btnLogin
    page should contain link        Dashboard

Mouse Hover on Admin->User Managerment->Users
    mouse over      link=Admin
    mouse over      link=User Management
    click link      link=Users
    page should contain button      id=btnAdd
    Sleep       3s

Add User Scenario -> Open Users page
    ${random_num}=     Generate Random String
    ${empname}=     Catenate    SEPARATOR=    Abhi    ${random_num}
    Log to Console      ${empname}

    mouse over      link=Admin
    mouse over      link=User Management
    click link      link=Users
    click button    name=btnAdd
    sleep           3s
    input text      id=systemUser_employeeName_empName  Fiona Grace
    input text      id=systemUser_userName      ${empname}
    sleep           5s
    input text      id=systemUser_password  admin123
    input text      id=systemUser_confirmPassword   admin123
    click button    id=btnSave
    sleep           3s
    page should contain link        link=Jagan2
    sleep           5s


Logout from Application and Verify that user has Logged out

    click element       id=welcome
    Sleep       2s
    click link      link=Logout
    page should contain link        Forgot your password?

Close the Browser

    close browser