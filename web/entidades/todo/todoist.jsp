<%@page import="funcoes.icones"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="Todo.TarefaDAO"%>
<%@page import="Todo.TarefaBean"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="../../assets/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="../../assets/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="../../assets/css/todo.css">
    </head>
    <body>
        <main>
            <%@ include file="../../interface/navbar.html" %>
            <h1>Todo List</h1>
            <div class="flex-principal">
                <div class="container-cadastrar">
                    <img src="../../assets/img/bag.png" alt="">
                    <form method="post" action="salvarTodo.jsp">
                        <input
                            class="input-item"
                            id="input-item" type="text"
                            name="nome"
                            placeholder="Digite o item que deseja"
                            />
                        <input 
                            class="input-item w-75" 
                            type="date"  
                            id="data" 
                            name="data" 
                            required
                        />
                        <div class="check-ativo-inativo">
                            <input type="checkbox" 
                                   name="concluido" value="1"/>
                            <span>concluído</span>
                        </div>

                        <button
                            class="button-item"
                            id="adicionar-item"
                            type="submit"
                            >
                            Salvar item
                        </button>

                    </form>
                </div>

                <div class="div-barra"></div>

                <div class="container-lista w-75">
                    <ul class="area-de-listatem">
                        <div>
                            <h6>ativas</h6>
                            <%
                                TarefaDAO tarefaDAO = new TarefaDAO();
                                String buscaAtiva;
                                String buscaInativa;
                                buscaAtiva = "select * from todo WHERE ativa = 0 ORDER BY data";
                                buscaInativa = "select * from todo WHERE ativa = 1 ORDER BY data";

                                List<TarefaBean> tarefasAtivas = tarefaDAO.listarTarefas(buscaAtiva);
                                List<TarefaBean> tarefasInativas = tarefaDAO.listarTarefas(buscaInativa);

                                SimpleDateFormat dataFormatada = new SimpleDateFormat("EEEE, d 'de' MMM'.' 'de' yyyy");
                                
                                if (tarefasAtivas.isEmpty()) {
                                    out.print("<p class='mensagem-lista-vazia'>Não há nenhum item na lista no momento.</p>");
                                } else {
                                    
                                    for (TarefaBean tarefa : tarefasAtivas) {
                                        
                                        StringBuilder novaTarefa = new StringBuilder();
                                        novaTarefa
                                                .append("<li>")
                                                .append("<div class='lista-item-container'>")
                                                .append("<input "
                                                        + "class='input-checkbox' "
                                                        + "type='checkbox' "
                                                        + "onchange='ativarOuInativarTarefa(" + tarefa.getCodigo() + ", " + tarefa.getAtiva() + ")' "
                                                        + "/>")
                                                .append("<div class='linha-nome-icones'>")
                                                .append("<p class='titulo-item'>")
                                                .append(tarefa.getTarefa())
                                                .append("</p>")
                                                .append("<div>")
                                                .append("<a href='?'>" + icones.editar() + "</a>")
                                                .append("<span>")
                                                .append("<a href='excluirTarefa.jsp?codigo=" 
                                                        + tarefa.getCodigo() + "'>" 
                                                        + icones.deletar() 
                                                        + "</a>")
                                                .append("</span>")
                                                .append("</div>")
                                                .append("</div>")
                                                .append("</div>")
                                                .append("<p class='texto-data'>" 
                                                        + dataFormatada.format(tarefa.getData()) 
                                                        + "</p>")
                                                .append("</li>");
                                        out.print(novaTarefa);
                                    }
                                }
                            %>

                            <!--                        
                                                    <li>
                                                        <div class="lista-item-container">
                                                            <input type="checkbox" id="checkbox-1" />
                                                            <p class="titulo-item">Ração de gato</p>
                                                        </div>
                                                        <p class="texto-data">Segunda-feira (31/10/2022</p>
                                                    </li>
                            -->

                        </div>
                        <div>
                            <div class="paginacao"> 
                                <span>first</span>
                                <span>1</span>
                                <span>2</span>
                                <span>3</span>
                                <span>last</span>
                            </div>
                        </div>
                    </ul>

                    <div class="div-barra"></div>

                    <ul class="area-de-listatem">
                        <div>
                            <h6>concluídas</h6>
                            <%
                                if (tarefasInativas.isEmpty()) {
                                    out.print("<p class='mensagem-lista-vazia'>Não há nenhum item na lista no momento.</p>");
                                } else {
                                    for (TarefaBean tarefa : tarefasInativas) {

                                        StringBuilder novaTarefa = new StringBuilder();
                                        novaTarefa
                                                .append("<li>")
                                                .append("<div class='lista-item-container'>")
                                                .append("<input "
                                                        + "class='input-checkbox' "
                                                        + "type='checkbox' "
                                                        + "id='checkbox-" + tarefa.getCodigo() + "' "
                                                        + "onchange='ativarOuInativarTarefa(" + tarefa.getCodigo() + ", " + tarefa.getAtiva() + ")' "
                                                        + "checked "
                                                        + "/>")

                                                .append("<div class='linha-nome-icones'>")
                                                .append("<p class='titulo-item item-checado'>")
                                                .append(tarefa.getTarefa())
                                                .append("</p>")
                                                .append("<div>")
                                                .append("<a href='?'>" + icones.editar() + "</a>")
                                                .append("<span>")
                                                .append("<a href='excluirTarefa.jsp?codigo=" 
                                                        + tarefa.getCodigo() 
                                                        + "'>" 
                                                        + icones.deletar() 
                                                        + "</a>")
                                                .append("</span>")
                                                .append("</div>")
                                                .append("</div>")
                                                .append("</div>")
                                                .append("<p "
                                                        + "class='texto-data data-checada'>" 
                                                        + dataFormatada.format(tarefa.getData()) 
                                                        + "</p>")
                                                .append("</li>");
                                        out.print(novaTarefa);

                                    }
                                }
                            %>
                            <!--
                                                    <li>
                                                        <div class="lista-item-container">
                                                            <input type="checkbox" id="checkbox-1" />
                                                            <p class="titulo-item item-checado">Ração de gato</p>
                                                        </div>
                                                        <p class="texto-data data-checada">Segunda-feira (31/10/2022)</p>
                                                    </li>  
                            -->
                        </div>
                        <div>
                            <div class="paginacao"> 
                                <span>first</span>
                                <span>1</span>
                                <span>2</span>
                                <span>3</span>
                                <span>last</span>
                            </div>
                        </div>
                    </ul>
                </div>
            </div>
        </main>

        <script>
            function ativarOuInativarTarefa(codigo, ativa) {
                location.href = "editarTodo.jsp?codigo=" + codigo + "&ativa=" + ativa;
            }
        </script>
        
        <script>
            // Obtém a data atual no formato YYYY-MM-DD
            let hoje = new Date().toISOString().split('T')[0];

            // Define o valor do input com a data atual
            document.getElementById("data").value = hoje;
        </script>        

    </body>
</html>