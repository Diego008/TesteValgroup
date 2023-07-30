*Keywords*
Validar Campos Obrigatorios    
    ${msg_esperada_titulo}        Set Variable     Título é um campo obrigatório
    ${msg_esperada_nome_empresa}  Set Variable     Nome da empresa é um campo obrigatório
    ${msg_esperada_data_inicio}   Set Variable     As datas de início e término são obrigatórias
    
    ${form_titulo}=               Get Text         
    ...  xpath://div[@id="single-typeahead-entity-form-component-profileEditFormElement-POSITION-profilePosition-ACoAAEVlGnUBHG3-Q3v3ZerYRu1K7HnsuOs2zPA-1-title-error"]/div/span
    ${form_nome_empresa}=         Get Text         
    ...  xpath://div[@id="single-typeahead-entity-form-component-profileEditFormElement-POSITION-profilePosition-ACoAAEVlGnUBHG3-Q3v3ZerYRu1K7HnsuOs2zPA-1-requiredCompany-error"]/div/span
    ${form_data_inicio}=          Get Text
    ...  xpath://div[@id="date-range-form-component-profileEditFormElement-POSITION-profilePosition-ACoAAEVlGnUBHG3-Q3v3ZerYRu1K7HnsuOs2zPA-1-dateRange-error"]/div/span

    Should Be Equal             ${msg_esperada_titulo}                 ${form_titulo}
    Should Be Equal             ${msg_esperada_nome_empresa}           ${form_nome_empresa}
    Should Be Equal             ${msg_esperada_data_inicio}            ${form_data_inicio}

Preencher Formulario e Cadastrar Experiencia
    [Arguments]                 ${msg_esperada}

    ${form_titulo}              Set Variable              Analista de QA
    ${form_nome_empresa}        Set Variable              TESTE
    ${form_data_inicio_mes}     Evaluate                  random.randint(1, 12)
    ${form_data_inicio_ano}     Evaluate                  random.randint(2020, 2023)

    Input Text                   
    ...  css:input[id="single-typeahead-entity-form-component-profileEditFormElement-POSITION-profilePosition-ACoAAEVlGnUBHG3-Q3v3ZerYRu1K7HnsuOs2zPA-1-title"]
    ...  ${form_titulo}  

    Input Text
    ...  css:input[id="single-typeahead-entity-form-component-profileEditFormElement-POSITION-profilePosition-ACoAAEVlGnUBHG3-Q3v3ZerYRu1K7HnsuOs2zPA-1-requiredCompany"]
    ...  ${form_nome_empresa}

    Select From List By Value  
    ...  css:select[id="date-range-form-component-profileEditFormElement-POSITION-profilePosition-ACoAAEVlGnUBHG3-Q3v3ZerYRu1K7HnsuOs2zPA-1-dateRange-start-date"]
    ...  ${form_data_inicio_mes}

    Select From List By Value
    ...  css:select[id="date-range-form-component-profileEditFormElement-POSITION-profilePosition-ACoAAEVlGnUBHG3-Q3v3ZerYRu1K7HnsuOs2zPA-1-dateRange-start-date-year-select"]
    ...  ${form_data_inicio_ano}

    Click Element
    ...  css:button[class="artdeco-button artdeco-button--2 artdeco-button--primary ember-view"]

    Wait Until Element is Visible   
    ...  xpath://div[@class="pe-next-action-page__content-header"]/span
    ${msg_cadastro_esperada}    Get Text
    ...  xpath://div[@class="pe-next-action-page__content-header"]/span

    Should Be Equal             ${msg_cadastro_esperada}    ${msg_esperada}