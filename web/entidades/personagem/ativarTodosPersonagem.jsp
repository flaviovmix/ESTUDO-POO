                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
String thumb = request.getParameter("capa");
    Connection conecta;
    PreparedStatement comando;

    Class.forName("org.postgresql.Driver");
    conecta = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/banco", "postgres", "masterkey"
    );
    comando = conecta.prepareStatement("DO $$ DECLARE personagem_id INT; fase_id INT; BEGIN FOR personagem_id IN 1..14 LOOP"
            + " FOR fase_id IN (SELECT pf.fase FROM personagem_fase pf WHERE pf.personagem = personagem_id) LOOP"
            + " UPDATE fase SET quebra_cabeca_1_ativo = 1 WHERE codigo = fase_id;"
            + " UPDATE fase SET quebra_cabeca_2_ativo = 1 WHERE codigo = fase_id;"
            + " UPDATE fase SET quebra_cabeca_3_ativo = 1 WHERE codigo = fase_id;"
            + " UPDATE fase SET quebra_cabeca_4_ativo = 1 WHERE codigo = fase_id;"
            + " UPDATE fase SET quebra_cabeca_5_ativo = 1 WHERE codigo = fase_id;"
            + " END LOOP;"
            + " UPDATE personagem SET ativo = 1 WHERE codigo = personagem_id;"
            + " END LOOP; END $$;");

    comando.executeUpdate();

    response.sendRedirect("listarPersonagem.jsp?capa=" + thumb);












%>