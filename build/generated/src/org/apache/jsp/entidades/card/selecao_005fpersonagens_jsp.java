package org.apache.jsp.entidades.card;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Connection;
import app.core.Conexao;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

public final class selecao_005fpersonagens_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/entidades/card/../../interface/navbarAzul.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

    
    //THUMBS SORTEDAS OU FIXA
    //int thumbSorteada = 1 + (int)(Math.random() * 8);
    int thumbSorteada = 1;
    
    //FACES SORTEDAS OU FIXA
    //int faceSorteada = 1 + (int)(Math.random() * 8);
    int faceSorteada = 1;
    
    
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"pt-br\">\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("        <title>Novo Card</title>\r\n");
      out.write("    \r\n");
      out.write("        <link id=\"tema\" rel=\"stylesheet\" href=\"../../assets/css/temas/variaveis-tema-claro.css\">  \r\n");
      out.write("        <link rel=\"stylesheet\" href=\"../../assets/css/css-card/ajustes/normalize.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"../../assets/css/nav/barra-menu.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"../../assets/css/nav/footer.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"../../assets/css/css-card/ajustes/responsividade.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"../../assets/css/css-card/card.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"../../assets/css/css-card/area-info-personagem.css\">\r\n");
      out.write("    </head>\r\n");
      out.write("<body>\r\n");
      out.write("    \r\n");
      out.write("<nav class=\"menu-principal\">\r\n");
      out.write("\r\n");
      out.write("    <ul class=\"menu\">\r\n");
      out.write("        <li>\r\n");
      out.write("            <a href=\"");
      out.print( request.getContextPath());
      out.write("/entidades/aluno/listarAluno.jsp\">ALUNOS</a>\r\n");
      out.write("        </li>\r\n");
      out.write("        <li>\r\n");
      out.write("            <a href=\"");
      out.print( request.getContextPath());
      out.write("/entidades/vegetais/listarVegetais.jsp\">VEGETAIS</a>\r\n");
      out.write("        </li>\r\n");
      out.write("        <li>\r\n");
      out.write("            <a href=\"");
      out.print( request.getContextPath());
      out.write("/entidades/card/selecao_personagens.jsp\">GAROTAS PIX</a>\r\n");
      out.write("        </li>        \r\n");
      out.write("        <li>\r\n");
      out.write("             <a href=\"");
      out.print( request.getContextPath());
      out.write("/entidades/personagem/listarPersonagem.jsp\">GAROTAS</a>\r\n");
      out.write("            <ul class=\"submenu\">\r\n");
      out.write("                <li><hr></li>\r\n");
      out.write("                <li>\r\n");
      out.write("                    <a href=\"");
      out.print( request.getContextPath());
      out.write("/entidades/personagem/zerarPersonagem.jsp?\">\r\n");
      out.write("                        <span>ZERAR TODAS</span>\r\n");
      out.write("                        <img class=\"emoje-menu inativo\" src=\"../../assets/img/emoje-2.png\" />\r\n");
      out.write("                    </a>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li>\r\n");
      out.write("                    <a href=\"");
      out.print( request.getContextPath());
      out.write("/entidades/personagem/ativarTodosPersonagem.jsp\">\r\n");
      out.write("                        <span>ATIVAR TODAS</span>\r\n");
      out.write("                        <img class=\"emoje-menu\" src=\"../../assets/img/emoje-5.png\" />\r\n");
      out.write("                    </a>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li><hr></li>\r\n");
      out.write("                <li>\r\n");
      out.write("                    <a href=\"");
      out.print( request.getContextPath());
      out.write("/entidades/personagem/atualizaTodasThumb.jsp?thumb=1\">\r\n");
      out.write("                        <span>CAPA COMO FASE 1</span>\r\n");
      out.write("                        <img class=\"emoje-menu\" src=\"../../assets/img/emoje-1.png\" />\r\n");
      out.write("                    </a>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li>\r\n");
      out.write("                    <a href=\"");
      out.print( request.getContextPath());
      out.write("/entidades/personagem/atualizaTodasThumb.jsp?thumb=2\">\r\n");
      out.write("                        <span>CAPA COMO FASE 2</span>\r\n");
      out.write("                        <img class=\"emoje-menu\" src=\"../../assets/img/emoje-2.png\" />\r\n");
      out.write("                    </a>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li>\r\n");
      out.write("                    <a href=\"");
      out.print( request.getContextPath());
      out.write("/entidades/personagem/atualizaTodasThumb.jsp?thumb=3\">\r\n");
      out.write("                        <span>CAPA COMO FASE 3</span>\r\n");
      out.write("                        <img class=\"emoje-menu\" src=\"../../assets/img/emoje-3.png\" />\r\n");
      out.write("                    </a>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li>\r\n");
      out.write("                    <a href=\"");
      out.print( request.getContextPath());
      out.write("/entidades/personagem/atualizaTodasThumb.jsp?thumb=4\">\r\n");
      out.write("                        <span>CAPA COMO FASE 4</span>\r\n");
      out.write("                        <img class=\"emoje-menu\" src=\"../../assets/img/emoje-4.png\" />\r\n");
      out.write("                    </a>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li>\r\n");
      out.write("                    <a href=\"");
      out.print( request.getContextPath());
      out.write("/entidades/personagem/atualizaTodasThumb.jsp?thumb=5\">\r\n");
      out.write("                        <span>CAPA COMO FASE 5</span>\r\n");
      out.write("                        <img class=\"emoje-menu\" src=\"../../assets/img/emoje-5.png\" />\r\n");
      out.write("                    </a>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li><hr></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("        </li>\r\n");
      out.write("        <li><a href=\"");
      out.print( request.getContextPath());
      out.write("/entidades/todo/todoist.jsp\">TO-DO</a>\r\n");
      out.write("        </li>\r\n");
      out.write("    </ul>\r\n");
      out.write("\r\n");
      out.write("    <button id=\"btnTema\" onclick=\"mudarTema()\">Mudar para modo escuro</button>\r\n");
      out.write("</nav>");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    <main>\r\n");
      out.write("        <div class=\"container-xl\">\r\n");
      out.write("            \r\n");

    String obs = null;
    String thumb = null;
    //boolean primeiro = true;
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


      out.write("            \r\n");
      out.write("            \r\n");
      out.write("            <div class=\"card card-selecionado\">\r\n");
      out.write("\r\n");
      out.write("                <div class=\"menu-lateral-card\">\r\n");
      out.write("                    <div class=\"area-icones-thumb\">\r\n");
      out.write("                        <a href=\"#\"><img src=\"../../assets/pixel_ai/t-5.png\" title=\"Aqui vai uma explicação.\"  alt=\"\"></a>\r\n");
      out.write("                        <a href=\"#\"><img src=\"../../assets/pixel_ai/t-5.png\" title=\"Aqui vai uma explicação.\"  alt=\"\"></a>\r\n");
      out.write("                        <a href=\"#\"><img src=\"../../assets/pixel_ai/t-5.png\" title=\"Aqui vai uma explicação.\"  alt=\"\"></a>\r\n");
      out.write("                        <a href=\"#\"><img src=\"../../assets/pixel_ai/t-5.png\" title=\"Aqui vai uma explicação.\"  alt=\"\"></a>\r\n");
      out.write("                        <a href=\"#\"><img src=\"../../assets/pixel_ai/t-4.png\" title=\"Aqui vai uma explicação.\"  alt=\"\"></a>\r\n");
      out.write("                        <a href=\"#\"><img src=\"../../assets/pixel_ai/t-3.png\" title=\"Aqui vai uma explicação.\"  alt=\"\"></a>\r\n");
      out.write("                        <a href=\"#\"><img src=\"../../assets/pixel_ai/t-2.png\" title=\"Aqui vai uma explicação.\"  alt=\"\"></a>\r\n");
      out.write("                        <a href=\"#\"><img src=\"../../assets/pixel_ai/t-1.png\" title=\"Aqui vai uma explicação.\"  alt=\"\"></a>\r\n");
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"controle-card\">\r\n");
      out.write("                        <a href=\"#\"><img class=\"svg\" src=\"../../assets/svg/apagar.svg\" alt=\"\"></a>\r\n");
      out.write("                        <a href=\"#\"><img class=\"svg\" src=\"../../assets/svg/compartilhar.svg\" alt=\"\"></a>\r\n");
      out.write("                        <a href=\"#\"><img class=\"svg\" src=\"../../assets/svg/editar.svg\" alt=\"\"></a>\r\n");
      out.write("                        <a href=\"#\"><img class=\"svg\" src=\"../../assets/svg/baixar.svg\" alt=\"\"></a>\r\n");
      out.write("                        \r\n");
      out.write("                    </div>        \r\n");
      out.write("                                \r\n");
      out.write("                    <div class=\"controle-card\">\r\n");
      out.write("                        <a href=\"#\"><img class=\"svg lixeira\" src=\"../../assets/svg/lixeira.svg\" alt=\"\"></a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"menu-bolinha btnMenuBolinhaCard amostra\">\r\n");
      out.write("                    <svg version=\"1.1\" id=\"Capa_1\" xmlns=\"http://www.w3.org/2000/svg\"\r\n");
      out.write("                        xmlns:xlink=\"http://www.w3.org/1999/xlink\" x=\"0px\" y=\"0px\" width=\"349.569px\" height=\"349.569px\"\r\n");
      out.write("                        viewBox=\"0 0 349.569 349.569\" style=\"enable-background:new 0 0 349.569 349.569;\"\r\n");
      out.write("                        xml:space=\"preserve\">\r\n");
      out.write("                        <g>\r\n");
      out.write("                            <g>\r\n");
      out.write("                                <circle cx=\"39.081\" cy=\"54.785\" r=\"39.081\" />\r\n");
      out.write("                                <circle cx=\"39.081\" cy=\"174.785\" r=\"39.081\" />\r\n");
      out.write("                                <circle cx=\"39.081\" cy=\"294.785\" r=\"39.081\" />\r\n");
      out.write("                                <g>\r\n");
      out.write("                                    <path d=\"M344.569,20.535H113.581c-2.757,0-5,2.243-5,5v58.5c0,2.757,2.243,5,5,5h230.988c2.757,0,5-2.243,5-5v-58.5\r\n");
      out.write("                                    C349.569,22.778,347.326,20.535,344.569,20.535z\" />\r\n");
      out.write("                                    <path d=\"M344.569,140.535H113.581c-2.757,0-5,2.243-5,5v58.5c0,2.757,2.243,5,5,5h230.988c2.757,0,5-2.243,5-5v-58.5\r\n");
      out.write("                                    C349.569,142.778,347.326,140.535,344.569,140.535z\" />\r\n");
      out.write("                                    <path d=\"M344.569,260.535H113.581c-2.757,0-5,2.243-5,5v58.5c0,2.757,2.243,5,5,5h230.988c2.757,0,5-2.243,5-5v-58.5\r\n");
      out.write("                                    C349.569,262.778,347.326,260.535,344.569,260.535z\" />\r\n");
      out.write("                                </g>\r\n");
      out.write("                            </g>\r\n");
      out.write("                        </g>\r\n");
      out.write("                    </svg>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"conteudo-card\">\r\n");
      out.write("                    <div class=\"area-info-personagem\" id=\"areaInfoPersonagem\">\r\n");
      out.write("                        <div class=\"cabecalho\">\r\n");
      out.write("                            <img class=\"bandeira\" src=\"../assets/pixel_ai/Brasil.png\" alt=\"\">\r\n");
      out.write("                            <div class=\"are-face\">\r\n");
      out.write("                                <img class=\"face\" src=\"../../assets/pixel_ai/");
      out.print( thumb );
      out.write('.');
      out.print( faceSorteada );
      out.write(".png\" alt=\"\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                                \r\n");
      out.write("                            <div class=\"classificacao\">\r\n");
      out.write("                                <a href=\"#\"><img src=\"../../assets/pixel_ai/ESTRELA_1-4.png\" alt=\"\"></a>\r\n");
      out.write("                                <a href=\"#\"><img src=\"../../assets/pixel_ai/ESTRELA_1-4.png\" alt=\"\"></a>\r\n");
      out.write("                                <a href=\"#\"><img src=\"../../assets/pixel_ai/ESTRELA_1-4.png\" alt=\"\"></a>\r\n");
      out.write("                                <a href=\"#\"><img src=\"../../assets/pixel_ai/ESTRELA_1-4.png\" alt=\"\"></a>\r\n");
      out.write("                                <a href=\"#\"><img src=\"../../assets/pixel_ai/ESTRELA_5.png\" alt=\"\"></a>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                            \r\n");
      out.write("                            \r\n");
      out.write("                            \r\n");
      out.write("                        <div class=\"tabela\">\r\n");
      out.write("                            <table>\r\n");
      out.write("                                <tbody>\r\n");
      out.write("                                    \r\n");

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

      out.write("                                    \r\n");
      out.write("                                  <tr><td class=\"chave\"><strong>");
      out.print( chaveFormatada );
      out.write(":</strong></td><td>");
      out.print( valorAttr );
      out.write("</td></tr>\r\n");

        }

        if (obs != null) {

      out.write("\r\n");
      out.write("                                  <tr class=\"obs\"><td colspan=\"2\" class=\"obs\">");
      out.print( obs );
      out.write("</td></tr>\r\n");
      out.write("                                \r\n");

        }

      out.write("\r\n");
      out.write("                                  \r\n");
      out.write("                                </tbody>\r\n");
      out.write("                              </table>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    \r\n");
      out.write("                    <img class=\"img-principal\" src=\"../../assets/pixel_ai/");
      out.print( thumb );
      out.write('.');
      out.print( thumbSorteada );
      out.write(".png\" />\r\n");
      out.write("                    <div class=\"area-titulo-da-fase mostrar\" id=\"area-titulo-da-fase\">\r\n");
      out.write("                        <span id=\"areaTituloTexto\">");
      out.print( nomeAtual );
      out.write("</span>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"area-link-fases\">\r\n");
      out.write("                    <a href=\"../jogo/quebra-cabeça.html\" data-titulo=\"TRAJES NORMAIS\"><img class=\"icone\" src=\"../../assets/pixel_ai/emoje-1.png\" /></a>\r\n");
      out.write("                    <a href=\"../jogo/quebra-cabeça.html\" data-titulo=\"ACADEMIA\"><img class=\"icone\" src=\"../../assets/pixel_ai/emoje-2.png\" /></a>\r\n");
      out.write("                    <a href=\"../jogo/quebra-cabeça.html\" data-titulo=\"PRAIA\"><img class=\"icone\" src=\"../../assets/pixel_ai/emoje-3.png\" /></a>\r\n");
      out.write("                    <a href=\"../jogo/quebra-cabeça.html\" data-titulo=\"PISCINA\"><img class=\"icone\" src=\"../../assets/pixel_ai/emoje-4.png\" /></a>\r\n");
      out.write("                    <a href=\"../jogo/quebra-cabeça.html\" data-titulo=\"LENDO\"><img class=\"icone\" src=\"../../assets/pixel_ai/emoje-5.png\" /></a>\r\n");
      out.write("                    <a href=\"../jogo/quebra-cabeça.html\" data-titulo=\"DORMINDO\"><img class=\"icone\" src=\"../../assets/pixel_ai/emoje-6.png\" /></a>\r\n");
      out.write("                    <a href=\"../jogo/quebra-cabeça.html\" data-titulo=\"BANHO\"><img class=\"icone\" src=\"../../assets/pixel_ai/emoje-7.png\" /></a>\r\n");
      out.write("                    <a href=\"../jogo/quebra-cabeça.html\" data-titulo=\"NUA\"><img class=\"icone\" src=\"../../assets/pixel_ai/emoje-8.png\" /></a>\r\n");
      out.write("                </div>    \r\n");
      out.write("\r\n");
      out.write("            </div>            \r\n");
      out.write("\r\n");
      out.write(" ");

    } // fim while

      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("    </main>\r\n");
      out.write("            <footer>\r\n");
      out.write("            <p> TODOS OS DIREITOS RESERVADOS</p>\r\n");
      out.write("        </footer>\r\n");
      out.write("    <script src=\"../../assets/js/mostrarAreaInfoPersonagem.js\"></script>\r\n");
      out.write("    <script src=\"../../assets/js/alterarNomeFaseNomePersonagem.js\"></script>\r\n");
      out.write("    <script src=\"../../assets/js/mostrarMenuLateralCard.js\"></script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
