$('.select2').select2();

//$('#cod-postal').addEventListener('focusout', searchCep);

let campos = ["nome", "sobrenome",
    "genero", "data-nascimento",
    "nacionalidade", "tipo-doc1", "doc1",
    "nome-pais", "cod-postal", "nome-logrd",
    "nome-num", "nome-comple", "bairro",
    "municipio", "estado", "tele", "email"];

let form = $("#form-meus-dados");

$("#salvar").click(function () {

    if (tratar_campos(campos)) {
        
         title = 'Enviando, aguarde alguns segundos...';
         swalAlertLoading(title, callback);
        
        $.post("/app-civa/gestorOms", form.serialize(), (data, status, jqXHR) => {
            console.log("Data: " + data.responseData + ", Status: " + status + ", jqXHR: " + jqXHR);
            if (status === 'success') {
                title = 'Gestor OMS cadastrado com sucesso!';
                text = "Cadastro realizada.";
                swalAlertSuccess(title, text, () => { window.location = './cadastrar-gestor-oms.jsp' });

            }
        }).fail(function (jqxhr, settings, ex) {
            title = 'Erro!';
            text = `Algum erro ocorreu e seus dados n&atilde;o foram enviados. Status: ${settings} ${ex}`;
            swalAlertError(title, text, callback);
        });
    } else {
        title = 'Campos não preenchidos!';
        text = 'Todos os campos precisam ser preenchidos!';
        swalAlertError(title, text, callback);
    }
});

pegarPaises("nacionalidade");