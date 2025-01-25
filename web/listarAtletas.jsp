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

    comando = conecta.prepareStatement("select * from atleta limit 10");
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
            
            <hr>
            <div class="row row-cols-1 row-cols-sm-2 row-cols-xxl-5 row-cols-xl-4 row-cols-lg-4 row-cols-md-3 g-4">

                <% while (resultado.next()) {%>
                <div class="col">
                    <div class="card">
                        <div class="area-efeito">
                            <img src="assets/img/<%= resultado.getString("nomearquivo")%>" class="card-img-top" alt="Imagem <%= resultado.getString("nomearquivo")%>">
                            <div class="info-overlay">

                                <h6>Atacante</h6>
                                <p><%= resultado.getString("timejoga")%></p>
                                <table>
                                    <tbody>
                                        <tr>
                                            <th>País:</th>
                                            <td><%= resultado.getString("paisOrigem")%></td>
                                            <th>Jogos:</th>
                                            <td><%= resultado.getString("QuatidadeJogos")%></td>
                                        </tr>

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
                                            <th>Gols:</th>
                                            <td><%= resultado.getString("quatidadeGols")%></td>
                                        </tr>

                                        <tr>
                                            <th>Altura:</th>
                                            <td><%= resultado.getString("altura")%> m</td>
                                            <th>Pé:</th>
                                            <td><%= resultado.getString("pe")%></td>
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
                                <a href="#" class="btn btn-light">VOTAR</a>
                                <div>
                                    <spam class="spam-estrelas-neutra">
                                        <svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor'
                                             class='bi bi-trash' viewBox='0 0 20 20'>
                                        <path
                                            d='M4.29981 16.125C3.91648 16.425 3.52481 16.4333 3.12481 16.15C2.72481 15.8666 2.59148 15.4916 2.72481 15.025L4.14981 10.4L0.524809 7.82498C0.124809 7.54164 0.00414245 7.16664 0.162809 6.69998C0.320809 6.23331 0.641476 5.99998 1.12481 5.99998H5.59981L7.04981 1.19998C7.13314 0.966642 7.26248 0.787309 7.43781 0.661976C7.61248 0.537309 7.79981 0.474976 7.99981 0.474976C8.19981 0.474976 8.38714 0.537309 8.56181 0.661976C8.73714 0.787309 8.86648 0.966642 8.94981 1.19998L10.3998 5.99998H14.8748C15.3581 5.99998 15.6791 6.23331 15.8378 6.69998C15.9958 7.16664 15.8748 7.54164 15.4748 7.82498L11.8498 10.4L13.2748 15.025C13.4081 15.4916 13.2748 15.8666 12.8748 16.15C12.4748 16.4333 12.0831 16.425 11.6998 16.125L7.99981 13.3L4.29981 16.125Z' />
                                        </svg>
                                    </spam>
                                    <spam class="spam-estrelas-positiva">
                                        <svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor'
                                             class='bi bi-trash' viewBox='0 0 20 20'>
                                        <path
                                            d='M4.29981 16.125C3.91648 16.425 3.52481 16.4333 3.12481 16.15C2.72481 15.8666 2.59148 15.4916 2.72481 15.025L4.14981 10.4L0.524809 7.82498C0.124809 7.54164 0.00414245 7.16664 0.162809 6.69998C0.320809 6.23331 0.641476 5.99998 1.12481 5.99998H5.59981L7.04981 1.19998C7.13314 0.966642 7.26248 0.787309 7.43781 0.661976C7.61248 0.537309 7.79981 0.474976 7.99981 0.474976C8.19981 0.474976 8.38714 0.537309 8.56181 0.661976C8.73714 0.787309 8.86648 0.966642 8.94981 1.19998L10.3998 5.99998H14.8748C15.3581 5.99998 15.6791 6.23331 15.8378 6.69998C15.9958 7.16664 15.8748 7.54164 15.4748 7.82498L11.8498 10.4L13.2748 15.025C13.4081 15.4916 13.2748 15.8666 12.8748 16.15C12.4748 16.4333 12.0831 16.425 11.6998 16.125L7.99981 13.3L4.29981 16.125Z' />
                                        </svg>
                                    </spam>
                                    <spam class="spam-estrelas-positiva">
                                        <svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor'
                                             class='bi bi-trash' viewBox='0 0 20 20'>
                                        <path
                                            d='M4.29981 16.125C3.91648 16.425 3.52481 16.4333 3.12481 16.15C2.72481 15.8666 2.59148 15.4916 2.72481 15.025L4.14981 10.4L0.524809 7.82498C0.124809 7.54164 0.00414245 7.16664 0.162809 6.69998C0.320809 6.23331 0.641476 5.99998 1.12481 5.99998H5.59981L7.04981 1.19998C7.13314 0.966642 7.26248 0.787309 7.43781 0.661976C7.61248 0.537309 7.79981 0.474976 7.99981 0.474976C8.19981 0.474976 8.38714 0.537309 8.56181 0.661976C8.73714 0.787309 8.86648 0.966642 8.94981 1.19998L10.3998 5.99998H14.8748C15.3581 5.99998 15.6791 6.23331 15.8378 6.69998C15.9958 7.16664 15.8748 7.54164 15.4748 7.82498L11.8498 10.4L13.2748 15.025C13.4081 15.4916 13.2748 15.8666 12.8748 16.15C12.4748 16.4333 12.0831 16.425 11.6998 16.125L7.99981 13.3L4.29981 16.125Z' />
                                        </svg>
                                    </spam>
                                    <spam class="spam-estrelas-positiva">
                                        <svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor'
                                             class='bi bi-trash' viewBox='0 0 20 20'>
                                        <path
                                            d='M4.29981 16.125C3.91648 16.425 3.52481 16.4333 3.12481 16.15C2.72481 15.8666 2.59148 15.4916 2.72481 15.025L4.14981 10.4L0.524809 7.82498C0.124809 7.54164 0.00414245 7.16664 0.162809 6.69998C0.320809 6.23331 0.641476 5.99998 1.12481 5.99998H5.59981L7.04981 1.19998C7.13314 0.966642 7.26248 0.787309 7.43781 0.661976C7.61248 0.537309 7.79981 0.474976 7.99981 0.474976C8.19981 0.474976 8.38714 0.537309 8.56181 0.661976C8.73714 0.787309 8.86648 0.966642 8.94981 1.19998L10.3998 5.99998H14.8748C15.3581 5.99998 15.6791 6.23331 15.8378 6.69998C15.9958 7.16664 15.8748 7.54164 15.4748 7.82498L11.8498 10.4L13.2748 15.025C13.4081 15.4916 13.2748 15.8666 12.8748 16.15C12.4748 16.4333 12.0831 16.425 11.6998 16.125L7.99981 13.3L4.29981 16.125Z' />
                                        </svg>
                                    </spam>
                                    <spam class="spam-estrelas-positiva">
                                        <svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor'
                                             class='bi bi-trash' viewBox='0 0 20 20'>
                                        <path
                                            d='M4.29981 16.125C3.91648 16.425 3.52481 16.4333 3.12481 16.15C2.72481 15.8666 2.59148 15.4916 2.72481 15.025L4.14981 10.4L0.524809 7.82498C0.124809 7.54164 0.00414245 7.16664 0.162809 6.69998C0.320809 6.23331 0.641476 5.99998 1.12481 5.99998H5.59981L7.04981 1.19998C7.13314 0.966642 7.26248 0.787309 7.43781 0.661976C7.61248 0.537309 7.79981 0.474976 7.99981 0.474976C8.19981 0.474976 8.38714 0.537309 8.56181 0.661976C8.73714 0.787309 8.86648 0.966642 8.94981 1.19998L10.3998 5.99998H14.8748C15.3581 5.99998 15.6791 6.23331 15.8378 6.69998C15.9958 7.16664 15.8748 7.54164 15.4748 7.82498L11.8498 10.4L13.2748 15.025C13.4081 15.4916 13.2748 15.8666 12.8748 16.15C12.4748 16.4333 12.0831 16.425 11.6998 16.125L7.99981 13.3L4.29981 16.125Z' />
                                        </svg>
                                    </spam>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                            <%}%>     
            </div>

            <hr>



            <%@ include file="interface/footer.html" %>     
        </main>






        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
