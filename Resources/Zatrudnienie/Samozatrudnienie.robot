*** Settings ***
Documentation   Rejestracja_Student
Library     SeleniumLibrary
Resource    Resources/Keywords.robot

*** Test Cases ***

Samozatrudnienie
    Typ zatrudnienia  3
    NIP
    Miesieczny przychod
    Sposob wplat