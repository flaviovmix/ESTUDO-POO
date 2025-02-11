<%@page import="Todo.TarefaDAO"%>
<%@page import="Todo.TarefaBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            TarefaBean tarefa = new TarefaBean();
            
            tarefa.setTarefa(request.getParameter("nome"));
            
            String dataStr = request.getParameter("data");
            java.sql.Date data = null;
            data = java.sql.Date.valueOf(dataStr);
            tarefa.setData(data);
            
            String concluidoParam = request.getParameter("concluido");
            int concluido = (concluidoParam != null) ? Integer.parseInt(concluidoParam) : 0;
            tarefa.setAtiva(concluido);
            
            TarefaDAO dao = new TarefaDAO();
            dao.adicionarTarefa(tarefa);
            
            response.sendRedirect("todoist.jsp");
        %>
    </body>
</html>
