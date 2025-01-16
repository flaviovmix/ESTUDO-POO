package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import funcoes.icones;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Connection;

public final class listarAluno_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    request.setCharacterEncoding("UTF-8");
    String campoBuscado = request.getParameter("campoBuscado") != null && !request.getParameter("campoBuscado").isEmpty()
            ? request.getParameter("campoBuscado")
            : "";

    String infoBuscada = request.getParameter("infoBuscada") != null && !request.getParameter("infoBuscada").isEmpty()
            ? request.getParameter("infoBuscada")
            : "";

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>TODO supply a title</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("\n");
      out.write("        <link href=\"assets/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"style.css\" rel=\"stylesheet\">     \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container-xl\"> \n");
      out.write("            <h2 class=\"d-none d-md-block\">LISTAGEM DE ALUNOS</h2>   \n");
      out.write("            <h2 class=\"d-block d-md-none h2-celular\">LISTAGEM DE ALUNOS</h2>   \n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-2 d-block d-md-none\">\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-8 d-block d-md-none\">\n");
      out.write("                    <a class=\"btn btn-success link-botao botaonovo-small\" href=\"FormCadastroAluno.html\">Novo Aluno</a>     \n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-2 d-block d-md-none\">\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-3 d-none d-md-table-cell\">\n");
      out.write("                    <a class=\"btn btn-success link-botao\" href=\"FormCadastroAluno.html\">Novo Aluno</a>     \n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <form  class=\"col-md-7\" method=\"post\" action=\"listarAluno.jsp\">\n");
      out.write("                    <div>\n");
      out.write("                        <div class=\"input-group mb-2\">\n");
      out.write("                            <select id=\"inputState\" name=\"campoBuscado\">\n");
      out.write("                                <option ");
if (campoBuscado.equals("Nome")) {
                                        out.print("selected");
                                    }
      out.write(">Nome\n");
      out.write("                                </option>\n");
      out.write("                                \n");
      out.write("                                <option ");
if (campoBuscado.equals("Codigo")) {
                                        out.print("selected");
                                    }
      out.write(">Codigo\n");
      out.write("                                </option>\n");
      out.write("\n");
      out.write("                                <option ");
if (campoBuscado.equals("Conjuge")) {
                                        out.print("selected");
                                    }
      out.write(">Conjuge\n");
      out.write("                                </option>\n");
      out.write("\n");
      out.write("                                <option ");
if (campoBuscado.equals("CPF")) {
                                        out.print("selected");
                                    }
      out.write(">CPF\n");
      out.write("                                </option>\n");
      out.write("\n");
      out.write("                                <option ");
if (campoBuscado.equals("Telefone")) {
                                        out.print("selected");
                                    }
      out.write(">Telefone\n");
      out.write("                                </option>\n");
      out.write("\n");
      out.write("                                <option ");
if (campoBuscado.equals("Email")) {
                                        out.print("selected");
                                    }
      out.write(">Email\n");
      out.write("                                </option>\n");
      out.write("                            </select>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" id=\"infoBuscada\" name=\"infoBuscada\" value=\"\" placeholder=\"faça sua busca aqui, vazio para todos\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            <table class=\"table\">\n");
      out.write("                <thead>\n");
      out.write("                    <tr>\n");
      out.write("\n");
      out.write("                        <th scope=\"col\" style=\"width: 3%;\">#</th>\n");
      out.write("                        <th scope=\"col\" style=\"width: 30%;\">Nome</th>\n");
      out.write("                        <th scope=\"col\" style=\"width: 15%;\" class=\"d-none d-md-table-cell\">CPF</th>\n");
      out.write("                        <th scope=\"col\" style=\"width: 20%;\" class=\"d-none d-lg-table-cell\">email</th>\n");
      out.write("                        <th scope=\"col\" style=\"width: 15%;\" class=\"d-none d-md-table-cell\">Telefone</th>\n");
      out.write("                        <th scope=\"col\" style=\"width: 10%;\" class=\"text-center\">Editar</th>\n");
      out.write("                        <th scope=\"col\" style=\"width: 5%;\" class=\"text-center\">Deletar</th>\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("\n");
      out.write("                <tbody class=\"table-group-divider\">\n");
      out.write("\n");
      out.write("                    ");

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

                    
      out.write("\n");
      out.write("\n");
      out.write("                </tbody>\n");
      out.write("\n");
      out.write("\n");
      out.write("            </table>\n");
      out.write("\n");
      out.write("\n");
      out.write("            <!-- Button trigger modal -->\n");
      out.write("            <button type=\"button\" class=\"btn btn-primary\" data-bs-toggle=\"modal\" data-bs-target=\"#staticBackdrop\">\n");
      out.write("                Launch static backdrop modal\n");
      out.write("            </button>\n");
      out.write("\n");
      out.write("            <!-- Modal -->\n");
      out.write("            <div class=\"modal fade\" id=\"staticBackdrop\" data-bs-backdrop=\"static\" data-bs-keyboard=\"false\" tabindex=\"-1\" aria-labelledby=\"staticBackdropLabel\" aria-hidden=\"true\">\n");
      out.write("                <div class=\"modal-dialog\">\n");
      out.write("                    <div class=\"modal-content\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <h4 class=\"modal-title fs-5\" id=\"staticBackdropLabel\">Tem certeza que deseja excluir o registro:</h4>\n");
      out.write("                            <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-body\">\n");
      out.write("                            <p><span>Nome completo: </span> Flávio José dos Passos</p>\n");
      out.write("                            <p><span>Conjuge: </span>Adriely Baldo Sotele dos Passos</p>\n");
      out.write("                            <p><span>CPF: </span> 114.897.999-83</p>\n");
      out.write("                            <p><span>Email: </span> flaviovmix@gmail</p>\n");
      out.write("                            <p><span>Data Fabricação:</span> 05/11/1982</p>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-footer\">  \n");
      out.write("                            <div class=\"col-12 text-center\">\n");
      out.write("                                <button type=\"button\" class=\"btn btn-danger col-5\">Excluir</button>\n");
      out.write("                                <button type=\"button\" class=\"btn btn-primary col-5\" data-bs-dismiss=\"modal\">Editar</button>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>              \n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <script src=\"assets/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("        <script>\n");
      out.write("            document.addEventListener(\"DOMContentLoaded\", function () {\n");
      out.write("                document.getElementById(\"infoBuscada\").focus();\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
