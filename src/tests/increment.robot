*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser

*** Test Cases ***
At start the counter is zero
    Go To  ${HOME_URL}
    Click Button  Nollaa
    Title Should Be  Laskuri
    Page Should Contain  nappia painettu 0 kertaa

When button pressed twice the counter is two
    Go To  ${HOME_URL}
    Click Button  Nollaa
    Click Button  Paina
    Click Button  Paina
    Page Should Contain  nappia painettu 2 kertaa

Resetting the counter sets it back to zero
    Go To  ${HOME_URL}
    Click Button  Nollaa
    Page Should Contain  nappia painettu 0 kertaa
    Click Button  Paina
    Click Button  Paina
    Page Should Contain  nappia painettu 2 kertaa
    Click Button  Nollaa
    Page Should Contain  nappia painettu 0 kertaa

Setting the counter to 12 works
    Go To  ${HOME_URL}
    Input Text  value  12
    Click Button  Aseta
    Page Should Contain  nappia painettu 12 kertaa
    Click Button  Paina
    Page Should Contain  nappia painettu 13 kertaa
    Click Button  Nollaa
    Page Should Contain  nappia painettu 0 kertaa