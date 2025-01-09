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
            //PEGANDO OS DADOS ENVIADO PELO FORMULARIO;
            Integer codigo = Integer.parseInt(request.getParameter("codigo"));
            String nome = request.getParameter("nome");
            String conjuge = request.getParameter("conjuge");
            String cpf = request.getParameter("cpf");
            String telefone = request.getParameter("telefone");
            String email = request.getParameter("email");
            String cep = request.getParameter("cep");
            String cidade = request.getParameter("cidade");
            String estado = request.getParameter("estado");
            String endereco = request.getParameter("endereco");
            String numero = request.getParameter("numero");
            String obs = request.getParameter("obs");

            String data_nascimentooStr = request.getParameter("data_nascimento");
            Date data_nascimento = Date.valueOf(data_nascimentooStr);

            try {
                //CONECTAR COM O BANDO DE DADOS
                Connection conecta;

                Class.forName("org.postgresql.Driver");
                conecta = DriverManager.getConnection(
                        "jdbc:postgresql://localhost:5432/regis", "postgres", "masterkey"
                );

                PreparedStatement comando;
                comando = conecta.prepareStatement(
                        "UPDATE cliente set nome = ?, conjuge = ?, cpf = ?, telefone = ?, email = ?, cep = ?, cidade = ?, estado = ?, endereco = ?, numero = ?, data_nascimento = ?, obs = ?  WHERE codigo=?"
                );

                comando.setString(1, nome);
                comando.setString(2, conjuge);
                comando.setString(3, cpf);
                comando.setString(4, telefone);
                comando.setString(5, email);
                comando.setString(6, cep);
                comando.setString(7, cidade);
                comando.setString(8, estado);
                comando.setString(9, endereco);
                comando.setString(10, numero);
                comando.setDate(11, data_nascimento);
                comando.setString(12, obs);
                comando.setInt(13, codigo);
                comando.executeUpdate();
                
            } catch (Exception x) {
                String erro = x.getMessage();
                    out.print("Aluno já cadastrado");
                if(erro.contains("Duplicate entry")) {
                    out.print("Mensagem de erro: " + erro);
                } else {
                    
                }
                out.print("Erro: " + x.getMessage());
            }

            response.sendRedirect("listarAluno.jsp");
        %>
    </body>
</html>
