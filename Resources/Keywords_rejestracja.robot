*** Keywords ***

#Kalkulator
Otworz Aplikacje Kliencka
    Open Browser    ${APLIKACJA KLIENCKA REJESTRACJA}   ${BROWSER}
    Maximize Browser Window

Wyslij
    Click button  xpath=//*[@id="root"]/div/button

#Rejestracja1
Email
    [Arguments]      ${Email}
    Input Text  name=email     ${Email}

Pesel
    [Arguments]      ${Pesel}
    Input Text  name=personalNumber     ${Pesel}

Haslo
    [Arguments]      ${Haslo}
    Input Text  name=password     ${Haslo}

Powtorz haslo
    [Arguments]      ${Powtorz haslo}
    Input Text  name=passwordConfirm     ${Powtorz haslo}

Zgoda
    Click Element     xpath=//*[@id="root"]/div/div[1]/div/div[2]/div[5]/div/label[1]/span

Zarejestruj
    Click Button    xpath=//*[@id="root"]/div/div[1]/div/div[3]/button

#Dane klienta
Imie
    [Arguments]      ${Imie}
    Input Text  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[1]/label/div[1]/input    ${Imie}

Nazwisko
    [Arguments]      ${Nazwisko}
    Input Text  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[2]/label/div[1]/input    ${Nazwisko}

Numer dowodu
    [Arguments]      ${Numer dowodu}
    Input Text  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[3]/label/div[1]/input    ${Numer dowodu}

Stan cywilny
    [Arguments]      ${Stan cywilny}
    Select From List By Index  name=marital_status  ${Stan cywilny}

Ilosc osob na utrzymaniu
    [Arguments]      ${Ilosc osob na utrzymaniu}
    Input Text  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[5]/label/div[1]/input    ${Ilosc osob na utrzymaniu}

Numer telefonu
    [Arguments]      ${Numer telefonu}
    Input Text  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[6]/div/label/div/input    ${Numer telefonu}

DalejPersonalData
    Click Button  xpath=//*[@id="root"]/div/div[2]/div/div[3]/button

#Adres
Ulica
    [Arguments]      ${Ulica}
    Input Text  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[1]/label/div[1]/input  ${Ulica}

Numer budynku
    [Arguments]      ${Numer budynku}
    Input Text  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[2]/label/div[1]/input  ${Numer budynku}

Numer lokalu
    [Arguments]      ${Numer lokalu}
    Input Text  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[3]/label/div/input  ${Numer lokalu}

Miasto
    [Arguments]      ${Miasto}
    Input Text  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[4]/label/div[1]/input  ${Miasto}

Kod pocztowy
    [Arguments]      ${Kod pocztowy}
    Input Text  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[5]/div/label/div[1]/input  ${Kod pocztowy}

DalejAdress
    Click Button  xpath=//*[@id="root"]/div/div[2]/div/div[3]/button[2]

#Wydatki
Miesieczne wydatki
    [Arguments]      ${Miesieczne wydatki}
    Input Text  name=monthly_regular_expenses  ${Miesieczne wydatki}

Dodatkowe wydatki
    [Arguments]      ${Dodatkowe wydatki}
    Input Text  name=other_loan_monthly_expenses  ${Dodatkowe wydatki}

Zaznacz wszystkie zgody
    Click Element     xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[3]/div/div/label[1]/span
Zgoda1
    Click Element     xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[4]/div/div/label[1]/span
Zgoda2
    Click Element     xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[5]/div/div/label[1]/span
Zgoda3
    Click Element     xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[6]/div/div/label[1]/span
Zgoda4
    Click Element     xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[7]/div/div/label[1]/span
Zgoda5
    Click Element     xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[8]/div/div/label[1]/span
Zgoda6
    Click Element     xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[9]/div/div/label[1]/span
Zgoda7
    Click Element     xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[10]/div/div/label[1]/span
Zgoda8
    Click Element     xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[11]/div/div/label[1]/span
Wyslij wniosek
    Click Button    xpath=//*[@id="root"]/div/div[2]/div/div[3]/button[2]

INGBank
    Sleep  5s
    Select frame   xpath=//iframe[@name='instantor']
  #  Page should contain element     xpath=//*[@id="bank-list-chooser-section"]/div[1]/div[2]
    Click element  xpath=//*[@id="bank-list-chooser-section"]/div[1]/div[2]

INGLogin
    Unselect Frame
    Sleep  3s
    Select frame  xpath=//iframe[@name='instantor']
    [Arguments]     ${INGlogin}
    Input Text  id=field_01  ${INGlogin}
    Click Element   id=terms_and_conditions
    Click Element   id=privacy_policy
    Click Element   xpath=//*[@id="main-content"]/div/div/div/div/form/button
    Sleep  7s
    Page should contain element  xpath=//*[@id="root"]/div/div[1]/img

Wyloguj
    Sleep  3s
    Click Button  xpath=//*[@id="root"]/div/div[1]/form/button
