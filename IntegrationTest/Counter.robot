*** Settings ***
Library           SeleniumLibrary
Variables         Variablesfile.yaml
*** Test Cases ***

Dev_TC14_Delete_Counter
    [Documentation]    Check user can delete Counter on UI
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Sleep    4s
    wait until page contains element    class=fa-calculator    timeout=${login.timeout}
    Click Element    class=fa-calculator    #Click on Counters
    Wait until page contains    text=Counter3    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/section/table/tbody/tr/td[3]/div/button/i    #Click Delete
    Sleep    2s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i    #Click Delete on confimation
    sleep    4s
    [Teardown]    Close Browser
    
Dev_TC15_Search_Counter
    [Documentation]    Check user can search Counter on UI
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    #Select Service
    Sleep    4s
    wait until page contains element    class=fa-calculator    timeout=${login.timeout}
    Click Element    class=fa-calculator    # Click on counters
    Wait until page contains    text=Counter3    timeout=${login.timeout}
    Input text    name=filterName    Counter3    # Enter Counter3 in Search
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/div[2]/button/i    #Click refresh
    Wait until page contains element    class=fa-remove    timeout=${login.timeout}
    Page should contain Element    class=fa-remove
    Sleep    4s
    [Teardown]    Close Browser
