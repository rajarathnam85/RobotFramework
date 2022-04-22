*** Settings ***
Library     DatabaseLibrary
Library     OperatingSystem
Library     SeleniumLibrary
Library     Collections
*** Variables ***
${dbname}       orangehrm
${dbuser}       root
${dbpasswd}     root
${dbhost}       localhost
${dbport}       3306
@{queryResults}

*** Test Cases ***
Read data from Database
   connect to database     pymysql     ${dbname}    ${dbuser}   ${dbpasswd}     ${dbhost}   ${dbport}
   table must exist     login
   check if exists in database  SELECT * FROM login
   @{queryResults}  QUERY   SELECT * FROM login
   log to console       ${queryResults}
   #@{List}      create list     @{queryResults}
   #log to console       ${List}
Loop Over A List Of Items And Log Each Of Them
    FOR     ${tdata}  IN      @{queryResults}
        Log to Console    ${tdata}
    END
