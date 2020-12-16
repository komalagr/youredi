*** Settings ***
Library           SeleniumLibrary
Variables         DevVariablesfile.yaml
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
    Sleep    11s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Selects Service
    Click Element    class=fa-object-group    #Click Processes
    Sleep    12s
    Capture Page Screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/header/button[1]    #Clicks Add Process button
    Sleep    12s
    Input Text    name=processName    1Process    #Provide new process name
    Sleep    11s
    Capture Page Screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div/div[2]/form/button    #Click Save
    Sleep    12s
    Page should contain element    class=fa-play    #New process page should be displayed with Start button
    Capture Page screenshot
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
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    11s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-object-group    # Clicks Processes
    Sleep    12s
    ${process}=    Get Text    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[2]/a    #Gets name of the process that will be deleted
    Capture Page Screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[9]/div/button    #Click delete
    Sleep    12s
    Input Text    xpath=//*[@id="input-8"]    ${process}    #Enter process name on delete pop up window
    Sleep    12s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]
    Sleep    11s
    Capture Page Screenshot
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
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    12s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    #Select Service
    Click Element    class=fa-object-group    #Click on Processes
    Sleep    12s
    Click Element    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[9]/div/button    #Click on delete button in first row
    Sleep    12s
    Input Text    xpath=//*[@id="input-8"]    8134 Bug    # enter incorrect process name in delete popup window
    Sleep    11s
    Element Should Be Disabled    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    #Check that delete button should be disabled
    Capture Page Screenshot
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
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    12s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # select service
    Click Element    class=fa-object-group    # click on processes
    Sleep    12s
    ${process}=    Get Text    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[2]/a    #get the process name to be deleted
    Capture Page Screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[9]/div/button    # click delete button
    Sleep    12s
    Input Text    xpath=//*[@id="input-8"]    ${process}    # get in the process name to be deleted
    Sleep    10s
    Capture Page Screenshot
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[2]    # click cancel on delete pop up window
    Sleep    10s
    Capture Page Screenshot
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
    Sleep    11s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-lightbulb-o    #Click endpoints
    Sleep    12s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/div/button    #click delete button
    Sleep    12s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    #confirm deletion
    Sleep    6s
    Capture Page Screenshot
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
    sleep    11s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-object-group    # Click on processes
    Sleep    12s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/header/button[1]    # click on add process
    Sleep    12s
    Input Text    name=processName    ProcessNew12121    # try adding adding process that already exist
    Sleep    11s
    Capture page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div/div[2]/form/button    # click save button
    Sleep    11s
    Page should not contain element    class=fa-play    # Error message should be displayed
    Capture Page screenshot
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
    Sleep    11s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-lightbulb-o    # Click on Endpoints
    Sleep    11s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/div/button    # click on delete enpoint
    Sleep    11s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    # confirm deletion on endpoint
    Sleep    11s
    Capture Page Screenshot
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
    Sleep    11s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-lightbulb-o    # click on endpoints
    Sleep    12s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/section/header/button[1]/i    # click on add endpoint
    Sleep    12s
    Input text    name=Description    3Endpoint    # enter new endpoint name
    click element    xpath=//*[@id="webide"]/main/section/section/form/header/button    # save the endpoint
    Sleep    11s
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
    Sleep    11s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-lightbulb-o    #Click endpoints
    Sleep    12s
    Capture Page screenshot
    click element    xpath=/html/body/main/section/section/section/article/ul/li[2]/h6/i
    sleep    12s
    Click Element    xpath=/html/body/main/section/section/form/header/div/button    #click delete button
    Sleep    11s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    #confirm deletion
    Sleep    6s
    Capture Page Screenshot
    close browser

Dev_TC09_ServiceDataPage
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
    Sleep    15s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]    #Select Service
    Sleep    18s
    Click Element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[14]/a/i    # click on Service data link
    Sleep    15s
    Capture Page Screenshot
    Input Text    name=itemType    Type2    # enter item type
    Input Text    name=index1    In2    # enter index1
    Input Text    name=index2    Dex2    # enter index 2
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i
    Sleep    15s
    capture page screenshot
    Page should contain    text=DataResult    # Service Data - Data should fe fetched

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
    Sleep    11s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-cogs    # Click on Parameters link
    Sleep    11s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/section/header/button[1]    # click on Add parameter
    Sleep    11s
    Input Text    name=ID    1parameter    # enter parameter name
    Execute javascript    _editor = document.querySelectorAll("div.CodeMirror")[0].CodeMirror;    _editor.setValue("Value for Key1")    # set value for parameter
    Sleep    5s
    Capture Page Screenshot
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/div[1]/button    # click save button
    sleep    11s
    Capture Page Screenshot
    Click element    xpath=//*[@id="webide"]/main/section/section/section/header/button[2]/i    # click refresh
    Sleep    11s
    Page should contain    text=1parameter    # check that page should display new parameter added

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
    Sleep    12s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # select service
    Click Element    class=fa-cogs    # click on paramters
    Sleep    15s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/div[2]/button/i    # click on delete button
    Sleep    11s
    Capture page screenshot
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i    # confirm deletion
    Sleep    11s
    Capture Page Screenshot

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
    Sleep    12s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]
    Sleep    11s
    Click Element    class=fa-table    # click on cross reference
    Sleep    12s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/section[1]/header/button[1]    # click on add cross reference table
    Sleep    11s
    Input Text    name=newTableName    Table1    # Add a table name
    Sleep    11s
    capture page screenshot
    click element    xpath=//*[@id="webide"]/div[5]/form/div/div[3]/div/button[1]
    sleep    12s
    Input Text    xpath=/html/body/main/section/section/section[2]/form[1]/article/div/div[1]/div/input    key1122
    Execute javascript    _editor = document.querySelectorAll("div.CodeMirror")[0].CodeMirror;    _editor.setValue("Value for Key1122")
    Sleep    5s
    Capture Page Screenshot
    Click element    xpath=//*[@id="webide"]/main/section/section/section[2]/form[1]/header/button
    sleep    6s
    Capture Page Screenshot
    close browser

Dev_TC13_Delete_CrossReferenceKey
    [Documentation]    Check user can delete Cross reference key on UI
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    12s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]
    Sleep    11s
    Click Element    class=fa-table    #Click on Cross Reference
    Sleep    11s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/section[2]/form[1]/header/div/button/i
    Sleep   11s
    Capture Page Screenshot
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]
    Sleep    6s
    Capture Page Screenshot
    Click element    xpath=//*[@id="webide"]/main/section/section/section[1]/header/button[2]
    sleep    6s
    Capture Page Screenshot
    close browser


Dev_TC14_Delete_Counter
    [Documentation]    Check user can delete Counter on UI
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    12s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-calculator    #Click on Counters
    Sleep    12s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/section/table/tbody/tr/td[3]/div/button/i    #Click Delete
    Sleep    11s
    Capture Page Screenshot
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i    #Click Delete on confimation
    Sleep    9s
    Capture Page Screenshot
    close browser

Dev_TC15_Search_Counter
    [Documentation]    Check user can search Counter on UI
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    12s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    #Select Service
    Click Element    class=fa-calculator    # Click on counters
    Sleep    12s
    Capture Page screenshot
    Input text    name=filterName    Counter3    # Enter Counter3 in Search
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/div[2]/button/i    #Click refresh
    Sleep    12s
    Capture Page Screenshot
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
    Sleep    12s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    sleep    12s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select service
    Click Element    class=fa-plug    #Click extension
    Sleep    12s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/section/header/button[1]/i    # Click on Add
    Sleep    12s
    Input Text    name=extension.Name    Ext2    #Enter Extension name
    Sleep    12s
    Capture Page Screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/button[1]    #Click save
    sleep    12s
    Capture Page Screenshot
    click element    xpath=//*[@id="webide"]/main/section/section/form/header/div/button/i    #Click delete
    Sleep    12s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i    # Confirm deletion
    Sleep    6s
    Capture Page screenshot
    close browser

Dev_TC17_Add Library
    [Documentation]    Check user can add Library
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    11s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    #Select Service
    Click Element    class=fa-book    #Click on Library
    Sleep    11s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/section/header/button[1]/i    #Click on Add
    Sleep    11s
    Input Text    name=Name    Default1    #Enter Library Name
    Sleep    11s
    Capture Page Screenshot
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i    #Click Save
    Sleep    8s
    Capture page screenshot
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
    Sleep    12s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    #Select Service
    Click Element    class=fa-book    #Click on Library
    Sleep    11s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/div/button/i    #Click on delete
    Sleep    11s
    Click element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i    #Confirm deletion
    Sleep    6s
    Capture Page Screenshot
    close browser

Dev_TC21-Alerts_FilterByInfo
    [Documentation]    Check user can filter Alerts by Info
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    11s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select Service
    Click Element    class=fa-bell    #Click on Alerts
    Sleep    11s
    capture page screenshot
    Input text    name=filterInfo    Info3    # Enter into filter criteria
    Sleep    11s
    Click element    xpath=//*[@id="webide"]/main/section/section/header/form/div[4]/button/i
    Sleep    6s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section[1]/section[1]/article/ul/li[2]
    Sleep    6s
    Capture page Screenshot
    Page should not contain    text=No alerts found
    close browser

Dev_TC25-Logs-information
    [Documentation]    Check user can Filter Logs by information
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    11s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-info-circle
    Sleep    12s
    capture page screenshot
    Input text    name=filterInformation    hii
    Sleep    12s
    Capture page Screenshot
    Page should not contain    text=hello
    page should contain    text=hii
    close browser

Dev_TC28-Logout
    [Documentation]    Check user can logout from the application
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    11s
    capture page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[2]/div/p/i
    capture page screenshot
    Click element    class=fa-cog
    Click element    xpath=//*[@id="webide"]/aside/div[2]/div/a[5]/i
    Handle Alert
    Sleep    11s
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
    Sleep    11s
    click element    xpath=//*[@id="webide"]/main/section/section/div/div[2]/div[1]/p/a[2]
    Sleep    11s
    Click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[1]/span[2]/a/i
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section/header/button[1]/i
    Sleep    11s
    Input Text    xpath=/html/body/main/section/section/section/section/div/div/div[2]/form/div/div/input    aryan@youredi.com
    Sleep    11s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section/div/div/div[2]/form/div/div/span/span/button/i
    Sleep    11s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section/div/div/div[2]/form/div[2]/button/i
    sleep    9s
    capture page screenshot
    Click element    xpath=//*[@id="webide"]/main/section/section/section/form/header/button/i
    sleep    6s
    capture page screenshot

Dev_TC36_EditUserRoleInOrganization
    [Documentation]    Check that we can edit role for the user for organisation
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    12s
    click element    xpath=//*[@id="webide"]/main/section/section/div/div[2]/div[1]/p/a[2]
    Sleep    12s
    capture page screenshot
    Click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[1]/span[2]/a/i
    sleep    11s
    Select from list by value    name=Role    Designer
    Sleep    8s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/form/header/button/i
    Sleep    6s
    capture page screenshot

Dev_TC35_DeleteUserFromOrganization
    [Documentation]    check that we can delete user from organisation
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    11s
    click element    xpath=//*[@id="webide"]/main/section/section/div/div[2]/div[1]/p/a[2]
    Sleep    12s
    Capture page screenshot
    Click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[1]/span[2]/a/i
    Sleep    11s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/form/header/div/button/i
    Sleep    12s
    Capture page screenshot
    Click element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i
    Sleep    9s
    Capture page screenshot
    Page should not contain    text=Aryan

Dev_TC44_ServiceDataPage_Index2NotMandatory
    [Documentation]    Check that index2 is not mandatory on Service data page
    ...
    ...
    ...    Test Data Setup
    ...    1. Need Organization -- Name : Komal test organistaion
    ...    2. Need Service -- DemoService2
    ...
    ...    Service data with Item Type as Type2 and Index1 as In2
    ...    Data should be DataResult
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    12s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]
    Sleep    15s
    Click Element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[14]/a/i
    Sleep    15s
    Capture Page Screenshot
    Input Text    name=itemType    Type2
    Input Text    name=index1    In2
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i
    Sleep    12s
    capture page screenshot
    Page should contain    text=DataResult

Dev_TC51_Check If binding is not active process should not get executed
    [Documentation]    Check if the endpoint binding is not active, process should not get executed.An error message should be displayed
    ...
    ...
    ...    Test Data Setup
    ...    1. Need Organization Name : Komal test organistaion
    ...    2. Need Service -- DemoService
    ...    3 Process name binding whose endpoint binding is not marked active
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    11s
    Click element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Sleep    11s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]    #Select service
    Sleep    11s
    Click element    class=fa-object-group    #Click on Processes
    Sleep    12s
    click element    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[2]/a    #Select Binding process
    Sleep    15s
    click element    xpath=//*[@id="webide"]/main/section[1]/header/div/button/i    #click start
    sleep    9s
    click element    xpath=//*[@id="webide"]/main/section[1]/div[1]/div[1]/div[1]/div/button[1]/i    #click start
    sleep    12s
    Page should contain    text=Process not found using given account    #error message shouldbe present
    capture page screenshot


TC31_Bug8642_ExtensionCanotBeDeleted_IfUsedInProcess
    [Documentation]    Check Service data UI page
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
    Sleep    15s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    12s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]    #Select Service
    Sleep    16s
    Click Element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[10]/a/i    # click on Extension link
    Sleep    15s
    Capture Page Screenshot
    Click element    xpath=//*[@id="webide"]/main/section[1]/section/form/header/div/button/i    #Click on Delete button
    Sleep    11s
    capture page screenshot
    Click element    xpath=/html/body/div[4]/form/div/div[3]/span/button[1]/i    # Confirm deletion
    Sleep    13s
    Page should contain    text=The extension cannot be deleted as it is being used in process
    close browser

TC47_Bug 8386: Space at the end of process name should not prevent it to be deleted.
    [Documentation]    Check that if message property is set \ with empty value , still it should be displayed in Transfer messages
    ...
    ...    test data setup
    ...    Process - 1Space trim Test with extra spaces in end should be present in Demo service4
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    12s
    Click Element    xpath=/html/body/main/section[1]/section/div/div[1]/div[2]/div[4]/div/p/a[2]    #click on demo service4
    sleep    11s
    Click element    xpath=/html/body/aside/div[1]/ul/li[5]/a/i    #click on processes
    Sleep    12s
    Click element    xpath=/html/body/main/section[1]/section/article/table/tbody/tr[1]/td[9]/div/button/i    #Click on delete
    Sleep    12s
    Capture page screenshot
    Input Text    xpath=/html/body/div[4]/form/div/div[2]/p[2]/input    1Space Trim Test
    sleep    12s
    Click element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i    #Confirm deletion
    sleep    11s
    Capturepage screenshot
    Page should not contain    text=1Space trim Test


TC32_AddandDeleteBinding
    [Documentation]    Check user can add Bindings to endpoint and also user can delete bindings
    ...
    ...    Komal test Organisation - Demo service 5
    ...    Counters endpoint
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    11s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[5]/div[1]/p/a[2]
    sleep    11s
    click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[7]/a/i
    Click element    xpath=//*[@id="webide"]/main/section/section/div/section/header/button[1]/i
    Sleep    12s
    Click element    xpath=//*[@id="webide"]/main/section/section/div/section/header/button[1]/i
    Sleep    11s
    click element    xpath=//*[@id="webide"]/main/section/section/div/section/header/button[1]/i
    sleep    11s
    Input Text    name=OperationName    Binding
    Input Text    name=HTTPMethod    GET
    click element    xpath=//*[@id="webide"]/main/section/section/div/form/header/button/i
    sleep    11s
    capture page screenshot
    Element should be enabled    xpath=//*[@id="webide"]/main/section/section/div/form/header/div/button/i
    Click element    xpath=//*[@id="webide"]/main/section/section/div/form/header/div/button/i
    sleep    6s
    click element    xpath=//*[@id="webide"]/div[5]/form/div/div[3]/span/button[1]/i
    sleep    6s
    click element    xpath=//*[@id="webide"]/main/section/section/div/section/header/button[2]/i
    sleep    6s
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
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    12s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[3]/div/p/a[2]
    sleep    12s
    Click Element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[7]/a/i
    Sleep    11s
    Capture Page screenshot
    click element    xpath=//*[@id="webide"]/main/section/section/section/header/button[2]/i
    Sleep    11s
    Select from List by Value    xpath=//*[@id="webide"]/main/section/section/form/article/div/div[2]/select    4
    sleep    9s
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i
    Sleep    9s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/header/button[2]
    Capture page screenshot
    Page should not contain    text=Can't change type of an endpoint that has endpoint bindings

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
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    11s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[4]/div[1]/p/a[2]
    sleep    11s
    Click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[7]/a/i
    Sleep    9s
    Select from list by value    xpath=//*[@id="webide"]/main/section/section/form/article/div/div[2]/select    1
    sleep    6s
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i
    sleep    12s
    Capture page screenshot
    Page should contain    text=Can't change type of an endpoint that has endpoint bindings
    Capture page screenshot

TC039_Transfer_FilterById
    [Documentation]    Check that user can filter transactions by id
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    15s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    10s
    click element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[1]/p/a[2]
    sleep    11s
    click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[2]/div/a/i
    sleep    11s
    Input text    xpath=/html/body/main/section/header/form/div[1]/div[5]/div[1]/div/input    11711285    #for dev - 11303940, stage=43179132
    sleep    15s
    click element    xpath=/html/body/main/section/header/form/div[2]/div[4]/div/button[2]/i
    click element    xpath=/html/body/main/section/header/form/div[2]/div[4]/div/button[1]/i
    sleep    11s
    capture page screenshot
    Page should not contain    text=11425361
    Page should contain    text=11711285

TC42_RestartProcesswithemptyProperty
    [Documentation]    Check that if message property is set \ with empty value , still it should be displayed in Transfer messages
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    11s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Selects Service
    Click Element    class=fa-object-group    #Click Processes
    Sleep    12s
    click element    xpath=/html/body/main/section/section/article/table/tbody/tr[1]/td[2]/a
    sleep    7s
    Click element    xpath=//*[@id="webide"]/main/section/header/div/button/i
    sleep    6s
    Click element    xpath=/html/body/main/section/div[1]/div/div[1]/div/button[1]/i
    Sleep    15s
    Click element    xpath=/html/body/aside/div[1]/ul/li[2]/div/a/i
    Sleep    6s
    Click element    xpath=/html/body/main/section/div/section/div/div/div[1]/div[1]/i
    Sleep    6s
    Click element    xpath=/html/body/main/section/section/header/div[1]/button/i
    Sleep    6s
    Click element    xpath=/html/body/main/section/section/div/div/div[1]/div/button[1]/i
    Sleep    6s
    Input Text    xpath=/html/body/main/section/section/div/div/div[2]/section/section[2]/section[2]/div/div/input    P1
    Click element    xpath=/html/body/main/section/section/div/div/div[1]/div/button[2]/i
    Sleep    12s
    Page should contain    text=Process started successfully.

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
    Sleep    10s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=/html/body/main/section/section/div/div[3]/div/p/a[2]    # Selects org2
    sleep    6s
    click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[1]/span[2]/a/i    #Click on edit org2
    sleep    6s
    Select from list by value    xpath=//*[@id="webide"]/main/section/section/form/article/div[2]/select    14449    #Select from parent org dropdown.For test = 1040, dev=14449,stage=906
    sleep    6s
    click element    xpath=/html/body/main/section/section/form/header/button[1]/i    #click save
    Page should contain    text=Komal test organistaion
    capture page screenshot

Tc44_AddandDeleteServiceSharing
    [Documentation]    Check user can delete Cross reference key on UI
    [Timeout]
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    11s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    #Select Service
    Sleep    12s
    Click element    xpath=/html/body/aside/div[1]/ul/li[4]/span[2]/a/i    #click on edit service
    sleep    9s
    click element    xpath=/html/body/main/section/section/section/article/ul/li/div/button/i    #click delete
    Sleep    6s
    click element    xpath=/html/body/div[4]/form/div/div[3]/span/button[1]/i    #click delete
    Sleep    12s
    Click element    xpath=/html/body/main/section/section/section/header/div/button    #click on add
    click element    xpath=/html/body/main/section/section/section/header/div/div/a
    sleep    16s
    click element    xpath=/html/body/main/section/section/form/header/button[1]/i    #click save

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
    Sleep    11s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select Service
    Click Element    class=fa-bell    #Click on Alerts
    Sleep    12s
    capture page screenshot
    Input text    name=filterInfo    Info3    # Enter into filter criteria
    Sleep    11s
    Click element    xpath=//*[@id="webide"]/main/section/section/header/form/div[4]/button/i
    Sleep    6s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section[1]/section[1]/article/ul/li[2]
    Sleep    6s
    Capture page Screenshot
    Page should not contain    text=No alerts found
    Click element    xpath=/html/body/main/section/section/section/section[2]/article/div/div/ul/li[2]/a    # click on comments
    Sleep    6s
    Input Text    xpath=/html/body/main/section/section/section/section[2]/article/div/section/form/div[1]/input    TestCommentAdding
    Sleep    6s
    Click element    xpath=/html/body/main/section/section/section/section[2]/article/div/section/form/div[2]/button/i    # click on add
    Sleep    6s
    Capture page screenshot
    Page should contain    text=TestCommentAdding

Dev_TC45-Alerts_AddPayload
    [Documentation]    Check user is able to add payload to alert on alert page
    ...
    ...    Test data setup. - Need an alert with info as Info3 in Demoservice of Komal Test Organisation
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    11s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select Service
    Click Element    class=fa-bell    #Click on Alerts
    Sleep    12s
    capture page screenshot
    Input text    name=filterInfo    Info3    # Enter into filter criteria
    Sleep    7s
    Click element    xpath=//*[@id="webide"]/main/section/section/header/form/div[4]/button/i
    Sleep    6s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section[1]/section[1]/article/ul/li[2]
    Sleep    6s
    Capture page Screenshot
    Page should not contain    text=No alerts found
    Click element    xpath=/html/body/main/section/section/section/section[2]/article/div/div/ul/li[3]/a    # click on payload
    Sleep    15s
    Input Text    xpath=//*[@id="webide"]/main/section/section/section/section[2]/article/div/form/div[1]/textarea    add
    Sleep    15s
    Click element    xpath=/html/body/main/section/section/section/section[2]/article/div/form/div[2]/div/button[1]/i    # click on save
    Sleep    6s
    Capture page screenshot

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
    Sleep    11s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select Service
    Click Element    class=fa-bell    #Click on Alerts
    Sleep    12s
    capture page screenshot
    Input text    name=filterInfo    Info3    # Enter into filter criteria
    Sleep    7s
    Click element    xpath=//*[@id="webide"]/main/section/section/header/form/div[4]/button/i
    Sleep    6s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section[1]/section[1]/article/ul/li[2]
    Sleep    6s
    Capture page Screenshot
    Page should not contain    text=No alerts found
    click element    xpath=/html/body/main/section/section/section/section[2]/header/div/div[2]/button[1]/i    # click on Assign to me
    sleep    12s
    ${assignedto}=    Get Text    xpath=/html/body/main/section/section/section/section[2]/article/div/section/div/dl/dd[6]/a    #Get value in Assigned to field
    Sleep    6s
    Should be equal as Strings    ${assignedto}    Komal Agarwal (komal@youredi.com)
    Sleep    5s

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
    Sleep    11s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select Service
    Click Element    class=fa-bell    #Click on Alerts
    Sleep    12s
    capture page screenshot
    Input text    name=filterInfo    Info3    # Enter into filter criteria
    Sleep    11s
    Click element    xpath=//*[@id="webide"]/main/section/section/header/form/div[4]/button/i
    Sleep    6s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section[1]/section[1]/article/ul/li[2]
    Sleep    6s
    Capture page Screenshot
    Page should not contain    text=No alerts found
    click element    xpath=/html/body/main/section/section/section/section[2]/header/div/div[2]/button[2]/i    # click on UnAssign
    sleep    12s
    ${assignedto}=    Get Text    xpath=/html/body/main/section/section/section/section[2]/article/div/section/div/dl/dd[6]/span    #Get value in Assigned to field
    Sleep    6s
    Should be equal as Strings    ${assignedto}    Not assigned.
    Sleep    5s

Dev_TC21-Alerts_FilterByAssignedTo
    [Documentation]    Check user can filter Alerts by Info
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    12s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select Service
    Click Element    class=fa-bell    #Click on Alerts
    Sleep    12s
    capture page screenshot
    Select from list by value    xpath=/html/body/main/section/section/header/form/div[2]/div[2]/select    16887    # Enter into filter criteria 928 for stage , dev=16887
    Sleep    11s
    Click element    xpath=//*[@id="webide"]/main/section/section/header/form/div[4]/button/i
    Sleep    6s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section[1]/section[1]/article/ul/li[3]
    Sleep    6s
    Capture page Screenshot
    Page should not contain    text=No alerts found
    ${id}=    Get Text    xpath=/html/body/main/section/section/section/section[2]/article/div/section/div/dl/dd[1]
    Sleep    6s
    Should be equal as Strings    ${id}    203542    #dev=203542
    Capture page screenshot
    close browser

Dev_TC53_ViewerRole
    [Documentation]    Check that user with only Viewer role can only see Account and Service Names.
    ...
    ...    Viewer cant see Transfers, Alerts, Processes etc
    Open Browser    https://dev.youredi.com/    chrome
    Input Text    id=email    viewerole@youredi.com
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    11s
    Page should contain    text=Komal test organistaion
    Page should contain    text=org1    #org1 for dev, and MainOrg for stage
    Sleep    11s
    Capture page screenshot
    Page should contain    text=DemoService
    Page should contain    text=DemoService2
    click element    xpath=/html/body/main/section/section/div/div[1]/div[1]/p/a[2]
    sleep    12s
    Page should not contain element    class=fa-dashboard
    Page should not contain element    class=fa-bell
    Click element    xpath=/html/body/main/section/section/div/div[1]/div[2]/div[1]/div/p/a
    Sleep    12s
    Page should not contain element    class=fa-object-group
    Page should not contain element    class=fa-book
    Page should not contain element    class=fa-lightbulb-o
    Page should not contain element    class=fa-cogs
    Page should not contain element    class=fa-table
    Page should not contain element    class=fa-plug
    Page should not contain element    class=fa-calendar
    Page should not contain element    class=fa-exclamation-cirlce

Dev_TC54_DesignerRole
    [Documentation]    Check that user with only designer role can see and access Accounts, Services, transfers, endpoints, processses, alerts etc.
    ...    But since no global admin rights he cant see Admin tools
    ...    and designer cant edit organization and services, alert settings
    Open Browser    https://dev.youredi.com/    chrome
    Input Text    id=email    Designerrole@youredi.com
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Page should contain    text=Komal test organistaion    # can see org and its sub org
    Page should contain    text=org1
    Click element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i
    sleep    12s
    Page should contain    text=DemoService    # can see services
    Page should contain    text=DemoService2
    click element    xpath=/html/body/main/section/section/div/div[1]/div[1]/p/a[2]
    sleep    12s
    Page should contain element    class=fa-dashboard    #can see Transfers
    Page should contain element    class=fa-bell    # can see alerts
    Page should not contain element    class=fa-edit    # cant edit organization
    Click element    xpath=/html/body/main/section/section/div/div[1]/div[2]/div[1]/div/p/a
    Sleep    6s
    Click element    xpath=/html/body/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Sleep    12s
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
    Sleep    11s
    click element    xpath=/html/body/main/section/section/section/article/ul/li[2]/h6/i
    sleep    11s
    click element    xpath=/html/body/main/section/section/form/header/div/button/i    # able to delete endpoints
    sleep    10s
    click element    xpath=/html/body/div[4]/form/div/div[3]/span/button[1]/i
    sleep    6s
    click element    xpath=/html/body/aside/div[1]/ul/li[3]/a/i
    sleep    8s
    click element    xpath=/html/body/main/section/section/section/section[1]/section[1]/form/div/h6
    sleep    12s
    Scroll element into view    xpath=/html/body/main/section/section/section/section[1]/section[1]/form/div[2]/button/i
    Sleep    11s
    Click element    xpath=/html/body/main/section/section/section/section[1]/section[1]/form/div[2]/button/i
    Sleep    6s
    Page should contain    text=Not authorized

Dev_TC54_AdminRole
    [Documentation]    Check that user that has Admin role but does not have Global admin rights, has full rights at account and service level but does not have access to admin tools
    Open Browser    https://dev.youredi.com/    chrome
    Input Text    id=email    adminrole@youredi.com
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Page should contain    text=Komal test organistaion    # can see org and its sub org
    Page should contain    text=org1
    Click element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i
    sleep    12s
    Page should contain    text=DemoService    # can see services
    Page should contain    text=DemoService2
    click element    xpath=/html/body/main/section/section/div/div[1]/div[1]/p/a[2]
    sleep    12s
    Page should contain element    class=fa-dashboard    #can see Transfers
    Page should contain element    class=fa-bell    # can see alerts
    Page should contain element    class=fa-edit    # cant edit organization
    Click element    xpath=/html/body/main/section/section/div/div[1]/div[2]/div[1]/div/p/a
    Sleep    11s
    Click element    xpath=/html/body/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Sleep    11s
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
    Sleep    11s
    click element    xpath=/html/body/main/section/section/section/article/ul/li[2]/h6/i
    sleep    10s
    click element    xpath=/html/body/main/section/section/form/header/div/button/i    # able to delete endpoints
    sleep    11s
    click element    xpath=/html/body/div[4]/form/div/div[3]/span/button[1]/i
    sleep    11s
    click element    xpath=/html/body/aside/div[1]/ul/li[3]/a/i
    sleep    8s
    click element    xpath=/html/body/main/section/section/section/section[1]/section[1]/form/div/h6
    sleep    12s
    Scroll element into view    xpath=/html/body/main/section/section/section/section[1]/section[1]/form/div[2]/button/i
    Sleep    11s
    Click element    xpath=/html/body/main/section/section/section/section[1]/section[1]/form/div[2]/button/i    # can save alert settings
    Sleep    11s
    Page should not contain    text=Not authorized
    
 Dev_TC56_AdminRoleWithGlobalAdminRights
    [Documentation]    Check that user that has Admin role and have Global admin rights, has full rights at account and service level and has access to admin tools
    Open Browser    https://dev.youredi.com/    chrome
    Input Text    id=email    globaladmintester@youredi.com
    Input Password    id=password    RobotTesting@123
    Click Element    class=fa-sign-in
    Sleep    16s
    Maximize Browser Window
    Page should contain    text=Komal test organistaion    # can see org and its sub org
    Page should contain    text=org1
    Click element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i
    sleep    15s
    Page should contain    text=DemoService    # can see services
    Page should contain    text=DemoService2
    click element    xpath=/html/body/main/section/section/div/div[1]/div[1]/p/a[2]
    sleep    12s
    Page should contain element    class=fa-dashboard    #can see Transfers
    Page should contain element    class=fa-bell    # can see alerts
    Page should contain element    class=fa-edit    # cant edit organization
    Click element    xpath=/html/body/main/section/section/div/div[1]/div[2]/div[1]/div/p/a
    Sleep    15s
    Click element    xpath=/html/body/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Sleep    15s
    Page should contain element    xpath=/html/body/aside/div[1]/ul/li[4]/span[2]/a/i
    Page should contain element    class=fa-object-group    # can see processes
    Page should contain element    class=fa-book    # can see libraries
    Page should contain element    class=fa-lightbulb-o    # can see endpoints
    Page should contain element    class=fa-cogs    # can see parameters
    Page should contain element    class=fa-table    # can see cross references
    Page should contain element    class=fa-plug    # can see extensions
    Page should contain element    class=fa-calendar
    Page should contain element    class=fa-cubes
    Scroll element into view    xpath=/html/body/aside/div[1]/ul/li[3]/a/i
    Page should contain element    xpath=/html/body/aside/div[1]/ul/li[3]/a/i    # can see admin tools
    Capture page screenshot
    Click element    class=fa-lightbulb-o    # click on endpoints
    Sleep    15s
    click element    xpath=/html/body/main/section/section/section/article/ul/li[2]/h6/i
    sleep    16s
    click element    xpath=/html/body/main/section/section/form/header/div/button/i    # able to delete endpoints
    sleep    15s
    click element    xpath=/html/body/div[4]/form/div/div[3]/span/button[1]/i
    sleep    11s
    click element    xpath=/html/body/aside/div[1]/ul/li[3]/a/i
    sleep    11s
    click element    xpath=/html/body/main/section/section/section/section[1]/section[1]/form/div/h6
    sleep    11s
    Scroll element into view    xpath=/html/body/main/section/section/section/section[1]/section[1]/form/div[2]/button/i
    Sleep    11s
    Click element    xpath=/html/body/main/section/section/section/section[1]/section[1]/form/div[2]/button/i    # can save alert settings
    Sleep    11s
    Page should not contain    text=Not authorized   

