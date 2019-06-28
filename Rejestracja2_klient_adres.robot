*** Settings ***
Documentation   Rejestracja_klient
Library     SeleniumLibrary
Resource    Resources/Bledy.robot
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
    [Arguments]      ${Email}   ${Pesel}    ${Haslo}    ${Powtorz haslo}    ${Imie}     ${Nazwisko}     ${Numer dowodu}    ${Stan cywilny}  ${Ilosc osob na utrzymaniu}     ${Numer telefonu}      ${Ulica}     ${Numer budynku}        ${Numer lokalu}    ${Miasto}   ${Kod pocztowy}  ${Brak Danych}   ${B.Kod.Pocztowy}  ${Tekst}
    Otworz Aplikacje Kliencka Wyslij

    Email   ${Email}
    Pesel   ${Pesel}
    Haslo   ${Haslo}
    Powtorz haslo   ${Powtorz haslo}
    Zgoda
    Zarejestruj
    Sleep  3s

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

    Run Keyword if  ${Brak Danych}==1   Brak danych adres   ${Tekst}
    ...    ELSE IF  ${B.Kod.Pocztowy}==1    Blad kod.pocztowy   ${Tekst}

    Close Browser


*** Test Cases ***            E-MAIL                      PESEL        HASLO       HASLO       IMIE    NAZWISKO  NR.DOWODU   STAN.CYWILNY  ILOSC.OS  NR.TEL      ULICA       NR.BUD    NR.MIESZ    MIASTO      KOD.P      BRAKDANYCH  B.KOD.POCZTOWY  TEKST
Brak danych                   polytestuj+30@gmail.com     07062582882  Testuję789  Testuję789  Poly10  Testuj10  AVE412293   1             1         609857889   ${EMPTY}    ${EMPTY}  ${EMPTY}    ${EMPTY}    ${EMPTY}   1           0               Pole jest wymagane.
Bledny kod                    polytestuj+31@gmail.com     30123120392  Testuję789  Testuję789  Poly11  Testuj11  KJP810690   2             2         765434567   Testowa     2         2           Kraków      22-22      0           1               Pole musi się zgadzać z formatem.
