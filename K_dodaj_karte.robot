*** Settings ***
Documentation   Dodaj_karte
Library     SeleniumLibrary
Resource    Resources/Keywords.robot
Resource    Resources/Keywords_rejestracja.robot
Suite Setup     Logowanie klient  ${POPRAWNY LOGIN}  ${POPRAWNE HASLO}
#Suite Teardown  Close Browser
Test Template   Dodaj karte

*** Variables ***
${BROWSER}                         Chrome
${APLIKACJA KLIENCKA LOGOWANIE}    https://qa-gex.funeda.pl/account/login
${STRONA UZYTKOWNIKA}              https://qa-gex.funeda.pl/dashboard/profile
${POPRAWNY LOGIN}                  polytestuj+419@gmail.com
${POPRAWNE HASLO}                  Testuję789

*** Keywords ***

Dodaj karte
    [Arguments]      ${Imie}  ${Nazwisko}  ${email}  ${Miesiac}  ${Rok}  ${CVC}
    Sleep  5s
    Click Element  xpath=//*[@id="root"]/div/div[2]/div/div[1]/div[1]/a
    Input Text  id=id_dp-firstname  ${Imie}
    Input Text  id=id_dp-lastname  ${Nazwisko}
    Input Text  id=id_dp-email  ${email}
    Get Text  xpath=//*[@id="test-credit-cards"]/table/tbody/tr[1]/td[2]
    #Press Keys  xpath=//*[@id="test-credit-cards"]/table/tbody/tr[1]/td[2]  CTRL+C
    Press Keys   id=id_dp-number  CTRL+v
    Input Text  id=id_dp-expiry_month  ${Miesiac}
    Input Text  id=id_dp-expiry_year  ${Rok}
    Input Text  id=id_dp-cvc  ${CVC}
    Click Element  id=payment-form-submit-dp
    Sleep  7s
    Page Should Contain Element  xpath=//*[@id="operation-status"]/strong
    Click Element  xpath=//*[@id="thank-you-page-section"]/form/div/input
    #Wyloguj klienta


*** Test Cases ***              IMIE    NAZWISKO      EMAIL                     MIESIAC     ROK     CVC
Dodawanie karty                 Poly    Testuj        polytestuj@gmail.com      11          19      111