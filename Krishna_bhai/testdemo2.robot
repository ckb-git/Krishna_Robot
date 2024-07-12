*** Settings ***

Documentation    To Validate the login form
Library    SeleniumLibrary
Library    Collections
Test Setup    Open the browser with the mortgage LoginPage url
Test Teardown    Close Browser Session
Resource    resource.robot


*** Variables ***
${Error_Message_Login}    css:.alert-danger
${Shope_page_load}    css:.nav-link

*** Test Cases ***

#Validate UnSuccesful Login
#    Fill the Login form    ${user_name}    ${invalid_password}
#    Wait until Element is located in the page    ${Error_Message_Login}
#    Verify error message is correct

Validate Cards display in the shopping Page
    Fill The Login Form    ${user_name}    ${valid_password}
    Wait until Element is located in the page   ${Shope_page_load}
    Verify Card titles in the Shop Page
    Select the Card    iphone X

    
*** Keywords ***

Fill the Login form
    [arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    password   ${password}
    Click Button    signInBtn
    
Wait until Element is located in the page
    [arguments]    ${element}
    Wait Until Element Is Visible    ${element}

Verify error message is correct
    ${result}=    Get Text    ${Error_Message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.


Verify Card titles in the Shop Page
    @{expectedList}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements}=    Get WebElements    css:.card-title
    @{actualList}=    Create List
    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        Append To List    ${actualList}    ${element.text}
    END
    Lists Should Be Equal    ${expectedList}    ${actualList}


Select the Card
    [arguments]    ${cardName}
    ${elements}=    Get WebElements    css:.card-title
    ${index}=    Set Variable    1
    FOR    ${element}    IN    @{elements}
        Exit For Loop If    '${cardName}'=='${element.text}'
        ${index}=    Evaluate    ${index}+1
    END
    Click Button    xpath:(//div[@class='card-footer'])[${index}]/button

        
dropdown
checkbox
iframe
alert
popup





    
    







