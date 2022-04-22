*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     String
#Need to use Collections Library if you are using List of dictionary objectx
Library     Collections
Library     OperatingSystem
*** Variables ***
${base_url}     https://demo.spreecommerce.org
${token}    3581_IKVSjA6xb5wKxw1MtxwG2ZcTeRudRuF2cJN7bA
${id}   21498
*** Test Cases ***
Delete an Address
    create session      mysession   ${base_url}
    log to console      ${token}
    ${headers}      create dictionary    Authorization=Bearer ${token}
    log to console      ${headers}

    ${response}=    delete on session         mysession       api/v2/storefront/account/addresses/${id}        headers=${headers}
    log to console      ${response.status_code}
    #${response_body}=      To Json     ${response.content}     pretty_print = True
    #Log to console     ${response_body}