<%@page import="funcoes.icones"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
    request.setCharacterEncoding("UTF-8");

    String pagAtual = request.getParameter("pag");
    int paginaAtual = (pagAtual != null && !pagAtual.isEmpty()) ? Integer.parseInt(pagAtual) : 1;

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

    int limitePorPagina = 15;
    int offset = (paginaAtual - 1) * limitePorPagina;

    comando = conecta.prepareStatement("SELECT * FROM personagem ORDER BY codigo LIMIT ? OFFSET ?;");
    comando.setInt(1, limitePorPagina);
    comando.setInt(2, offset);

    //comando = conecta.prepareStatement("select * from personagem limit 8");
    ResultSet resultado = comando.executeQuery();


%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Galeria de Imagens</title>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/solid.css"
          integrity="sha384-Tv5i09RULyHKMwX0E8wJUqSOaXlyu3SQxORObAI08iUwIalMmN5L6AvlPX2LMoSE" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/fontawesome.css"
          integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous" />

        <link rel="stylesheet" href="../../assets/css/ajustes/normalize.css">
        <link id="tema" rel="stylesheet" href="../../assets/css/temas/variaveis-tema-claro.css">
        <link rel="stylesheet" href="../../assets/css/nav/barra-menu.css">
        <link rel="stylesheet" href="../../assets/css/cards/card.css">
        <link rel="stylesheet" href="../../assets/css/cards/table.css">
        <link rel="stylesheet" href="../../assets/css/cards/ancoras.css">
        <link rel="stylesheet" href="../../assets/css/cards/info.css">        

        <style>
            /*    .pagination-custom .page-item .page-link {
                    background-color: #4CAF50;  Cor de fundo verde 
                    color: white;  Cor do texto 
                }
            
                .pagination-custom .page-item.active .page-link {
                    background-color: #333;  Cor do item ativo 
                    color: white;  Cor do texto ativo 
                }
            
                .pagination-custom .page-item:hover .page-link {
                    background-color: #555;  Cor ao passar o mouse 
                }*/
        </style>        
    </head>
    <body>

        <main class="container">

            <div class="sidebar">
                <button class="menu-hamburger" id="menuToggle">
                    <span class="fa fa-bars" id="menuIcon"></span>
                </button>   

                <nav class="sidebar__navigation">
                    <div class="logo">
                        <a href="">
                            <img src="../../assets/icons/logo-spotify.png" alt="Logo" />
                        </a>
                    </div>

                    <ul>

                        <li>
                            <a href="<%= request.getContextPath() %>/entidades/aluno/listarAluno.jsp">
                                <span class="fa fa-user"></span>
                                <span>ALUNOS</span>
                            </a>
                        </li>
                    </ul>    
                    
                </nav>                

            </div>            

            <div class="container-xl">


                <nav class="navbar navbar-expand-sm navbar-dark bg-dark d-none d-md-block fixed-top mb-5" aria-label="Third navbar example">
                    <div class="container-xl">

                        <div class="col-3 d-none d-md-table-cell text-center">
                            <a class="btn btn-success link-botao w-75" href="FormCadastroPersonagem.html">Novo Registro</a>     
                        </div>

                        <form  class="col-md-9 d-flex justify-content-center" method="post" action="listarAluno.jsp">
                            <div class="w-75">
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
                </nav>

            </div>




            <div class="row row-cols-1 row-cols-sm-2 row-cols-xxl-5 row-cols-xl-5 row-cols-lg-3 row-cols-md-3 g-4 zoom-menor m-auto">

                <% while (resultado.next()) {%>

                <div class="col">
                    <div class="card">
                        <div class="area-efeito">
                            <img src="../../assets/img/<%= resultado.getString("nomearquivo")%>.png" class="card-img-top" alt="Imagem <%= resultado.getString("nomearquivo")%>">



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
                            <div class="row descricao justify-content-between my-1 px-2">


                                <div class="col-6 d-flex gap-0">
                                    <a href="../quebra-cabeca/9x16.jsp?pag=<%= resultado.getString("nomeArquivo")%>.1.png">
                                        <spam class="spam-estrelas-positiva"> 
                                            <%
                                                String estrela1 = icones.estrela().replace("<svg", "<svg width='25' height='25'");
                                                out.print(estrela1);
                                            %> 
                                        </spam>
                                    </a>
                                    <a href="../quebra-cabeca/9x16.jsp?pag=<%= resultado.getString("nomeArquivo")%>.2.png">
                                        <spam class="spam-estrelas-positiva">
                                            <%
                                                String estrela2 = icones.estrela().replace("<svg", "<svg width='25' height='25'");
                                                out.print(estrela2);
                                            %> 
                                        </spam>
                                    </a>
                                    <a href="../quebra-cabeca/9x16.jsp?pag=<%= resultado.getString("nomeArquivo")%>.3.png">
                                        <spam class="spam-estrelas-positiva">
                                            <%
                                                String estrela3 = icones.estrela().replace("<svg", "<svg width='25' height='25'");
                                                out.print(estrela3);
                                            %> 
                                        </spam>
                                    </a>
                                    <a href="../quebra-cabeca/9x16.jsp?pag=<%= resultado.getString("nomeArquivo")%>.4.png">
                                        <spam class="spam-estrelas-positiva">
                                            <%
                                                String estrela4 = icones.estrela().replace("<svg", "<svg width='25' height='25'");
                                                out.print(estrela4);
                                            %> 
                                        </spam>
                                    </a>
                                    <a href="../quebra-cabeca/9x16.jsp?pag=<%= resultado.getString("nomeArquivo")%>.5.png">
                                        <spam class="spam-estrelas-positiva">
                                            <%
                                                String estrela5 = icones.estrela().replace("<svg", "<svg width='25' height='25'");
                                                out.print(estrela5);
                                            %> 
                                        </spam>
                                    </a>
                                </div>

                                <div class="col-6 d-flex justify-content-end gap-3">                         
                                    <spam> <% out.print(icones.editar()); %> </spam>
                                    <spam> <% out.print(icones.deletar());%> </spam>
                                </div>

                                <!--<a href="quebra-cabeca-9x16.jsp?pag=<%= resultado.getString("nomeArquivo")%>" class="btn btn-light">Jogar</a>-->
                                <!--<a href="quebra-cabeca-9x16.jsp?pag=<%= resultado.getString("nomeArquivo")%>" class="btn btn-light">Jogar</a>-->
                            </div>
                        </div>

                    </div>
                </div>

                <%}%>        
            </div>

            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-custom justify-content-center py-5 pb-0">
                    <li class="page-item">
                        <a class="page-link" href="listarPersonagem.jsp?pag=1">Primeiro</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="<%
                            if (paginaAtual == 1) {
                                out.print("listarPersonagem.jsp?pag=1");
                            } else {
                                int pag = paginaAtual - 1;
                                out.print("listarPersonagem.jsp?pag=" + pag);
                            }
                           %>"><</a>
                    </li>
                    <li class="page-item <%if (paginaAtual == 1) {
                            out.print("active");
                        }%>">
                        <a class="page-link" href="listarPersonagem.jsp?pag=1">1</a>
                    </li>
                    <li class="page-item <%if (paginaAtual == 2) {
                            out.print("active");
                        }%>">
                        <a class="page-link" href="listarPersonagem.jsp?pag=2">2</a>
                    </li>
                    <li class="page-item <%if (paginaAtual == 3) {
                            out.print("active");
                        }%>">
                        <a class="page-link" href="listarPersonagem.jsp?pag=3">3</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="<%
                            if (paginaAtual == 3) {
                                out.print("listarPersonagem.jsp?pag=3");
                            } else {
                                int pag = paginaAtual + 1;
                                out.print("listarPersonagem.jsp?pag=" + pag);
                            }
                           %>">></a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="listarPersonagem.jsp?pag=3">Último</a>
                    </li>
                </ul>
            </nav>

        </main>




        <%@ include file="../../interface/footer.html" %>      
        <div class="modal fade" id="gameModal" tabindex="-1" aria-labelledby="gameModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="gameModalLabel">Jogo de Quebra-Cabeça</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Conteúdo do jogo -->
                        <div>
                            <iframe src="quebra-cabeca.jsp" name="centro"></iframe>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            document.getElementById("menuToggle").addEventListener("click", function () {
                let menuIcon = document.getElementById("menuIcon");
                let sidebar = document.querySelector(".sidebar");

                sidebar.classList.toggle("active");

                // Alterna entre os ícones fa-bars e fa-times
                if (menuIcon.classList.contains("fa-bars")) {
                    menuIcon.classList.remove("fa-bars");
                    menuIcon.classList.add("fa-times");
                } else {
                    menuIcon.classList.remove("fa-times");
                    menuIcon.classList.add("fa-bars");
                }
            });
        </script>        

    </body>
</html>
