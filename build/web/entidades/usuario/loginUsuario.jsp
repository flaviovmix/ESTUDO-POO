
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="Usuario.UsuarioBean"%>
<%@page import="Usuario.UsuarioDAO"%>
<%
    String usuarioForm = request.getParameter("usuario");
    String senhaForm = request.getParameter("senha");

    String sql = "SELECT * FROM usuario WHERE usuario = '" + usuarioForm + "'";
    System.out.println(sql);

    UsuarioDAO dao = new UsuarioDAO();
    UsuarioBean usuarioBanco = dao.buscarUsuario(sql);

    if (usuarioBanco != null && usuarioBanco.getUsuario().equals(usuarioForm) && usuarioBanco.getPassword().equals(senhaForm)) {
        response.sendRedirect(request.getContextPath() + "/entidades/personagem/listarPersonagem.jsp");
    } else {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

%>
