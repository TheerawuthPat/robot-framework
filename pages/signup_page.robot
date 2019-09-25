*** Variables ***
${URL}    https://goo.gl/iCce7C

*** Keywords ***
Open 
    Open Browser    ${URL}    browser=chrome

Fill in Firstname "${firstname}"
    Input Text    id:firstname    ${firstname}

Fill in Lastname "${lastname}"
    Input Text    id:lastname    ${lastname}

Fill in Address "${address}"
    Input Text    id:address    ${address}

Fill in Zipcode "${zipcode}"
    Input Text    id:zipcode    ${zipcode}

Sign up
    Click Button    id:signup

    