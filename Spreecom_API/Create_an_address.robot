*** Settings ***
Library     RequestsLibrary
#Need to use Collections Library if you are using List of dictionary objectx
Library     Collections
Library     String
Library     JSONLibrary
Library     OperatingSystem
*** Variables ***
${base_url}     https://demo.spreecommerce.org/
${token}        3581_IKVSjA6xb5wKxw1MtxwG2ZcTeRudRuF2cJN7bA
*** Test Cases ***
Create an Adress
    create session      mysession   ${base_url}
    log to Console      ${token}
    ${headers}=       create dictionary      Authorization=Bearer ${token}       Content-Type=application/json
    log to Console      ${headers}
    ${req_body}=    get file        Spreecom_API/TestData/Create_an_adress.json
    log to Console      ${req_body}

    ${json_body}=   convert string to json      ${req_body}
    ${response}=    post on session         mysession       /api/v2/storefront/account/addresses      json=${json_body}        headers=${headers}
    log to console      ${response.status_code}
    ${response_body}=      To Json     ${response.content}     pretty_print = True
    Log to console     ${response_body}

    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal    ${status_code}       200
    log to console      ${status_code}

#Check token from Response Body
    ${fname}=      get value from json  ${response.json()}        $.data.attributes.firstname
    #extract the contents of the string out of the query results , to remove unicode
    # Need to use [0]
    Log to console      ${fname[0]}
    Should be equal  ${fname[0]}  raja

    ${id}=      get value from json  ${response.json()}        $.data.id

    ${id_final}=      Set Variable    ${id[0]}
    Log to console   ${id_final}