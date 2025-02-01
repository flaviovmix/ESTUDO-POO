<%@page import="java.sql.Date"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            int codigo;
            codigo = Integer.parseInt(request.getParameter("codigo"));
            
            try {
                //CONECTAR COM O BANDO DE DADOS
                Connection conecta;

                Class.forName("org.postgresql.Driver");
                conecta = DriverManager.getConnection(
                        "jdbc:postgresql://localhost:5432/banco", "postgres", "masterkey"
                );

                PreparedStatement comando;
                comando = conecta.prepareStatement(
                        "DELETE FROM aluno WHERE codigo=?"
                );
                comando.setInt(1, codigo);
                comando.executeUpdate();
                
            } catch (Exception x) {
                String erro = x.getMessage();
                    out.print("Aluno já cadastrado");
                if(erro.contains("Duplicate entry")) {
                    out.print("Mensagem de erro: " + erro);
                } else {
                    out.print("Erro: " + x.getMessage());    
                }
            }

            response.sendRedirect("listarAluno.jsp");
        %>
    </body>
</html>
