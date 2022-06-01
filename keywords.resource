*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variables ***
${base_url_robot}         https://robotframework.org
${event_url}              https://plausible.io/api/event

*** Keywords ***
Check response main page
    ${response}=                    Check response endpoint         /
    Should Be Equal As Integers     ${response.status_code}     200

Check response page documentation
    ${response}=                    Check response endpoint         /robotframework
    Should Be Equal As Integers     ${response.status_code}     200

Check response page rpa
    ${response}=                    Check response endpoint         /rpa/
    Should Be Equal As Integers     ${response.status_code}     200

Check response page foundation
    ${response}=                    Check response endpoint         ?/foundation
    Should Be Equal As Integers     ${response.status_code}     200

Check response page code_of_conduct
    ${response}=                    Check response endpoint         ?/code-of-conduct
    Should Be Equal As Integers     ${response.status_code}     200

Check response page privacy-policy
    ${response}=                    Check response endpoint         ?/privacy-policy
    Should Be Equal As Integers     ${response.status_code}     200

Get simple example config
    Chek config file    ExampleEntry    Simple Example

Get simple example 2 config
    Chek config file    Example1        Simple Example 2

Get Advanced example config
    Chek config file    Example2        Advanced Example

Get BDD-Example config
    Chek config file    ExampleBDD      BDD-Example

Get Variables config
    Chek config file    Variables       Variables

Get FOR-Loops config
    Chek config file    FOR_Loops       FOR-Loops

Get IF-Expression config
    Chek config file    IF_Statement    IF-Expression

Get CustomCode config
    Chek config file    CustomCode      Custom

Chek config file
    [Arguments]         ${exemple}  ${nameconfig}
    ${response}=        GET         ${base_url_robot}/live/Examples/${exemple}/config.json
    Should Be Equal As Strings      ${nameconfig}   ${response.json()["name"]}


Check response endpoint
    [Arguments]         ${end_point}
    Create Session      conn                ${base_url_robot}         verify=false      disable_warnings=1
    ${response}=        GET On Session      conn                      ${end_point}
    [Return]            ${response}

Send Event to robot
    [Arguments]         ${section}
    ${json_sec}=        create dictionary   section=${section}
    ${json_object}=     create dictionary   n=Nav click     u=https://robotframework.org/#${section}     p=${json_sec}   d=robotframework.org    r=https://www.google.com/
    ${response}=        POST                ${event_url}    json=${json_object}
    [Return]            ${response}




