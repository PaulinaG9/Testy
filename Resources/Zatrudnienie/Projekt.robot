*** Settings ***
Documentation   Rejestracja_Student
Library     SeleniumLibrary
Resource    Resources/Keywords.robot

*** Test Cases ***

Employment details
    Typ zatrudnienia  2
    Poczatek zatrudnienia mies
    Poczatek zatrudnienia rok
    Koniec zatrudnienia mies
    Koniec zatrudnienia rok
    Pracodawca
    Stanowisko
    Numer telefonu pracodawcy
    Ulica pracodawcy
    Numer budynku pracodawcy
    Miasto pracodawcy
    Kod pocztowy pracodawcy
    Miesieczny przychod  1500
    Sposob wplat  2
