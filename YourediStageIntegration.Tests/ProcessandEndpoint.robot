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
    Wait until page contains element    class=fa-object-group    timeout=30s
    Click Element    class=fa-object-group    #Click Processes
    Wait Until Element Is Visible    class=fa-plus    timeout=30s
    Click Element    xpath=//*[@id="webide"]/main/section/section/header/button[1]    #Clicks Add Process button
    Wait until page contains    text=Add new process    timeout=30s
    Input Text    name=processName    1Process    #Provide new process name
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div/div[2]/form/button    #Click Save
    Wait until page contains element    class=fa-play    timeout=30s
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
    Wait until page contains element    class=fa-object-group    timeout=30s
    Click Element    class=fa-object-group    # Clicks Processes
    Wait until Page contains    text=1Process    timeout=30s
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
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    #Select Service
    Wait until page contains element    class=fa-object-group    timeout=30s
    Click Element    class=fa-object-group    #Click on Processes
    Wait until Page contains    text=2enpoint    timeout=30s
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
    Wait until page contains element    class=fa-object-group    timeout=30s
    Click Element    class=fa-object-group    # click on processes
    Wait until Page contains    text=2enpoint    timeout=30s
    ${process}=    Get Text    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[2]/a    #get the process name to be deleted
    Click Element    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[9]/div/button    # click delete button
    Sleep    6s
    Input Text    xpath=//*[@id="input-8"]    ${process}    # get in the process name to be deleted
    Wait until element is enabled    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    timeout=30s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[2]    # click cancel on delete pop up window
    Sleep    10s
    Page should contain    text=${process}
    

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
    Wait until page contains element    class=fa-lightbulb-o    timeout=30s
    Click Element    class=fa-lightbulb-o    #Click endpoints
    Wait until page contains    text=2enpoint    timeout=16s
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/div/button    #click delete button
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    #confirm deletion
    Wait until page does not contain    text=1Process    timeout=30s
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
    Wait until page contains element    class=fa-object-group    timeout=30s
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
    Wait until page contains element    class=fa-lightbulb-o    timeout=30s
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
    Wait until page contains element    class=fa-lightbulb-o    timeout=30s
    Click Element    class=fa-lightbulb-o    # click on endpoints
    Wait until page contains    text=2enpoint    timeout=16s
    Click Element    xpath=//*[@id="webide"]/main/section/section/section/header/button[1]/i    # click on add endpoint
    Sleep    4s
    Input text    name=Description    3Endpoint    # enter new endpoint name
    click element    xpath=//*[@id="webide"]/main/section/section/form/header/button    # save the endpoint
    Wait until page contains    text=3Endpoint    timeout=30s
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
    Wait until page contains element    class=fa-lightbulb-o    timeout=30s    
    Click Element    class=fa-lightbulb-o    #Click endpoints
    Wait until page contains    text=2enpoint    timeout=30s
    click element    xpath=/html/body/main/section/section/section/article/ul/li[2]/h6/i
    sleep    6s
    Click Element    xpath=/html/body/main/section/section/form/header/div/button    #click delete button
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    #confirm deletion
    Wait until page does not contain    text=3endpoint    timeout=16s
    
    
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
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[3]/div/p/a[2]
    Sleep    4s
    Wait until page contains element    class=fa-lightbulb-o    timeout=30s
    Click Element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[7]/a/i    #Click endpoints
    Wait until page contains    text=Binding    timeout=16s
    click element    xpath=//*[@id="webide"]/main/section/section/section/header/button[2]/i
    Sleep    4s
    Select from List by Value    xpath=//*[@id="webide"]/main/section/section/form/article/div/div[2]/select    4
    sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/header/button[2]
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
    Sleep    16s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[4]/div[1]/p/a[2]
    Sleep    4s
    Wait until page contains element    class=fa-lightbulb-o    timeout=30s
    Click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[7]/a/i    #click on endpoints
    Sleep    4s
    Wait until page contains    text=1Space Trim Test    timeout=30s
    Select from list by value    xpath=//*[@id="webide"]/main/section/section/form/article/div/div[2]/select    1
    sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i
    Wait until page contains    text=Can't change type of an endpoint that has endpoint bindings
    Page should contain    text=Can't change type of an endpoint that has endpoint bindings
        



