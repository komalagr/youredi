*** Settings ***
Library           SeleniumLibrary
Variables         DevVariablesfile.yaml
*** Test Cases ***


TC43_AddParentOrg
    [Documentation]    Check that we can set Parent organisation to an organisation..
    ...
    ...    Test data setup. We shall e using an organization present at third position
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    15s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=/html/body/main/section/section/div/div[3]/div/p/a[2]    # Selects org2
    click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[1]/span[2]/a/i    #Click on edit org2
    sleep    4s
    Select from list by value    xpath=//*[@id="webide"]/main/section/section/form/article/div[2]/select    14449    #Select from parent org dropdown.For test = 1040, dev=14449,stage=906
    sleep    4s
    click element    xpath=/html/body/main/section/section/form/header/button[1]/i    #click save
    Page should contain    text=Komal test organistaion
