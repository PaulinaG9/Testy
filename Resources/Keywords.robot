*** Keywords ***


EmailAdmin
    [Arguments]      ${EmailAdmin}
    Input Text  name=username     ${EmailAdmin}

HasloAdmin
    [Arguments]      ${HasloAdmin}
    Input Text  name=password     ${HasloAdmin}


ZalogujAdmin
    Click Element  xpath=//*[@id="login-form"]/div[3]/input
    Sleep  2s
    Page should contain element  id=site-name

UzytkownicyAdmin
    Click Element     xpath=//*[@id="content-main"]/div[9]/table/tbody/tr/th/a

WyszukajUsera
    [Arguments]  ${MailUsera}
    Input text   name=q  ${MailUsera}
    Click Element   xpath=//*[@id="changelist-search"]/div/input[2]

UsunUsera
    Sleep  2s
    Click Element  xpath=//*[@id="action-toggle"]
    [Arguments]      ${Usun}
    Select From List By Index  name=action  ${Usun}
    Click Element  xpath=//*[@id="changelist-form"]/div[1]/button
    Click Element  xpath=//*[@id="content"]/form/div/input[4]
    Click Element  xpath=//*[@id="container"]/div[2]/a[1]