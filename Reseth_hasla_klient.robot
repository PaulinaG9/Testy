*** Settings ***
Documentation   Logowanie_klient
Library         SeleniumLibrary
Suite Setup     Otworz Aplikacje Kliencka
#Suite Teardown  Close Browser
Test Template   ResetujHaslo

*** Variables ***
${BROWSER}                         Chrome
${APLIKACJA KLIENCKA LOGOWANIE}    https://qa-gex.funeda.pl/account/login
${APLIKACJA PRACOWNICZA}           https://backoffice.qa-gex.funeda.pl/
${STRONA UZYTKOWNIKA}              https://qa-gex.funeda.pl/dashboard/profile
${ADMIN DJANGO}                    https://api.qa-gex.funeda.pl/admin/login/?next=/admin/
${POPRAWNY LOGIN}                  polytestuj+10@gmail.com
${POPRAWNE HASLO}                  Tesuję789
${MAILHOG}                         http://qa-gex.funeda.pl:8025/#
*** Keywords ***

ResetujHaslo
    [Arguments]     ${e-mail}   ${haslo}    ${pesel}


Otworz Aplikacje Kliencka
    Open Browser    ${APLIKACJA KLIENCKA LOGOWANIE}   ${BROWSER}
    Maximize Browser Window

Zapomnialem Hasla
    Click button  xpath=//*[@id="root"]/div/div[1]/div/div[4]/a

Wpisz login
    [Arguments]      ${email}
    Input Text  name=email     ${email}

Wpisz pesel
    [Arguments]      ${pesel}
    Input Text  name=personalNumber     ${pesel}

Potwierdz
    Click button    xpath=//*[@id="root"]/div/div[1]/div/div[1]/div[3]/div/button

Mailhog

Wpisz haslo
    [Arguments]      ${password}
    Input Text  name=password     ${password}

Powtorz haslo
    [Arguments]      ${password2}
    Input Text  name=password     ${password2}

Strona uzytkownika
    Location Should Be  https://qa-gex.funeda.pl/dashboard/profile

*** Test Cases ***           E-MAIL             HASLO                   ADRES
