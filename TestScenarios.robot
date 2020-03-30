*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
TC01
    Open Browser    https://www.google.com/    chrome

TC02
    Open Browser    https://stage.youredi.com/    chrome
    Input Text    id=email    komal@youredi.com
    Input Password    id=password    $RJvT&Zd*Zzx0tW&R3r32$Pw
    Click Element    class=fa-sign-in
