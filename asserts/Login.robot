*Keywords*
Validar Email 
    [Arguments]          ${email}       ${msg_esperada}

    Input text           id:session_key                     ${email}
    Input text           id:session_password                UserTest

    Click Element        css:button[data-id="sign-in-form__submit-btn"]

    ${msg_erro}          Get Text                           id:error-for-username
    Should Be Equal      ${msg_erro}                        ${msg_esperada} 

Validar Senha 
    [Arguments]          ${pass}       ${msg_esperada}

    Input text           id:session_key                     diego_agt@outlook.com
    Input text           id:session_password                ${pass}

    Click Element        css:button[data-id="sign-in-form__submit-btn"]

    ${msg_erro}          Get Text                           css:p[for="session_password"]
    Should Be Equal      ${msg_erro}                        ${msg_esperada}   

Validar Login
    [Arguments]          ${email}                           ${pass}     ${mensagem_login}    
    
    Input text           id:session_key                     ${email}
    Input text           id:session_password                ${pass}

    Click Element        css:button[data-id="sign-in-form__submit-btn"]

    Wait Until Element is Visible   xpath://a[@class="ember-view block"]/div[2]     20s            
    ${login_in}=         Get Text                           
    ...     xpath://a[@class="ember-view block"]/div[2]
    Should Be Equal      ${mensagem_login}                  ${login_in}
