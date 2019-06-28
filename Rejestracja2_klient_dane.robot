*** Settings ***
Documentation   Rejestracja_klient
Library     SeleniumLibrary
Resource    Resources/Bledy.robot
Resource    Resources/Keywords_rejestracja.robot
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
    [Arguments]      ${Email}   ${Pesel}    ${Haslo}    ${Powtorz haslo}    ${Imie}     ${Nazwisko}     ${Numer dowodu}    ${Stan cywilny}  ${Ilosc osob na utrzymaniu}     ${Numer telefonu}    ${Brak Danych}  ${B.Nr.Dowodu}  ${B.Nr.Tel}    ${Tekst}
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

    Run Keyword if  ${Brak Danych}==1  Brak danych dane     ${Tekst}
    ...  ELSE IF  ${B.Nr.Dowodu}==1  Blad nr.dowodu     ${Tekst}
    ...  ELSE IF  ${B.Nr.Tel}==1  Blad nr.tel   ${Tekst}

    Close Browser

*** Test Cases ***            E-MAIL                      PESEL        HASLO       HASLO       IMIE       NAZWISKO   NR.DOWODU   STAN.CYWILNY  ILOSC.OS   NR.TEL     BRAKDANYCH  B.NR.DOWODU  B.NR.TEL    TEKST
Brak danych                   polytestuj+20@gmail.com     83110175666  Testuję789  Testuję789  ${EMPTY}   ${EMPTY}   ${EMPTY}    0             ${EMPTY}   ${EMPTY}   1           0            0           Pole jest wymagane.
Bledny nr.dowodu              polytestuj+21@gmail.com     48031266972  Testuję789  Testuję789  Poly11     Testuj11   numer       2             2         765434567   0           1            0           Znaki po serii dowodu osobistego muszą być cyframi.
Bledny nr.dowodu2             polytestuj+22@gmail.com     97092002382  Testuję789  Testuję789  Poly12     Testuj12   222188603   2             1         758362436   0           1            0           Tylko litery mogą być wykorzystane w serii dowodu.
Bledny nr.telefonu            polytestuj+23@gmail.com     75062639415  Testuję789  Testuję789  Poly13     Testuj13   JWF706407   2             3         986243      0           0            1           Pole musi się zgadzać z formatem.
