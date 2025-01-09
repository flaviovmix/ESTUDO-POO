
<%@page import="Disciplina.Disciplina"%>
<%@page import="funcoes.icones"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
            <h2 class="d-none d-md-block">LISTAGEM DE DISCIPLINA</h2>   
            <h2 class="d-block d-md-none h2-celular">LISTAGEM DE DISCIPLINA</h2>   
            
            <div class="row">
                <div class="col-3 d-none d-md-table-cell">
                    <a class="btn btn-success link-botao" href="FormCadastroAluno.html">Nova Disciplina</a>     
                </div>
            </div>

            <div class="row">
                <div class="col-7">


                    <table class="table">
                        <thead>
                            <tr>

                                <th scope="col" style="width: 3%;">#</th>
                                <th scope="col">Nome</th>
                                <th scope="col">Carga Horária</th>

                            </tr>
                        </thead>

                        <tbody class="table-group-divider">

                            <%

                                Disciplina disciplina1 = new Disciplina();
                                disciplina1.setNome("Matemática");
                                disciplina1.setCargaHoraria(-45);

                                out.print("<tr>");

                                    out.print("<th scope='row'>");
                                    out.print("1");
                                    out.print("</th>");

                                    out.print("<td>");
                                    out.print(disciplina1.getNome());
                                    out.print("</td>");

                                    out.print("<td class='d-none d-md-table-cell'>");
                                    out.print(disciplina1.getCargaHoraria());
                                    out.print("</td>");

                                out.print("</tr>");


                            %>

                        </tbody>
                    </table>
                </div>
            </div>
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                Launch static backdrop modal
            </button>

            <!-- Modal -->
                       
        </div>

        <script src="assets/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                document.getElementById("infoBuscada").focus();
            });
        </script>
    </body>
</html>
