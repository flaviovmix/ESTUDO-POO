<%@page import="Aluno.Aluno"%>
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

            String data_nascimentooStr = request.getParameter("data_nascimento");
            Date data_nascimento = Date.valueOf(data_nascimentooStr);
            
            String obs = request.getParameter("obs");

            Aluno cliente = new Aluno();
            cliente.setNome(nome);
            cliente.setConjuge(conjuge);
            cliente.setCpf(cpf);
            cliente.setTelefone(telefone);
            cliente.setEmail(email);
            cliente.setCep(cep);
            cliente.setCidade(cidade);
            cliente.setEstado(estado);
            cliente.setEndereco(endereco);
            cliente.setNumero(numero);
            cliente.setData_nascimento(data_nascimento);
            cliente.setObs(obs);
            
            try {
                //CONECTAR COM O BANDO DE DADOS
                Connection conecta;

                Class.forName("org.postgresql.Driver");
                conecta = DriverManager.getConnection(
                        "jdbc:postgresql://localhost:5432/regis", "postgres", "masterkey"
                );

                PreparedStatement comando;
                comando = conecta.prepareStatement(
                        "INSERT INTO cliente (nome, conjuge, cpf, telefone, email, cep, cidade, estado, endereco, numero, data_nascimento, obs) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
                );

                comando.setString(1, cliente.getNome());
                comando.setString(2, cliente.getConjuge());
                comando.setString(3, cliente.getCpf());
                comando.setString(4, cliente.getTelefone());
                comando.setString(5, cliente.getEmail());
                comando.setString(6, cliente.getCep());
                comando.setString(7, cliente.getCidade());
                comando.setString(8, cliente.getEstado());
                comando.setString(9, cliente.getEndereco());
                comando.setString(10, cliente.getNumero());
                comando.setDate(11, data_nascimento);
                comando.setString(12, cliente.getObs());
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
