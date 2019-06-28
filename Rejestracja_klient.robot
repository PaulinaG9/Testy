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

    Wait Until Element Is Visible  name=email
    Email   ${Email}
    Pesel   ${Pesel}
    Haslo   ${Haslo}
    Powtorz haslo   ${Powtorz haslo}
    Zgoda
    Zarejestruj
    Wait Until Element Is Visible  name=first_name

    Imie  ${Imie}
    Nazwisko  ${Nazwisko}
    Numer dowodu  ${Numer dowodu}
    Stan cywilny  ${Stan cywilny}
    Ilosc osob na utrzymaniu  ${Ilosc osob na utrzymaniu}
    Numer telefonu  ${Numer telefonu}
    DalejPersonalData

    Wait Until Element Is Visible  name=street
    Ulica  ${Ulica}
    Numer budynku  ${Numer budynku}
    Numer lokalu  ${Numer lokalu}
    Miasto  ${Miasto}
    Kod pocztowy  ${Kod pocztowy}
    DalejAdress

    Wait Until Element Is Visible  name=employment_type
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

    Wait Until Element Is Visible  name=monthly_regular_expenses
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
    Wait Until Page Contains  Nastąpiło wylogowanie z aplikacji.
    #Close Browser


*** Test Cases ***            E-MAIL                      PESEL        HASLO       HASLO       IMIE    NAZWISKO  NR.DOWODU   STAN.CYWILNY  ILOSC.OS  NR.TEL      ULICA       NR.BUD  NR.MIESZ    MIASTO      KOD.P    TYP.ZATRUDNIENIA  MIES.WYD  DOD.WYD
Poprawne dane UoP_okr         polytestuj+10@gmail.com     37012725821  Testuję789  Testuję789  Poly10  Testuj10  GPD628291   1             1         609857889   Testowa     1       1           Wrocek      11-111   1                 2100      500
Poprawne dane Projekt         polytestuj+11@gmail.com     66101353267  Testuję789  Testuję789  Poly11  Testuj11  KJP810690   2             2         765434567   Testowa     2       2           Kraków      22-222   2                 5000      800
Poprawne dane Samozatr        polytestuj+12@gmail.com     46112639079  Testuję789  Testuję789  Poly12  Testuj12  ASW188603   2             1         758362436   Testowa     3       3           Warszawa    33-333   3                 5000      800
Poprawne dane Renta           polytestuj+13@gmail.com     95040321565  Testuję789  Testuję789  Poly13  Testuj13  JWF706407   2             3         986243749   Testowa     4       4           Bytom       44-444   4                 5000      800
Poprawne dane Student         polytestuj+14@gmail.com     03102394394  Testuję789  Testuję789  Poly14  Testuj14  WUL587436   2             4         564839275   Testowa     5       5           Ustroń      55-555   5                 5000      800
Poprawne dane Farmer          polytestuj+15@gmail.com     58030798169  Testuję789  Testuję789  Poly15  Testuj15  WEV997349   2             1         457840373   Testowa     6       6           Toruń       66-666   6                 5000      800
Poprawne dane Gospodyni       polytestuj+16@gmail.com     08071598460  Testuję789  Testuję789  Poly16  Testuj16  VNU617370   2             1         794733994   Testowa     7       7           Opole       77-777   7                 5000      800
Poprawne dane Bezrob          polytestuj+17@gmail.com     84052536799  Testuję789  Testuję789  Poly17  Testuj17  CAA636090   2             2         645393444   Testowa     8       8           Poznań      88-888   8                 5000      800
Poprawne dane Inne            polytestuj+18@gmail.com     85080476437  Testuję789  Testuję789  Poly18  Testuj18  AHM952728   2             3         736383888   Testowa     9       9           Grynia      99-999   9                 5000      800
#SAS failed                    polytestuj+119@gmail.com     13060623977  Testuję789  Testuję789  Poly19  Testuj19  JLV022850   2             1         463829266   Testowa     10      10          Sopot       10-1010  10                5000      800
#SAS accepted1                 polytestuj+219@gmail.com     37083059531  Testuję789  Testuję789  Poly19  Testuj19  ICK155151   2             1         463829266   Testowa     10      10          Sopot       10-1010  10                5000      800
#SAS accepted2                 polytestuj+319@gmail.com     53012307782  Testuję789  Testuję789  Poly19  Testuj19  KIN898651   2             1         463829266   Testowa     10      10          Sopot       10-1010  10                5000      800
#SAS accepted3                  polytestuj+419@gmail.com     90073048173  Testuję789  Testuję789  Poly19  Testuj19  BVO706887   2             1         463829266   Testowa     10      10          Sopot       10-1010  10                5000      800
#Awaiting manual verification  polytestuj+519@gmail.com     37012725821  Testuję789  Testuję789  Poly10  Testuj10  GPD628291   1             1         609857889   Testowa     1       1           Wrocek      11-111   1                 2100      500