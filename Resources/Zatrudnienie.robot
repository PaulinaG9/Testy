*** Settings ***
Documentation   Rejestracja
Library     SeleniumLibrary

*** Keywords ***

UoP_okr
    Typ zatrudnienia  1
    Poczatek zatrudnienia mies  5
    Poczatek zatrudnienia rok  8
    Koniec zatrudnienia mies  5
    Koniec zatrudnienia rok  10
    Pracodawca  Firma A
    Stanowisko  CEO
    Numer telefonu pracodawcy  789987789
    Ulica pracodawcy  Gajowa
    Numer budynku pracodawcy  4/7
    Miasto pracodawcy  Wroclław
    Kod pocztowy pracodawcy  54321
    Miesieczny przychod  1500
    Sposob wplat  2

UoP_nokr
    Typ zatrudnienia  1
    Poczatek zatrudnienia mies  2
    Poczatek zatrudnienia rok  3
    Umowa na czas nieokreslony
    Pracodawca  Test
    Stanowisko  XCV
    Numer telefonu pracodawcy  987667887
    Ulica pracodawcy  Ulica
    Numer budynku pracodawcy  3
    Miasto pracodawcy  Miasto
    Kod pocztowy pracodawcy  33777
    Miesieczny przychod  15000
    Sposob wplat  1

Projekt
    Typ zatrudnienia  2
    Poczatek zatrudnienia mies  4
    Poczatek zatrudnienia rok  6
    Koniec zatrudnienia mies  10
    Koniec zatrudnienia rok  7
    Pracodawca  Firma B
    Stanowisko  Grafik
    Numer telefonu pracodawcy  963136468
    Ulica pracodawcy  Poziomkowa
    Numer budynku pracodawcy  3
    Miasto pracodawcy  Chorzów
    Kod pocztowy pracodawcy  99555
    Miesieczny przychod  2500
    Sposob wplat  1

Samozatrudnienie
    Typ zatrudnienia  3
    NIP  3550592763
    Miesieczny przychod  3000
    Sposob wplat  2

Rencista_okr
    Typ zatrudnienia  4
    Renta do mies  3
    Renta do rok  10
    Miesieczny przychod  1800
    Sposob wplat  1

Rencista_nokr
    Typ zatrudnienia  4
    Renta dozywotnia
    Miesieczny przychod  1800
    Sposob wplat  1

Student
    Typ zatrudnienia  5
    Stypendium  1
    Miesieczny przychod  1500
    Sposob wplat  1

Farmer
    Typ zatrudnienia  6
    Miesieczny przychod  7200
    Sposob wplat  2

Gospodyni
    Typ zatrudnienia  7
    Miesieczny przychod  800
    Sposob wplat  1

Bezrobotny
    Typ zatrudnienia  8
    Miesieczny przychod  0
    Sposob wplat  1

Inne
    Typ zatrudnienia  9
    Miesieczny przychod  10000
    Sposob wplat  2

PracaDorywcza
    Typ zatrudnienia  10
    Miesieczny przychod  2300
    Sposob wplat  1

Typ zatrudnienia
    [Arguments]      ${Typ zatrudnienia}
    Select From List By Index  name=employment_type  ${Typ zatrudnienia}

Stypendium
    [Arguments]      ${Stypendium}
    Select From List By Index  name=scholarship  ${Stypendium}

Poczatek zatrudnienia mies
    [Arguments]      ${Poczatek zatrudnienia mies}
    Select From List By Index  name=employment_startMonth  ${Poczatek zatrudnienia mies}

Poczatek zatrudnienia rok
    [Arguments]      ${Poczatek zatrudnienia rok}
    Select From List By Index  name=employment_startYear  ${Poczatek zatrudnienia rok}

Umowa na czas nieokreslony
    Click Element     xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[2]/div/div/label[1]/span

Koniec zatrudnienia mies
    [Arguments]      ${Koniec zatrudnienia mies}
    Select From List By Index  name=employment_endMonth  ${Koniec zatrudnienia mies}

Koniec zatrudnienia rok
    [Arguments]      ${Koniec zatrudnienia rok}
    Select From List By Index  name=employment_endYear  ${Koniec zatrudnienia rok}

NIP
    [Arguments]      ${NIP}
    Input Text  name=tax_id  ${NIP}

Pracodawca
    [Arguments]      ${Pracodawca}
    Input Text  name=employer_name  ${Pracodawca}

Stanowisko
    [Arguments]      ${Stanowisko}
    Input Text  name=job_position  ${Stanowisko}

Numer telefonu pracodawcy
    [Arguments]      ${Numer telefonu pracodawcy}
    Input Text  name=employer_phone_number  ${Numer telefonu pracodawcy}

Ulica pracodawcy
    [Arguments]      ${Ulica pracodawcy}
    Input Text  name=employer_street  ${Ulica pracodawcy}

Numer budynku pracodawcy
    [Arguments]      ${Numer domu pracodawcy}
    Input Text  name=employer_house_number  ${Numer domu pracodawcy}

Miasto pracodawcy
    [Arguments]      ${Miasto pracodawcy}
    Input Text  name=employer_city  ${Miasto pracodawcy}

Kod pocztowy pracodawcy
    [Arguments]      ${Kod pocztowy pracodawcy}
    Input Text  name=employer_postal_code  ${Kod pocztowy pracodawcy}

Renta dozywotnia
    Click Element     xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[2]/div/div/label[1]/span

Renta do mies
    [Arguments]      ${Renta do mies}
    Select From List By Index  name=pension_tillMonth  ${Renta do mies}

Renta do rok
    [Arguments]      ${Renta do rok}
    Select From List By Index  name=pension_tillYear  ${Renta do rok}

Dodatkowy przychod
    Click Element     xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[5]/div/div/label[1]/span

Kwota dodatkowego przychodu
    [Arguments]      ${Kwota dodatkowego przychodu}
    Input Text  name=additional_income_amount  ${Kwota dodatkowego przychodu}

Miesieczny przychod
    [Arguments]      ${Miesieczny przychod}
    Input Text  name=monthly_net_income  ${Miesieczny przychod}

Sposob wplat
    [Arguments]      ${Sposob wplat}
    Select From List By Index  name=income_payout_target  ${Sposob wplat}


DalejZatrudnienie
    Click Button  xpath=//*[@id="root"]/div/div[2]/div/div[3]/button[2]
