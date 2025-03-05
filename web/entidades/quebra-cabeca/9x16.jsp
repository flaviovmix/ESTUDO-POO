<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="funcoes.icones"%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.4.0/dist/confetti.browser.min.js"></script>

        
        
        
        <link href="../../assets/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="../../assets/css/style.css" rel="stylesheet">   
        <link href="../../assets/css/quebra-cabeca.css" rel="stylesheet">     
        <link rel="stylesheet" href="../../assets/css/ajustes/ativo-inativo.css">      

        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                background-color: #f3f3f3;
            }

            canvas {
                margin-top: 48px;
                border: 2px solid #333;
                box-shadow: 0px 0px 10px #777;
                border-radius: 15px;
            }

            #game-container {
                position: relative;
            }

            .piece {
                position: absolute;
                cursor: grab;
            }
        </style>
    </head>

    <body>
        <%@ include file="../../interface/navbar.html" %>
        <%
        String divisaoPecasRows = "1";
        String divisaoPecasCols = "1";
        String distanciaParaEncaixe = "10";
        
//        if (parteDaFaseOriginal == 1) {
//            divisaoPecasRows = "2";
//            divisaoPecasCols = "2";
//        } else if (parteDaFaseOriginal == 2) {
//            divisaoPecasRows = "3";
//            divisaoPecasCols = "2";            
//        } else if (parteDaFaseOriginal == 3) {
//            divisaoPecasRows = "4";
//            divisaoPecasCols = "3";     
//        } else if (parteDaFaseOriginal == 4) {
//            divisaoPecasRows = "4";
//            divisaoPecasCols = "3";     
//        } else if (parteDaFaseOriginal == 5) {
//            divisaoPecasRows = "4";
//            divisaoPecasCols = "4";     
//        }            
            
            String pagAtual = request.getParameter("pag");
            String personagem = request.getParameter("personagem");
            
            String numero = pagAtual;
            String[] partes = numero.split("\\."); // Divide em "1" e "2"
            int parteDaFase = Integer.parseInt(partes[1]); // Converte "2" para inteiro
            int peronsagem = Integer.parseInt(partes[0]); // Converte "1" para inteiro
            int proximoPersonagem = peronsagem + 1;
            peronsagem = (peronsagem == 14) ? 14 : peronsagem + 1;  
            int parteDaFaseOriginal = parteDaFase; 
            parteDaFase = (parteDaFase == 5) ? 5 : parteDaFase + 1;  

            System.out.println(parteDaFase); 

           System.out.println(parteDaFase);        
            
        //CONECTAR COM O BANDO DE DADOS
        Connection conecta;
        PreparedStatement atualizaParteDaFase;
        PreparedStatement atualizaPersonagem;
        PreparedStatement atualizaFaseProximoPersonagem;
        PreparedStatement personagemAtualCompleto;

        Class.forName("org.postgresql.Driver");
        conecta = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/banco", "postgres", "masterkey"
        );

        atualizaParteDaFase = conecta.prepareStatement(
                "UPDATE fase SET quebra_cabeca_" + parteDaFase + "_ativo = 1 WHERE codigo = (" +
                " SELECT pf.fase FROM personagem_fase pf JOIN personagem p ON pf.personagem = p.codigo " +
                " WHERE p.codigo = " + personagem + ");"
        );
        
        atualizaPersonagem = conecta.prepareStatement(
            "UPDATE personagem SET ativo = 1 WHERE codigo = " + peronsagem + ";"
        );      
        
        atualizaFaseProximoPersonagem = conecta.prepareStatement(
            "UPDATE fase SET quebra_cabeca_1_ativo = 1 WHERE codigo = ("
          + " SELECT pf.fase FROM personagem_fase pf JOIN personagem p ON "
          + "pf.personagem = p.codigo WHERE p.codigo = " + proximoPersonagem + ");"
        );     

        atualizaParteDaFase.executeUpdate(); 
        
//        parteDaFase = (parteDaFase == 5) ? atualizaPersonagem.executeUpdate() : 5 ;
        if (parteDaFaseOriginal == 5) {
            atualizaPersonagem.executeUpdate();
            atualizaFaseProximoPersonagem.executeUpdate();
        }
         

        personagemAtualCompleto = conecta.prepareStatement(
            "SELECT p.*, f.* FROM personagem_fase pf JOIN personagem p ON pf.personagem = p.codigo"
          + " JOIN fase f ON pf.fase = f.codigo WHERE p.codigo = " + personagem + " ORDER BY p.codigo, f.codigo;"
        );   

        ResultSet resultado = personagemAtualCompleto.executeQuery();
        

        %>
        
        <div id="game-container">
            <!--<h3 class="agradecimento-completar text-center"  id="timer">85:00</h3>-->
<% while (resultado.next()) {%>
            <div class="estrelas">
                <a href="<%= "1".equals(resultado.getString("quebra_cabeca_1_ativo")) 
                            ? request.getContextPath() + "/entidades/quebra-cabeca/9x16.jsp?pag=" + resultado.getString("quebra_cabeca_1") + "&personagem=" +resultado.getString("codigo") 
                            : "#" %>">
                    <img class="<%= "1".equals(resultado.getString("quebra_cabeca_1_ativo")) ? "ativo" : "inativo" %>" src="../../assets/img/emoje-1.png" />
                </a>
                
                <a href="<%= "1".equals(resultado.getString("quebra_cabeca_2_ativo")) 
                            ? request.getContextPath() + "/entidades/quebra-cabeca/9x16.jsp?pag=" + resultado.getString("quebra_cabeca_2") + "&personagem=" +resultado.getString("codigo") 
                            : "#" %>">
                    <img class="<%= "1".equals(resultado.getString("quebra_cabeca_2_ativo")) ? "ativo" : "inativo" %>" src="../../assets/img/emoje-2.png" />
                </a>
                
                <a href="<%= "1".equals(resultado.getString("quebra_cabeca_3_ativo")) 
                            ? request.getContextPath() + "/entidades/quebra-cabeca/9x16.jsp?pag=" + resultado.getString("quebra_cabeca_3") + "&personagem=" +resultado.getString("codigo") 
                            : "#" %>">
                    <img class="<%= "1".equals(resultado.getString("quebra_cabeca_3_ativo")) ? "ativo" : "inativo" %>" src="../../assets/img/emoje-3.png" />
                </a>
                
                <a href="<%= "1".equals(resultado.getString("quebra_cabeca_4_ativo")) 
                            ? request.getContextPath() + "/entidades/quebra-cabeca/9x16.jsp?pag=" + resultado.getString("quebra_cabeca_4") + "&personagem=" +resultado.getString("codigo") 
                            : "#" %>">
                    <img class="<%= "1".equals(resultado.getString("quebra_cabeca_4_ativo")) ? "ativo" : "inativo" %>" src="../../assets/img/emoje-4.png" />
                </a> 
                
                <a href="<%= "1".equals(resultado.getString("quebra_cabeca_5_ativo")) 
                            ? request.getContextPath() + "/entidades/quebra-cabeca/9x16.jsp?pag=" + resultado.getString("quebra_cabeca_5") + "&personagem=" +resultado.getString("codigo") 
                            : "#" %>">
                    <img class="<%= "1".equals(resultado.getString("quebra_cabeca_5_ativo")) ? "ativo" : "inativo" %>" src="../../assets/img/emoje-5.png" />
                </a>   
            </div>  
                    
<!-- Modal Bootstrap -->
<div class="modal fade" id="faseConcluidaModal" tabindex="-1" aria-labelledby="faseConcluidaLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content text-center"> <!-- Centraliza o conte�do -->
            <div class="modal-header">
                <h5 class="modal-title" id="faseConcluidaLabel">Parab�ns!</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <img class="imagem-circular d-block mx-auto" src="../../assets/img/r-<%= resultado.getString("nome_arquivo")%>.png" alt="Imagem">
                
                <p class="mt-3">
                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.
                </p>
                <strong><%= resultado.getString("nome")%></strong>
            </div>
            <div class="modal-footer d-flex justify-content-center"> <!-- Centraliza os bot�es -->
                <button type="button" class="btn btn-primary w-50" data-bs-dismiss="modal">Voc� foi incr�el!</button>
                <!--<a href="#" class="btn btn-primary ms-2 w-50">Continuar</a>-->
            </div>
        </div>
    </div>
</div>

                  
                    
<%}%>                    


            <!--  
            <div class="estrelas">
                  <spam> <img class="img-fase" src="assets/img/SAVANA/SAVANA-01.png"> </spam>
                  <spam> <img class="img-fase" src="assets/img/SAVANA/SAVANA-02.png"> </spam>
                  <spam> <img class="img-fase" src="assets/img/SAVANA/SAVANA-03.png"> </spam>
                  <spam> <img class="img-fase" src="assets/img/SAVANA/SAVANA-04.png"> </spam>
                  <spam> <img class="img-fase" src="assets/img/SAVANA/SAVANA-05.png"> </spam>                
                  <spam> <img class="img-fase" src="assets/img/SAVANA/SAVANA-06.png"> </spam>                
                  <spam> <img class="img-fase" src="assets/img/SAVANA/SAVANA-07.png"> </spam>                
                  <spam> <img class="img-fase" src="assets/img/SAVANA/SAVANA-08.png"> </spam>                
              </div>     
            -->

            <canvas id="puzzleCanvas" width="1440" height="870"></canvas>



        <script>
            const canvas = document.getElementById("puzzleCanvas");
            const ctx = canvas.getContext("2d");

            const rows = <%= divisaoPecasRows%>; // N�mero de linhas
            const cols = <%= divisaoPecasCols%>; // N�mero de colunas
            const pieceWidth = 478 / cols;
            const pieceHeight = 849 / rows;

            const image = new Image();
            //image.src = "../../assets/img/1.1.png";  Use uma imagem qualquer
            image.src = "../../assets/img/<%= pagAtual%>.png";

            let pieces = [];
            let draggingPiece = null;
            let offsetX, offsetY;

            class Piece {
                constructor(imgX, imgY, canvasX, canvasY) {
                    this.imgX = imgX; // Posi��o da pe�a na imagem
                    this.imgY = imgY;
                    this.canvasX = canvasX; // Posi��o da pe�a no canvas
                    this.canvasY = canvasY;
                    this.width = pieceWidth;
                    this.height = pieceHeight;
                    this.locked = false; // Indica se a pe�a est� no lugar certo
                }

                draw() {
                    ctx.drawImage(
                            image,
                            this.imgX,
                            this.imgY,
                            this.width,
                            this.height,
                            this.canvasX,
                            this.canvasY,
                            this.width,
                            this.height
                            );
                }

                isClicked(x, y) {
                    return (
                            !this.locked &&
                            x > this.canvasX &&
                            x < this.canvasX + this.width &&
                            y > this.canvasY &&
                            y < this.canvasY + this.height
                            );
                }

                isInCorrectPosition() {
                    // Verifica se a pe�a est� dentro de uma �rea de 50px da posi��o correta
                    return (
                            Math.abs(this.canvasX - (this.imgX + 485)) < <%= distanciaParaEncaixe %> &&
                            Math.abs(this.canvasY - (this.imgY + 10)) < <%= distanciaParaEncaixe %>
                            );
                }

                lockPosition() {
                    this.canvasX = this.imgX + 485;
                    this.canvasY = this.imgY + 10;
                    this.locked = true;
                }
            }

            function shuffle(array) {
                for (let i = array.length - 1; i > 0; i--) {
                    const j = Math.floor(Math.random() * (i + 1));
                    [array[i], array[j]] = [array[j], array[i]];
                }
            }

            image.onload = function () {
                // Criar pe�as
                for (let row = 0; row < rows; row++) {
                    for (let col = 0; col < cols; col++) {
                        pieces.push(
                                new Piece(
                                        col * pieceWidth,
                                        row * pieceHeight,
                                        Math.random() * (canvas.width - pieceWidth), // Aleatoriamente dentro da tela
                                        Math.random() * (canvas.height - pieceHeight) // Aleatoriamente dentro da tela
                                        )
                                );
                    }
                }

                // Embaralhar pe�as
                shuffle(pieces);

                drawAll();
            };

            function drawAll() {
                ctx.clearRect(0, 0, canvas.width, canvas.height);

                // �rea de montagem (720x1280)
                ctx.fillStyle = 'rgba(0, 0, 0, 0.1)';
                ctx.strokeStyle = '#ddd'; // Cor da borda
                ctx.lineWidth = 5;       // Largura da borda
                // Desenhar a "borda"
                ctx.strokeRect(485, 10, 478, 849);
                ctx.fillRect(485, 10, 478, 849); // �rea onde as pe�as devem ser encaixadas

                // Desenha todas as pe�as
                pieces.forEach(piece => piece.draw());
            }

            canvas.addEventListener("mousedown", (e) => {
                const rect = canvas.getBoundingClientRect();
                const mouseX = e.clientX - rect.left;
                const mouseY = e.clientY - rect.top;

                for (let i = pieces.length - 1; i >= 0; i--) {
                    if (pieces[i].isClicked(mouseX, mouseY)) {
                        draggingPiece = pieces[i];
                        offsetX = mouseX - draggingPiece.canvasX;
                        offsetY = mouseY - draggingPiece.canvasY;

                        // Mover a pe�a para frente (�ltima no array)
                        pieces.splice(i, 1);
                        pieces.push(draggingPiece);

                        drawAll();
                        break;
                    }
                }
            });

            canvas.addEventListener("mousemove", (e) => {
                if (draggingPiece) {
                    const rect = canvas.getBoundingClientRect();
                    const mouseX = e.clientX - rect.left;
                    const mouseY = e.clientY - rect.top;

                    draggingPiece.canvasX = mouseX - offsetX;
                    draggingPiece.canvasY = mouseY - offsetY;

                    drawAll();
                }
            });

            canvas.addEventListener("mouseup", () => {
                if (draggingPiece) {
                    if (draggingPiece.isInCorrectPosition()) {
                        draggingPiece.lockPosition();
                    }
                    draggingPiece = null;
                    drawAll();
                    checkCompletion(); 
                    let todasNoLugar = pieces.every(piece => piece.locked);
                    if (todasNoLugar) {
                        mostrarModal(); // Exibe o modal
                    }                    // Verifica se todas as pe�as foram encaixadas
                }
            });
            
function showConfetti() {
    // Cria confetes no centro da tela
    confetti({
        particleCount: 1000,    // N�mero de confetes
        angle: 0,             // �ngulo de dispers�o
        spread: 700,            // Espalhamento dos confetes
        origin: { x: 0.5, y: 0.0 }  // Posi��o inicial no centro
    });
}

function checkCompletion() {
    let allLocked = pieces.every(piece => piece.locked); // Verifica se todas as pe�as est�o travadas

    if (allLocked) {
        // Exibe o modal Bootstrap
        var modal = new bootstrap.Modal(document.getElementById('faseConcluidaModal'));
        modal.show();

        // Chama a fun��o de confete
        showConfetti();

        // Adiciona evento ao bot�o "Continuar"
        document.getElementById("continuarBtn").addEventListener("click", function () {
            fetch("<%= request.getContextPath() %>/passarDeFase.jsp?personagem=<%= personagem %>&parte=<%= parteDaFaseOriginal %>")
            .then(response => response.text())
            .then(data => {
                console.log("Fase atualizada:", data);
                window.location.href = "<%= request.getContextPath() %>/proximaFase.jsp?personagem=<%= personagem %>";
            })
            .catch(error => console.error("Erro ao passar de fase:", error));
        });
    }
}
           
        </script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>




    </body>

</html>