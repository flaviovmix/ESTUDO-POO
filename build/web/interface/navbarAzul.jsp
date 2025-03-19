<nav class="menu-principal">

    <ul class="menu">
        <li>
            <a href="<%= request.getContextPath()%>/entidades/aluno/listarAluno.jsp">ALUNOS</a>
        </li>
        <li>
            <a href="<%= request.getContextPath()%>/entidades/vegetais/listarVegetais.jsp">VEGETAIS</a>
        </li>
        <li>
            <a href="<%= request.getContextPath()%>/entidades/personagem/ListarGarotasPix.jsp">GAROTAS PIX</a>
        </li>        
        <li>
             <a href="<%= request.getContextPath()%>/entidades/personagem/listarPersonagem.jsp">GAROTAS</a>
            <ul class="submenu">
                <li><hr></li>
                <li>
                    <a href="<%= request.getContextPath()%>/entidades/personagem/zerarPersonagem.jsp?">
                        <span>ZERAR TODAS</span>
                        <img class="emoje-menu inativo" src="../../assets/img/emoje-2.png" />
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath()%>/entidades/personagem/ativarTodosPersonagem.jsp">
                        <span>ATIVAR TODAS</span>
                        <img class="emoje-menu" src="../../assets/img/emoje-5.png" />
                    </a>
                </li>
                <li><hr></li>
                <li>
                    <a href="<%= request.getContextPath()%>/entidades/personagem/atualizaTodasThumb.jsp?thumb=1">
                        <span>CAPA COMO FASE 1</span>
                        <img class="emoje-menu" src="../../assets/img/emoje-1.png" />
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath()%>/entidades/personagem/atualizaTodasThumb.jsp?thumb=2">
                        <span>CAPA COMO FASE 2</span>
                        <img class="emoje-menu" src="../../assets/img/emoje-2.png" />
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath()%>/entidades/personagem/atualizaTodasThumb.jsp?thumb=3">
                        <span>CAPA COMO FASE 3</span>
                        <img class="emoje-menu" src="../../assets/img/emoje-3.png" />
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath()%>/entidades/personagem/atualizaTodasThumb.jsp?thumb=4">
                        <span>CAPA COMO FASE 4</span>
                        <img class="emoje-menu" src="../../assets/img/emoje-4.png" />
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath()%>/entidades/personagem/atualizaTodasThumb.jsp?thumb=5">
                        <span>CAPA COMO FASE 5</span>
                        <img class="emoje-menu" src="../../assets/img/emoje-5.png" />
                    </a>
                </li>
                <li><hr></li>
            </ul>
        </li>
        <li><a href="<%= request.getContextPath()%>/entidades/todo/todoist.jsp">TO-DO</a>
        </li>
    </ul>

    <button id="btnTema" onclick="mudarTema()">Mudar para modo escuro</button>
</nav>