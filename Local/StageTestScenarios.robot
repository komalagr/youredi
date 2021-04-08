*** Settings ***
Library           SeleniumLibrary
Variables         variablesfile.yaml
*** Test Cases ***

Dev_TC34_AddUserToOrganization
    [Documentation]    Check we can add User to Organisation
    ...
    ...    Test data setup
    ...    Komal test organisation
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    25s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    click element    xpath=//*[@id="webide"]/main/section/section/div/div[2]/div[1]/p/a[2]
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[1]/span[2]/a/i
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section/header/button[1]/i
    wait until page contains    text=Add user    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/section/section/div/div/div[2]/form/div/div/input    aryan@youredi.com
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section/div/div/div[2]/form/div/div/span/span/button/i
    Sleep    11s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section/div/div/div[2]/form/div[2]/button/i
    sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/form/header/button/i
    sleep    6s
    Close browser
    
Dev_TC36_EditUserRoleInOrganization
    [Documentation]    Check that we can edit role for the user for organisation
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    25s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    click element    xpath=//*[@id="webide"]/main/section/section/div/div[2]/div[1]/p/a[2]
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[1]/span[2]/a/i
    sleep    4s
    Select from list by value    name=Role    Designer
    Wait until page contains    text=Designer    timeout=${login.timeout}
    Click element    xpath=//*[@id="webide"]/main/section/section/section/form/header/button/i
    sleep    4s
    Close browser
    
Dev_TC35_DeleteUserFromOrganization
    [Documentation]    check that we can delete user from organisation
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    25s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    click element    xpath=//*[@id="webide"]/main/section/section/div/div[2]/div[1]/p/a[2]
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[1]/span[2]/a/i
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/form/header/div/button/i
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i
    Wait until page does not contain    text=Aryan    timeout=${login.timeout}
    Page should not contain    text=Aryan
    Close browser
    
Dev_TC21-Alerts_FilterByInfo
    [Documentation]    Check user can filter Alerts by Info
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select Service
    Wait until page contains element    class=fa-bell    timeout=${login.timeout}
    Click Element    class=fa-bell    #Click on Alerts
    Wait until page contains element    name=filterInfo    timeout=${login.timeout}
    Input text    name=filterInfo    Info3    # Enter into filter criteria
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/header/form/div[4]/button/i    #click refresh
    Sleep    11s
    Wait until page contains    text=No alerts found.    timeout=${login.timeout}
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section[1]/section[1]/article/ul/li[2]
    Wait until page does not contain    text=No alerts found    timeout=${login.timeout}
    Page should not contain    text=No alerts found
    Close browser
    
Dev_TC45-Alerts_AddComment
    [Documentation]    Check user is able to add comments to alert on alert page
    ...
    ...    Test data setup. - Need an alert with info as Info3 in Demoservice of Komal Test Organisation
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    25s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select Service
    Wait until page contains element    class=fa-bell    timeout=${login.timeout}
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
    Input Text    xpath=/html/body/main/section/section/section/section[2]/article/div/section/form/div[1]/input    a
    Sleep    4s
    Click element    xpath=/html/body/main/section/section/section/section[2]/article/div/section/form/div[2]/button/i    # click on add
    Page should contain    text=TestCommentAdding
    Close browser
    
Dev_TC46-Alerts_AssignToMe
    [Documentation]    Check user is able to assign the alert to himself/herself
    ...
    ...    Test data setup. - Need an alert with info as Info3 in Demoservice of Komal Test Organisation
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    20s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select Service
    Wait until page contains element    class=fa-bell    timeout=${login.timeout}
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
    Close browser
    
Dev_TC47-Alerts_Unassign
    [Documentation]    Check user is able to unassign the alert
    ...
    ...    Test data setup. - Need an alert with info as Info3 in Demoservice of Komal Test Organisation
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select Service
    Wait until page contains element    class=fa-bell    timeout=${login.timeout}
    Click Element    class=fa-bell    #Click on Alerts
    Sleep    6s
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
    Close browser
    
Dev_TC21-Alerts_FilterByAssignedTo
    [Documentation]    Check user can filter Alerts by Info
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select Service
    Wait until page contains element    class=fa-bell    timeout=${login.timeout}
    Click Element    class=fa-bell    #Click on Alerts
    sleep    11s
    Select from list by value    xpath=/html/body/main/section/section/header/form/div[2]/div[2]/select    928    
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/header/form/div[4]/button/i
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section[1]/section[1]/article/ul/li[3]
    Sleep    8s
    Page should not contain    text=No alerts found
    Wait until page contains    text=1category    timeout=${login.timeout}
    ${id}=    Get Text    xpath=/html/body/main/section/section/section/section[2]/article/div/section/div/dl/dd[1]
    Should be equal as Strings    ${id}    241869    
    Close browser
    
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
    Click Element    class=fa-calculator    #Click on Counters
    Wait until page contains    text=Counter3    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/section/table/tbody/tr/td[3]/div/button/i    #Click Delete
    Sleep    2s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i    #Click Delete on confimation
    Close browser
  
    
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
    Click Element    class=fa-calculator    # Click on counters
    Wait until page contains    text=Counter3    timeout=${login.timeout}
    Input text    name=filterName    Counter3    # Enter Counter3 in Search
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/div[2]/button/i    #Click refresh
    Wait until page contains element    class=fa-remove
    Page should contain Element    class=fa-remove
    Close browser
    
    
Dev_TC12_AddCrossReference_Positive
    [Documentation]    Check user can add Cross reference key on UI
    ...
    ...    Test Data Setup
    ...    1. Need Organization -- Name : Komal test organistaion
    ...    2. Need Service -- DemoService2
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]
    sleep    25s
    Wait until element is visible    class=fa-table    timeout=${login.timeout}
    Click Element    class=fa-table    # click on cross reference
    sleep    25s
    Wait until page contains    text=Table20    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/section[1]/header/button[1]    # click on add cross reference table
    sleep    4s
    Input Text    name=newTableName    Table1    # Add a table name
    click element    xpath=//*[@id="webide"]/div[5]/form/div/div[3]/div/button[1]    #click add key
    Wait until page contains    text=Table20    timeout=${login.timeout}
    Sleep    2s
    Input Text    xpath=/html/body/main/section/section/section[2]/form[1]/article/div/div[1]/div/input    key1122
    Execute javascript    _editor = document.querySelectorAll("div.CodeMirror")[0].CodeMirror;    _editor.setValue("Value for Key1122")
    Sleep    5s
    Click element    xpath=//*[@id="webide"]/main/section/section/section[2]/form[1]/header/button
    Sleep    8s
    Close browser
    
Dev_TC13_Delete_CrossReferenceKey
    [Documentation]    Check user can delete Cross reference key on UI
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    21s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]
    sleep    25s
    Wait until element is visible    class=fa-table    timeout=${login.timeout}
    Click Element    class=fa-table    #Click on Cross Reference
    Sleep    2s
    Click Element    xpath=//*[@id="webide"]/main/section/section/section[2]/form[1]/header/div/button/i
    Sleep    2s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]
    Sleep    2s
    Click element    xpath=//*[@id="webide"]/main/section/section/section[1]/header/button[2]
    Sleep    2s
    Close browser
    
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
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=/html/body/main/section/section/div/div[3]/div/p/a[2]    # Selects org2
    sleep    4s
    click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[1]/span[2]/a/i    #Click on edit org2
    sleep    4s
    Select from list by value    xpath=//*[@id="webide"]/main/section/section/form/article/div[2]/select    906    #Select from parent org dropdown.For test = 1040, dev=14449,stage=906
    sleep    4s
    click element    xpath=/html/body/main/section/section/form/header/button[1]/i    #click save
    Page should contain    text=Komal test organistaion
    Close browser

Dev_TC17_Add Library
    [Documentation]    Check user can add Library
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    #Select Service
    Click Element    class=fa-book    #Click on Library
    Sleep    4s
    Click Element    class=fa-plus    #Click on Add
    Wait until page contains    text=// You can define static functions and variables that will be available in all steps.    timeout=${login.timeout}
    Input Text    name=Name    Default1    #Enter Library Name
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i    #Click Save
    Wait until page contains    text=Default1    timeout=${login.timeout}
    Element should be Enabled    class=fa-refresh    #Click refresh
    Close browser
   
    
Dev_TC18_Delete Library
    [Documentation]    Check user can delete library
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    #Select Service
    Click Element    class=fa-book    #Click on Library
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/div/button/i    #Click on delete
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i    #Confirm deletion
    Wait until page does not contain    text=Default1    timeout=${login.timeout}
    Close browser
  
Dev_TC28-Logout
    [Documentation]    Check user can logout from the application
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[2]/div/p/i
    Click element    class=fa-cog
    Click element    xpath=//*[@id="webide"]/aside/div[2]/div/a[5]/i
    Handle Alert
    Wait until page contains    text=Please log in to access Youredi.    timeout=${login.timeout}
    Page should contain element    xpath=//*[@id="login"]/div/div[1]/div[2]/form/div[4]/div/button/i
    Close browser
    
Dev_TC01_AddProcess
    [Documentation]    Check that If Process does not exist , it should get added successfully
    ...
    ...    Test Data Setup
    ...    1. Need Organization Name : Komal test organistaion
    ...    2. Need Service -- DemoService
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    16s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Selects Service
    Click Element    class=fa-object-group    #Click Processes
    Wait Until Element Is Visible    class=fa-plus    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/header/button[1]    #Clicks Add Process button
    Wait until page contains    text=Add new process    timeout=${login.timeout}
    Input Text    name=processName    1Process    #Provide new process name
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div/div[2]/form/button    #Click Save
    Wait until page contains element    class=fa-play    timeout=${login.timeout}
    Page should contain element    class=fa-play    #New process page should be displayed with Start button
    Close browser
    
    
Dev_TC02_DeleteProcess_PositiveScenario
    [Documentation]    Check that user is able to delete the process if process name entered on Delete pop up window is correct
    ...
    ...    Test data setup
    ...    Need process- 1Process added to DemoService in Komal test organistaion
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    16s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-object-group    # Clicks Processes
    Wait until Page contains    text=1Process    timeout=${login.timeout}
    ${process}=    Get Text    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[2]/a    #Gets name of the process that will be deleted
    Click Element    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[9]/div/button    #Click delete
    Sleep    4s
    Input Text    xpath=//*[@id="input-8"]    ${process}    #Enter process name on delete pop up window
    Wait until element is enabled    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]
    Sleep    4s
    Close browser
    
Dev_TC03_DeleteProcess_ProcessNameIncorect
    [Documentation]    Check that delete button should not be active if On delete window,process name entered is incorrect
    ...
    ...    Test Data setup
    ...    1. Komal test organistaion \ -- DemoService
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    #Select Service
    Click Element    class=fa-object-group    #Click on Processes
    Wait until Page contains    text=2enpoint    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[9]/div/button    #Click on delete button in first row
    Sleep    6s
    Input Text    xpath=//*[@id="input-8"]    8134 Bug    # enter incorrect process name in delete popup window
    Sleep    6s
    Element Should Be Disabled    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    #Check that delete button should be disabled
    Sleep    4s
    Close browser
 
Dev_TC04_DeleteProcess_Cancel
    [Documentation]    Check that user if User clicks on cancel button on Delete process page, then process should not get deleted
    ...
    ...
    ...    Test Data setup
    ...    1. Komal test organistaion \ -- DemoService
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    16s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # select service
    Click Element    class=fa-object-group    # click on processes
    Wait until Page contains    text=2enpoint    timeout=${login.timeout}
    ${process}=    Get Text    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[2]/a    #get the process name to be deleted
    Click Element    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[9]/div/button    # click delete button
    Sleep    6s
    Input Text    xpath=//*[@id="input-8"]    ${process}    # get in the process name to be deleted
    Wait until element is enabled    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[2]    # click cancel on delete pop up window
    Sleep    10s
    Page should contain    text=${process}
    Close browser
    
Dev_TC05_DeleteEndpoint_Positive
    [Documentation]    Check that If endpoint is not assoicated to a process, then it should get deleted
    ...
    ...    Test Data setup
    ...    1. Komal test organistaion \ -- DemoService \ -- 1Process
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-lightbulb-o    #Click endpoints
    Wait until page contains    text=2enpoint    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/div/button    #click delete button
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    #confirm deletion
    Wait until page does not contain    text=1Process    timeout=${login.timeout}
    Close browser
    
Dev_TC06_AddProcess_Negative_ProcessAlreadyExist
    [Documentation]    Check that process should not get added if Process name or endpoint name already exist
    ...
    ...
    ...    Test Data Setup
    ...    1. Need Organization -- Name : Komal test organistaion
    ...    2. Need Service -- DemoService
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    15s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-object-group    # Click on processes
    Wait until Page contains    text=2enpoint    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/header/button[1]    # click on add process
    Wait until page contains    text=Add new process
    Input Text    name=processName    ProcessNew12121    # try adding adding process that already exist
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div/div[2]/form/button    # click save button
    Wait until page contains    text=Error    timeout=${login.timeout}
    Page should not contain element    class=fa-play    # Error message should be displayed
    Close browser
    
Dev_TC07_DeleteEndpoint_Negative_EndpointAssociatedToProcess
    [Documentation]    Check that If endpoint is associated to a process , endpoint should not get deleted
    ...
    ...
    ...    Test Data Setup
    ...    1. Need Organization -- Name : Komal test organistaion
    ...    2. Need Service -- DemoService
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in    # Login
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-lightbulb-o    # Click on Endpoints
    Wait until page contains    text=2enpoint    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/div/button    # click on delete enpoint
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    # confirm deletion on endpoint
    Wait until page contains    text=Can't delete an endpoint that has a process attached    timeout=${login.timeout}
    Page Should contain    text=Can't delete an endpoint that has a process attached    # error message should be displayed since endpoint associated to a process
    Close browser
    
Dev_TC08_AddEndpoint_Positive
    [Documentation]    Check user can add endpoint if it does not already exist
    ...
    ...
    ...    Test Data Setup
    ...    1. Need Organization -- Name : Komal test organistaion
    ...    2. Need Service -- DemoService
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-lightbulb-o    # click on endpoints
    Wait until page contains    text=2enpoint    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/section/header/button[1]/i    # click on add endpoint
    Sleep    4s
    Input text    name=Description    3Endpoint    # enter new endpoint name
    click element    xpath=//*[@id="webide"]/main/section/section/form/header/button    # save the endpoint
    Wait until page contains    text=3Endpoint    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/section/header/button[2]    # refresh endpoints
    Close browser
    
Dev_TC08b_DeleteEndpointforNextrun
    [Documentation]    Check that If endpoint is not assoicated to a process, then it should get deleted
    ...
    ...    Test Data setup
    ...    1. Komal test organistaion \ -- DemoService \ -- 1Process
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-lightbulb-o    #Click endpoints
    Wait until page contains    text=2enpoint    timeout=${login.timeout}
    click element    xpath=/html/body/main/section/section/section/article/ul/li[2]/h6/i
    sleep    6s
    Click Element    xpath=/html/body/main/section/section/form/header/div/button    #click delete button
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    #confirm deletion
    Wait until page does not contain    text=3endpoint    timeout=${login.timeout}
    Close browser
    
Dev_TC53_ViewerRole
    [Documentation]    Check that user with only Viewer role can only see Account and Service Names.
    ...
    ...    Viewer cant see Transfers, Alerts, Processes etc
    Open Browser    ${login.url}    chrome
    Input Text    id=email    robot@youredi.com
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    16s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Page should contain    text=Komal test organistaion
    Page should contain    text=MainOrg    #org1 for dev, and MainOrg for stage
    Page should contain    text=DemoService
    Page should contain    text=DemoService2
    click element    xpath=/html/body/main/section/section/div/div[1]/div[1]/p/a[2]
    Page should not contain element    class=fa-dashboard
    Page should not contain element    class=fa-bell
    Click element    xpath=/html/body/main/section/section/div/div[1]/div[2]/div[1]/div/p/a
    Sleep    4s
    Page should not contain element    class=fa-object-group
    Page should not contain element    class=fa-book
    Page should not contain element    class=fa-lightbulb-o
    Page should not contain element    class=fa-cogs
    Page should not contain element    class=fa-table
    Page should not contain element    class=fa-plug
    Page should not contain element    class=fa-calendar
    Page should not contain element    class=fa-exclamation-cirlce
    Page should not contain element    class=fa-cubes
    Close browser
    
Dev_TC25-Logs-information
    [Documentation]    Check user can Filter Logs by information
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-info-circle
    sleep    6s
    Input text    name=filterInformation    hii
    sleep    4s
    Wait until page contains    text=hii    timeout=${login.timeout}
    Page should not contain    text=hello
    page should contain    text=hii
    Close browser
    
TC10_AddServiceParameter_Positive
    [Documentation]    Check user can add Service parameter on Parameter UI page
    ...
    ...
    ...    Test Data Setup
    ...    1. Need Organization -- Name : Komal test organistaion
    ...    2. Need Service -- DemoService
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    15s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-cogs    # Click on Parameters link
    Wait until page contains element    xpath=//*[@id="webide"]/main/section/section/section/header/button[1]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/section/header/button[1]    # click on Add parameter
    Sleep    4s
    Input Text    name=ID    1parameter    # enter parameter name
    Execute javascript    _editor = document.querySelectorAll("div.CodeMirror")[0].CodeMirror;    _editor.setValue("Value for Key1")    # set value for parameter
    Sleep    5s
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/div[1]/button    # click save button
    Wait until page contains    text=1parameter    timeout=16s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/header/button[2]/i    # click refresh
    Wait until page contains    text=1parameter    timeout=${login.timeout}
    Page should contain    text=1parameter    # check that page should display new parameter added
    Close browser
    
Dev_TC11_DeleteParameter
    [Documentation]    Check user can delete service parameter
    ...
    ...    Test Data Setup
    ...    1. Need Organization -- Name : Komal test organistaion
    ...    2. Need Service -- DemoService
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # select service
    Click Element    class=fa-cogs    # click on paramters
    Sleep    6s
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/div[2]/button/i    # click on delete button
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i    # confirm deletion
    Wait until page does not contain    text=1parameter    timeout=${login.timeout}
    Close browser
    
TC09_ServiceDataPage
    [Documentation]    Check Service data UI page
    ...
    ...
    ...    Test Data Setup
    ...    1. Need Organization -- Name : Komal test organistaion
    ...    2. Need Service -- DemoService2
    ...
    ...    Service data should be set with following values
    ...    ItemType2
    ...    Index1 as In2
    ...    Index2 as Dex2
    ...
    ...    Data as DataResult
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    15s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]    #Select Service
    Sleep    18s
    Wait until page contains element    class=fa-cubes    timeout=${login.timeout}
    Click Element    class=fa-cubes    # click on Service data link
    Wait until page contains element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i    timeout=${login.timeout}
    Input Text    name=itemType    Type2    # enter item type
    Input Text    name=index1    In2    # enter index1
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i
    Wait until page contains    text=DataResult    timeout=${login.timeout}
    Page should contain    text=DataResult    # Service Data - Data should fe fetched
    Close browser
    
TC039_Transfer_FilterById
    [Documentation]    Check that user can filter transactions by id
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    15s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    click element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[1]/p/a[2]
    click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[2]/div/a/i
    sleep    4s
    Input text    xpath=/html/body/main/section/header/form/div[1]/div[5]/div[1]/div/input    45649376    #for dev - 11303940, stage=43179132
    sleep    4s
    click element    xpath=/html/body/main/section/header/form/div[2]/div[4]/div/button[2]/i
    click element    xpath=/html/body/main/section/header/form/div[2]/div[4]/div/button[1]/i
    Wait until page contains    text=45649376    timeout=${login.timeout}
    Page should not contain    text=11425361
    Page should contain    45649376
    Close browser
    
TC33_PBI 8220: Web IDE: changing of Endpoint type.
    [Documentation]    Check user can edit endpoint type if it Binding is not associated to it
    ...
    ...    Komal Test Organisation - Demo Service 3
    ...    Endpoint \ with type Inbound and no binding attached to it
    ...    Endpoint is associated to a process
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    16s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[3]/div/p/a[2]
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[7]/a/i    #Click endpoints
    Wait until page contains    text=Binding    timeout=${login.timeout}
    click element    xpath=//*[@id="webide"]/main/section/section/section/header/button[2]/i
    Sleep    4s
    Select from List by Value    xpath=//*[@id="webide"]/main/section/section/form/article/div/div[2]/select    4
    sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/header/button[2]
    Page should not contain    text=Can't change type of an endpoint that has endpoint bindings
    Close browser
    
TC34_CannotChangeEndpointType_IfBindingassociated
    [Documentation]    Check user cannot edit endpoint type if it Binding is associated to it
    ...
    ...    Test Data setup
    ...    Komal Test Organisation - DemoService4
    ...    EndpointB1 with Binding
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    16s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[4]/div[1]/p/a[2]
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[7]/a/i    #click on endpoints
    Sleep    4s
    Wait until page contains    text=1Space Trim Test    timeout=${login.timeout}
    Select from list by value    xpath=//*[@id="webide"]/main/section/section/form/article/div/div[2]/select    1
    sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i
    Wait until page contains    text=Can't change type of an endpoint that has endpoint bindings
    Page should contain    text=Can't change type of an endpoint that has endpoint bindings
    Close browser
    
TC16_Add Extension
    [Documentation]    Check user can add extension 
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select service
    wait until page contains element    class=fa-plug    timeout=${login.timeout}
    Click Element    class=fa-plug    #Click extension
    sleep    12s
    Click Element    class=fa-plus    # Click on Add
    Sleep    6s
    Input Text    name=extension.Name    Ext2    #Enter Extension name
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/button[1]    #Click save
    Sleep    6s
    Close browser
    
TC17_Delete Extension
    [Documentation]    Check user can Delete extension if it is not associated to a process
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select service
    wait until page contains element    class=fa-plug    timeout=${login.timeout}
    Click Element    class=fa-plug    #Click extension
    sleep    12s
    Wait Until Element Is Enabled    class=fa-remove    timeout=${login.timeout}
    click element    class=fa-remove    #Click delete
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i    # Confirm deletion
    Sleep    4s   
    Close browser
    
TC47_Bug 8386: Space at the end of process name should not prevent it to be deleted.
    [Documentation]    Check that if message property is set \ with empty value , still it should be displayed in Transfer messages
    ...
    ...    test data setup
    ...    Process - 1Space trim Test with extra spaces in end should be present in Demo service4
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    16s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section[1]/section/div/div[1]/div[2]/div[4]/div/p/a[2]    #click on demo service4
    Sleep    4s
    Wait Until page contains Element    class=fa-object-group    timeout=${login.timeout}
    Click element    xpath=/html/body/aside/div[1]/ul/li[5]/a/i    #click on processes
    Wait Until Element Is Visible    class=fa-plus    timeout=${login.timeout}
    Sleep    4s
    Click element    xpath=/html/body/main/section[1]/section/article/table/tbody/tr[1]/td[9]/div/button/i    #Click on delete
    Sleep    4s
    Input Text    xpath=/html/body/div[4]/form/div/div[2]/p[2]/input    1Space Trim Test
    sleep    4s
    Click element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i    #Confirm deletion
    wait until page contains element    class=fa-plus    timeout=${login.timeout}
    Page should not contain    text=1Space trim Test
    Close browser

TC20
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    16s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[3]/div/p/a[2]
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[7]/a/i    #Click endpoints
    Wait until page contains    text=Binding    timeout=${login.timeout}
    click element    xpath=//*[@id="webide"]/main/section/section/section/header/button[2]/i
    Sleep    4s
    Select from List by Value    xpath=//*[@id="webide"]/main/section/section/form/article/div/div[2]/select    1
    sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/header/button[2]
    Page should not contain    text=Can't change type of an endpoint that has endpoint bindings
    Close browser
    
T40_Add Comments to SubOrg Alerts
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    # Selects Organization
    click element    xpath=/html/body/main/section/section/div/div[4]/div/p/a[2]
    sleep    4s
    click element    class=fa-bell
    sleep    4s
    Select from list by value    xpath=/html/body/main/section/section/header/form/div[1]/div[1]/select    370
    Sleep    4s
    click element    xpath=/html/body/main/section/section/header/form/div[4]/button    #click refresh
    Sleep    8s
    Click element    xpath=/html/body/main/section/section/section/section[1]/section[1]/article/ul/li[2]
    Sleep    8s
    Click element    xpath=/html/body/main/section/section/section/section[2]/article/div/div/ul/li[2]/a    #click on comments
    sleep    5s
    Input Text    xpath=/html/body/main/section/section/section/section[2]/article/div/section/form/div[1]/input    Added Comments
    Click element    class=fa-plus
    Sleep    4s
    Page should not contain    text=404 error
    Close browser
    
TC31_Bug8642_ExtensionCanotBeDeleted_IfUsedInProcess
    [Documentation]    Check Extension cannot be deleted if referenced by another process
    ...
    ...
    ...    Test Data Setup
    ...    1. Need Organization -- Name : Komal test organistaion
    ...    2. Need Service -- DemoService2
    ...
    ...    Extension should be added and it should be referenced by some process in the service
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]    #Select Service
    Sleep    12s
    Wait until page contains element    class=fa-plug    timeout=${login.timeout}
    Click Element    class=fa-plug    #Click extension
    Wait Until page contains    text=Ext    timeout=${login.timeout}
    Sleep    11s
    Click element    class=fa-remove    #Click on Delete button
    Sleep    6s
    Click element    xpath=/html/body/div[4]/form/div/div[3]/span/button[1]/i    # Confirm deletion
    Wait until page contains    text=The extension cannot be deleted as it is being used in process    timeout=${login.timeout}
    Page should contain    text=The extension cannot be deleted as it is being used in process
    Close browser
    
TC54_DesignerRoleedit
    [Documentation]    Check that user with only designer role can see and access Accounts, Services, transfers, endpoints, processses, alerts etc.
    ...    But since no global admin rights he cant see Admin tools
    ...    and designer cant edit organization and services, alert settings
    Open Browser    ${login.url}    chrome
    Input Text    id=email    robotTester@youredi.com
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    16s
    Page should contain    text=Komal test organistaion    # can see org and its sub org
    Page should contain    text=MainOrg
    Click element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i
    Page should contain    text=DemoService    # can see services
    Page should contain    text=DemoService2
    click element    xpath=/html/body/main/section/section/div/div[1]/div[1]/p/a[2]
    Page should contain element    class=fa-dashboard    #can see Transfers
    Page should contain element    class=fa-bell    # can see alerts
    Page should not contain element    class=fa-edit    # cant edit organization
    Click element    xpath=/html/body/main/section/section/div/div[1]/div[2]/div[1]/div/p/a
    Sleep    4s
    Click element    xpath=/html/body/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Sleep    4s
    Page should not contain element    class=fa-edit
    Page should contain element    class=fa-object-group    # can see processes
    Page should contain element    class=fa-book    # can see libraries
    Page should contain element    class=fa-lightbulb-o    # can see endpoints
    Page should contain element    class=fa-cogs    # can see parameters
    Page should contain element    class=fa-table    # can see cross references
    Page should contain element    class=fa-plug    # can see extensions
    Page should contain element    class=fa-calendar
    Page should contain element    class=fa-calculator
    Page should contain element    class=fa-cubes
    Page should not contain element    class=fa-exclamation-cirlce    # cant see admin tools
    Click element    class=fa-lightbulb-o    # click on endpoints
    Wait until page contains    text=2enpoint    timeout=${login.timeout}
    click element    xpath=/html/body/main/section/section/section/article/ul/li[2]/h6/i
    click element    xpath=/html/body/main/section/section/form/header/div/button/i    # able to delete endpoints
    sleep    2s
    click element    xpath=/html/body/div[4]/form/div/div[3]/span/button[1]/i
    sleep    4s
    click element    xpath=/html/body/aside/div[1]/ul/li[3]/a/i
    sleep    4s
    click element    xpath=/html/body/main/section/section/section/section[1]/section[1]/form/div/h6
    sleep    4s
    Scroll element into view    xpath=/html/body/main/section/section/section/section[1]/section[1]/form/div[2]/button/i
    Sleep    4s
    Click element    xpath=/html/body/main/section/section/section/section[1]/section[1]/form/div[2]/button/i
    wait until page contains    text=Not authorized    timeout=${login.timeout}
    Page should contain    text=Not authorized
    Close browser

Dev_TC54_AdminRole
    [Documentation]    Check that user that has Admin role but does not have Global admin rights, has full rights at account and service level but does not have access to admin tools
    Open Browser    ${login.url}    chrome
    Input Text    id=email    admintester@youredi.com
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    16s
    Page should contain    text=Komal test organistaion    # can see org and its sub org
    Page should contain    text=MainOrg
    Click element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i
    Page should contain    text=DemoService    # can see services
    Page should contain    text=DemoService2
    click element    xpath=/html/body/main/section/section/div/div[1]/div[1]/p/a[2]
    Page should contain element    class=fa-dashboard    #can see Transfers
    Page should contain element    class=fa-bell    # can see alerts
    Page should contain element    class=fa-edit    # cant edit organization
    Click element    xpath=/html/body/main/section/section/div/div[1]/div[2]/div[1]/div/p/a
    Sleep    4s
    Click element    xpath=/html/body/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Sleep    4s
    Page should contain element    xpath=/html/body/aside/div[1]/ul/li[4]/span[2]/a/i
    Page should contain element    class=fa-object-group    # can see processes
    Page should contain element    class=fa-book    # can see libraries
    Page should contain element    class=fa-lightbulb-o    # can see endpoints
    Page should contain element    class=fa-cogs    # can see parameters
    Page should contain element    class=fa-table    # can see cross references
    Page should contain element    class=fa-plug    # can see extensions
    Page should contain element    class=fa-calendar
    Page should contain element    class=fa-calculator
    Page should contain element    class=fa-cubes
    Page should not contain element    class=fa-exclamation-cirlce    # cant see admin tools
    Click element    class=fa-lightbulb-o    # click on endpoints
    Wait until page contains    text=2enpoint    timeout=${login.timeout}
    click element    xpath=/html/body/main/section/section/section/article/ul/li[2]/h6/i
    sleep    2s
    click element    xpath=/html/body/main/section/section/form/header/div/button/i    # able to delete endpoints
    sleep    4s
    click element    xpath=/html/body/div[4]/form/div/div[3]/span/button[1]/i
    sleep    4s
    click element    xpath=/html/body/aside/div[1]/ul/li[3]/a/i
    sleep    4s
    click element    xpath=/html/body/main/section/section/section/section[1]/section[1]/form/div/h6
    sleep    4s
    Scroll element into view    xpath=/html/body/main/section/section/section/section[1]/section[1]/form/div[2]/button/i
    Sleep    4s
    Click element    xpath=/html/body/main/section/section/section/section[1]/section[1]/form/div[2]/button/i    # can save alert settings
    Sleep    4s
    Page should not contain    text=Not authorized
    close browser
    
Dev_TC45-Alerts_AddPayload
    [Documentation]    Check user is able to add payload to alert on alert page
    ...
    ...    Test data setup. - Need an alert with info as Info3 in Demoservice of Komal Test Organisation
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    16s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
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
    Input Text    xpath=//*[@id="webide"]/main/section/section/section/section[2]/article/div/form/div[1]/textarea    add
    Sleep    4s
    Click element    xpath=/html/body/main/section/section/section/section[2]/article/div/form/div[2]/div/button[1]/i    # click on save
    sleep    4s
    Close browser
    
TC1OPData_AlertCommentsposiitve
    [Documentation]    User should be able to fetch Comments of Alert belonging to an account
    ...
    ...    Test data
    ...    Uodated Org having alert with comments
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(898)/Alerts(236598)/AlertComments
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should contain    text=200 success
    close browser

TC2OPData_AlertCommentsNeg
    [Documentation]    Comments of an alert that belongs to another account should not get fetched.error message should be displayed
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(263)/Alerts(236598)/AlertComments
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should contain    text=200 success
    close browser

TC3OPData_AlertsNegative
    [Documentation]    Alert of another account should not get fetched
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(263)/Alerts(236598)
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    Page should contain    text=404 error
    close browser

TC4OPData_Service_Positive
    [Documentation]    Service details belonging to \ account should get fetched
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(898)/Services(368)
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should contain    text=200 success
    close browser

TC5OPData_ServiceNegative
    [Documentation]    Service details belonging to \ another account should not get fetched
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(263)/Services(368)
    sleep    4s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    2s
    Page should not contain    text=200 success
    Page should contain    text=404 error
    close browser

TC6OPData_ProcessesPositive
    [Documentation]    Process details belonging to \ correct service, correct account should get fetched
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(898)/Services(368)/Processes(1970)
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should contain    text=200 success
    close browser

TC7OPData_Processes_Negative
    [Documentation]    Process details belonging to another \ service of correct account , should not get fetched
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(898)/Services(371)/Processes(1970)
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    Page should contain    text=500 error
    close browser

TC8OPData_ProcessesNegative
    [Documentation]    Process details belonging to correct \ service but diffenrent account mentioned, so should not get fetched
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(263)/Services(368)/Processes(1970)
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    Page should contain    text=404 error
    close browser

TC9OPData_ExtensionPositive
    [Documentation]    If correct Extension id, \ correct service, correct account is mentioned, then extension details should get fetched
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(898)/Services(368)/Extensions(4528056)
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should contain    text=200 success
    close browser

TC10OPData_ExtensionNegative
    [Documentation]    If correct Extension id, \ correct account, but incorrect service, is mentioned, then extension details should not get fetched
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(898)/Services(371)/Extensions(4528056)
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    close browser

TC11OPData_ExtensionNegative
    [Documentation]    If correct Extension id, \ correct service, but incorrect account is mentioned, then extension details should not get fetched
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(263)/Services(368)/Extensions(4528056)
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    close browser

TC12OPData_ServiceParameterPositive
    [Documentation]    If correct Extension id, \ correct service, correct account is mentioned, then extension details should get fetched
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(898)/Services(368)/ServiceParameters
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should contain    text=200 success
    close browser

TC13OPData_ServiceParameterNegative
    [Documentation]    If correct Service id but incorrect account name mentioned, then Service parameters should not get feteched
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(263)/Services(368)/ServiceParameters
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    close browser

TC14OPData_CrossReferencePositive
    [Documentation]    If correct service, correct account id is mentioned then cross reference details should be fetched correctly
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(898)/Services(368)/CrossReferences
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should contain    text=200 success
    close browser

TC15OPData_CrossReferenceNegative
    [Documentation]    If correct service, but another \ account id is mentioned then cross reference details should not be fetched
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(263)/Services(368)/CrossReferences
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    close browser

TC16OPData_CounterPositive
    [Documentation]    If correct service, correct account id is mentioned then counter details should be fetched correctly
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(898)/Services(368)/Counters
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should contain    text=200 success
    close browser

TC17OPData_CounterNegative
    [Documentation]    If correct service, incorrect account id is mentioned then Counter details should not be fetched correctly
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(263)/Services(368)/Counters
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    close browser

TC18OPData_EPBindingPositive
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(898)/Services(368)/Endpoints(3484)/EndpointBindings
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should contain    text=200 success
    close browser

TC19OPData_EPBindingNegative
    [Documentation]    correct account name, correct service, incorrect endpoint - binding ids, binding details not fetched
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(898)/Services(368)/Endpoints(3485)/EndpointBindings(1488)
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    close browser

TC20OPData_EPBindingNegative
    [Documentation]    incorrect account name, correct service, correct endpoint - binding ids, binding details not fetched
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    4s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(263)/Services(368)/Endpoints(3484)/EndpointBindings(1488)
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    close browser

TC21OPData_EndpointPositive
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(898)/Services(368)/Endpoints(3484)
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should contain    text=200 success
    close browser

TC22OPData_EndpointNegative
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(263)/Services(368)/Endpoints(3484)
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    close browser

TC23OPData_EndpointNegative
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(263)/Services(368)/Endpoints
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    close browser

TC24OPData_ServiceLogPositive
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(898)/Services(368)/ServiceLogs
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should contain    text=200 success
    close browser

TC25OPData_ServiceLogNegative
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(263)/Services(368)/ServiceLogs
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    close browser

TC26OPData_TransferPositive
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(898)/Transfers(45504474)
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should contain    text=200 success
    close browser

TC27OPData_TransferNegative
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(263)/Transfers(45504474)
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    close browser

TC28OPData_ServiceDataPositive
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(898)/Services(370)/ServiceDatas/FindItems(ItemType='ItemType1Update',Index1='',Index2='',Skip=0,Take=50)
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should contain    text=200 success
    close browser

TC29OPData_ServiceDataNegative
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(263)/Services(370)/ServiceDatas/FindItems(ItemType='ItemType1Update',Index1='',Index2='',Skip=0,Take=50)
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    close browser

TC30OPData_LibrariesPositive
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(898)/Services(370)/CodeLibraries
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should contain    text=200 success
    close browser

TC31OPData_LibrariesNegative
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(263)/Services(370)/CodeLibraries
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    close browser

TC32OPData_SchedulesPositive
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(898)/Services(370)/Schedules
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should contain    text=200 success
    close browser

TC33OPData_SchedulesNegative
    [Documentation]    If correct service, incorrect account id is mentioned then cross reference details should not be fetched correctly
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    click element    xpath=/html/body/aside/div[2]/button[2]/i
    click element    xpath=/html/body/aside/div[2]/div/a[1]
    sleep    2s
    Input Text    xpath=/html/body/main/section/section/header/form/div/input    /api/Accounts(263)/Services(370)/Schedules
    sleep    2s
    click element    xpath=/html/body/main/section/section/header/form/div/button/i
    sleep    4s
    Page should not contain    text=200 success
    close browser

   


