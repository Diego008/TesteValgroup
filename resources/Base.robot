*Settings*
Library         SeleniumLibrary

*Variables*
${URL}                          https://www.linkedin.com      
${BROWSER_CHROME}               chrome

*Keywords*
Abrir Página Linkedin
    Open Browser                ${URL}  ${BROWSER_CHROME}
    Maximize Browser Window

Printar tela
    Capture Page Screenshot

Fechar Página
    Close Browser