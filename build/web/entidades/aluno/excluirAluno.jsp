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
            int codigo = Integer.parseInt(request.getParameter("codigo"));

//            AlunoBean aluno = new AlunoBean();            
            AlunoDAO dao = new AlunoDAO();
            dao.excluirAlunos(codigo);
            
            response.sendRedirect("listarAluno.jsp");
        %>
    </body>
</html>
