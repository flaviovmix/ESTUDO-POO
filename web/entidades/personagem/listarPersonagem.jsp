<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");

    //String thumb = request.getParameter("capa");
    //String capaURL = request.getParameter("capa");

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

//    int limitePorPagina = 14;
//    int offset = (paginaAtual - 1) * limitePorPagina;
//    comando = conecta.prepareStatement("SELECT * FROM personagem ORDER BY codigo LIMIT ? OFFSET ?;");

/*
    comando = conecta.prepareStatement(
            "SELECT p.*, f.* FROM personagem_fase pf JOIN personagem p ON pf.personagem = p.codigo"
            + " JOIN fase f ON pf.fase = f.codigo ORDER BY p.codigo, f.codigo");
*/
    
    comando = conecta.prepareStatement(
             "SELECT p.*, f.* FROM personagem_fase pf " +
             "JOIN personagem p ON pf.personagem = p.codigo " +
             "JOIN fase f ON pf.fase = f.codigo " +
             "WHERE p.codigo IN (1, 3, 4, 10, 6, 8, 12, 13, 14) " +
             "ORDER BY CASE " +
             "    WHEN p.codigo = 1 THEN 1 " +
             "    WHEN p.codigo = 12 THEN 2 " +
             "    WHEN p.codigo = 4 THEN 3 " +
             "    WHEN p.codigo = 13 THEN 4 " +
             "    WHEN p.codigo = 14 THEN 5 " +
             "    WHEN p.codigo = 8 THEN 6 " +
             "    WHEN p.codigo = 3 THEN 7 " +
             "    WHEN p.codigo = 10 THEN 8 " +
             "    WHEN p.codigo = 6 THEN 9 " +
             "    ELSE 10 " +
             "END");
    
    
    
//    comando.setInt(1, limitePorPagina);
//    comando.setInt(2, offset);
    //comando = conecta.prepareStatement("select * from personagem limit 8");
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

                    <% while (resultado.next()) {%>
                    
                    <div class="card">
                        <div class="area-img-info">
                            <%
                                int thumb = Integer.parseInt(resultado.getString("thumb")); 
                                String emojeInativo = "emoje-inativo";
                                String bolinhaInativa = "bolinhas-inativas";
                                if ("0".equals(resultado.getString("ativo"))) {
                                    thumb = 1;
                                }
                                
                                if ("1".equals(resultado.getString("ativo"))) {
                                    emojeInativo = "emoje-para-card-ativo";
                                    bolinhaInativa = "bolinha-para-card-ativo";
                                }   
                                
                                int ativos = 0; // Inicializa a contagem de quebra-cabeças ativos

                                // Percorre os quebra-cabeças de 1 a 5 para verificar quais estão ativos
                                for (int i = 1; i <= 5; i++) {
                                    // Verifica se o campo "quebra_cabeca_X_ativo" no banco de dados é "1" (ativo)
                                    if ("1".equals(resultado.getString("quebra_cabeca_" + i + "_ativo"))) {
                                        ativos++; // Incrementa a contagem de ativos
                                    }
                                }

                                // Se houver pelo menos 1 e no máximo 4 quebra-cabeças ativos,
                                // e se `thumb` for maior ou igual ao número de ativos, ajusta `thumb`
                                if (ativos > 0 && ativos <= 4 && thumb >= ativos) {
                                    thumb = ativos;
                                }
                            %>
                            <img 
                                class="img-principal <%= "1".equals(resultado.getString("ativo")) ? " img-principal-ativa" : "img-principal-inativa"%>" 
                                src="../../assets/img/<%= resultado.getString("nome_arquivo")%>.<%= thumb%>.png"
                                alt="imagem da personagem 1"
                            />

                            <div class="info-personagem">

                                <div class="ecolha-thumb">
                                <a href="<%= "1".equals(resultado.getString("quebra_cabeca_1_ativo"))
                                        ? request.getContextPath() + "/entidades/personagem/atualizaThumb.jsp?personagem=" + resultado.getString("codigo") + "&thumb=1"
                                        : "#"%>">
                                    <img class="<%= "1".equals(resultado.getString("quebra_cabeca_1_ativo")) ? "ativo" : bolinhaInativa %>" src="../../assets/img/t-1.png" />
                                </a>
                                
                                <a href="<%= "1".equals(resultado.getString("quebra_cabeca_2_ativo"))
                                        ? request.getContextPath() + "/entidades/personagem/atualizaThumb.jsp?personagem=" + resultado.getString("codigo") + "&thumb=2"
                                        : "#"%>">
                                    <img class="<%= "1".equals(resultado.getString("quebra_cabeca_2_ativo")) ? "ativo" : bolinhaInativa %>" src="../../assets/img/t-2.png" />
                                </a>    
                                
                                <a href="<%= "1".equals(resultado.getString("quebra_cabeca_3_ativo"))
                                        ? request.getContextPath() + "/entidades/personagem/atualizaThumb.jsp?personagem=" + resultado.getString("codigo") + "&thumb=3"
                                        : "#"%>">
                                    <img class="<%= "1".equals(resultado.getString("quebra_cabeca_3_ativo")) ? "ativo" : bolinhaInativa %>" src="../../assets/img/t-3.png" />
                                </a>

                                <a href="<%= "1".equals(resultado.getString("quebra_cabeca_4_ativo"))
                                        ? request.getContextPath() + "/entidades/personagem/atualizaThumb.jsp?personagem=" + resultado.getString("codigo") + "&thumb=4"
                                        : "#"%>">
                                    <img class="<%= "1".equals(resultado.getString("quebra_cabeca_4_ativo")) ? "ativo" : bolinhaInativa %>" src="../../assets/img/t-4.png" />
                                </a>
                                
                                <a href="<%= "1".equals(resultado.getString("quebra_cabeca_5_ativo"))
                                        ? request.getContextPath() + "/entidades/personagem/atualizaThumb.jsp?personagem=" + resultado.getString("codigo") + "&thumb=5"
                                        : "#"%>">
                                    <img class="<%= "1".equals(resultado.getString("quebra_cabeca_5_ativo")) ? "ativo" : bolinhaInativa %>" src="../../assets/img/t-5.png" />
                                </a>                                
 
                                </div>
                                <img class="bandeira <%= "1".equals(resultado.getString("ativo")) ? " ativo" : "inativo"%>" src="../../assets/img/<%= resultado.getString("pais")%>.png" /> 
                                <div class="img-nome-personagem">
                                    <img class="imagem-circular <%= "1".equals(resultado.getString("ativo")) ? " ativo" : "inativo"%>" src="../../assets/img/r-<%= resultado.getString("nome_arquivo")%>.png" alt="">
                                    <div>
                                        <h2 class="<%= "1".equals(resultado.getString("ativo")) ? "ativo" : "inativo" %>"><%= resultado.getString("nome")%></h2>
                                        <p class="<%= "1".equals(resultado.getString("ativo")) ? " ativo" : "inativo"%>" ><%= resultado.getString("nacionalidade")%></p>
                                    </div>
                                </div>

                                    <table class="<%= "1".equals(resultado.getString("ativo")) ? "ativo" : "inativo" %>">

                                    <tr>
                                        <td><strong>Idade:</strong></td>
                                        <td>

                                            <%
                                                // Obtendo a data de nascimento do banco
                                                java.sql.Date dataNascimentoSQL = resultado.getDate("data_nascimento");
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
                                    </tr>
                                    <tr>
                                        <td><strong>Busto:</strong></td>
                                        <td><%= resultado.getString("busto")%> cm</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Quadril:</strong></td>
                                        <td><%= resultado.getString("quadril")%> cm</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Cintura:</strong></td>
                                        <td><%= resultado.getString("cintura")%> cm</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Altura:</strong></td>
                                        <td><%= resultado.getString("altura")%> cm</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Peso:</strong></td>
                                        <td><%= resultado.getString("peso")%> Kg</td>
                                    </tr>
                                    <tr class="obs">
                                        <td colspan="2" class="obs"><%= resultado.getString("obs")%></td>
                                    </tr>

                                </table>
                                <h3 class="<%= "1".equals(resultado.getString("ativo")) ? "ativo" : "inativo" %>"><%= resultado.getString("estado_civil")%></h3>
                                <div class="editar-excluir-dentro-info <%= "1".equals(resultado.getString("ativo")) ? "ativo" : "inativo" %>">
                                    <a href="#"><span class="fa fa-pen"></span></a>
                                    <a href="#"><span class="fa fa-trash"></span></a>

                                </div>
                            </div>
                        </div>
                        <div class="area-links">
                            <div class="area-estrelas">
                                <a href="<%= "1".equals(resultado.getString("quebra_cabeca_1_ativo"))
                                        ? request.getContextPath() + "/entidades/quebra-cabeca/9x16.jsp?pag=" + resultado.getString("quebra_cabeca_1") + "&personagem=" + resultado.getString("codigo")
                                        : "#"%>">
                                    <img class="<%= "1".equals(resultado.getString("quebra_cabeca_1_ativo")) ? "ativo" : emojeInativo %>" src="../../assets/img/emoje-1.png" />
                                </a>

                                <a href="<%= "1".equals(resultado.getString("quebra_cabeca_2_ativo"))
                                        ? request.getContextPath() + "/entidades/quebra-cabeca/9x16.jsp?pag=" + resultado.getString("quebra_cabeca_2") + "&personagem=" + resultado.getString("codigo")
                                        : "#"%>">
                                    <img class="<%= "1".equals(resultado.getString("quebra_cabeca_2_ativo")) ? "ativo" : emojeInativo %>" src="../../assets/img/emoje-2.png" />
                                </a>

                                <a href="<%= "1".equals(resultado.getString("quebra_cabeca_3_ativo"))
                                        ? request.getContextPath() + "/entidades/quebra-cabeca/9x16.jsp?pag=" + resultado.getString("quebra_cabeca_3") + "&personagem=" + resultado.getString("codigo")
                                        : "#"%>">
                                    <img class="<%= "1".equals(resultado.getString("quebra_cabeca_3_ativo")) ? "ativo" : emojeInativo %>" src="../../assets/img/emoje-3.png" />
                                </a>

                                <a href="<%= "1".equals(resultado.getString("quebra_cabeca_4_ativo"))
                                        ? request.getContextPath() + "/entidades/quebra-cabeca/9x16.jsp?pag=" + resultado.getString("quebra_cabeca_4") + "&personagem=" + resultado.getString("codigo")
                                        : "#"%>">
                                    <img class="<%= "1".equals(resultado.getString("quebra_cabeca_4_ativo")) ? "ativo" : emojeInativo %>" src="../../assets/img/emoje-4.png" />
                                </a> 

                                <a href="<%= "1".equals(resultado.getString("quebra_cabeca_5_ativo"))
                                        ? request.getContextPath() + "/entidades/quebra-cabeca/9x16.jsp?pag=" + resultado.getString("quebra_cabeca_5") + "&personagem=" + resultado.getString("codigo")
                                        : "#"%>">
                                    <img class="<%= "1".equals(resultado.getString("quebra_cabeca_5_ativo")) ? "ativo" : emojeInativo %>" src="../../assets/img/emoje-5.png" />
                                </a>               
                            </div>
                        </div>
                    </div>
                    <%}%>  


                </div>
            </div>
                    
        </main>
        <footer>
            <p> TODOS OS DIREITOS RESERVADOS</p>
        </footer>
        <script>
            function mudarTema() {
                const linkTema = document.getElementById("tema");
                const btnTema = document.getElementById("btnTema");
                const temaClaro = "../../assets/css/temas/variaveis-tema-claro.css";
                const temaEscuro = "../../assets/css/temas/variaveis-tema-escuro.css";

                if (linkTema.getAttribute("href") === temaClaro) {
                    // Muda para tema escuro
                    linkTema.setAttribute("href", temaEscuro);
                    btnTema.textContent = "Mudar para modo claro";
                } else {
                    // Muda para tema claro
                    linkTema.setAttribute("href", temaClaro);
                    btnTema.textContent = "Mudar para modo escuro";
                }
            }


            function mostrarCard() {
                // Oculta todas as divs
                document.getElementById('estilo-card').classList.add('ativo');
                document.getElementById('estilo-card').classList.remove('oculto');

                document.getElementById('estilo-tabela').classList.add('oculto');
                document.getElementById('estilo-tabela').classList.remove('ativo');
            }

            function mostrarTable() {
                // Oculta todas as divs
                document.getElementById('estilo-card').classList.add('oculto');
                document.getElementById('estilo-card').classList.remove('ativo');

                document.getElementById('estilo-tabela').classList.add('ativo');
                document.getElementById('estilo-tabela').classList.remove('oculto');
            }
        </script>

    </body>

</html>