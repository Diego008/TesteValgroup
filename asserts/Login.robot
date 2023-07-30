*Keywords*
Validar Login
    [Arguments]          ${email}                           ${pass}     ${mensagem_login}    
    
    Input text           id:session_key                     ${email}
    Input text           id:session_password                ${pass}

    Click Element        css:button[data-id="sign-in-form__submit-btn"]

    Wait Until Element is Visible   xpath://a[@class="ember-view block"]/div[2]     20s            
    ${login_in}=         Get Text                           xpath://a[@class="ember-view block"]/div[2]
    Should Be Equal      ${mensagem_login}                  ${login_in}
