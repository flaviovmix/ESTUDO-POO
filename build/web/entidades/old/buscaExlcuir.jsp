<%@page import="java.util.List"%>
<%@page import="Aluno.AlunoBean"%>
<%@page import="Aluno.AlunoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int codigo = (Integer.parseInt(request.getParameter("codigo")));
            
            String busca;
            busca = "SELECT * FROM aluno where codigo = " + codigo;
            
            AlunoDAO dao = new AlunoDAO();
            dao.listarAlunos(busca);
            
            AlunoDAO alunoDAO = new AlunoDAO(); 
            List<AlunoBean> alunos = alunoDAO.listarAlunos(busca);
            for (AlunoBean aluno : alunos) {
                 out.print(aluno.getNome());
            }

            
//            response.sendRedirect("listarAluno.jsp");
        %>

    </body>
</html>
