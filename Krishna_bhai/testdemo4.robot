* Settings *

Documentation    To Validate the login form
Library    SeleniumLibrary
Library    Collections
Library    String
Test Setup    Open the browser with the mortgage LoginPage url
Test Teardown    Close Browser Session
Resource    resource.robot


* Variables *
${Error_Message_Login}    css:.alert-danger


* Test Cases *
Validate Child Window Functionality
    Select the link of Child window
    Verify the user is Switched to Child Window
    Grab the Email id on the Child Window
    Switch to Parent window and enter the email

* Keywords *
Select the link of Child window
    Click Element    css:.blinkingText
    Sleep    5

Verify the user is Switched to Child Window
    Switch Window    NEW
    Element Text Should Be    css:h1    DOCUMENTS REQUEST

Grab the Email id on the Child Window
    Sleep    5
    ${text}=    get text    css:.red
    @{words}=    Split String    ${text}    at
    #0-->Please email us at
    #1->mentor@rahulshettyacademy.com with below template to receive response
    ${text_split}=    Get From List    ${words}    1
    log    ${text_split}
    @{words_2}=    Split String    ${text_split}
    #0->mentor@rahulshettyacademy.com
    ${email}=    Get From List    ${words_2}    0
    Set Global Variable    ${email}

Switch to Parent window and enter the email
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username    ${email}
    Sleep    3


#Wait Until Element Is Visible
#Unselect Frame
#Select Frame
    
#step

#'''one a url
#browser
#Switch to frame
#Select some element inside the frame
#UnSelect Frame'''