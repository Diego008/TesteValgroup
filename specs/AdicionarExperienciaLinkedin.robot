*Settings*
Resource            ${EXECDIR}/resources/Base.robot
Resource            ${EXECDIR}/asserts/Login.robot
Resource            ${EXECDIR}/asserts/FormsAddExperiencia.robot
Suite Setup         Abrir Página Linkedin
Suite Teardown      Fechar Página
Test Teardown       Printar tela

*Variables*
#@{email}    diego@  diego_agt@outlook.com
${email}    diego_agt@outlook.com
${pass}     UserTest
${mensagem_login_esperada}  Olá, Usuario de Teste!

*Test Cases*
# Dado que acessei a página de Login do Linkedin 
# E fiz login com sucesso
Fazer Login
    Wait Until Element is Visible    id:session_key
    Page Should Contain              Ainda não faz parte do LinkedIn? Cadastre-se agora

    Validar Login                    ${email}  ${pass}  ${mensagem_login_esperada}

#Quando eu acessar a página de perfil do usuário
Acessar página perfil do Usuario    
    Click Element                   xpath://a[@class="ember-view block"]/div[2]
    ${perfil_usuario_cargo}=        Get Text            css:div[class="text-body-medium break-words"]
    
    Click Element                   css:button[aria-label="Editar introdução"]
    Wait Until Element Is Visible   css:h2[id="profile-edit-form-page-header"]
    ${titulo_pagina}=               Get Text            css:h2[id="profile-edit-form-page-header"]
    Should Be Equal                 ${titulo_pagina}    Editar introdução
    
    ${cargo_atual}=                 Get Text            css:option[value="Analista de teste/QA na Teste de Software"]

    Should Be Equal                 ${perfil_usuario_cargo}     ${cargo_atual}

    Click Element                   css:a[href="https://www.linkedin.com/in/usuario-de-teste-de-software-bb1aa5285/add-edit/POSITION/?profileFormEntryPoint=PROFILE_TOP_CARD_EDIT_FORM"]

#Então devo Adicionar uma nova experiência validando o formulário corretamente
Adicionar nova experiência profissional
    Wait Until Element Is Visible   css:h2[id="profile-edit-form-page-header"]
    ${titulo_pagina}=               Get Text            css:h2[id="profile-edit-form-page-header"]
    Should Be Equal                 ${titulo_pagina}    Adicionar experiência
    
    Click Element                   css:div[data-control-name="toggle_share"]
    ${notificar_rede}=              Get Text            css:span[class="artdeco-toggle__text"]
    Should Be Equal                 ${notificar_rede}   Desativada

    Click Element                   css:button[class="artdeco-button artdeco-button--2 artdeco-button--primary ember-view"]
    
    #formulario - campos obrigatorios (titulo, nome da empresa, data inicio)
    ${validacao_campo_titulo}=        Set Variable     Título é um campo obrigatório
    ${validacao_campo_nome_empresa}=  Set Variable     Nome da empresa é um campo obrigatório
    ${validacao_campo_data_inicio}=   Set Variable     As datas de início e término são obrigatórias

    Validar Campos Obrigatorios  ${validacao_campo_titulo}  ${validacao_campo_nome_empresa}  ${validacao_campo_data_inicio}

