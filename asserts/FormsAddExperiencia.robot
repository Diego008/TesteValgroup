*Keywords*
Validar Campos Obrigatorios    
    [Arguments]     ${titulo}   ${nome_empresa}  ${data_inicio}
    
    ${form_titulo}=             Get Text         xpath://div[@id="single-typeahead-entity-form-component-profileEditFormElement-POSITION-profilePosition-ACoAAEVlGnUBHG3-Q3v3ZerYRu1K7HnsuOs2zPA-1-title-error"]/div/span
    ${form_nome_empresa}=       Get Text         xpath://div[@id="single-typeahead-entity-form-component-profileEditFormElement-POSITION-profilePosition-ACoAAEVlGnUBHG3-Q3v3ZerYRu1K7HnsuOs2zPA-1-requiredCompany-error"]/div/span
    ${form_data_inicio}=        Get Text         xpath://div[@id="date-range-form-component-profileEditFormElement-POSITION-profilePosition-ACoAAEVlGnUBHG3-Q3v3ZerYRu1K7HnsuOs2zPA-1-dateRange-error"]/div/span

    Should Be Equal              ${titulo}                 ${form_titulo}
    Should Be Equal              ${nome_empresa}           ${form_nome_empresa}
    Should Be Equal              ${data_inicio}            ${form_data_inicio}