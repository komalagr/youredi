  
*** Settings ***
Library           SeleniumLibrary
Variables         Variablesfile.yaml
*** Test Cases ***

DEV_TC1_OData_AlertCommentsposiitve
    [Documentation]    User should be able to fetch Comments of Alert belonging to an account
    ...
    ...    Test data
    ...    Uodated Org having alert with comments
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    5s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid1})/Alerts(${login.alertid1})/AlertComments
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Wait until page contains    text=200 success    timeout=${login.timeout}
    Page should contain    text=200 success
    [Teardown]    Close Browser

DEV_TC2_OData_AlertCommentsNeg
    [Documentation]    Comments of an alert that belongs to another account should not get fetched.error message should be displayed
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout} 
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    5s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}    
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid2})/Alerts(${login.alertid1})/AlertComments
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    [Teardown]    Close Browser

DEV_TC3_OData_AlertsNegative
    [Documentation]    Alert of another account should not get fetched
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    5s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid2})/Alerts(${login.alertid1})
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    Page should contain    text=404 error
    [Teardown]    Close Browser

DEV_TC4_OData_Service_Positive
    [Documentation]    Service details belonging to \ account should get fetched
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    5s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid1})/Services(${login.serviceid1})
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Wait until page contains    text=200 success    timeout=${login.timeout}
    Page should contain    text=200 success
    [Teardown]    Close Browser

DEV_TC5_OData_ServiceNegative
    [Documentation]    Service details belonging to \ another account should not get fetched
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    5s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid2})/Services(${login.serviceid2})
    sleep    4s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    2s
    Page should not contain    text=200 success
    Page should contain    text=404 error
    [Teardown]    Close Browser

DEV_TC6_OData_ProcessesPositive
    [Documentation]    Process details belonging to \ correct service, correct account should get fetched
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    5s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid1})/Services(${login.serviceid1})/Processes(${login.processid1})
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Wait until page contains    text=200 success    timeout=${login.timeout}
    Page should contain    text=200 success
    [Teardown]    Close Browser

DEV_TC7_OData_Processes_Negative
    [Documentation]    Process details belonging to another \ service of correct account , should not get fetched
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    6s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid1})/Services(${login.serviceid2})/Processes(${login.processid1})
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    Page should contain    text=500 error
    [Teardown]    Close Browser

DEV_TC8_OData_ProcessesNegative
    [Documentation]    Process details belonging to correct \ service but diffenrent account mentioned, so should not get fetched
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid2})/Services(${login.serviceid2})/Processes(${login.processid1})
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    [Teardown]    Close Browser

DEV_TC9_OData_ExtensionPositive
    [Documentation]    If correct Extension id, \ correct service, correct account is mentioned, then extension details should get fetched
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid1})/Services(${login.serviceid2})/Extensions(${login.extensionsid1})
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Wait until page contains    text=200 success    timeout=${login.timeout}
    Page should contain    text=200 success
    [Teardown]    Close Browser

DEV_TC10_OData_ExtensionNegative
    [Documentation]    If correct Extension id, \ correct account, but incorrect service, is mentioned, then extension details should not get fetched
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid1})/Services(${login.serviceid1})/Extensions(${login.extensionsid1})
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    [Teardown]    Close Browser

DEV_TC11_OData_ExtensionNegative
    [Documentation]    If correct Extension id, \ correct service, but incorrect account is mentioned, then extension details should not get fetched
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid2})/Services(${login.serviceid2})/Extensions(${login.extensionsid1})
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    [Teardown]    Close Browser

DEV_TC12_OData_ServiceParameterPositive
    [Documentation]    If correct Extension id, \ correct service, correct account is mentioned, then extension details should get fetched
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid1})/Services(${login.serviceid3})/ServiceParameters
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Wait until page contains    text=200 success    timeout=${login.timeout}
    Page should contain    text=200 success
    [Teardown]    Close Browser

DEV_TC13_OData_ServiceParameterNegative
    [Documentation]    If correct Service id but incorrect account name mentioned, then Service parameters should not get feteched
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid3} )/Services(${login.serviceid3})/ServiceParameters
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    [Teardown]    Close Browser

DEV_TC14_OData_CrossReferencePositive
    [Documentation]    If correct service, correct account id is mentioned then cross reference details should be fetched correctly
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid1})/Services(${login.serviceid2})/CrossReferences
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Wait until page contains    text=200 success    timeout=${login.timeout}
    Page should contain    text=200 success
    [Teardown]    Close Browser

DEV_TC15_OData_CrossReferenceNegative
    [Documentation]    If correct service, but another \ account id is mentioned then cross reference details should not be fetched
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid2})/Services(${login.serviceid2})/CrossReferences
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    [Teardown]    Close Browser

DEV_TC16_OData_CounterPositive
    [Documentation]    If correct service, correct account id is mentioned then counter details should be fetched correctly
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    5s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid1})/Services(${login.serviceid1})/Counters
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Wait until page contains    text=200 success    timeout=${login.timeout}
    Page should contain    text=200 success
    [Teardown]    Close Browser

DEV_TC17_OData_CounterNegative
    [Documentation]    If correct service, incorrect account id is mentioned then Counter details should not be fetched correctly
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    5s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid2})/Services(${login.serviceid2})/Counters
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    [Teardown]    Close Browser

DEV_TC18_OData_EPBindingPositive
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid1})/Services(${login.serviceid2})/Endpoints(${login.endpointsid1})/EndpointBindings(${login.bindingsid1})
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Wait until page contains    text=200 success    timeout=${login.timeout}
    Page should contain    text=200 success
    [Teardown]    Close Browser

DEV_TC19_OData_EPBindingNegative
    [Documentation]    correct account name, correct service, incorrect endpoint - binding ids, binding details not fetched
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid1})/Services(${login.serviceid1})/Endpoints(${login.endpointsid1})/EndpointBindings(${login.bindingsid1})
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    [Teardown]    close Browser

DEV_TC20_OData_EPBindingNegative
    [Documentation]    incorrect account name, correct service, correct endpoint - binding ids, binding details not fetched
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    5s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid2})/Services(${login.serviceid2})/Endpoints(${login.endpointsid1})/EndpointBindings(${login.bindingsid1})
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    [Teardown]    Close browser

DEV_TC21_OData_EndpointPositive
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid1})/Services(${login.serviceid2})/Endpoints(${login.endpointsid1})
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Wait until page contains    text=200 success    timeout=${login.timeout}
    Page should contain    text=200 success
    [Teardown]    Close Browser

DEV_TC22_OData_EndpointNegative
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid2})/Services(${login.serviceid2})/Endpoints(${login.endpointsid1})
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    [Teardown]    Close Browser

DEV_TC23_OData_EndpointNegative
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid2})/Services(${login.serviceid2})/Endpoints
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    [Teardown]    Close Browser

DEV_TC24_OData_ServiceLogPositive
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep   4s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid1})/Services(${login.serviceid1})/ServiceLogs
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Wait until page contains    text=200 success    timeout=${login.timeout}
    Page should contain    text=200 success
    [Teardown]    Close Browser

DEV_TC25_OData_ServiceLogNegative
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid2})/Services(${login.serviceid2})/ServiceLogs
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    [Teardown]    Close Browser

DEV_TC26_OData_TransferPositive
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    5s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid1})/Transfers(${login.transferid1})
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Wait until page contains    text=200 success    timeout=${login.timeout}
    Page should contain    text=200 success
    [Teardown]    Close Browser

DEV_TC27_OData_TransferNegative
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid2})/Transfers(${login.transferid1})
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    [Teardown]    Close Browser

DEV_TC28_OData_ServiceDataPositive
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid1})/Services(${login.serviceid1})/ServiceDatas/FindItems(ItemType='Type2',Index1='',Index2='',Skip=0,Take=50)
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Wait until page contains    text=200 success    timeout=${login.timeout}
    Page should contain    text=200 success
    [Teardown]    Close Browser

DEV_TC29_OData_ServiceDataNegative
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    [Setup]    login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid2})/Services(${login.serviceid2})/ServiceDatas/FindItems(ItemType='Type2',Index1='',Index2='',Skip=0,Take=50)
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    [Teardown]    Close browser

DEV_TC30_OData_LibrariesPositive
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid1})/Services(${login.serviceid2})/CodeLibraries
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Wait until page contains    text=200 success    timeout=${login.timeout}
    Page should contain    text=200 success
    [Teardown]    Close Browser

DEV_TC31_OData_LibrariesNegative
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid2})/Services(${login.serviceid2})/CodeLibraries
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    [Teardown]    Close browser

DEV_TC32_OData_SchedulesPositive
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid1})/Services(${login.serviceid2})/Schedules
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Wait until page contains    text=200 success    timeout=${login.timeout}
    Page should contain    text=200 success
    [Teardown]    Close Browser

DEV_TC33_OData_SchedulesNegative
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    5s
    Wait until element is visible    xpath=/html/body/main/section/section/header/form/div/input    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(${login.accountid2})/Services(${login.serviceid2})/Schedules
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    [Teardown]    Close browser
    
*** Keywords ***
Login
    Open Browser    ${login.url}    headlesschrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in




