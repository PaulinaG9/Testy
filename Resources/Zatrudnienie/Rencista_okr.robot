*** Settings ***
Documentation   Rejestracja_Student
Library     SeleniumLibrary
Resource    Resources/Keywords.robot

*** Test Cases ***

Employment details
    Typ zatrudnienia  4
    Renta do mies
    Renta do rok
    Miesieczny przychod
    Sposob wplat
    Dalej3
