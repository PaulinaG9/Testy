*** Settings ***
Documentation   UsunUsera
Library     SeleniumLibrary
Resource   Resources/Keywords.robot
Suite Setup     Otworz Admina Django i zaloguj
Suite Teardown  Close Browser
Test Template   Wyszukaj i usun usera

*** Variables ***
${BROWSER}                         Chrome
${APLIKACJA KLIENCKA LOGOWANIE}    https://qa-gex.funeda.pl/account/login
${APLIKACJA PRACOWNICZA}           https://backoffice.qa-gex.funeda.pl/
${STRONA UZYTKOWNIKA}              https://qa-gex.funeda.pl/dashboard/profile
${ADMIN DJANGO}                    https://api.qa-gex.funeda.pl/admin/login/?next=/admin/
${ADMIN LOGIN}                     admin@qa-gex.funeda.pl
${ADMIN HASLO}                     zaq1@WSX

*** Keywords ***


Wyszukaj i usun usera
    [Arguments]     ${e-mail}
    UzytkownicyAdmin
    WyszukajUsera  ${e-mail}
    UsunUsera  1
    Reload Page


Otworz Admina Django i zaloguj
    Open Browser    ${ADMIN DJANGO}   ${BROWSER}
    Maximize Browser Window
    EmailAdmin  ${ADMIN LOGIN}
    HasloAdmin  ${ADMIN HASLO}
    ZalogujAdmin


*** Test Cases ***          #{e-mail}
polytestuj+10@gamil.com     polytestuj+10@gmail.com
polytestuj+11@gmail.com     polytestuj+111@gmail.com
#polytestuj+12@gmail.com     polytestuj+12@gmail.com
#polytestuj+13@gmail.com     polytestuj+13@gmail.com
#polytestuj+14@gmail.com     polytestuj+14@gmail.com
#polytestuj+15@gmail.com     polytestuj+15@gmail.com
#polytestuj+16@gmail.com     polytestuj+16@gmail.com
#polytestuj+17@gmail.com     polytestuj+17@gmail.com
#polytestuj+18@gmail.com     polytestuj+18@gmail.com
#polytestuj+19@gmail.com     polytestuj+19@gmail.com