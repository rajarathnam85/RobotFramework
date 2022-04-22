*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
#Need to use Collections Library if you are using List of dictionary objectx
Library     Collections
*** Variables ***
${base_url}     https://demo.spreecommerce.org/api/v2/storefront/countries
${iso}       ind

*** Test Cases ***
Retrieve a Country
    create session      mysession   ${base_url}
    ${response}=    GET On Session     mysession        /${iso}
    log to console      ${response.status_code}
    log to console      ${response.content}
    log to console      ${response.headers}

    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal    ${status_code}       200
    log to console      ${status_code}

    ${body}=        convert to string       ${response.content}
    should contain  ${body}     INDIA

#Check ID from Response Body
    ${id}=      get value from json  ${response.json()}        $.data.id
    #extract the contents of the string out of the query results , to remove unicode
    # Need to use [0]
    Log to console      ${id[0]}
    Should be equal  ${id[0]}  99
#Check iso_name from Response Body
    ${iso_name}=      get value from json  ${response.json()}        $.data.attributes.iso_name
    #extract the contents of the string out of the query results , to remove unicode
    # Need to use [0]
    Log to console      ${iso_name[0]}
    Should be equal  ${iso_name[0]}  INDIA