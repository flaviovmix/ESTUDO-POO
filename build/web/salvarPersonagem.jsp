<%@page import="Personagem.Personagem"%>
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
            String nomeArquivo = request.getParameter("imageInput");
            String nacionalidade = request.getParameter("nacionalidade");
            String orientacaoSexual = request.getParameter("orientacaoSexual");
            String estadoCivil = request.getParameter("estadoCivil");
            double peso = Double.parseDouble(request.getParameter("peso"));
            double quadil = Double.parseDouble(request.getParameter("quadil"));
            double busto = Double.parseDouble(request.getParameter("busto"));
            double altura = Double.parseDouble(request.getParameter("altura"));
            String hobbie = request.getParameter("hobbie");

            String data_nascimentooStr = request.getParameter("data_nascimento");
            Date data_nascimento = Date.valueOf(data_nascimentooStr);
            
            String obs = request.getParameter("obs");

            Personagem personagem = new Personagem();
            personagem.setNome(nome);
            personagem.setNomeArquivo(nomeArquivo);
            personagem.setNacionalidade(nacionalidade);
            personagem.setOrientacaoSexual(orientacaoSexual);
            personagem.setEstadoCivil(estadoCivil);
            personagem.setPeso(peso);
            personagem.setQuadil(quadil);
            personagem.setBusto(busto);
            personagem.setAltura(altura);
            personagem.setHobbie(hobbie);
            personagem.setData_nascimento(data_nascimento);
            personagem.setObs(obs);
            
            try {
                //CONECTAR COM O BANDO DE DADOS
                Connection conecta;

                Class.forName("org.postgresql.Driver");
                conecta = DriverManager.getConnection(
                        "jdbc:postgresql://localhost:5432/banco", "postgres", "masterkey"
                );

                PreparedStatement comando;
                comando = conecta.prepareStatement(
                        "INSERT INTO personagem (nome, nomeArquivo, nacionalidade, orientacaoSexual, civil, peso, quadil, busto, altura, hobbie, nascimento, obs) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
                );

                comando.setString(1, personagem.getNome());
                comando.setString(2, personagem.getNomeArquivo());
                comando.setString(3, personagem.getNacionalidade());
                comando.setString(4, personagem.getOrientacaoSexual());
                comando.setString(5, personagem.getEstadoCivil());
                comando.setDouble(6, personagem.getPeso());
                comando.setDouble(7, personagem.getQuadil());
                comando.setDouble(8, personagem.getBusto());
                comando.setDouble(9, personagem.getAltura());
                comando.setString(10, personagem.getHobbie());
                comando.setDate(11, data_nascimento);
                comando.setString(12, personagem.getObs());
                comando.executeUpdate();
                
            } catch (Exception x) {
                String erro = x.getMessage();
                    out.print("Personagem já cadastrado");
                if(erro.contains("Duplicate entry")) {
                    out.print("Mensagem de erro: " + erro);
                } else {
                    
                }
                out.print("Erro: " + x.getMessage());
            }

            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
