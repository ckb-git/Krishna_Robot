*** Settings ***
Documentation    A resource file with reusable keywords and variables
Library    SeleniumLibrary


*** Variables ***
${user_name}    rahulshettyacademy
${invalid_password}    password@456
${valid_password}    learning
${url}    https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
Open the browser with the mortgage LoginPage url
    Create Webdriver    Chrome
    Go To    ${url}

Close Browser Session
    Close Browser