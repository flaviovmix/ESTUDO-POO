<%@page import="Personagem.PersonagemDAO"%>
<%@page import="Personagem.PersonagemBean"%>
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
            PersonagemBean personagem = new PersonagemBean();
            
            personagem.setNome(request.getParameter("nome"));
            personagem.setNomeArquivo(request.getParameter("imageInput"));
            personagem.setNacionalidade(request.getParameter("nacionalidade"));
            personagem.setOrientacaoSexual(request.getParameter("orientacaoSexual"));
            personagem.setEstadoCivil(request.getParameter("estadoCivil"));
            personagem.setPeso(Double.parseDouble(request.getParameter("peso")));
            personagem.setQuadil(Double.parseDouble(request.getParameter("quadil")));
            personagem.setBusto(Double.parseDouble(request.getParameter("busto")));
            personagem.setAltura(Double.parseDouble(request.getParameter("altura")));
            personagem.setHobbie(request.getParameter("hobbie"));
            personagem.setObs(request.getParameter("obs"));
            
            String data_nascimentooStr = request.getParameter("data_nascimento");
            Date data_nascimento = Date.valueOf(data_nascimentooStr);
            
            PersonagemDAO dao = new PersonagemDAO();
            dao.adicionarPersonagem(personagem);
           
            response.sendRedirect("listarPersonagem.jsp");
        %>
    </body>
</html>
