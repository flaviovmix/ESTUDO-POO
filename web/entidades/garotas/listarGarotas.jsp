<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%

    Connection conecta;
    PreparedStatement comando;

    Class.forName("org.postgresql.Driver");
    conecta = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/banco", "postgres", "masterkey"
    );

    comando = conecta.prepareStatement("SELECT p.*, f.* FROM personagem_fase pf JOIN personagem p ON pf.personagem = p.codigo"
            + " JOIN fase f ON pf.fase = f.codigo ORDER BY p.codigo, f.codigo;");

    ResultSet resultado = comando.executeQuery();

%>
<!DOCTYPE html>
<html lang="pt-BR">
    
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/solid.css"
              integrity="sha384-Tv5i09RULyHKMwX0E8wJUqSOaXlyu3SQxORObAI08iUwIalMmN5L6AvlPX2LMoSE" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/fontawesome.css"
              integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous" />

        <link id="tema" rel="stylesheet" href="../../assets/css/temas/variaveis-tema-claro.css">      
        <link rel="stylesheet" href="../../assets/css/ajustes/normalize.css">

        <link rel="stylesheet" href="../../assets/css/nav/barra-menu.css">
        <link rel="stylesheet" href="../../assets/css/nav/footer.css">
        <link rel="stylesheet" href="../../assets/css/cards/card.css">
        <link rel="stylesheet" href="../../assets/css/cards/table.css">
        <link rel="stylesheet" href="../../assets/css/cards/ancoras.css">
        <link rel="stylesheet" href="../../assets/css/cards/info.css">      
        <link rel="stylesheet" href="../../assets/css/ajustes/ativo-inativo.css">      

        <link rel="stylesheet" href="../assets/css/ajustes/responsividade.css">


    </head>
     
    <body>
        <nav class="menu-principal">

            <ul class="menu">
                <li>
                    <a href="<%= request.getContextPath()%>/entidades/aluno/listarAluno.jsp">ALUNOS</a>

                </li>
                <li>
                    <a href="#">GAROTAS</a>
                    <ul class="submenu">
                        <li><hr></li>
                        <li>
                            <a href="<%= request.getContextPath()%>/entidades/personagem/zerarPersonagem.jsp?">
                                <span>ZERAR TODAS</span>
                                <img class="emoje-menu inativo" src="../../assets/img/emoje-2.png" />
                            </a>
                        </li>
                        <li>
                            <a href="<%= request.getContextPath()%>/entidades/personagem/ativarTodosPersonagem.jsp">
                                <span>ATIVAR TODAS</span>
                                <img class="emoje-menu" src="../../assets/img/emoje-5.png" />
                            </a>
                        </li>
                        <li><hr></li>
                        <li>
                            <a href="<%= request.getContextPath()%>/entidades/personagem/atualizaTodasThumb.jsp?thumb=1">
                                <span>CAPA COMO FASE 1</span>
                                <img class="emoje-menu" src="../../assets/img/emoje-1.png" />
                            </a>
                        </li>
                        <li>
                            <a href="<%= request.getContextPath()%>/entidades/personagem/atualizaTodasThumb.jsp?thumb=2">
                                <span>CAPA COMO FASE 2</span>
                                <img class="emoje-menu" src="../../assets/img/emoje-2.png" />
                            </a>
                        </li>
                        <li>
                            <a href="<%= request.getContextPath()%>/entidades/personagem/atualizaTodasThumb.jsp?thumb=3">
                                <span>CAPA COMO FASE 3</span>
                                <img class="emoje-menu" src="../../assets/img/emoje-3.png" />
                            </a>
                        </li>
                        <li>
                            <a href="<%= request.getContextPath()%>/entidades/personagem/atualizaTodasThumb.jsp?thumb=4">
                                <span>CAPA COMO FASE 4</span>
                                <img class="emoje-menu" src="../../assets/img/emoje-4.png" />
                            </a>
                        </li>
                        <li>
                            <a href="<%= request.getContextPath()%>/entidades/personagem/atualizaTodasThumb.jsp?thumb=5">
                                <span>CAPA COMO FASE 5</span>
                                <img class="emoje-menu" src="../../assets/img/emoje-5.png" />
                            </a>
                        </li>
                        <li><hr></li>
                    </ul>
                </li>
                <li><a href="<%= request.getContextPath()%>/entidades/todo/todoist.jsp">TO-DO</a>
                </li>
            </ul>

            <button id="btnTema" onclick="mudarTema()">Mudar para modo escuro</button>
        </nav>

        <main>

            <div id="estilo-card">
                <div  class="container-xl">    

                    <% while (resultado.next()) { %>

                    <div class="card">

                        <div class="area-img-info"></div>
                        <div class="area-links"></div>

                    </div>

                    <% }%>
                    
                </div>
            </div>  

        </main>
                    
        <footer>
            <p> TODOS OS DIREITOS RESERVADOS</p>
        </footer>
                    
    </body>

</html>