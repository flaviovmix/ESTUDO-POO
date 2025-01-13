
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
        <div class="container-xl"> 
            <h2 class="d-none d-md-block">LISTAGEM DE PROFESSORES</h2>   
            <h2 class="d-block d-md-none h2-celular">LISTAGEM DE PROFESSORES</h2>   
            <div class="row">
                <div class="col-2 d-block d-md-none">
                </div>
                <div class="col-8 d-block d-md-none">
                    <a class="btn btn-success link-botao botaonovo-small" href="FormCadastroAluno.html">Novo Professor</a>     
                </div>
                <div class="col-2 d-block d-md-none">
                </div>
            </div>
            <div class="row">
                <div class="col-3 d-none d-md-table-cell">
                    <a class="btn btn-success link-botao" href="FormCadastroAluno.html">Novo Professor</a>     
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
                            //CONECTAR COM O BANDO DE DADOS
                            Connection conecta;
                            PreparedStatement comando;

                            Class.forName("org.postgresql.Driver");
                            conecta = DriverManager.getConnection(
                                    "jdbc:postgresql://localhost:5432/regis", "postgres", "masterkey"
                            );

                            if (infoBuscada == "") {
                                comando = conecta.prepareStatement("select * from cliente order by nome");
                            } else {
                                if (campoBuscado.equals("Codigo")) {
                                    comando = conecta.prepareStatement("select * from cliente WHERE codigo = " + infoBuscada);
                                } else {
                                    comando = conecta.prepareStatement("select * from cliente WHERE LOWER(" + campoBuscado + ") LIKE ('%" + infoBuscada + "%') order by " + campoBuscado);
                                }
                            }
                            ResultSet resultado = comando.executeQuery();

                            while (resultado.next()) {
                                out.print("<tr>");

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
                                        .append("<a href=")
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
                                        .append("<a ")
                                        .append("href=")
                                        .append("http://localhost:8081/ESTUDO-POO/excluirAluno.jsp")
                                        .append("?codigo=" + resultado.getString("codigo"))
                                        .append(" id=\"")
                                        .append(resultado.getString("codigo"))
                                        .append("\"")
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
                            <h4 class="modal-title fs-5" id="staticBackdropLabel">Tem certeza que deseja excluir o registro:</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p><span>Nome completo: </span> Flávio José dos Passos</p>
                            <p><span>Conjuge: </span>Adriely Baldo Sotele dos Passos</p>
                            <p><span>CPF: </span> 114.897.999-83</p>
                            <p><span>Email: </span> flaviovmix@gmail</p>
                            <p><span>Data Fabricação:</span> 05/11/1982</p>
                        </div>
                        <div class="modal-footer">  
                            <div class="col-12 text-center">
                                <button type="button" class="btn btn-danger col-5">Excluir</button>
                                <button type="button" class="btn btn-primary col-5" data-bs-dismiss="modal">Editar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>              
        </div>

        <script src="assets/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                document.getElementById("infoBuscada").focus();
            });
        </script>
    </body>
</html>
