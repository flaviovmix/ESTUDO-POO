<%@page import="Todo.TarefaDAO"%>
<%@page import="Todo.TarefaBean"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            TarefaBean tarefa = new TarefaBean();
            tarefa.setCodigo(Integer.parseInt(request.getParameter("codigo")));
            Integer ativa = (Integer.parseInt(request.getParameter("ativa")));
            
            if (ativa == 0){
                tarefa.setAtiva(1);
            } else {
                tarefa.setAtiva(0);
            }          
            TarefaDAO dao = new TarefaDAO();
            dao.ativarOuDesativarTarefa(tarefa);

            response.sendRedirect("todoist.jsp");
        %>
    </body>
</html>
