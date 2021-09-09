*** Settings ***
Library           SeleniumLibrary
Variables         variablesfile.yaml
*** Test Cases ***

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
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Selects Service
    Click Element    class=fa-object-group    #Click Processes
    Wait Until Element Is Visible    class=fa-plus    timeout=16s
    Click Element    xpath=//*[@id="webide"]/main/section/section/header/button[1]    #Clicks Add Process button
    Wait until page contains    text=Add new process    timeout=18s
    Input Text    name=processName    1Process    #Provide new process name
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div/div[2]/form/button    #Click Save
    Wait until page contains element    class=fa-play    timeout=16s
    Page should contain element    class=fa-play    #New process page should be displayed with Start button
    close browser

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
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-object-group    # Clicks Processes
    Wait until Page contains    text=1Process    timeout=16s
    ${process}=    Get Text    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[2]/a    #Gets name of the process that will be deleted
    Click Element    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[9]/div/button    #Click delete
    Sleep    4s
    Input Text    xpath=//*[@id="input-8"]    ${process}    #Enter process name on delete pop up window
    Wait until element is enabled    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    timeout=16s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]
    close browser

Dev_TC03_DeleteProcess_ProcessNameIncorect
    [Documentation]    Check that delete button should not be active if On delete window,process name entered is incorrect
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
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    #Select Service
    Click Element    class=fa-object-group    #Click on Processes
    Wait until Page contains    text=2enpoint    timeout=16s
    Click Element    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[9]/div/button    #Click on delete button in first row
    Sleep    6s
    Input Text    xpath=//*[@id="input-8"]    8134 Bug    # enter incorrect process name in delete popup window
    Sleep    6s
    Element Should Be Disabled    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    #Check that delete button should be disabled
    close browser

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
    Wait until Page contains    text=2enpoint    timeout=16s
    ${process}=    Get Text    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[2]/a    #get the process name to be deleted
    Click Element    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[9]/div/button    # click delete button
    Sleep    6s
    Input Text    xpath=//*[@id="input-8"]    ${process}    # get in the process name to be deleted
    Wait until element is enabled    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    timeout=16s
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
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-lightbulb-o    #Click endpoints
    Wait until page contains    text=2enpoint    timeout=16s
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/div/button    #click delete button
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    #confirm deletion
    Wait until page does not contain    text=1Process    timeout=16s
    close browser

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
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-object-group    # Click on processes
    Wait until Page contains    text=2enpoint    timeout=16s
    Click Element    xpath=//*[@id="webide"]/main/section/section/header/button[1]    # click on add process
    Wait until page contains    text=Add new process
    Input Text    name=processName    ProcessNew12121    # try adding adding process that already exist
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div/div[2]/form/button    # click save button
    Wait until page contains    text=Error    timeout=16s
    Page should not contain element    class=fa-play    # Error message should be displayed
    close browser

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
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-lightbulb-o    # Click on Endpoints
    Wait until page contains    text=2enpoint    timeout=16s
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/div/button    # click on delete enpoint
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    # confirm deletion on endpoint
    Wait until page contains    text=Can't delete an endpoint that has a process attached    timeout=16s
    Page Should contain    text=Can't delete an endpoint that has a process attached    # error message should be displayed since endpoint associated to a process
    close browser

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
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-lightbulb-o    # click on endpoints
    Wait until page contains    text=2enpoint    timeout=16s
    Click Element    xpath=//*[@id="webide"]/main/section/section/section/header/button[1]/i    # click on add endpoint
    Sleep    4s
    Input text    name=Description    3Endpoint    # enter new endpoint name
    click element    xpath=//*[@id="webide"]/main/section/section/form/header/button    # save the endpoint
    Wait until page contains    text=3Endpoint
    Click Element    xpath=//*[@id="webide"]/main/section/section/section/header/button[2]    # refresh endpoints
    close browser

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
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-lightbulb-o    #Click endpoints
    Wait until page contains    text=2enpoint    timeout=16s
    click element    xpath=/html/body/main/section/section/section/article/ul/li[2]/h6/i
    sleep    6s
    Click Element    xpath=/html/body/main/section/section/form/header/div/button    #click delete button
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    #confirm deletion
    Wait until page does not contain    text=3endpoint    timeout=16s
    close browser



Dev_TC10_AddServiceParameter_Positive
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
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-cogs    # Click on Parameters link
    Wait until page contains element    xpath=//*[@id="webide"]/main/section/section/section/header/button[1]    timeout=16s
    Click Element    xpath=//*[@id="webide"]/main/section/section/section/header/button[1]    # click on Add parameter
    Sleep    4s
    Input Text    name=ID    1parameter    # enter parameter name
    Execute javascript    _editor = document.querySelectorAll("div.CodeMirror")[0].CodeMirror;    _editor.setValue("Value for Key1")    # set value for parameter
    Sleep    5s
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/div[1]/button    # click save button
    Wait until page contains    text=1parameter    timeout=16s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/header/button[2]/i    # click refresh
    Wait until page contains    text=1parameter    timeout=16s
    Page should contain    text=1parameter    # check that page should display new parameter added
    close browser

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
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # select service
    Click Element    class=fa-cogs    # click on paramters
    Sleep    6s
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/div[2]/button/i    # click on delete button
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i    # confirm deletion
    Wait until page does not contain    text=1parameter    timeout=16s
    close browser

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
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]
    sleep    4s
    Click Element    class=fa-table    # click on cross reference
    Wait until page contains    text=Table20    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/section[1]/header/button[1]    # click on add cross reference table
    sleep    4s
    Input Text    name=newTableName    Table1    # Add a table name
    click element    xpath=//*[@id="webide"]/div[5]/form/div/div[3]/div/button[1]    #click add key
    Wait until page contains    text=Table20    timeout=18s
    Sleep    2s
    Input Text    xpath=/html/body/main/section/section/section[2]/form[1]/article/div/div[1]/div/input    key1122
    Execute javascript    _editor = document.querySelectorAll("div.CodeMirror")[0].CodeMirror;    _editor.setValue("Value for Key1122")
    Sleep    5s
    Click element    xpath=//*[@id="webide"]/main/section/section/section[2]/form[1]/header/button
    close browser

Dev_TC13_Delete_CrossReferenceKey
    [Documentation]    Check user can delete Cross reference key on UI
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]
    sleep    4s
    Click Element    class=fa-table    #Click on Cross Reference
    Sleep    2s
    Click Element    xpath=//*[@id="webide"]/main/section/section/section[2]/form[1]/header/div/button/i
    Sleep    2s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]
    Sleep    2s
    Click element    xpath=//*[@id="webide"]/main/section/section/section[1]/header/button[2]
    close browser

Dev_TC14_Delete_Counter
    [Documentation]    Check user can delete Counter on UI
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-calculator    #Click on Counters
    Wait until page contains    text=Counter3    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/section/table/tbody/tr/td[3]/div/button/i    #Click Delete
    Sleep    2s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i    #Click Delete on confimation
    close browser

Dev_TC15_Search_Counter
    [Documentation]    Check user can search Counter on UI
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    #Select Service
    Click Element    class=fa-calculator    # Click on counters
    Wait until page contains    text=Counter3    timeout=18s
    Input text    name=filterName    Counter3    # Enter Counter3 in Search
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/div[2]/button/i    #Click refresh
    Wait until page contains element    class=fa-remove
    Page should contain Element    class=fa-remove
    Close browser

Dev_TC16_Add And Delete Extension
    [Documentation]    Check user add and Delete extension if it is not associated to a process
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select service
    Click Element    class=fa-plug    #Click extension
    sleep    12s
    Click Element    class=fa-plus    # Click on Add
    Sleep    6s
    Input Text    name=extension.Name    Ext2    #Enter Extension name
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/button[1]    #Click save
    sleep    12s
    click element    xpath=//*[@id="webide"]/main/section/section/form/header/div/button/i    #Click delete
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i    # Confirm deletion
    close browser

Dev_TC17_Add Library
    [Documentation]    Check user can add Library
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    #Select Service
    Click Element    class=fa-book    #Click on Library
    Sleep    4s
    Click Element    class=fa-plus    #Click on Add
    Wait until page contains    text=// You can define static functions and variables that will be available in all steps.    timeout=18s
    Input Text    name=Name    Default1    #Enter Library Name
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i    #Click Save
    Wait until page contains    text=Default1    timeout=18s
    Element should be Enabled    class=fa-refresh    #Click refresh
    close browser

Dev_TC18_Delete Library
    [Documentation]    Check user can delete library
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    #Select Service
    Click Element    class=fa-book    #Click on Library
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/div/button/i    #Click on delete
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i    #Confirm deletion
    Wait until page does not contain    text=Default1    timeout=18s
    close browser

Dev_TC21-Alerts_FilterByInfo
    [Documentation]    Check user can filter Alerts by Info
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select Service
    Click Element    class=fa-bell    #Click on Alerts
    Wait until page contains element    name=filterInfo    timeout=18s
    Input text    name=filterInfo    Info3    # Enter into filter criteria
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/header/form/div[4]/button/i    #click refresh
    sleep    11s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section[1]/section[1]/article/ul/li[2]
    Wait until page does not contain    text=No alerts found    timeout=18s
    Page should not contain    text=No alerts found
    

Dev_TC25-Logs-information
    [Documentation]    Check user can Filter Logs by information
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-info-circle
    sleep    6s
    Input text    name=filterInformation    hii
    sleep    4s    timeout=18s
    Page should not contain    text=hello
    page should contain    text=hii
    

Dev_TC28-Logout
    [Documentation]    Check user can logout from the application
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[2]/div/p/i
    Click element    class=fa-cog
    Click element    xpath=//*[@id="webide"]/aside/div[2]/div/a[5]/i
    Handle Alert
    Wait until page contains    text=Please log in to access Youredi.    timeout=18s
    Page should contain element    xpath=//*[@id="login"]/div/div[1]/div[2]/form/div[4]/div/button/i

Dev_TC34_AddUserToOrganization
    [Documentation]    Check we can add User to Organisation
    ...
    ...    Test data setup
    ...    Komal test organisation
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    15s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    click element    xpath=//*[@id="webide"]/main/section/section/div/div[2]/div[1]/p/a[2]
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[1]/span[2]/a/i
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section/header/button[1]/i
    wait until page contains    text=Add user    timeout=18s
    Input Text    xpath=/html/body/main/section/section/section/section/div/div/div[2]/form/div/div/input    aryan@youredi.com
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section/div/div/div[2]/form/div/div/span/span/button/i
    Sleep    11s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section/div/div/div[2]/form/div[2]/button/i
    sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/form/header/button/i
    close browser

Dev_TC36_EditUserRoleInOrganization
    [Documentation]    Check that we can edit role for the user for organisation
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    16s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    click element    xpath=//*[@id="webide"]/main/section/section/div/div[2]/div[1]/p/a[2]
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[1]/span[2]/a/i
    sleep    4s
    Select from list by value    name=Role    Designer
    Wait until page contains    text=Designer
    Click element    xpath=//*[@id="webide"]/main/section/section/section/form/header/button/i
    Close browser

Dev_TC35_DeleteUserFromOrganization
    [Documentation]    check that we can delete user from organisation
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    16s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    click element    xpath=//*[@id="webide"]/main/section/section/div/div[2]/div[1]/p/a[2]
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[1]/span[2]/a/i
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/form/header/div/button/i
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i
    Wait until page does not contain    text=Aryan    timeout=18s
    Page should not contain    text=Aryan


TC039_Transfer_FilterById
    [Documentation]    Check that user can filter transactions by id
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    15s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    click element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[1]/p/a[2]
    click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[2]/div/a/i
    sleep    4s
    Input text    xpath=/html/body/main/section/header/form/div[1]/div[5]/div[1]/div/input    44181485
    sleep    4s
    click element    xpath=/html/body/main/section/header/form/div[2]/div[4]/div/button[2]/i
    click element    xpath=/html/body/main/section/header/form/div[2]/div[4]/div/button[1]/i
    Wait until page contains    text=44181485
    Page should not contain    text=11425361
    Page should contain    44181485


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
    Select from list by value    xpath=//*[@id="webide"]/main/section/section/form/article/div[2]/select    906    #Select from parent org dropdown.For test = 1040, dev=14449,stage=906
    sleep    4s
    click element    xpath=/html/body/main/section/section/form/header/button[1]/i    #click save
    Page should contain    text=Komal test organistaion

Dev_TC45-Alerts_AddComment
    [Documentation]    Check user is able to add comments to alert on alert page
    ...
    ...    Test data setup. - Need an alert with info as Info3 in Demoservice of Komal Test Organisation
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select Service
    Click Element    class=fa-bell    #Click on Alerts
    wait until page contains    text=No alerts found.    timeout=18s
    Input text    name=filterInfo    Info3    # Enter into filter criteria
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/header/form/div[4]/button/i
    Sleep    3s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section[1]/section[1]/article/ul/li[2]
    Wait until page contains    text=Info3    timeout=18s
    Page should not contain    text=No alerts found
    Click element    xpath=/html/body/main/section/section/section/section[2]/article/div/div/ul/li[2]/a    # click on comments
    Sleep    4s
    Input Text    xpath=/html/body/main/section/section/section/section[2]/article/div/section/form/div[1]/input    TestCommentAdding
    Sleep    4s
    Click element    xpath=/html/body/main/section/section/section/section[2]/article/div/section/form/div[2]/button/i    # click on add
    Page should contain    text=TestCommentAdding


Dev_TC46-Alerts_AssignToMe
    [Documentation]    Check user is able to assign the alert to himself/herself
    ...
    ...    Test data setup. - Need an alert with info as Info3 in Demoservice of Komal Test Organisation
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select Service
    Click Element    class=fa-bell    #Click on Alerts
    Sleep    7s
    Input text    name=filterInfo    Info3    # Enter into filter criteria
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/header/form/div[4]/button/i
    Sleep    3s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section[1]/section[1]/article/ul/li[2]
    Wait until page contains    text=Info3    timeout=18s
    Page should not contain    text=No alerts found
    click element    xpath=/html/body/main/section/section/section/section[2]/header/div/div[2]/button[1]/i    # click on Assign to me
    sleep    4s
    ${assignedto}=    Get Text    xpath=/html/body/main/section/section/section/section[2]/article/div/section/div/dl/dd[6]/a    #Get value in Assigned to field
    Sleep    4s
    Should be equal as Strings    ${assignedto}    Komal Agarwal (komal@youredi.com)

Dev_TC47-Alerts_Unassign
    [Documentation]    Check user is able to unassign the alert
    ...
    ...    Test data setup. - Need an alert with info as Info3 in Demoservice of Komal Test Organisation
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select Service
    Click Element    class=fa-bell    #Click on Alerts
    Sleep    7s
    Input text    name=filterInfo    Info3    # Enter into filter criteria
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/header/form/div[4]/button/i
    Sleep    3s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section[1]/section[1]/article/ul/li[2]
    Wait until page contains    text=Info3    timeout=18s
    Page should not contain    text=No alerts found
    click element    xpath=/html/body/main/section/section/section/section[2]/header/div/div[2]/button[2]/i    # click on UnAssign
    sleep    4s
    ${assignedto}=    Get Text    xpath=/html/body/main/section/section/section/section[2]/article/div/section/div/dl/dd[6]/span    #Get value in Assigned to field
    Should be equal as Strings    ${assignedto}    Not assigned.
    
    
TC21-Alerts_FilterByAssignedTo
    [Documentation]    Check user can filter Alerts by Info
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select Service
    Click Element    class=fa-bell    #Click on Alerts
    sleep    4s
    Select from list by value    xpath=/html/body/main/section/section/header/form/div[2]/div[2]/select    928    # Enter into filter criteria 928 for stage , dev=16887
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/header/form/div[4]/button/i
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section[1]/section[1]/article/ul/li[3]
    Sleep    4s
    ${id}=    Get Text    xpath=/html/body/main/section/section/section/section[2]/article/div/section/div/dl/dd[1]
    Should be equal as Strings    ${id}    241869    #dev=203542
    close browser

Dev_TC53_ViewerRole
    [Documentation]    Check that user with only Viewer role can only see Account and Service Names.
    ...
    ...    Viewer cant see Transfers, Alerts, Processes etc
    Open Browser    ${login.url}    chrome
    Input Text    id=email    robot@youredi.com
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Page should contain    text=Komal test organistaion
    Page should contain    text=MainOrg    #org1 for dev, and MainOrg for stage
    Click element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    12s
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

