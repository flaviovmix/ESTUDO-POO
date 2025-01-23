<%@page import="funcoes.icones"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
    request.setCharacterEncoding("UTF-8");
    String campoBuscado = request.getParameter("campoBuscado") != null && !request.getParameter("campoBuscado").isEmpty()
            ? request.getParameter("campoBuscado")
            : "";

    String infoBuscada = request.getParameter("infoBuscada") != null && !request.getParameter("infoBuscada").isEmpty()
            ? request.getParameter("infoBuscada")
            : "";

    //CONECTAR COM O BANDO DE DADOS
    Connection conecta;
    PreparedStatement comando;

    Class.forName("org.postgresql.Driver");
    conecta = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/banco", "postgres", "masterkey"
    );

    comando = conecta.prepareStatement("select * from personagem limit 10");
    ResultSet resultado = comando.executeQuery();


%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Galeria de Imagens</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="style.css" rel="stylesheet">
        <link href="gamer.css" rel="stylesheet">
    </head>
    <body>



        <main class="container">
            <%@ include file="interface/navbar.html" %>

            <h2 class="d-none d-md-block">MODO CARD</h2>   
            <h2 class="d-block d-md-none h2-celular">MODO CARD</h2>   
            <div class="row">
                <div class="col-2 d-block d-md-none">
                </div>
                <div class="col-8 d-block d-md-none">
                    <a class="btn btn-success link-botao botaonovo-small" href="FormCadastroPersonagem.html">Novo Registro</a>     
                </div>
                <div class="col-2 d-block d-md-none">
                </div>
            </div>
            <div class="row">

                <div class="col-3 d-none d-md-table-cell">
                    <a class="btn btn-success link-botao" href="FormCadastroPersonagem.html">Novo Registro</a>     
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
        </div>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-xxl-5 row-cols-xl-4 row-cols-lg-3 row-cols-md-3 g-4">

            <% while (resultado.next()) {%>

            <div class="col">
                <div class="card">
                    <div class="area-efeito">
                        <img src="assets/img/<%= resultado.getInt("codigo")%>.png" class="card-img-top" alt="Imagem 1">



                        <div class="info-overlay">

                            <h6><%= resultado.getString("nacionalidade")%></h6>
                            <p><%= resultado.getString("orientacaoSexual")%></p>
                            <table>
                                <tbody>
                                    <tr>
                                        <th>Idade:</th>
                                        <td>    
                                            <%
                                                // Obtendo a data de nascimento do banco
                                                java.sql.Date dataNascimentoSQL = resultado.getDate("nascimento");
                                                if (dataNascimentoSQL != null) {
                                                    // Convertendo para java.util.Date
                                                    java.util.Date dataNascimento = new java.util.Date(dataNascimentoSQL.getTime());
                                                    java.util.Date hoje = new java.util.Date();

                                                    // Calculando a diferença em milissegundos
                                                    long diferencaMilissegundos = hoje.getTime() - dataNascimento.getTime();

                                                    // Convertendo para anos
                                                    long milissegundosPorAno = 1000L * 60 * 60 * 24 * 365;
                                                    int idade = (int) (diferencaMilissegundos / milissegundosPorAno);

                                                    // Exibindo a idade
                                                    out.print(idade + " anos");
                                                } else {
                                                    out.print("--");
                                                }
                                            %>
                                        </td>
                                        <th>Peso:</th>
                                        <td><%= resultado.getString("peso")%> kgs</td>
                                    </tr>

                                    <tr>
                                        <th>Busto:</th>
                                        <td><%= resultado.getString("busto")%> cm</td>
                                        <th>Quadil:</th>
                                        <td><%= resultado.getString("quadil")%> cm</td>
                                    </tr>

                                    <tr>
                                        <th>Civil:</th>
                                        <td><%= resultado.getString("civil")%></td>
                                        <th>Altura:</th>
                                        <td><%= resultado.getString("altura")%> m</td>
                                    </tr>    

                                    <tr>
                                        <th colspan="2">Hobbies:</th>
                                        <td><%= resultado.getString("hobbie")%></td>
                                    </tr>                                      

                                </tbody>
                            </table>
                            <span><%= resultado.getString("obs")%></span>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="info-nome">
                            <h6><%= resultado.getString("nome")%></h6>
                        </div>    
                        <div class="descricao">
                            <!--<h5 class="card-title"><%= resultado.getString("nome")%></h5>-->
                            <a href="interface/tela-do-jogo.jsp" class="btn btn-light">Jogar</a>
                            <div>
                                <spam class="spam-estrelas-neutra"> <% out.print(icones.estrela()); %> </spam>
                                <spam class="spam-estrelas-neutra"> <% out.print(icones.estrela()); %> </spam>
                                <spam class="spam-estrelas-positiva"> <% out.print(icones.estrela()); %> </spam>
                                <spam class="spam-estrelas-positiva"> <% out.print(icones.estrela()); %> </spam>
                                <spam class="spam-estrelas-positiva"> <% out.print(icones.estrela()); %> </spam>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <%}%>        
        </div>

        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center py-5 pb-0">
                <li class="page-item">
                    <a class="page-link">Anterior</a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item active"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">Próximo</a>
                </li>
            </ul>
        </nav>

    </main>




    <%@ include file="interface/footer.html" %>      

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
