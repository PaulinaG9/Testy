*** Settings ***
Documentation   Rejestracja
Library     SeleniumLibrary
Resource    Resources/Keywords.robot
Resource    Resources/Zatrudnienie.robot

*** Test Cases ***

Kalkulator
    Aplikacja kliencka
    Maximize Browser Window
    Wyslij
    Sleep  3s

Rejestracja 1
    Email   polytestuj+333@gmail.com
    Pesel   19071243281
    Haslo   Testuję789
    Powtorz haslo   Testuję789
    Zgoda
    Zarejestruj
    sleep  5s

Dane klienta
    Imie  Poly333
    Nazwisko  Testuj333
    Numer dowodu  AVE412293
    Stan cywilny  1
    Ilosc osob na utrzymaniu  1
    Numer telefonu  609857889
    DalejPersonalData

Adres
    Ulica  Testowa
    Numer budynku  333
    Numer lokalu  1
    Miasto  Test
    Kod pocztowy  33-333
    DalejAdress

Zatrudnienie
    UoP_okr
    DalejZatrudnienie

Wydatki
    Miesieczne wydatki  2300
    Dodatkowe wydatki  300
    Zgoda1
    Zgoda2
    Zgoda3
    Zgoda4
    Zgoda5
    Zgoda6
    Zgoda7
    Zgoda8
    Wyslij wniosek

Intrastat
    INGBank
    INGLogin  fake42!

