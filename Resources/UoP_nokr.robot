*** Settings ***
Documentation   Rejestracja
Library     SeleniumLibrary
Resource    Resources/Keywords.robot

*** Keywords ***

UoP_nokr
    Typ zatrudnienia  1
    Poczatek zatrudnienia mies  2
    Poczatek zatrudnienia rok  3
    Umowa na czas nieokreslony
    Pracodawca  Test
    Stanowisko  XCV
    Numer telefonu pracodawcy  987667887
    Ulica pracodawcy  Ulica
    Numer budynku pracodawcy  3
    Miasto pracodawcy  Miasto
    Kod pocztowy pracodawcy  33777
    Miesieczny przychod  1500
    Sposob wplat  2

