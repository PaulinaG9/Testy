*** Settings ***
Documentation   Rejestracja_klient
Library     SeleniumLibrary
Resource    Resources/Bledy.robot
Resource    Resources/Keywords_rejestracja.robot
Resource    Resources/Zatrudnienie.robot
Resource    Resources/Keywords.robot
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
    [Arguments]      ${Email}   ${Pesel}    ${Haslo}    ${Powtorz haslo}    ${Imie}     ${Nazwisko}     ${Numer dowodu}    ${Stan cywilny}  ${Ilosc osob na utrzymaniu}     ${Numer telefonu}   ${Ulica}     ${Numer budynku}        ${Numer lokalu}    ${Miasto}   ${Kod pocztowy}  ${Brak Danych}   ${Tekst}
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

    DalejZatrudnienie

    Run Keyword if  ${Brak Danych}==1  Brak danych zatrudnienie     ${Tekst}
 #   ...  ELSE IF  ${B.Nr.Dowodu}==1  Blad nr.dowodu     ${Tekst}
  #  ...  ELSE IF  ${B.Nr.Tel}==1  Blad nr.tel   ${Tekst}

    Close Browser

*** Test Cases ***            E-MAIL                      PESEL        HASLO       HASLO       IMIE       NAZWISKO   NR.DOWODU   STAN.CYWILNY  ILOSC.OS   NR.TEL       ULICA       NR.BUD    NR.MIESZ    MIASTO      KOD.P    BRAKDANYCH     TEKST
Brak danych                   polytestuj+44@gmail.com     90071403992  Testuję789  Testuję789  Poly40     Testuj40   SUT933949   1             1           567654345   Test        50        5           City        54-555   1              Pole jest wymagane.
