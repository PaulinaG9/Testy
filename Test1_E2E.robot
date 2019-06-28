*** Settings ***
Documentation   Rejestracja_klient
Library     SeleniumLibrary
Resource    Resources/Zatrudnienie.robot
Resource    Resources/Keywords_rejestracja.robot
Resource    Resources/Keywords.robot
#Suite Setup     Otworz Aplikacje Kliencka
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
    [Arguments]      ${Email}   ${Pesel}    ${Haslo}    ${Powtorz haslo}    ${Imie}     ${Nazwisko}     ${Numer dowodu}    ${Stan cywilny}  ${Ilosc osob na utrzymaniu}     ${Numer telefonu}      ${Ulica}     ${Numer budynku}        ${Numer lokalu}    ${Miasto}   ${Kod pocztowy}     ${Typ zatrudnienia}     ${Miesieczne wydatki}    ${Dodatkowe wydatki}
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
    Zgoda1
    Zgoda2
    Zgoda3
    Zgoda4
    Zgoda5
    Zgoda6
    Zgoda7
    Zgoda8
    Wyslij wniosek

    INGBank
    INGLogin  fake42!


    Wyloguj klienta
    Sleep  2s
    Close Browser

    Otworz Aplikacje Pracownicza Logowanie



*** Test Cases ***            E-MAIL                      PESEL        HASLO       HASLO       IMIE    NAZWISKO  NR.DOWODU   STAN.CYWILNY  ILOSC.OS  NR.TEL      ULICA       NR.BUD  NR.MIESZ    MIASTO      KOD.P    TYP.ZATRUDNIENIA  MIES.WYD  DOD.WYD
SAS failed                    polytestuj+119@gmail.com     13060623977  Testuję789  Testuję78 9  Poly19  Testuj19  JLV022850   2             1         463829266   Testowa     10      10          Sopot       10-1010  10                5000      800
