*** Settings ***

Documentation    To Validate the login form
Library    SeleniumLibrary



*** Variables ***
${Error_Message_Login}    css:.alert-danger

*** Test Cases ***

Validate Succesful Login
    Open the browser with the mortgage LoginPage url
    Fill the Login form
    Wait until it check and display error message
    Verify error message is correct
    
*** Keywords ***
Open the browser with the mortgage LoginPage url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the Login form
    Input Text    id:username    krishna108@gamil.com
    Input Password    password    password@456
    Click Button    signInBtn
    
Wait until it check and display error message
    Wait Until Element Is Visible    css:.alert-danger

Verify error message is correct
    ${result}=    Get Text    ${Error_Message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
