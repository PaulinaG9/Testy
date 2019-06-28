*** Settings ***
Documentation   Logowanie_pracownik
Library         SeleniumLibrary
Resource   Resources/Keywords.robot
Suite Setup     Otworz Aplikacje Pracownicza Logowanie
Suite Teardown  Close Browser
Test Template   Logowanie

*** Variables ***
${BROWSER}                         Chrome
${APLIKACJA PRACOWNICZA}           https://backoffice.qa-gex.funeda.pl/
${STRONA UZYTKOWNIKA}              https://qa-gex.funeda.pl/dashboard/profile
${ADMIN DJANGO}                    https://api.qa-gex.funeda.pl/admin/login/?next=/admin/
${POPRAWNY LOGIN}                  admin@qa-gex.funeda.pl
${POPRAWNE HASLO}                  zaq1@WSX

*** Keywords ***

Logowanie
    [Arguments]     ${e-mail}   ${haslo}    ${adres}
    Wpisz login pracownika    ${e-mail}
    Wpisz Haslo pracownika     ${haslo}
    Potwierdz Logowanie pracownika
    Sleep  1s
    Location Should Be  ${adres}
    Reload Page


*** Test Cases ***           E-MAIL             HASLO                   ADRES
Bledny e-mail                invalid            ${POPRAWNE HASLO}       https://backoffice.qa-gex.funeda.pl/login
Bledne haslo                 ${POPRAWNY LOGIN}  invalid                 https://backoffice.qa-gex.funeda.pl/login
Bledny e-mail i haslo        invalid            whatewer                https://backoffice.qa-gex.funeda.pl/login
Pusty e-mail                 ${EMPTY}           ${POPRAWNE HASLO}       https://backoffice.qa-gex.funeda.pl/login
Puste haslo                  ${POPRAWNY LOGIN}  ${EMPTY}                https://backoffice.qa-gex.funeda.pl/login
Pusty e-mail i haslo         ${EMPTY}           ${EMPTY}                https://backoffice.qa-gex.funeda.pl/login
#Nieistniejace konto
Poprawne logowanie           ${POPRAWNY LOGIN}  ${POPRAWNE HASLO}       https://backoffice.qa-gex.funeda.pl/origination