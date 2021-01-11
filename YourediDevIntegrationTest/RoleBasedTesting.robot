*** Settings ***
Library           SeleniumLibrary
Variables         DevVariablesfile.yaml
*** Test Cases ***


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
    Wait until page contains    text=Organizations    timeout=18s
    Page should contain    text=Komal test organistaion
    Page should contain    text=org1    #org1 for dev, and MainOrg for stage
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

Dev_TC54_DesignerRole
    [Documentation]    Check that user with only designer role can see and access Accounts, Services, transfers, endpoints, processses, alerts etc.
    ...    But since no global admin rights he cant see Admin tools
    ...    and designer cant edit organization and services, alert settings
    Open Browser    https://dev.youredi.com/    chrome
    Input Text    id=email    Designerrole@youredi.com
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    16s
    Page should contain    text=Komal test organistaion    # can see org and its sub org
    Page should contain    text=org1
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
    Wait until page contains    text=2enpoint    timeout=16s
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
    wait until page contains    text=Not authorized    timeout=18s
    Page should contain    text=Not authorized

Dev_TC54_AdminRole
    [Documentation]    Check that user that has Admin role but does not have Global admin rights, has full rights at account and service level but does not have access to admin tools
    Open Browser    https://dev.youredi.com/    chrome
    Input Text    id=email    adminrole@youredi.com
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    16s
    Page should contain    text=Komal test organistaion    # can see org and its sub org
    Page should contain    text=org1
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
    Wait until page contains    text=2enpoint    timeout=16s
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

