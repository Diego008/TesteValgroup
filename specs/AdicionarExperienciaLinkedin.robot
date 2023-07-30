*Settings*
Resource            ${EXECDIR}/resources/Base.robot
Resource            ${EXECDIR}/asserts/Login.robot
Resource            ${EXECDIR}/asserts/FormsAddExperiencia.robot
Suite Setup         Abrir Página Linkedin
Suite Teardown      Fechar Página
Test Teardown       Printar tela

*Variables*
${url_home}     https://www.linkedin.com/

*Test Cases*
# Dado que acessei a página de Login do Linkedin 
# E após validar e-mail, senha
# E fazer login com sucesso
Fazer Login
    Wait Until Element is Visible    id:session_key
    Page Should Contain              Ainda não faz parte do LinkedIn? Cadastre-se agora

    ${email}                         Set variable        diego@    
    ${msg_email_esperada}            Set Variable
    ...  Não foi possível encontrar uma conta do LinkedIn associada a este e-mail. Tente novamente ou crie uma conta .

    Validar Email                    ${email}            ${msg_email_esperada}

    Go To                            ${url_home}

    ${pass}                          Set Variable        user
    ${msg_senha_esperada}            Set Variable        
    ...  A senha fornecida deve ter no mínimo 6 caracteres

    Validar Senha                    ${pass}             ${msg_senha_esperada}    

    ${email}                         Set variable        diego_agt@outlook.com
    ${pass}                          Set variable        UserTest
    ${msg_login_esperada}            Set variable        Olá, Usuario de Teste!

    Validar Login     ${email}       ${pass}             ${msg_login_esperada}
    

#Quando eu acessar a página de perfil do usuário
Acessar página perfil do Usuario    
    Click Element                   xpath://a[@class="ember-view block"]/div[2]
    ${perfil_usuario_cargo}=        Get Text            
    ...     css:div[class="text-body-medium break-words"]
    
    Click Element                   css:button[aria-label="Editar introdução"]
    Wait Until Element Is Visible   css:h2[id="profile-edit-form-page-header"]
    ${titulo_pagina}=               Get Text            
    ...     css:h2[id="profile-edit-form-page-header"]
    Should Be Equal                 ${titulo_pagina}    Editar introdução
    
    ${cargo_atual}=                 Get Text            
    ...     css:option[value="Analista de teste/QA na Teste de Software"]

    Should Be Equal                 ${perfil_usuario_cargo}     ${cargo_atual}

    Click Element                   
    ...     css:a[href="https://www.linkedin.com/in/usuario-de-teste-de-software-bb1aa5285/add-edit/POSITION/?profileFormEntryPoint=PROFILE_TOP_CARD_EDIT_FORM"]

#Então devo Adicionar uma nova experiência validando o formulário corretamente
Adicionar nova experiência profissional
    Wait Until Element Is Visible   css:h2[id="profile-edit-form-page-header"]
    ${titulo_pagina}=               Get Text            
    ...     css:h2[id="profile-edit-form-page-header"]
    Should Be Equal                 ${titulo_pagina}    Adicionar experiência
    
    ${notificar_rede}=              Get Text            
    ...     css:span[class="artdeco-toggle__text"]
    
    IF   '${notificar_rede}' == 'Ativada'  
        Click Element               css:div[data-control-name="toggle_share"]
    END

    Click Element                   
    ...     css:button[class="artdeco-button artdeco-button--2 artdeco-button--primary ember-view"]
    
    #formulario - campos obrigatorios (titulo, nome da empresa, data inicio)
    Validar Campos Obrigatorios

    ${msg_esperada_cadastro}        Set Variable        Seu cargo foi adicionado
    Preencher Formulario e Cadastrar Experiencia  ${msg_esperada_cadastro}