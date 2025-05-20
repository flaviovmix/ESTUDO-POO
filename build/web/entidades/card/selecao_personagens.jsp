<%@page import="java.sql.Connection"%>
<%@page import="app.core.Conexao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%
    
    int nivel;
    int roupaThumbSorteada;
    int faceSorteada;
    
    //SORTEIRO DE IMAGENS MÁXIMO 8
    if (false) {
        nivel = 1 + (int)(Math.random() * 1);
        roupaThumbSorteada = 1 + (int)(Math.random() * 8);
        faceSorteada = 1 + (int)(Math.random() * 1);        
    } else {
        nivel = 1;
        roupaThumbSorteada = 1;
        faceSorteada = 1;
    }
        
    
    request.setCharacterEncoding("UTF-8");

    // Parâmetros de página via URL, ex: ?pagina=1
    int pagina = 1;
    int limite = 10 * 7; // Número de cards por página

    String paginaStr = request.getParameter("pagina");
    if (paginaStr != null && !paginaStr.isEmpty()) {
        try {
            pagina = Integer.parseInt(paginaStr);
        } catch (NumberFormatException e) {
            pagina = 1;
        }
    }

    int offset = (pagina - 1) * limite;

    // Conectar com o banco de dados
    Conexao conexao = new Conexao("card_adventure");
    Connection conecta = conexao.abrirConexao();
    
    StringBuilder sb = new StringBuilder();
    
    sb.append("SELECT c.nome, a.chave, a.valor ");
    sb.append("FROM atributos a ");
    sb.append("JOIN cards c ON a.fk_card = c.id_card ");
    sb.append("WHERE c.fk_tema IN (1, 2) ");
    sb.append("AND a.chave IN (");
    sb.append("'data_nascimento', ");
    sb.append("'peso', ");
    sb.append("'quadril', ");
    sb.append("'cintura', ");
    sb.append("'busto', ");
    sb.append("'altura', ");
    sb.append("'hobbie', ");
    sb.append("'nacionalidade', ");
    sb.append("'obs', ");
    sb.append("'thumb'");
    sb.append(") ");
    sb.append("ORDER BY c.nome, a.chave ");
    sb.append("LIMIT ? OFFSET ?");

    PreparedStatement comando = conecta.prepareStatement(sb.toString());
    comando.setInt(1, limite);
    comando.setInt(2, offset);

    ResultSet resultado = comando.executeQuery();
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Seleção de Personagem</title>
    
        <link id="tema" rel="stylesheet" href="../../assets/css/temas/variaveis-tema-claro.css">  
        <link rel="stylesheet" href="../../assets/css/ajustes-de-tela.css">
        <link rel="stylesheet" href="../../assets/css/css-card/ajustes/normalize.css">
        <link rel="stylesheet" href="../../assets/css/nav/barra-menu.css">
        <link rel="stylesheet" href="../../assets/css/nav/footer.css">
        <link rel="stylesheet" href="../../assets/css/css-card/ajustes/responsividade.css">
        <link rel="stylesheet" href="../../assets/css/css-card/card.css">
        <link rel="stylesheet" href="../../assets/css/css-card/area-info-personagem.css">
    </head>
<body>
    
<%@ include file="../../interface/navbarAzul.jsp" %>    
    
    <main>
        <div class="container-tela">
        
        <div class="container-xl">
            
<%
    String obs = null;
    String thumb = null;
    java.util.List<String[]> atributos = new java.util.ArrayList<String[]>();

    boolean temMais = resultado.next();
    while (temMais) {
        String nomeAtual = resultado.getString("nome");
        atributos.clear();
        obs = null;
        thumb = null;

        // Coletar todos os atributos do personagem atual
        do {
            String chave = resultado.getString("chave");
            String valor = resultado.getString("valor");

            if ("obs".equals(chave)) {
                obs = valor;
            } else if ("thumb".equals(chave)) {
                thumb = valor;                
            } else {
                atributos.add(new String[]{chave, valor});
            }

            temMais = resultado.next();
            if (!temMais) break;
        } while (nomeAtual.equals(resultado.getString("nome")));

%>            
            
            <div class="card card-selecionado">

                <div class="menu-lateral-card">
                    <div class="area-icones-thumb">
                        <a href="#"><img src="../../assets/pixel_ai/icones/t-8.png" title="Aqui vai uma explicação."  alt=""></a>
                        <a href="#"><img src="../../assets/pixel_ai/icones/t-7.png" title="Aqui vai uma explicação."  alt=""></a>
                        <a href="#"><img src="../../assets/pixel_ai/icones/t-6.png" title="Aqui vai uma explicação."  alt=""></a>
                        <a href="#"><img src="../../assets/pixel_ai/icones/t-5.png" title="Aqui vai uma explicação."  alt=""></a>
                        <a href="#"><img src="../../assets/pixel_ai/icones/t-4.png" title="Aqui vai uma explicação."  alt=""></a>
                        <a href="#"><img src="../../assets/pixel_ai/icones/t-3.png" title="Aqui vai uma explicação."  alt=""></a>
                        <a href="#"><img src="../../assets/pixel_ai/icones/t-2.png" title="Aqui vai uma explicação."  alt=""></a>
                        <a href="#"><img src="../../assets/pixel_ai/icones/t-1.png" title="Aqui vai uma explicação."  alt=""></a>

                    </div>

                    <div class="controle-card">
                        <a href="#"><img class="svg" src="../../assets/svg/apagar.svg" alt=""></a>
                        <a href="#"><img class="svg" src="../../assets/svg/compartilhar.svg" alt=""></a>
                        <a href="#"><img class="svg" src="../../assets/svg/editar.svg" alt=""></a>
                        <a href="#"><img class="svg" src="../../assets/svg/baixar.svg" alt=""></a>
                        
                    </div>        
                                
                    <div class="controle-card">
                        <a href="#"><img class="svg lixeira" src="../../assets/svg/lixeira.svg" alt=""></a>
                    </div>
                </div>

                <div class="menu-bolinha btnMenuBolinhaCard amostra">
                    <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="349.569px" height="349.569px"
                        viewBox="0 0 349.569 349.569" style="enable-background:new 0 0 349.569 349.569;"
                        xml:space="preserve">
                        <g>
                            <g>
                                <circle cx="39.081" cy="54.785" r="39.081" />
                                <circle cx="39.081" cy="174.785" r="39.081" />
                                <circle cx="39.081" cy="294.785" r="39.081" />
                                <g>
                                    <path d="M344.569,20.535H113.581c-2.757,0-5,2.243-5,5v58.5c0,2.757,2.243,5,5,5h230.988c2.757,0,5-2.243,5-5v-58.5
                                    C349.569,22.778,347.326,20.535,344.569,20.535z" />
                                    <path d="M344.569,140.535H113.581c-2.757,0-5,2.243-5,5v58.5c0,2.757,2.243,5,5,5h230.988c2.757,0,5-2.243,5-5v-58.5
                                    C349.569,142.778,347.326,140.535,344.569,140.535z" />
                                    <path d="M344.569,260.535H113.581c-2.757,0-5,2.243-5,5v58.5c0,2.757,2.243,5,5,5h230.988c2.757,0,5-2.243,5-5v-58.5
                                    C349.569,262.778,347.326,260.535,344.569,260.535z" />
                                </g>
                            </g>
                        </g>
                    </svg>
                </div>

                <div class="conteudo-card">
                    <div class="area-info-personagem" id="areaInfoPersonagem">
                        <div class="cabecalho">
                            <img class="bandeira" src="../assets/pixel_ai/Brasil.png" alt="">
                            <div class="are-face">
                                <img class="face" src="../../assets/pixel_ai/personagens/<%= thumb %>/face.png" alt="">
                            </div>
                                
                            <div class="classificacao">
                                <a href="#"><img src="../../assets/pixel_ai/icones/ESTRELA_1-4.png" alt=""></a>
                                <a href="#"><img src="../../assets/pixel_ai/icones/ESTRELA_1-4.png" alt=""></a>
                                <a href="#"><img src="../../assets/pixel_ai/icones/ESTRELA_1-4.png" alt=""></a>
                                <a href="#"><img src="../../assets/pixel_ai/icones/ESTRELA_1-4.png" alt=""></a>
                                <a href="#"><img src="../../assets/pixel_ai/icones/ESTRELA_5.png" alt=""></a>
                            </div>
                        </div>
                            
                            
                            
                        <div class="tabela">
                            <table>
                                <tbody>
                                    
<%
        for (String[] attr : atributos) {
            String chaveAttr = attr[0];
            String valorAttr = attr[1];
            String chaveFormatada = "";

            switch (chaveAttr) {
                case "data_nascimento": chaveFormatada = "D. de Nascimento"; break;
                case "peso": chaveFormatada = "Peso"; break;
                case "quadril": chaveFormatada = "Quadril"; break;
                case "cintura": chaveFormatada = "Cintura"; break;
                case "busto": chaveFormatada = "Busto"; break;
                case "altura": chaveFormatada = "Altura"; break;
                case "estado_civil": chaveFormatada = "Estado Civil"; break;
                case "orientacao_sexual": chaveFormatada = "Orientação Sexual"; break;
                case "hobbie": chaveFormatada = "Hobbie"; break;
                case "nacionalidade": chaveFormatada = "Nacionalidade"; break;
                default: chaveFormatada = chaveAttr;
            }
%>                                    
                                  <tr><td class="chave"><strong><%= chaveFormatada %>:</strong></td><td><%= valorAttr %></td></tr>
<%
        }

        if (obs != null) {
%>
                                  <tr class="obs"><td colspan="2" class="obs"><%= obs %></td></tr>
                                
<%
        }
%>
                                  
                                </tbody>
                              </table>
                        </div>
                    </div>
                    
                    <img class="img-principal" src="../../assets/pixel_ai/personagens/<%= thumb %>/<%= nivel %>/<%= roupaThumbSorteada %>.png" />
                    <div class="area-titulo-da-fase mostrar" id="area-titulo-da-fase">
                        <span id="areaTituloTexto"><%= nomeAtual %></span>
                    </div>
                </div>

                <div class="area-link-fases">
                    
                    <div class="selecao-da-fase">
                      <div class="fase">
                        <img src="../../assets/pixel_ai/icones/emoje-1.png" alt="">
                      </div>
                      <div class="roupa">
                        <img src="../../assets/pixel_ai/icones/t-1.png" alt="">
                      </div>
                      <div class="jogar">
                        <a class="link" href="#">Jogar</a>
                      </div>                          
                    </div>
                    
                    
                    <a href="../quebra-cabeca/7x9.jsp?personagem=<%= thumb %>&nivel=1" data-titulo="TRAJES NORMAIS"><img class="icone" src="../../assets/pixel_ai/icones/emoje-1.png" /></a>
                    <a href="../quebra-cabeca/7x9.jsp?personagem=<%= thumb %>&nivel=2" data-titulo="ACADEMIA"><img class="icone" src="../../assets/pixel_ai/icones/emoje-2.png" /></a>
                    <a href="../quebra-cabeca/7x9.jsp?personagem=<%= thumb %>&nivel=3" data-titulo="PRAIA"><img class="icone" src="../../assets/pixel_ai/icones/emoje-3.png" /></a>
                    <a href="../quebra-cabeca/7x9.jsp?personagem=<%= thumb %>&nivel=4" data-titulo="PISCINA"><img class="icone" src="../../assets/pixel_ai/icones/emoje-4.png" /></a>
                    <a href="../quebra-cabeca/7x9.jsp?personagem=<%= thumb %>&nivel=5" data-titulo="LENDO"><img class="icone" src="../../assets/pixel_ai/icones/emoje-5.png" /></a>
                    <a href="../quebra-cabeca/7x9.jsp?personagem=<%= thumb %>&nivel=6" data-titulo="DORMINDO"><img class="icone" src="../../assets/pixel_ai/icones/emoje-6.png" /></a>
                    <a href="../quebra-cabeca/7x9.jsp?personagem=<%= thumb %>&nivel=7" data-titulo="BANHO"><img class="icone" src="../../assets/pixel_ai/icones/emoje-7.png" /></a>
                    <a href="../quebra-cabeca/7x9.jsp?personagem=<%= thumb %>&nivel=8" data-titulo="NUA"><img class="icone" src="../../assets/pixel_ai/icones/emoje-8.png" /></a>
                </div>    

            </div>            

 <%
    } // fim while
%>
        </div>
        </div>
    </main>
            <footer>
            <p> TODOS OS DIREITOS RESERVADOS</p>
        </footer>
    <script src="../../assets/js/mostrarAreaInfoPersonagem.js"></script>
    <script src="../../assets/js/alterarNomeFaseNomePersonagem.js"></script>
    <script src="../../assets/js/mostrarMenuLateralCard.js"></script>

</body>
</html>