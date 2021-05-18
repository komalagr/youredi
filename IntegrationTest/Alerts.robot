*** Settings ***
Library           SeleniumLibrary
Variables         Variablesfile.yaml
*** Test Cases ***
    
TC45-Alerts_AddComment
    [Documentation]    Check user is able to add comments to alert on alert page
    ...
    ...    Test data setup. - Need an alert with info as Info3 in Demoservice of Komal Test Organisation
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    wait until page contains element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select Service
    wait until page contains element    class=fa-bell    timeout=${login.timeout}
    Click Element    class=fa-bell    #Click on Alerts
    Sleep    6s
    Input text    name=filterInfo    Info3    # Enter into filter criteria
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/header/form/div[4]/button/i
    Sleep    3s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section[1]/section[1]/article/ul/li[2]
    Wait until page contains    text=Info3    timeout=${login.timeout}
    Page should not contain    text=No alerts found
    Click element    xpath=/html/body/main/section/section/section/section[2]/article/div/div/ul/li[2]/a    # click on comments
    Sleep    4s
    Input Text    xpath=/html/body/main/section/section/section/section[2]/article/div/section/form/div[1]/input    TestCommentAdding
    Sleep    4s
    Click element    xpath=/html/body/main/section/section/section/section[2]/article/div/section/form/div[2]/button/i    # click on add
    Page should contain    text=TestCommentAdding
    Sleep    4s
    [Teardown]    Close Browser

TC45-Alerts_AddPayload
    [Documentation]    Check user is able to add payload to alert on alert page
    ...
    ...    Test data setup. - Need an alert with info as Info3 in Demoservice of Komal Test Organisation
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    wait until page contains element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select Service
    wait until page contains element    class=fa-bell    timeout=${login.timeout}
    Click Element    class=fa-bell    #Click on Alerts
    Sleep    6s
    Input text    name=filterInfo    Info3    # Enter into filter criteria
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/header/form/div[4]/button/i
    Sleep    3s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section[1]/section[1]/article/ul/li[2]
    Wait until page contains    text=Info3    timeout=${login.timeout}
    Page should not contain    text=No alerts found
    Click element    xpath=/html/body/main/section/section/section/section[2]/article/div/div/ul/li[3]/a    # click on payload
    Sleep    4s
    Execute javascript    _editor = document.querySelectorAll("div.CodeMirror")[0].CodeMirror;    _editor.setValue("Value for Key1")
    Sleep    4s
    Click element    xpath=/html/body/main/section/section/section/section[2]/article/div/form/div[2]/div/button[1]/i    # click on save
    sleep    4s
    [Teardown]    Close Browser

TC46-Alerts_AssignToMe
    [Documentation]    Check user is able to assign the alert to himself/herself
    ...
    ...    Test data setup. - Need an alert with info as Info3 in Demoservice of Komal Test Organisation
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    wait until page contains element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select Service
    wait until page contains element    class=fa-bell    timeout=${login.timeout}
    Click Element    class=fa-bell    #Click on Alerts
    Sleep    6s
    Input text    name=filterInfo    Info3    # Enter into filter criteria
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/header/form/div[4]/button/i
    Sleep    3s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section[1]/section[1]/article/ul/li[2]
    Wait until page contains    text=Info3    timeout=${login.timeout}
    Page should not contain    text=No alerts found
    click element    xpath=/html/body/main/section/section/section/section[2]/header/div/div[2]/button[1]/i    # click on Assign to me
    sleep    4s
    ${assignedto}=    Get Text    xpath=/html/body/main/section/section/section/section[2]/article/div/section/div/dl/dd[6]/a    #Get value in Assigned to field
    Sleep    4s
    Should be equal as Strings    ${assignedto}    Komal Agarwal (komal@youredi.com)
    Sleep    4s
    [Teardown]    Close Browser

TC47-Alerts_Unassign
    [Documentation]    Check user is able to unassign the alert
    ...
    ...    Test data setup. - Need an alert with info as Info3 in Demoservice of Komal Test Organisation
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    wait until page contains element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select Service
    wait until page contains element    class=fa-bell    timeout=${login.timeout}
    Click Element    class=fa-bell    #Click on Alerts
    Sleep    4s
    Input text    name=filterInfo    Info3    # Enter into filter criteria
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/header/form/div[4]/button/i
    Sleep    3s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section[1]/section[1]/article/ul/li[2]
    Wait until page contains    text=Info3    timeout=${login.timeout}
    Page should not contain    text=No alerts found
    click element    xpath=/html/body/main/section/section/section/section[2]/header/div/div[2]/button[2]/i    # click on UnAssign
    sleep    4s
    ${assignedto}=    Get Text    xpath=/html/body/main/section/section/section/section[2]/article/div/section/div/dl/dd[6]/span    #Get value in Assigned to field
    Should be equal as Strings    ${assignedto}    Not assigned.
    sleep    4s
    [Teardown]    Close Browser

Dev_TC21-Alerts_FilterByAssignedTo
    [Documentation]    Check user can filter Alerts by Info
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    wait until page contains element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select Service
    wait until page contains element    class=fa-bell    timeout=${login.timeout}
    Click Element    class=fa-bell    #Click on Alerts
    sleep    6s
    Select from list by value    xpath=/html/body/main/section/section/header/form/div[2]/div[2]/select    ${login.alertfilter}    # Enter into filter criteria 928 for stage , dev=16887
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/header/form/div[4]/button/i
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section[1]/section[1]/article/ul/li[3]
    Sleep    4s
    Page should not contain    text=No alerts found
    ${id}=    Get Text    xpath=/html/body/main/section/section/section/section[2]/article/div/section/div/dl/dd[1]
    Should be equal as Strings    ${id}    ${login.alertid}    #dev=203542
    Sleep    4s
    [Teardown]    Close Browser
    
    
TC60AlertWarningCategory
    [Documentation]    Check users can filter alerts based on severity - Warning
    ...
    ...    Komal Test Organisation - Demo Service 4
    ...    Need alerts with Minor, major, critical and warning category
    [Setup]    login
    Wait until page contains    text=Login successful. Welcome to Youredi!
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div[2]/div[3]/div/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div[2]/div[3]/div/p/a[2]    #Select Service
    Sleep    2s
    Click element    class=fa-bell
    Sleep    4s
    Click element    xpath=/html/body/main/section/section/header/form/div[4]/div/button[1]/span/i
    Click element    class=fa-refresh
    Sleep    2s
    Click element    xpath=/html/body/main/section/section/section/section[1]/section[1]/article/ul/li[5]/span
    Sleep    2s
    Page should contain    text=No alerts found.
    [Teardown]    Close Browser

TC61AlertMinorCategory
    [Documentation]    Check users can filter alerts based on severity - Minor
    ...
    ...    Komal Test Organisation - Demo Service 4
    ...    Need alerts with Minor, major, critical and warning category
    [Setup]    login
    Wait until page contains    text=Login successful. Welcome to Youredi!
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div[2]/div[3]/div/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div[2]/div[3]/div/p/a[2]    #Select Service
    Sleep    2s
    Click element    class=fa-bell
    Sleep    4s
    Click element    xpath=/html/body/main/section/section/header/form/div[4]/div/button[2]/span/i
    Click element    class=fa-refresh
    Sleep    2s
    Click element    xpath=/html/body/main/section/section/section/section[1]/section[1]/article/ul/li[4]/span
    Sleep    2s
    Page should contain    text=No alerts found.
    [Teardown]    Close Browser

TC62AlertMajorCategory
    [Documentation]    Check users can filter alerts based on severity - Major
    ...
    ...    Komal Test Organisation - Demo Service 4
    ...    Need alerts with Minor, major, critical and warning category
    [Setup]    login
    Wait until page contains    text=Login successful. Welcome to Youredi!
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div[2]/div[3]/div/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div[2]/div[3]/div/p/a[2]    #Select Service
    Sleep    2s
    Click element    class=fa-bell
    Sleep    4s
    Click element    xpath=/html/body/main/section/section/header/form/div[4]/div/button[3]/span/i
    Click element    class=fa-refresh
    Sleep    2s
    Click element    xpath=/html/body/main/section/section/section/section[1]/section[1]/article/ul/li[3]/span
    Sleep    2s
    Page should contain    text=No alerts found.
    [Teardown]    Close Browser

TC63AlertCriticalCategory
    [Documentation]    Check users can filter alerts based on severity - Critical
    ...
    ...    Komal Test Organisation - Demo Service 4
    ...    Need alerts with Minor, major, critical and warning category
    [Setup]    login
    Wait until page contains    text=Login successful. Welcome to Youredi!
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div[2]/div[3]/div/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div[2]/div[3]/div/p/a[2]    #Select Service
    Sleep    2s
    Click element    class=fa-bell
    Sleep    4s
    Click element    xpath=/html/body/main/section/section/header/form/div[4]/div/button[4]/span/i
    Click element    class=fa-refresh
    Sleep    2s
    Click element    xpath=/html/body/main/section/section/section/section[1]/section[1]/article/ul/li[2]/span
    Sleep    2s
    Page should contain    text=No alerts found.
    [Teardown]    Close Browser


*** Keywords ***
Login
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in



