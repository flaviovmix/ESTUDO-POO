<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Date"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="../../assets/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="../../assets/css/style.css" rel="stylesheet">        
    </head>
    <body>   
        <div class="container-xl">

            <%
                int codigo;
                codigo = Integer.parseInt(request.getParameter("codigo"));

                //CONECTAR COM O BANDO DE DADOS
                Connection conecta;

                Class.forName("org.postgresql.Driver");
                conecta = DriverManager.getConnection(
                        "jdbc:postgresql://localhost:5432/banco", "postgres", "masterkey"
                );

                PreparedStatement comando;
                comando = conecta.prepareStatement(
                        "SELECT * FROM aluno WHERE codigo=?"
                );
                comando.setInt(1, codigo);

                ResultSet resultado = comando.executeQuery();

                while (resultado.next()) {
            %>

            <form id="form_cliente" method="post" action="editarAluno.jsp">
                <h2>EDITAR ALUNO</h2>   
                <fieldset class="row g-3 cadastro">

                    <div class="col-md-6 d-none">
                        <label for="codigo" class="form-label">Codigo:</label>
                        <input type="text" class="form-control campo-texto" id="codigo" name="codigo" placeholder="" value="<%= resultado.getString("codigo")%>" required>
                    </div>                        

                    <div class="col-xxl-4 col-xl-4 col-lg-6 col-md-6 col-sm-8">
                        <label for="nome" class="form-label">Nome completo:</label>
                        <input type="text" class="form-control campo-texto" id="nome" name="nome" placeholder="" value="<%= resultado.getString("nome")%>" required>
                    </div>

                    <div class="col-xxl-2 col-xl-2 col-lg-3 col-md-3 col-sm-4">
                        <label for="telefone" class="form-label">Telefone:</label>
                        <input type="text" class="form-control campo-texto" id="telefone" name="telefone" placeholder="" value="<%= resultado.getString("telefone")%>" required>
                    </div>   


                    <div class="col-xxl-2 col-xl-2 col-lg-3 col-md-3 col-sm-4">
                        <label for="cpf" class="form-label">CPF:</label>
                        <input type="text" class="form-control campo-texto" id="cpf" name="cpf" placeholder="" value="<%= resultado.getString("cpf")%>" required>
                    </div>  

                    <div class="col-xxl-2 col-xl-2 col-lg-3 col-md-3 col-sm-4">
                        <label for="rg" class="form-label">RG:</label>
                        <input type="text" class="form-control campo-texto" id="rg" name="rg" placeholder="" value="114.897.999-83" required>
                    </div>  

                    <div class="col-xxl-2 col-xl-2 col-lg-3 col-md-3 col-sm-4">
                        <label for="data_nascimento" class="form-label">Data Nasc.:</label>
                        <input type="date" class="form-control campo-texto" id="data_nascimento" name="data_nascimento" placeholder="" value="<%= resultado.getString("data_nascimento")%>">
                    </div>   

                    <div class="col-xxl-3 col-xl-3 col-lg-6 col-md-6 col-sm-9">
                        <label for="email" class="form-label">E-mail:</label>
                        <input type="text" class="form-control campo-texto" id="email" name="email" placeholder="" value="<%= resultado.getString("email")%>" required>
                    </div>   

                    <div class="col-xxl-2 col-xl-2 col-lg-3 col-md-3 col-sm-3">
                        <label for="cep" class="form-label">CEP:</label>
                        <input type="text" class="form-control campo-texto" id="cep" name="cep" placeholder="" value="<%= resultado.getString("cep")%>" required>
                    </div>  

                    <div class="col-xxl-6 col-xl-6 col-lg-9 col-md-9 col-sm-12">
                        <label for="endereco" class="form-label">Endereço:</label>
                        <input type="text" class="form-control campo-texto" id="endereco" name="endereco" placeholder="" value="<%= resultado.getString("endereco")%>" required>
                    </div>

                    <div class="col-xxl-1 col-xl-1 col-lg-2 col-md-2 col-sm-3">
                        <label for="numero" class="form-label">Número:</label>
                        <input type="text" class="form-control campo-texto" id="numero" name="numero" placeholder="" value="<%= resultado.getString("numero")%>" required>
                    </div>   

                    <div class="col-xxl-4 col-xl-4 col-lg-7 col-md-7 col-sm-9">
                        <label for="cidade" class="form-label">Cidade:</label>
                        <input type="text" class="form-control campo-texto" id="cidade" name="cidade" placeholder="" value="<%= resultado.getString("cidade")%>" required>
                    </div>   

                    <div class="col-xxl-2 col-xl-2 col-lg-3 col-md-3 col-sm-4">
                        <label for="estado" class="form-label">Estado:</label>
                        <input type="text" class="form-control campo-texto" id="estado" name="estado" placeholder="" value="<%= resultado.getString("estado")%>" required>
                    </div>   

                    <div class="col-xxl-5 col-xl-5 col-lg-12 col-md-12 col-sm-8">
                        <label for="conjuge" class="form-label">Conjuge:</label>
                        <input type="text" class="form-control campo-texto" id="conjuge" name="conjuge" placeholder="" value="<%= resultado.getString("conjuge")%>" required>
                    </div>              


                    <div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12">
                        <label for="obs" class="form-label">Observação:</label>
                        <textarea class="form-control campo-texto" rows="3" id="obs" name="obs" placeholder="" required><%= resultado.getString("obs")%>
                        </textarea>
                    </div>     

                    <div class="col-md-12">
                        <!--quebra de linha no form-->
                    </div>

                    <div class="col-3">
                        <button type="submit" class="btn btn-primary link-botao">Salvar</button>
                    </div>

                    <div class="col-3">
                        <a class="btn btn-secondary link-botao" href="listarAluno.jsp">Cancelar</a>
                    </div>
                </fieldset>
            </form>        

            <%
                }
            %>    


        </div>
        <script src="../../assets/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            const formProduto = document.getElementById('form_cliente');

            formProduto.addEventListener('submit', (event) => {
                const dateInput = document.getElementById('data_nascimento');
                const dateValue = dateInput.value; // Data no formato 'yyyy-MM-dd'

                if (dateValue.includes('/')) {
                    // Substituir barras por traços
                    dateInput.value = dateValue.replace(/\//g, '-');
                }
            });
        </script>        
    </body>
</html>        
</body>
</html>
