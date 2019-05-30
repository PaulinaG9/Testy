*** Settings ***
Documentation   Rejestracja_klient
Library     SeleniumLibrary
Resource    Resources/Bledy.robot
Resource    Resources/Keywords_rejestracja.robot
Resource    Resources/Zatrudnienie.robot
#Suite Setup     Otworz Aplikacje Kliencka Wyslij
#Suite Teardown  Close Browser
Test Template   Rejestracja

*** Variables ***
${BROWSER}                         Chrome
${APLIKACJA KLIENCKA REJESTRACJA}  https://qa-gex.funeda.pl/
${APLIKACJA PRACOWNICZA}           https://backoffice.qa-gex.funeda.pl/
${STRONA UZYTKOWNIKA}              https://qa-gex.funeda.pl/dashboard/profile
${ADMIN DJANGO}                    https://api.qa-gex.funeda.pl/admin/login/?next=/admin/
${ING LOGIN}                       fake42!

*** Keywords ***

Rejestracja
    [Arguments]      ${Email}   ${Pesel}    ${Haslo}    ${Powtorz haslo}    ${Imie}     ${Nazwisko}     ${Numer dowodu}    ${Stan cywilny}  ${Ilosc osob na utrzymaniu}     ${Numer telefonu}      ${Ulica}     ${Numer budynku}        ${Numer lokalu}    ${Miasto}   ${Kod pocztowy}     ${Typ zatrudnienia}     ${Miesieczne wydatki}    ${Dodatkowe wydatki}  ${Brak Danych}   ${Tekst}
    Otworz Aplikacje Kliencka Wyslij
    Email   ${Email}
    Pesel   ${Pesel}
    Haslo   ${Haslo}
    Powtorz haslo   ${Powtorz haslo}
    Zgoda
    Zarejestruj
    sleep  5s

    Imie  ${Imie}
    Nazwisko  ${Nazwisko}
    Numer dowodu  ${Numer dowodu}
    Stan cywilny  ${Stan cywilny}
    Ilosc osob na utrzymaniu  ${Ilosc osob na utrzymaniu}
    Numer telefonu  ${Numer telefonu}
    DalejPersonalData

    Ulica  ${Ulica}
    Numer budynku  ${Numer budynku}
    Numer lokalu  ${Numer lokalu}
    Miasto  ${Miasto}
    Kod pocztowy  ${Kod pocztowy}
    DalejAdress

    Typ zatrudnienia    ${Typ zatrudnienia}
    Run Keyword if  ${Typ zatrudnienia}==1    UoP_okr
    Run Keyword if  ${Typ zatrudnienia}==2    Projekt
    Run Keyword if  ${Typ zatrudnienia}==3    Samozatrudnienie
    Run Keyword if  ${Typ zatrudnienia}==4    Rencista_okr
    Run Keyword if  ${Typ zatrudnienia}==5    Student
    Run Keyword if  ${Typ zatrudnienia}==6    Farmer
    Run Keyword if  ${Typ zatrudnienia}==7    Gospodyni
    Run Keyword if  ${Typ zatrudnienia}==8    Bezrobotny
    Run Keyword if  ${Typ zatrudnienia}==9    Inne
    Run Keyword if  ${Typ zatrudnienia}==10   PracaDorywcza
    DalejZatrudnienie

    Miesieczne wydatki  ${Miesieczne wydatki}
    Dodatkowe wydatki  ${Dodatkowe wydatki}
    Wyslij wniosek

    Run Keyword if  ${Brak Danych}==1  Brak danych wydatki     ${Tekst}
    Brak zgod  ${Tekst}

 Close Browser

*** Test Cases ***            E-MAIL                      PESEL        HASLO       HASLO       IMIE       NAZWISKO   NR.DOWODU   STAN.CYWILNY  ILOSC.OS  NR.TEL      ULICA       NR.BUD    NR.MIESZ    MIASTO      KOD.P    TYP.ZATRUDNIENIA  MIES.WYD   DOD.WYD    BRAKDANYCH     TEKST
Brak danych                   polytestuj+60@gmail.com     95090138252  Testuję789  Testuję789  Poly60     Testuj60   SUT933949   1             1         567654345   Test        50        5           City        54-555   5                 ${EMPTY}   ${EMPTY}   1              Pole jest wymagane.
