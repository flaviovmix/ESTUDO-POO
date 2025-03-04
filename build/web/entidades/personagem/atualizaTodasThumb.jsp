<%@page import="java.sql.ResultSet"%>   
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%//CONECTAR COM O BANDO DE DADOS
    
    String thumb = request.getParameter("thumb");
    String persongem = request.getParameter("personagem");
    
    request.getParameter("capa");
    Connection conecta;
    PreparedStatement comando;

    Class.forName("org.postgresql.Driver");
    conecta = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/banco", "postgres", "masterkey"
    );

    comando = conecta.prepareStatement("UPDATE personagem SET thumb = " + thumb + ";");

    comando.executeUpdate();
    response.sendRedirect("listarPersonagem.jsp");
    
%>