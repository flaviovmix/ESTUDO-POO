
<%@page import="app.core.Conexao"%>
<%@page import="funcoes.icones"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");
    String campoBuscado = request.getParameter("campoBuscado") != null && !request.getParameter("campoBuscado").isEmpty()
            ? request.getParameter("campoBuscado")
            : "";

    String infoBuscada = request.getParameter("infoBuscada") != null && !request.getParameter("infoBuscada").isEmpty()
            ? request.getParameter("infoBuscada")
            : "";
%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="style.css" rel="stylesheet">     
    </head>
    <body>
        <main>

            <%@ include file="interface/navbar.html" %>

            <div class="container-xl"> 
                <h2 class="d-none d-md-block">LISTAGEM DE ALUNOS</h2>   
                <h2 class="d-block d-md-none h2-celular">LISTAGEM DE ALUNOS</h2>   
                <div class="row">
                    <div class="col-2 d-block d-md-none">
                    </div>
                    <div class="col-8 d-block d-md-none">
                        <a class="btn btn-success link-botao botaonovo-small" href="FormCadastroAluno.html">Novo Aluno</a>     
                    </div>
                    <div class="col-2 d-block d-md-none">
                    </div>
                </div>
                <div class="row">

                    <div class="col-3 d-none d-md-table-cell">
                        <a class="btn btn-success link-botao" href="FormCadastroAluno.html">Novo Aluno</a>     
                    </div>

                    <form  class="col-md-7" method="post" action="listarAluno.jsp">
                        <div>
                            <div class="input-group mb-2">
                                <select id="inputState" name="campoBuscado">
                                    <option <%if (campoBuscado.equals("Nome")) {
                                            out.print("selected");
                                        }%>>Nome
                                    </option>

                                    <option <%if (campoBuscado.equals("Codigo")) {
                                            out.print("selected");
                                        }%>>Codigo
                                    </option>

                                    <option <%if (campoBuscado.equals("Conjuge")) {
                                            out.print("selected");
                                        }%>>Conjuge
                                    </option>

                                    <option <%if (campoBuscado.equals("CPF")) {
                                            out.print("selected");
                                        }%>>CPF
                                    </option>

                                    <option <%if (campoBuscado.equals("Telefone")) {
                                            out.print("selected");
                                        }%>>Telefone
                                    </option>

                                    <option <%if (campoBuscado.equals("Email")) {
                                            out.print("selected");
                                        }%>>Email
                                    </option>
                                </select>
                                <input type="text" class="form-control" id="infoBuscada" name="infoBuscada" value="" placeholder="faça sua busca aqui, vazio para todos">
                            </div>
                        </div>
                    </form>

                </div>


                <table class="table">

                    <thead>
                        <tr>

                            <th scope="col" style="width: 3%;">#</th>
                            <th scope="col" style="width: 30%;">Nome</th>
                            <th scope="col" style="width: 15%;" class="d-none d-md-table-cell">CPF</th>
                            <th scope="col" style="width: 20%;" class="d-none d-lg-table-cell">email</th>
                            <th scope="col" style="width: 15%;" class="d-none d-md-table-cell">Telefone</th>
                            <th scope="col" style="width: 10%;" class="text-center">Editar</th>
                            <th scope="col" style="width: 5%;" class="text-center">Deletar</th>
                        </tr>
                    </thead>

                    <tbody class="table-group-divider">

                        <%
                            try (Connection conecta = DriverManager.getConnection(
                                    "jdbc:postgresql://localhost:5432/banco", "postgres", "masterkey")) {

                                // Declarando o PreparedStatement fora para escopo amplo
                                PreparedStatement comando;

                                if (infoBuscada.isEmpty()) {
                                    // Busca todos os registros
                                    comando = conecta.prepareStatement("SELECT * FROM aluno ORDER BY nome");
                                } else {
                                    if (campoBuscado.equalsIgnoreCase("Codigo")) {
                                        // Busca por código (usa placeholders para evitar SQL Injection)
                                        comando = conecta.prepareStatement("SELECT * FROM aluno WHERE codigo = ?");
                                        comando.setInt(1, Integer.parseInt(infoBuscada)); // Convertendo para inteiro
                                    } else {
                                        // Busca genérica com LIKE e LOWER
                                        comando = conecta.prepareStatement(
                                                "SELECT * FROM aluno WHERE LOWER(" + campoBuscado + ") LIKE ? ORDER BY " + campoBuscado);
                                        comando.setString(1, "%" + infoBuscada.toLowerCase() + "%");
                                    }
                                }

                                // Executa a consulta e processa o resultado
                                try (ResultSet resultado = comando.executeQuery()) {
                                    while (resultado.next()) {
                                        out.print("<tr class='py-0'>");

                                        out.print("<th scope='row'>");
                                        out.print(resultado.getString("codigo"));
                                        out.print("</th>");

                                        out.print("<td>");
                                        out.print(resultado.getString("nome"));
                                        out.print("</td>");

                                        out.print("<td class='d-none d-md-table-cell'>");
                                        out.print(resultado.getString("cpf"));
                                        out.print("</td>");

                                        out.print("<td class='d-none d-lg-table-cell'>");
                                        out.print(resultado.getString("email"));
                                        out.print("</td>");

                                        out.print("<td class='d-none d-md-table-cell'>");
                                        out.print(resultado.getString("telefone"));
                                        out.print("</td>");

                                        StringBuilder tdCompletaAlterar = new StringBuilder();
                                        tdCompletaAlterar
                                                .append("<td class='text-center'>")
                                                .append("<a class='btn py-0' href=")
                                                .append("http://localhost:8081/ESTUDO-POO/FormEditarAluno.jsp")
                                                .append("?codigo=" + resultado.getString("codigo"))
                                                .append(">")
                                                .append(icones.editar())
                                                .append("</a>")
                                                .append("</td>");
                                        out.print(tdCompletaAlterar);

                                        StringBuilder tdCompletaDeletar = new StringBuilder();
                                        tdCompletaDeletar
                                                .append("<td class='text-center'>")
                                                .append("<button ")
                                                .append("class='btn py-0'")
                                                .append("onclick=\"abrirModalExcluir('")
                                                .append(resultado.getString("codigo")).append("', '")
                                                .append(resultado.getString("nome")).append("', '")
                                                .append(resultado.getString("email")).append("', '")
                                                .append(resultado.getString("conjuge")).append("', '")
                                                .append(resultado.getString("data_nascimento")).append("', '")
                                                .append(resultado.getString("cpf")).append("')\">")
                                                .append(icones.deletar())
                                                .append("</button>")
                                                .append("</td>");
                                        out.print(tdCompletaDeletar);

                                        out.print("</tr>");

                                    }
                                } // ResultSet será fechado automaticamente aqui

                            } catch (NumberFormatException e) {
                                // Tratamento específico para erros de conversão em 'codigo'
                                out.print("Erro: O campo 'codigo' deve ser um número válido.");
                            } catch (Exception e) {
                                // Tratamento genérico de exceções
                                out.print("Erro: " + e.getMessage());
                            }
                        %>

                    </tbody>

                </table>


                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                    Launch static backdrop modal
                </button>

                <%
                    
                    Conexao db = new Conexao();
                    
                    String codigo = request.getParameter("codigo");

                    try {

                        PreparedStatement comando = db.getConn().prepareStatement("DELETE FROM cliente WHERE codigo = ?");
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

                <!-- Modal -->
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title fs-5" id="staticBackdropLabel">Tem certeza que deseja excluir o registro?</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                
                                <p><strong>Nome completo:</strong> <span id="modalNome"></span></p>
                                <p><strong>CPF:</strong> <span id="modalCpf"></span></p>
                                <p><strong>Conjuge:</strong> <span id="modalConjuge"></span></p>
                                <p><strong>Email:</strong> <span id="modalEmail"></span></p>
                                <p><strong>Data Nascimento:</strong> <span id="modalData_nascimento"></span></p>
                                
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
            </div>
        </main>
        <script src="assets/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        document.getElementById("infoBuscada").focus();
                    });
        </script>

        <script>
            function abrirModalExcluir(codigo, nome, email, conjuge, data_nascimento, cpf) {
                // Atualiza os elementos do modal com as informações do registro
                document.getElementById("modalCodigo").value = codigo; // Campo oculto para o código
                document.getElementById("modalNome").innerText = nome;
                document.getElementById("modalEmail").innerText = email;
                document.getElementById("modalConjuge").innerText = conjuge;
                document.getElementById("modalData_nascimento").innerText = data_nascimento;
                document.getElementById("modalCpf").innerText = cpf;

                // Exibe o modal
                let modalExcluir = new bootstrap.Modal(document.getElementById("staticBackdrop"));
                modalExcluir.show();
            }
        </script>     

        <script>
            function excluirRegistro() {
                const codigo = document.getElementById("modalCodigo").value;

                // Redireciona para a página de exclusão com o código
                window.location.href = `excluirAluno.jsp?codigo=${codigo}`;
            }
        </script>        
    </body>
</html>
