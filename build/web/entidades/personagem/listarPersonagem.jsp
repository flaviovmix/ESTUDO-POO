<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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

    int limitePorPagina = 14;
    int offset = (paginaAtual - 1) * limitePorPagina;

    comando = conecta.prepareStatement("SELECT * FROM personagem ORDER BY codigo LIMIT ? OFFSET ?;");
    comando.setInt(1, limitePorPagina);
    comando.setInt(2, offset);

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

        <link rel="stylesheet" href="../../assets/css/ajustes/normalize.css">
        <link id="tema" rel="stylesheet" href="../../assets/css/temas/variaveis-tema-claro.css">
        <link rel="stylesheet" href="../../assets/css/nav/barra-menu.css">
        <link rel="stylesheet" href="../../assets/css/cards/card.css">
        <link rel="stylesheet" href="../../assets/css/cards/table.css">
        <link rel="stylesheet" href="../../assets/css/cards/ancoras.css">
        <link rel="stylesheet" href="../../assets/css/cards/info.css">      

  <link rel="stylesheet" href="../assets/css/ajustes/responsividade.css">
</head>

<body>
  <nav class="menu-principal">
    <ul>
      <div class="container-nav">
        <div>
          <li><a href="#home">NOVO REGISTRO</a></li>
          <li><a class="nav-link active" aria-current="page" href="<%= request.getContextPath() %>/entidades/aluno/listarAluno.jsp">ALUNOS</a></li>
          <li><a class="nav-link active" aria-current="page" href="<%= request.getContextPath() %>/entidades/todo/todoist.jsp">TO-DO</a></li>
        </div>
        <button id="btnTema" onclick="mudarTema()">Mudar para modo escuro</button>
      </div>
    </ul>
  </nav>

  <main>

    <div id="estilo-card" class="ativo">
      <div  class="container-xl">

          <% while (resultado.next()) {%>
        <div class="card">
          <div class="area-img-info">
            <img class="img-principal" src="../../assets/img/<%= resultado.getString("nomearquivo")%>.png" alt="imagem da personagem 1" />
            <div class="info-personagem">
                
                
               <img class="bandeira" src="../../assets/img/bandeira.png" /> 
              <div class="img-nome-personagem">
                  <img class="imagem-circular" src="../../assets/img/r-<%= resultado.getString("nomearquivo")%>.png" alt="">
                <div>
                  <h2><%= resultado.getString("nome")%> ANDRADE</h2>
                  <p><%= resultado.getString("nacionalidade")%></p>
                </div>
              </div>

              <table>

                <tr>
                  <td><strong>Idade:</strong></td>
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
                </tr>
                <tr>
                  <td><strong>Busto:</strong></td>
                  <td><%= resultado.getString("busto")%> cm</td>
                </tr>
                <tr>
                  <td><strong>Quadril:</strong></td>
                  <td><%= resultado.getString("quadil")%> cm</td>
                </tr>
                <tr>
                  <td><strong>Cintura:</strong></td>
                  <td>36 cm</td>
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
              <h3><%= resultado.getString("civil")%></h3>
              <div class="editar-excluir-dentro-info">
                <a href="#"><span class="fa fa-pen"></span></a>
                <a href="#"><span class="fa fa-trash"></span></a>

              </div>
            </div>
          </div>
          <div class="area-links">
            <div class="area-estrelas">
                <a href="#">
                    <img class="preto-branco" src="../../assets/img/emoje-1.png" />
                </a>
                <a href="#">
                    <img class="preto-branco" src="../../assets/img/emoje-2.png" />
                </a>
                <a href="#">
                    <img class="preto-branco" src="../../assets/img/emoje-3.png" />
                </a>                
                <a href="#">
                    <img class="preto-branco" src="../../assets/img/emoje-4.png" />
                </a>                     
                <a href="#">
                    <img class="preto-branco" src="../../assets/img/emoje-5.png" />
                </a>                     
            </div>
          </div>
        </div>
        <%}%>  


      </div>
    </div>

    <div id="estilo-tabela" class="tabela-personagem oculto">
      <table>

        <tr>
          <td><strong>Idade:</strong></td>
          <td><strong>Busto:</strong></td>
          <td><strong>Quadril:</strong></td>
          <td><strong>Cintura:</strong></td>
          <td><strong>Altura:</strong></td>
          <td><strong>Peso:</strong></td>
          <td><strong>Obs:</strong></td>
        </tr>

        <script>
          for (let i = 2; i < 15; i++) {
            document.write(` 
          <tr>
            <td>22 anos</td>
            <td>145 cm</td>
            <td>28 cm</td>
            <td>36 cm</td>
            <td>1,78 cm</td>
            <td>58 Kg</td>
            <td colspan="2" class="obs">Lorem Ipsum is</td>
          </tr>
         `);

          }
        </script>

      </table>
    </div>
  </main>

  <script>
    function mudarTema() {
      const linkTema = document.getElementById("tema");
      const btnTema = document.getElementById("btnTema");
      const temaClaro = "../assets/css/temas/variaveis-tema-claro.css";
      const temaEscuro = "../assets/css/temas/variaveis-tema-escuro.css";

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