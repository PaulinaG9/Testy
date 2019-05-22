*** Settings ***
Documentation   Rejestracja_Student
Library     SeleniumLibrary
Resource    Resources/Keywords.robot

*** Test Cases ***

Employment details
    Typ zatrudnienia  6
    Miesieczny przychod
    Sposob wplat
    Dalej3