*** Settings ***
Library     RequestsLibrary
#Need to use Collections Library if you are using List of dictionary objectx
Library     Collections
Library     JSONLibrary
Library     OperatingSystem
*** Variables ***
${base_url}     https://demo.spreecommerce.org

*** Test Cases ***
Create or Refresh Token
    create session      mysession       ${base_url}
    ${header}=       create dictionary       Content-Type=application/json
    ${req_body}=    get file        Spreecom_API/TestData/CreateToken.json
    log to console      ${req_body}
    ${json_body}=   convert string to json      ${req_body}
    ${response}=    post on session         mysession       /spree_oauth/token      json=${json_body}        headers=${header}
    #${response}=    post on session     mysession   /spree_oauth/token    data=${req_body}
    log to console      ${response.status_code}
    ${response_body}=      To Json     ${response.content}     pretty_print = True
    log to console      ${response_body}
    #log to console      ${response.headers}

    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal    ${status_code}       200
    log to console      ${status_code}

#Check token from Response Body
    ${access_token}=      get value from json  ${response.json()}        $.access_token
    #extract the contents of the string out of the query results , to remove unicode
    # Need to use [0]
    ${access_token_final}=      Set Variable    ${access_token[0]}
    Log to console      ${access_token_final}