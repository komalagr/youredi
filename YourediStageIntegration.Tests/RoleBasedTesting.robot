*** Settings ***
Library           SeleniumLibrary
Variables         variablesfile.yaml
*** Test Cases ***


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

