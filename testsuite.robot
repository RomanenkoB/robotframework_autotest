*** Settings ***
Library     RequestsLibrary
Resource    keywords.resource

*** Test Cases ***
Check main page robotframework
    Check response main page

Cheсk working event
    ${response_community}=                    Send Event to robot     community
    ${response_resources}=                    Send Event to robot     resources
    ${response_development}=                  Send Event to robot     development
    ${response_getting_started}=                  Send Event to robot     getting-started
    Should Be True     ${response_community.status_code} == ${202} and ${response_resources.status_code} == ${202} and ${response_development.status_code} == ${202} and ${response_getting_started.status_code} == ${202}

Check response of all enpoints robotframework
    Check response page documentation
    Check response page rpa
    Check response page privacy-policy
    Check response page foundation
    Check response page code_of_conduct

Check config files
    Get simple example config
    Get simple example 2 config
    Get Advanced example config
    Get Variables config
    Get BDD-Example config
    Get FOR-Loops config
    Get IF-Expression config
    Get CustomCode config


