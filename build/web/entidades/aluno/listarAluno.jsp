
<%@page import="java.util.List"%>
<%@page import="Aluno.AlunoBean"%>
<%@page import="Aluno.AlunoDAO"%>
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

        <link href="../../assets/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="../../assets/css/style.css" rel="stylesheet">     
    </head>
    <body>
        <main>

            <%@ include file="../../interface/navbar.html" %>

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
                            try {
                                    AlunoDAO alunoDAO = new AlunoDAO(); 
                                    String busca;
                                    if (infoBuscada == "") {
                                        busca = "SELECT * FROM aluno ORDER BY nome";
                                    } else {
                                        if (campoBuscado.equals("Codigo")) {
                                            busca = ("select * from aluno WHERE codigo = " + infoBuscada);
                                        } else {
                                            busca = ("select * from aluno WHERE LOWER(" + campoBuscado + ") LIKE ('%" + infoBuscada + "%') order by " + campoBuscado);
                                        }
                                    }
                                    
                                    List<AlunoBean> alunos = alunoDAO.listarAlunos(busca);

                                for (AlunoBean aluno : alunos) {
                                    out.print("<tr>");

                                    out.print("<th scope='row'>");
                                    out.print(aluno.getCodigo());
                                    out.print("</th>");

                                    out.print("<td>");
                                    out.print(aluno.getNome());
                                    out.print("</td>");

                                    out.print("<td class='d-none d-md-table-cell'>");
                                    out.print(aluno.getCpf());
                                    out.print("</td>");

                                    out.print("<td class='d-none d-lg-table-cell'>");
                                    out.print(aluno.getEmail());
                                    out.print("</td>");

                                    out.print("<td class='d-none d-md-table-cell'>");
                                    out.print(aluno.getTelefone());
                                    out.print("</td>");

                                    StringBuilder tdCompletaAlterar = new StringBuilder();
                                    tdCompletaAlterar
                                            .append("<td class='text-center'>")
                                            .append("<a href=")
                                            .append("FormEditarAluno.jsp")
                                            .append("?codigo=" + aluno.getCodigo())
                                            .append(">")
                                            .append(icones.editar())
                                            .append("</a>")
                                            .append("</td>");
                                    out.print(tdCompletaAlterar);

                                    StringBuilder tdCompletaDeletar = new StringBuilder();
                                    tdCompletaDeletar
                                            .append("<td class='text-center'>")
                                            .append("<a ")
                                            .append("href='#' ")
                                            .append("class='btn-excluir' ")
                                            .append("data-bs-toggle='modal' ")
                                            .append("data-bs-target='#staticBackdrop' ")
                                            .append("data-id='" + aluno.getCodigo() + "' ")
                                            .append("data-nome='" + aluno.getNome() + "' ")
                                            .append("data-conjuge='" + aluno.getConjuge()+ "' ")
                                            .append("data-cpf='" + aluno.getCpf() + "' ")
                                            .append("data-email='" + aluno.getEmail() + "' ")
                                            .append("data-nascimento='" + aluno.getData_nascimento() + "' ")
                                            .append(">")
                                            .append(icones.deletar())
                                            .append("</a>")
                                            .append("</td>");
                                    out.print(tdCompletaDeletar);

                                    out.print("</tr>");

                                }
                            } catch (Exception x) {
                                out.print("Erro: " + x.getMessage());
                            }

                        %>

                    </tbody>

                </table>


                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                    Launch static backdrop modal
                </button>

                <!-- Modal -->
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title fs-5" id="staticBackdropLabel">Tem certeza que deseja excluir o registro?</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p><strong>Nome completo:</strong> <span id="modal-nome"></span></p>
                                <p><strong>Cônjuge:</strong> <span id="modal-conjuge"></span></p>
                                <p><strong>CPF:</strong> <span id="modal-cpf"></span></p>
                                <p><strong>Email:</strong> <span id="modal-email"></span></p>
                                <p><strong>Data de Nascimento:</strong> <span id="modal-nascimento"></span></p>
                                <input type="hidden" id="modal-id">
                            </div>
                            <div class="modal-footer">  
                                <div class="col-12 text-center">
                                    <button type="button" class="btn btn-danger col-5" id="btn-confirmar-exclusao">Excluir</button>
                                    <button type="button" class="btn btn-primary col-5" data-bs-dismiss="modal">Cancelar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </main>
        <script src="../../assets/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                document.getElementById("infoBuscada").focus();
            });
        </script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const modalNome = document.getElementById("modal-nome");
                const modalConjuge = document.getElementById("modal-conjuge");
                const modalCpf = document.getElementById("modal-cpf");
                const modalEmail = document.getElementById("modal-email");
                const modalNascimento = document.getElementById("modal-nascimento");
                const modalId = document.getElementById("modal-id");
                const btnConfirmarExclusao = document.getElementById("btn-confirmar-exclusao");

                // Atualizar o modal com os dados do registro
                document.querySelectorAll(".btn-excluir").forEach(button => {
                    button.addEventListener("click", function () {
                        modalId.value = this.getAttribute("data-id");
                        modalNome.textContent = this.getAttribute("data-nome");
                        modalConjuge.textContent = this.getAttribute("data-conjuge");
                        modalCpf.textContent = this.getAttribute("data-cpf");
                        modalEmail.textContent = this.getAttribute("data-email");
                        modalNascimento.textContent = this.getAttribute("data-nascimento");
                    });
                });

                // Confirmar exclusão
                btnConfirmarExclusao.addEventListener("click", function () {
                    const id = modalId.value;

                    // Redirecionar para o script de exclusão (ou usar AJAX se preferir)
                      location.href = "excluirAluno.jsp?codigo=" + id;
                });
            });
        </script>

    </body>
</html>
