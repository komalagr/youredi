*** Settings ***
Library           SeleniumLibrary
Variables         Variablesfile.yaml
*** Test Cases ***

TC01_AddProcess
    [Documentation]    Check that If Process does not exist , it should get added successfully
    ...
    ...    Test Data Setup
    ...    1. Need Organization Name : Komal test organistaion
    ...    2. Need Service -- DemoService
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Sleep    4s
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    Sleep    8s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Selects Service
    Wait Until page contains element    class=fa-object-group    timeout=${login.timeout}
    Click Element    class=fa-object-group    #Click Processes
    Wait Until Element Is Visible    class=fa-plus    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/header/button[1]    #Clicks Add Process button
    Wait until page contains    text=Add new process    timeout=${login.timeout}
    Input Text    name=processName    1Process    #Provide new process name
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div/div[2]/form/button    #Click Save
    Wait until page contains element    class=fa-play    timeout=${login.timeout}
    Page should contain element    class=fa-play    #New process page should be displayed with Start button
    Sleep    2s
    [Teardown]    Close Browser

TC02_DeleteProcess_PositiveScenario
    [Documentation]    Check that user is able to delete the process if process name entered on Delete pop up window is correct
    ...
    ...    Test data setup
    ...    Need process- 1Process added to DemoService in Komal test organistaion
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Sleep    4s
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    Sleep    4s
    Wait Until page contains element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    #Select service
    Wait Until page contains element    class=fa-object-group    timeout=${login.timeout}
    Click Element    class=fa-object-group    # Clicks Processes
    Wait until Page contains    text=1Process    timeout=${login.timeout}
    ${process}=    Get Text    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[2]/a    #Gets name of the process that will be deleted
    Click Element    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[9]/div/button    #Click delete
    Sleep    4s
    Input Text    xpath=/html/body/div[4]/form/div/div[2]/p[2]/input    ${process}    #Enter process name on delete pop up window
    Wait until element is enabled    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]
    Sleep    4s
    [Teardown]    Close Browser

TC03_DeleteProcess_ProcessNameIncorect
    [Documentation]    Check that delete button should not be active if On delete window,process name entered is incorrect
    ...
    ...    Test Data setup
    ...    1. Komal test organistaion \ -- DemoService
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Sleep    3s
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    Sleep    4s
    Wait Until page contains element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    #Select Service
    Wait Until page contains element    class=fa-object-group    timeout=${login.timeout}
    Click Element    class=fa-object-group    #Click on Processes
    Wait until Page contains    text=2enpoint    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[9]/div/button    #Click on delete button in first row
    Sleep    2s
    Wait until page contains    text=Really delete permanently?    timeout=${login.timeout}
    Input Text    xpath=/html/body/div[4]/form/div/div[2]/p[2]/input    8134 Bug    # enter incorrect process name in delete popup window
    Sleep    2s
    Element Should Be Disabled    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    #Check that delete button should be disabled
    Sleep    2s
    [Teardown]    Close Browser

TC04_DeleteProcess_Cancel
    [Documentation]    Check that user if User clicks on cancel button on Delete process page, then process should not get deleted
    ...
    ...
    ...    Test Data setup
    ...    1. Komal test organistaion \ -- DemoService
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Sleep    3s
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    Sleep    3s
    Wait Until page contains element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # select service
    Wait Until page contains element    class=fa-object-group    timeout=${login.timeout}
    Click Element    class=fa-object-group    # click on processes
    Wait until Page contains    text=2enpoint    timeout=${login.timeout}
    ${process}=    Get Text    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[2]/a    #get the process name to be deleted
    Click Element    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[9]/div/button    # click delete button
    Sleep    1s
    Wait until page contains    text=Really delete permanently?    timeout=${login.timeout}
    Input Text    xpath=/html/body/div[4]/form/div/div[2]/p[2]/input    ${process}    # get in the process name to be deleted
    Wait until element is enabled    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[2]    # click cancel on delete pop up window
    Sleep    4s
    Wait until Page contains    text=${process}    timeout=${login.timeout}
    Page should contain    text=${process}
    Sleep    2s
    [Teardown]    Close Browser

Dev_TC05_DeleteEndpoint_Positive
    [Documentation]    Check that If endpoint is not assoicated to a process, then it should get deleted
    ...
    ...    Test Data setup
    ...    1. Komal test organistaion \ -- DemoService \ -- 1Process
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Sleep    3s
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    Sleep    4s
    Wait Until page contains element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Wait Until page contains element    class=fa-lightbulb-o    timeout=${login.timeout}
    Click Element    class=fa-lightbulb-o    #Click endpoints
    Wait until page contains    text=2enpoint    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/div/button    #click delete button
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    #confirm deletion
    Wait until page does not contain    text=1Process    timeout=${login.timeout}
    Sleep    2s
    [Teardown]    Close Browser

Dev_TC06_AddProcess_Negative_ProcessAlreadyExist
    [Documentation]    Check that process should not get added if Process name or endpoint name already exist
    ...
    ...
    ...    Test Data Setup
    ...    1. Need Organization -- Name : Komal test organistaion
    ...    2. Need Service -- DemoService
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Sleep    3s
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    Sleep    3s
    Wait Until page contains element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Wait Until page contains element    class=fa-object-group    timeout=${login.timeout}
    Click Element    class=fa-object-group    # Click on processes
    Wait until Page contains    text=2enpoint    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/header/button[1]    # click on add process
    Wait until page contains    text=Add new process
    Input Text    name=processName    ProcessNew12121    # try adding adding process that already exist
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div/div[2]/form/button    # click save button
    Wait until page contains    text=Error    timeout=${login.timeout}
    Page should not contain element    class=fa-play    # Error message should be displayed
    Sleep    2s
    [Teardown]    Close Browser

Dev_TC07_DeleteEndpoint_Negative_EndpointAssociatedToProcess
    [Documentation]    Check that If endpoint is associated to a process , endpoint should not get deleted
    ...
    ...
    ...    Test Data Setup
    ...    1. Need Organization -- Name : Komal test organistaion
    ...    2. Need Service -- DemoService
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    Sleep    3s
    Wait Until page contains element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Wait Until page contains element    class=fa-lightbulb-o    timeout=${login.timeout}
    Click Element    class=fa-lightbulb-o    # Click on Endpoints
    Wait until page contains    text=2enpoint    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/div/button    # click on delete enpoint
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    # confirm deletion on endpoint
    Wait until page contains    text=Can't delete an endpoint that has a process attached    timeout=${login.timeout}
    Page Should contain    text=Can't delete an endpoint that has a process attached    # error message should be displayed since endpoint associated to a process
    Sleep    2s
    [Teardown]    Close Browser

Dev_TC08_AddEndpoint_Positive
    [Documentation]    Check user can add endpoint if it does not already exist
    ...
    ...
    ...    Test Data Setup
    ...    1. Need Organization -- Name : Komal test organistaion
    ...    2. Need Service -- DemoService
    [Setup]    login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Sleep    3s
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    Sleep    4s
    Wait Until page contains element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Wait Until page contains element    class=fa-lightbulb-o    timeout=${login.timeout}
    Click Element    class=fa-lightbulb-o    # click on endpoints
    Wait until page contains    text=2enpoint    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/section/header/button[1]/i    # click on add endpoint
    Sleep    4s
    Input text    name=Description    3Endpoint    # enter new endpoint name
    click element    xpath=//*[@id="webide"]/main/section/section/form/header/button    # save the endpoint
    Wait until page contains    text=3Endpoint    timeout=${login.timeout}
    Sleep    4s
    [Teardown]    Close Browser

Dev_TC08b_DeleteEndpointforNextrun
    [Documentation]    Check that If endpoint is not assoicated to a process, then it should get deleted
    ...
    ...    Test Data setup
    ...    1. Komal test organistaion \ -- DemoService \ -- 1Process
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Sleep    3s
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    Sleep    3s
    Wait Until page contains element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Wait Until page contains element    class=fa-lightbulb-o    timeout=${login.timeout}
    Click Element    class=fa-lightbulb-o    #Click endpoints
    Wait until page contains    text=2enpoint    timeout=${login.timeout}
    click element    xpath=/html/body/main/section/section/section/article/ul/li[2]/h6/i
    sleep    6s
    Click Element    xpath=/html/body/main/section/section/form/header/div/button    #click delete button
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]    #confirm deletion
    Wait until page does not contain    text=3endpoint    timeout=${login.timeout}
    Sleep    2s
    [Teardown]    Close Browser

Dev_TC51_Check If binding is not active process should not get executed
    [Documentation]    Check if the endpoint binding is not active, process should not get executed.An error message should be displayed
    ...
    ...
    ...    Test Data Setup
    ...    1. Need Organization Name : Komal test organistaion
    ...    2. Need Service -- DemoService
    ...    3 Process name binding whose endpoint binding is not marked active
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Sleep    3s
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    Sleep    4s
    Wait Until page contains element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]    #Select service
    Wait Until page contains element    class=fa-object-group    timeout=${login.timeout}
    Click element    class=fa-object-group    #Click on Processes
    sleep    4s
    click element    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[2]/a    #Select Binding process
    Sleep    6s
    [Teardown]    Close Browser

Bug 8386: Space at the end of process name should not prevent it to be deleted.
    [Documentation]    Check that if message property is set \ with empty value , still it should be displayed in Transfer messages
    ...
    ...    test data setup
    ...    Process - 1Space trim Test with extra spaces in end should be present in Demo service4
    [Setup]    login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Sleep    3s
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    Sleep    3s
    Wait Until page contains element    xpath=/html/body/main/section[1]/section/div/div[1]/div[2]/div[4]/div/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section[1]/section/div/div[1]/div[2]/div[4]/div/p/a[2]    #click on demo service4
    Sleep    2s
    Wait Until page contains element    class=fa-object-group    timeout=${login.timeout}
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
    Sleep    2s
    [Teardown]    Close Browser

TC32_AddandDeleteBinding
    [Documentation]    Check user can add Bindings to endpoint and also user can delete bindings
    ...
    ...    Komal test Organisation - Demo service 5
    ...    Counters endpoint
    [Setup]    login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Sleep    3s
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    Sleep    3s
    Wait Until page contains element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[5]/div[1]/p/a[2]    timeout=${login.timeout}
    Click element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[5]/div[1]/p/a[2]
    Wait Until page contains element    class=fa-lightbulb-o    timeout=${login.timeout}
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
    Element should be enabled    xpath=//*[@id="webide"]/main/section/section/div/form/header/div/button/i
    Click element    xpath=//*[@id="webide"]/main/section/section/div/form/header/div/button/i
    sleep    6s
    click element    xpath=//*[@id="webide"]/div[5]/form/div/div[3]/span/button[1]/i
    sleep    6s
    click element    xpath=//*[@id="webide"]/main/section/section/div/section/header/button[2]/i
    Sleep    2s
    [Teardown]    Close Browser

TC33_PBI 8220: Web IDE: changing of Endpoint type.
    [Documentation]    Check user can edit endpoint type if it Binding is not associated to it
    ...
    ...    Komal Test Organisation - Demo Service 3
    ...    Endpoint \ with type Inbound and no binding attached to it
    ...    Endpoint is associated to a process
    [Setup]    login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    Sleep    3s
    Wait Until page contains element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[3]/div/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[3]/div/p/a[2]
    Sleep    2s
    Wait until page contains element    class=fa-lightbulb-o    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[7]/a/i    #Click endpoints
    Wait until page contains    text=Binding    timeout=${login.timeout}
    Sleep    4s
    Select from List by Value    xpath=//*[@id="webide"]/main/section/section/form/article/div/div[2]/select    4
    sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i
    Sleep    4s
    Page should not contain    text=Can't change type of an endpoint that has endpoint bindings
    Sleep    2s
    [Teardown]    Close Browser

TC34_CannotChangeEndpointType_IfBindingassociated
    [Documentation]    Check user cannot edit endpoint type if it Binding is associated to it
    ...
    ...    Test Data setup
    ...    Komal Test Organisation - DemoService4
    ...    EndpointB1 with Binding
    [Setup]    login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    Sleep    3s
    Wait Until page contains element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[4]/div[1]/p/a[2]    timeout=${login.timeout}
    Click element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[4]/div[1]/p/a[2]
    Sleep    4s
    Wait until page contains element    class=fa-lightbulb-o    timeout=${login.timeout}
    Click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[7]/a/i    #click on endpoints
    Wait until page contains    text=1Space Trim Test    timeout=${login.timeout}
    Select from list by value    xpath=//*[@id="webide"]/main/section/section/form/article/div/div[2]/select    1
    sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i
    Wait until page contains    text=Can't change type of an endpoint that has endpoint bindings
    Page should contain    text=Can't change type of an endpoint that has endpoint bindings
    Sleep    2s
    [Teardown]    Close Browser

TC42_RestartProcesswithemptyProperty
    [Documentation]    Check that if message property is set \ with empty value , still it should be displayed in Transfer messages
    [Setup]    login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    Sleep    3s
    Wait Until page contains element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Selects Service
    Sleep    4s
    wait until page contains element    class=fa-object-group    timeout=${login.timeout}
    Click Element    class=fa-object-group    #Click Processes
    Sleep    4s
    click element    xpath=/html/body/main/section/section/article/table/tbody/tr[1]/td[2]/a
    sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/header/div/button/i
    sleep    4s
    Click element    xpath=/html/body/main/section/div[1]/div/div[1]/div/button[1]/i
    Sleep    4s
    Click element    xpath=/html/body/aside/div[1]/ul/li[2]/div/a/i
    Sleep    16s
    Wait until element is visible    xpath=/html/body/main/section/div/section/div/div/div[1]/div[1]/i    timeout=${login.timeout}
    Click element    xpath=/html/body/main/section/div/section/div/div/div[1]/div[1]/i    #click transfer id
    sleep    8s
    Wait until element is visible    xpath=/html/body/main/section/section/header/div[1]/button/i    timeout=${login.timeout}
    Click element    xpath=/html/body/main/section/section/header/div[1]/button/i    #click transfer id
    Sleep    4s
    Click element    xpath=/html/body/main/section/section/div/div/div[1]/div/button[1]/i    #click start process
    Wait until element is visible    class=fa-plus    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/div/div/div[2]/section/section[2]/section[2]/div/div/input    P1
    Click element    xpath=/html/body/main/section/section/div/div/div[1]/div/button[2]/i    #click start
    Sleep    9s
    Wait until page contains    text=Process started successfully.    timeout=${login.timeout}
    Sleep    9s
    Page should contain    text=Process started successfully.
    Sleep    2s
    [Teardown]    Close Browser

TC20_Reset endpoint type for next run.
    [Documentation]    Check user can edit endpoint type if it Binding is not associated to it
    ...
    ...    Komal Test Organisation - Demo Service 3
    ...    Endpoint \ with type Inbound and no binding attached to it
    ...    Endpoint is associated to a process
    [Setup]    login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    Click Element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select Organization
    Sleep    3s
    Wait Until page contains element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[3]/div/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[3]/div/p/a[2]
    Sleep    2s
    Wait until page contains element    class=fa-lightbulb-o    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[7]/a/i    #Click endpoints
    Wait until page contains    text=Binding    timeout=${login.timeout}
    Sleep    4s
    Select from List by Value    xpath=//*[@id="webide"]/main/section/section/form/article/div/div[2]/select    1
    sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i
    Sleep    4s
    Page should not contain    text=Can't change type of an endpoint that has endpoint bindings
    Sleep    2s
    [Teardown]    Close Browser
    

*** Keywords ***
Login
    Open Browser    ${login.url}    headlesschrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in



