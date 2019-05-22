*** Settings ***
Documentation   Rejestracja_Student
Library     SeleniumLibrary
Resource    Resources/Keywords.robot

*** Test Cases ***

Employment details
    Typ zatrudnienia  8
    Miesieczny przychod
    Sposob wplat
    Dalej3