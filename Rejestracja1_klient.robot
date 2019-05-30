*** Settings ***
Documentation   Rejestracja_klient
Library     SeleniumLibrary
Resource    Resources/Bledy.robot
Resource    Resources/Keywords_rejestracja.robot
Suite Setup     Otworz Aplikacje Kliencka Wyslij
Suite Teardown  Close Browser
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
    [Arguments]      ${Email}   ${Pesel}    ${Haslo}    ${Powtorz haslo}    ${Zgoda}   ${B.Mail}   ${B.Pesel}   ${B.Haslo}   ${B.Haslo2}   ${B.Zgody}   ${Tekst}

    Email   ${Email}
    Pesel   ${Pesel}
    Haslo   ${Haslo}
    Powtorz haslo   ${Powtorz haslo}
    Run Keyword If  ${Zgoda}==1  Zgoda
    Zarejestruj

    Run Keyword if  ${B.Mail}==1  Bledny mail  ${Tekst}
    Run Keyword if  ${B.Pesel}==1  Bledny pesel  ${Tekst}
    Run Keyword if  ${B.Haslo}==1  Bledne haslo  ${Tekst}
    Run Keyword if  ${B.Haslo2}==1  Bledne haslo2  ${Tekst}
    Run Keyword if  ${B.Zgody}==1  Brak zgody  ${Tekst}

    Reload Page


*** Test Cases ***            E-MAIL                      PESEL        HASLO       HASLO        ZGODA    B.MAIL    B.PESEL    B.HASLO    B.HASLO2    B.ZGODY      TEKST
Niepoprawny mail              polytestuj+40gmail.com      19071243281  Testuję789  Testuję789   1        1         0          0          0           0            Wpisz poprawny adres e-mail.
Niepoprawny pesel             polytestuj+41@gmail.com     661a0133267  Testuję789  Testuję789   1        0         1          0          0           0            Numer PESEL powinnien składac się z 11 cyfr.
Niepoprawne haslo             polytestuj+42@gmail.com     46112639079  Test789     Test789      1        0         0          1          0           0            To pole musi mieć co najmiej 8 znaków.
Niepoprawne drugie haslo      polytestuj+44@gmail.com     03102394394  Testuję789  Testuję987   1        0         0          0          1           0            Hasła się nie zgadzają.
Brak zgody                    polytestuj+45@gmail.com     58030798169  Testuję789  Testuję789   0        0         0          0          0           1            Musisz zatwierdzić zgode na przetwarzanie adresu e-mail.
Pusty mail                    ${EMPTY}                    08071598460  Testuję789  Testuję789   1        1         0          0          0           0            To pole jest wymagane.
Pusty pesel                   polytestuj+47@gmail.com     ${EMPTY}     Testuję789  Testuję789   1        0         1          0          0           0            To pole jest wymagane.
Puste haslo                   polytestuj+48@gmail.com     85080476437  ${EMPTY}    Testuję789   1        0         0          1          0           0            To pole jest wymagane.
