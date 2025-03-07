<%@page import="Usuario.UsuarioDAO"%>
<%@page import="Usuario.UsuarioBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    UsuarioBean usuario = new UsuarioBean();
    usuario.setPrimeiroNomeOuApelido(request.getParameter("primeiroNomeOuApelido"));
    usuario.setUsuario(request.getParameter("usuario"));
    usuario.setEmail(request.getParameter("email"));
    usuario.setPassword(request.getParameter("senha"));
    
    UsuarioDAO dao = new UsuarioDAO();
    dao.adicionarUsuario(usuario);
    
    response.sendRedirect(request.getContextPath()+ "/index.jsp");
%>
