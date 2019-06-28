*** Keywords ***

#Kalkulator
Otworz Aplikacje Kliencka
    Open Browser    ${APLIKACJA KLIENCKA REJESTRACJA}   ${BROWSER}
    Maximize Browser Window

Otworz Aplikacje Kliencka Wyslij
    Open Browser    ${APLIKACJA KLIENCKA REJESTRACJA}   ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains  Kalkulator pożyczki
    Wyslij


Otworz Aplikacje Kliencka Logowanie
    Open Browser    ${APLIKACJA KLIENCKA LOGOWANIE}   ${BROWSER}
    Maximize Browser Window

Otworz Aplikacje Pracownicza Logowanie
    Open Browser    ${APLIKACJA PRACOWNICZA}   ${BROWSER}
    Maximize Browser Window
    Click Element  xpath=//*[@id="root"]/div/div/div[2]/div/a

Wyslij
    Click button  xpath=//*[@id="root"]/div/button

Logowanie klient
    [Arguments]     ${e-mail}   ${haslo}
    Otworz Aplikacje Kliencka Logowanie
    Wpisz login uzytkownika    ${e-mail}
    Wpisz Haslo uzytkownika    ${haslo}
    Potwierdz Logowanie

Wpisz login uzytkownika
    [Arguments]      ${login}
    Input Text  name=email     ${login}

Wpisz Haslo uzytkownika
    [Arguments]      ${password}
    Input Text  name=password     ${password}

Potwierdz Logowanie
    Click button    xpath=//*[@id="root"]/div/div[2]/div[1]/div[2]/button

Wpisz login pracownika
    [Arguments]      ${login}
    Input Text  name=email     ${login}

Wpisz Haslo pracownika
    [Arguments]      ${password}
    Input Text  name=password     ${password}

Potwierdz Logowanie pracownika
    Click button    xpath=//*[@id="root"]/div/div/div[2]/div/div/form/div[2]/button

Strona pracownicza
    Location Should Be  https://backoffice.qa-gex.funeda.pl/origination

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

Wyloguj klienta
    Sleep  3s
    Click Button  xpath=//*[@id="root"]/div/div[1]/form/button



