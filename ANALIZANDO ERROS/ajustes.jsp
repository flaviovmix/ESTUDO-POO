Para que o modal exclua o registro selecionado, você precisa ajustar a 
lógica do modal para que ele interaja com o item selecionado. Vou te explicar como fazer isso passo a passo:

1. Adicione um evento para abrir o modal com os dados do registro
Você precisa capturar os dados do registro ao clicar no botão de exclusão e preenchê-los dinamicamente no modal.

Alterações no botão "Deletar" dentro da tabela:
Modifique o botão de deletar para chamar uma função JavaScript que passará as informações do registro para o modal.

-------------------------------------------------------
StringBuilder tdCompletaDeletar = new StringBuilder();
tdCompletaDeletar
    .append("<td class='text-center'>")
    .append("<button ")
    .append("class='btn btn-danger' ")
    .append("onclick=\"abrirModalExcluir('")
    .append(resultado.getString("codigo")).append("', '")
    .append(resultado.getString("nome")).append("', '")
    .append(resultado.getString("cpf")).append("')\">")
    .append(icones.deletar())
    .append("</button>")
    .append("</td>");
out.print(tdCompletaDeletar);
-------------------------------------------------------
Aqui, a função abrirModalExcluir será chamada com o código, nome e CPF do registro.



2. Crie a função JavaScript para preencher o modal
Adicione o seguinte script na sua página:
-------------------------------------------------------
<script>
    function abrirModalExcluir(codigo, nome, cpf) {
        // Atualiza os elementos do modal com as informações do registro
        document.getElementById("modalCodigo").value = codigo; // Campo oculto para o código
        document.getElementById("modalNome").innerText = nome;
        document.getElementById("modalCpf").innerText = cpf;

        // Exibe o modal
        let modalExcluir = new bootstrap.Modal(document.getElementById("staticBackdrop"));
        modalExcluir.show();
    }
</script>
-------------------------------------------------------


3. Ajuste o HTML do modal
Inclua campos dinâmicos para exibir os dados do registro e um campo oculto 
para o codigo, que será enviado ao back-end para exclusão.
-------------------------------------------------------
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title fs-5" id="staticBackdropLabel">Tem certeza que deseja excluir o registro?</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p><span>Nome completo:</span> <strong id="modalNome"></strong></p>
                <p><span>CPF:</span> <strong id="modalCpf"></strong></p>
                <!-- Campo oculto para o código -->
                <input type="hidden" id="modalCodigo" name="codigo">
            </div>
            <div class="modal-footer">  
                <button type="button" class="btn btn-danger col-5" onclick="excluirRegistro()">Excluir</button>
                <button type="button" class="btn btn-primary col-5" data-bs-dismiss="modal">Cancelar</button>
            </div>
        </div>
    </div>
</div>

-------------------------------------------------------



4. Crie a função excluirRegistro no JavaScript
Essa função enviará o código do registro para uma página JSP 
(como excluirAluno.jsp) para processar a exclusão.
-------------------------------------------------------
<script>
    function excluirRegistro() {
        const codigo = document.getElementById("modalCodigo").value;

        // Redireciona para a página de exclusão com o código
        window.location.href = `excluirAluno.jsp?codigo=${codigo}`;
    }
</script>

-------------------------------------------------------



5. Implemente a lógica em excluirAluno.jsp
No arquivo excluirAluno.jsp, você deve capturar o parâmetro 
codigo e executar a exclusão no banco de dados:
-------------------------------------------------------
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String codigo = request.getParameter("codigo");

    try (Connection conecta = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/regis", "postgres", "masterkey")) {

        PreparedStatement comando = conecta.prepareStatement("DELETE FROM cliente WHERE codigo = ?");
        comando.setInt(1, Integer.parseInt(codigo));

        int linhasAfetadas = comando.executeUpdate();
        if (linhasAfetadas > 0) {
            response.sendRedirect("listarAluno.jsp?mensagem=Registro excluído com sucesso");
        } else {
            response.sendRedirect("listarAluno.jsp?mensagem=Erro ao excluir o registro");
        }

    } catch (Exception e) {
        out.print("Erro: " + e.getMessage());
    }
%>

-------------------------------------------------------
Resultado
Agora, ao clicar no botão de deletar, o modal será aberto com os dados 
do registro. Se o usuário confirmar, o registro será excluído e a página será atualizada.