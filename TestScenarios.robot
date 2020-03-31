*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
TC01
    Open Browser    https://www.google.com/    chrome

TC02
    Open Browser    https://dev.youredi.com/    chrome
    Input Text    id=email    komal@youredi.com
    Input Password    id=password    J6YOOVdNlwZE2mesoX0a$4@3rd
    Click Element    class=fa-sign-in
