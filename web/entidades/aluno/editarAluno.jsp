<%@page import="Aluno.AlunoDAO"%>
<%@page import="Aluno.AlunoBean"%>
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
            //String data_nascimentooStr = request.getParameter("data_nascimento");
            //Date data_nascimento = Date.valueOf(data_nascimentooStr);
            
            AlunoBean aluno = new AlunoBean();
            aluno.setCodigo(Integer.parseInt(request.getParameter("codigo")));
            aluno.setNome(request.getParameter("nome"));
            aluno.setConjuge(request.getParameter("conjuge"));
            aluno.setCpf(request.getParameter("cpf"));
            aluno.setTelefone(request.getParameter("telefone"));
            aluno.setEmail(request.getParameter("email"));
            aluno.setCep(request.getParameter("cep"));
            aluno.setCidade(request.getParameter("cidade"));
            aluno.setEstado(request.getParameter("estado"));
            aluno.setEndereco(request.getParameter("endereco"));
            aluno.setNumero(request.getParameter("numero"));
            aluno.setObs(request.getParameter("obs"));
            
            AlunoDAO dao = new AlunoDAO();
            dao.editarAluno(aluno);

            response.sendRedirect("listarAluno.jsp");
        %>
    </body>
</html>
