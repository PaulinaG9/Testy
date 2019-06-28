*** Keywords ***

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
    Click Element     xpath=//*[@id="root"]/div/div[2]/div[1]/div[2]/div[5]/div/label[1]/span

Zarejestruj
    Click Button    Zarejestruj się

#Dane klienta
Imie
    [Arguments]      ${Imie}
    Input Text  name=first_name    ${Imie}

Nazwisko
    [Arguments]      ${Nazwisko}
    Input Text  name=last_name   ${Nazwisko}

Numer dowodu
    [Arguments]      ${Numer dowodu}
    Input Text  name=id_card_number    ${Numer dowodu}

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
    Click Button  Dalej

#Adres
Ulica
    [Arguments]      ${Ulica}
    Input Text  name=street  ${Ulica}

Numer budynku
    [Arguments]      ${Numer budynku}
    Input Text  name=house_number  ${Numer budynku}

Numer lokalu
    [Arguments]      ${Numer lokalu}
    Input Text  name=apartment_number  ${Numer lokalu}

Miasto
    [Arguments]      ${Miasto}
    Input Text  name=city  ${Miasto}

Kod pocztowy
    [Arguments]      ${Kod pocztowy}
    Input Text  name=postal_code  ${Kod pocztowy}

DalejAdress
    Click Button  Dalej

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
    Click Button    Wyślij

INGBank
    Wait Until Element Is Visible  id=instantor
    Select frame   id=instantor
    Wait Until Element Is Visible  xpath=//*[@id="bank-list-chooser-section"]/div[1]/div[2]
    Click Element  xpath=//*[@id="bank-list-chooser-section"]/div[1]/div[2]

INGLogin
    Unselect Frame
    Select frame  id=instantor
    Wait Until Element Is Visible  id=field_01
    [Arguments]     ${INGlogin}
    Input Text  id=field_01  ${INGlogin}
    Sleep  1s
    Click Element   id=terms_and_conditions
    Click Element   id=privacy_policy
    Click Element   xpath=//*[@id="main-content"]/div/div/div/div/form/button
    Wait Until Element Is Visible  xpath=//*[@id="root"]/div/div[1]/img

INGHaslo
    Unselect Frame
    Wait Until Element Is Visible  id=instantor
    Select frame  id=instantor
    [Arguments]     ${INGhaslo2}  ${INGhaslo5}  ${INGhaslo7}  ${INGhaslo8}  ${INGhaslo9}
    Input Text  id=fld_1  ${INGhaslo2}
    Input Text  id=fld_4  ${INGhaslo5}
    Input Text  id=fld_6  ${INGhaslo7}
    Input Text  id=fld_7  ${INGhaslo8}
    Input Text  id=fld_8  ${INGhaslo9}
    Click Element  xpath=//*[@id="main-content"]/div/div/div/div/form/button



