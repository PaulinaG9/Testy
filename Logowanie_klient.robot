*** Settings ***
Documentation   Logowanie_klient
Library         SeleniumLibrary
Resource   Resources/Keywords.robot
Suite Setup     Otworz Aplikacje Kliencka Logowanie
#Suite Teardown  Close Browser
Test Template   Logowanie

*** Variables ***
${BROWSER}                         Chrome
${APLIKACJA KLIENCKA LOGOWANIE}    https://qa-gex.funeda.pl/account/login
${APLIKACJA PRACOWNICZA}           https://backoffice.qa-gex.funeda.pl/
${STRONA UZYTKOWNIKA}              https://qa-gex.funeda.pl/dashboard/profile
${ADMIN DJANGO}                    https://api.qa-gex.funeda.pl/admin/login/?next=/admin/
${POPRAWNY LOGIN}                  polytestuj+10@gmail.com
${POPRAWNE HASLO}                  Tesuję789

*** Keywords ***

Logowanie
    [Arguments]     ${e-mail}   ${haslo}    ${adres}
    Wpisz login uzytkownika    ${e-mail}
    Wpisz Haslo uzytkownika     ${haslo}
    Potwierdz Logowanie
    Sleep  1s
    Location Should Be  ${adres}
    Reload Page


*** Test Cases ***           E-MAIL             HASLO                   ADRES
Bledny e-mail                invalid            ${POPRAWNE HASLO}       https://qa-gex.funeda.pl/account/login
Bledne haslo                 ${POPRAWNY LOGIN}  invalid                 https://qa-gex.funeda.pl/account/login
Bledny e-mail i haslo        invalid            whatewer                https://qa-gex.funeda.pl/account/login
Pusty e-mail                 ${EMPTY}           ${POPRAWNE HASLO}       https://qa-gex.funeda.pl/account/login
Puste haslo                  ${POPRAWNY LOGIN}  ${EMPTY}                https://qa-gex.funeda.pl/account/login
Pusty e-mail i haslo         ${EMPTY}           ${EMPTY}                https://qa-gex.funeda.pl/account/login
#Nieistniejace konto
Poprawne logowanie           ${POPRAWNY LOGIN}  ${POPRAWNE HASLO}       https://qa-gex.funeda.pl/dashboard/profile