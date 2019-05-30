*** Keywords ***

#Rejestracja1
Bledny mail
    [Arguments]     ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div[1]/div[2]/div[1]/div/div[2]   ${Tekst}
Bledny pesel
    [Arguments]     ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div[1]/div[2]/div[2]/div/div[2]    ${Tekst}
Bledne haslo
    [Arguments]     ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div[1]/div[2]/div[3]/div/div[2]    ${Tekst}
Bledne haslo2
    [Arguments]     ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div[1]/div[2]/div[4]/div/div[2]    ${Tekst}
Brak zgody
    [Arguments]     ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div[1]/div[2]/div[5]/div[2]    ${Tekst}

#Personal data
Brak danych dane
    [Arguments]     ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[1]/label/div[2]   ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[2]/label/div[2]   ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[3]/label/div[2]   ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[4]/label/div   ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[5]/label/div[2]   ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[6]/div/label/div[2]   ${Tekst}
Blad nr.dowodu
    [Arguments]     ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[3]/label/div[2]   ${Tekst}
Blad nr.tel
    [Arguments]     ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[6]/div/label/div[2]   ${Tekst}

#Adres
Brak danych adres
    [Arguments]     ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[1]/label/div[2]   ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[2]/label/div[2]   ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[4]/label/div[2]  ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[5]/div/label/div[2]  ${Tekst}
Blad kod.pocztowy
    [Arguments]     ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[5]/div/label/div[2]   ${Tekst}

#Zatrudnienie
Brak danych zatrudnienie
    [Arguments]     ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[1]/label/div  ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[2]/label/div[2]   ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[3]/label/div  ${Tekst}

#Wydatki
Brak danych wydatki
    [Arguments]     ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[1]/label/div[2]  ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[2]/label/div[2]  ${Tekst}

Brak zgod
    [Arguments]     ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[4]/div/div[2]  ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[5]/div/div[2]  ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[6]/div/div[2]  ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[7]/div/div[2]  ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[8]/div/div[2]  ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[9]/div/div[2]  ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[10]/div/div[2]  ${Tekst}
    Element Text Should Be  xpath=//*[@id="root"]/div/div[2]/div/div[2]/div[11]/div/div[2]  ${Tekst}