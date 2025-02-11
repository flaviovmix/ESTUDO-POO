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
                            value="Novo ítem"
                            />
                        <input 
                            class="input-item w-75" 
                            type="date"  
                            id="data" 
                            name="data" 
                            placeholder="" 
                            value="1982-11-05" 
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
                        %>
                        
                        <%
                            if (tarefasAtivas.isEmpty()) {
                                out.print("<p class='mensagem-lista-vazia'>Não há nenhum item na lista no momento.</p>");
                            } else {
                            for (TarefaBean tarefa : tarefasAtivas) {
                               
                                    out.print("<li>");
                                    out.print("<div class='lista-item-container'>");
                                    out.print("<input type='checkbox' id='checkbox-1' />");
                                    out.print("<p class='titulo-item'>");
                                    out.print(tarefa.getTarefa());
                                    out.print("</p>");
                                    out.print("</div>");
                                    out.print("<p class='texto-data'>" + tarefa.getData() + "</p>");
                                    out.print("</li>");                                    
                               
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
                               
                                    out.print("<li>");
                                    out.print("<div class='lista-item-container'>");
                                    out.print("<input type='checkbox' id='checkbox-1' />");
                                    out.print("<p class='titulo-item'>");
                                    out.print(tarefa.getTarefa());
                                    out.print("</p>");
                                    out.print("</div>");
                                    out.print("<p class='texto-data'>" + tarefa.getData() + "</p>");
                                    out.print("</li>");                                    
                               
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

                    <!-- <p class="mensagem-lista-vazia">Não há nenhum item na lista no momento.</p> -->
                </div>
            </div>
        </main>
    </body>
</html>