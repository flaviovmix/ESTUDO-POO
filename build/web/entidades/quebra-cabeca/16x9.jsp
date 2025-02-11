<%@page import="funcoes.icones"%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="../assets/css/style.css" rel="stylesheet"> 
        <link href="../assets/css/quebra-cabeca.css" rel="stylesheet">        

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
        <div id="game-container">
            <h3 class="agradecimento-completar text-center"  id="timer">85:00</h3>

            <div class="estrelas">
                <spam class="spam-estrelas-positiva"> <% out.print(icones.estrela()); %> </spam>
                <spam class="spam-estrelas-neutra"> <% out.print(icones.estrela()); %> </spam>
                <spam class="spam-estrelas-neutra"> <% out.print(icones.estrela());%> </spam>
                <spam class="spam-estrelas-neutra"> <% out.print(icones.estrela()); %> </spam>
                <spam class="spam-estrelas-neutra"> <% out.print(icones.estrela());%> </spam>                
                <spam class="spam-estrelas-neutra"> <% out.print(icones.estrela());%> </spam>                
                <spam class="spam-estrelas-neutra"> <% out.print(icones.estrela());%> </spam>                
                <spam class="spam-estrelas-neutra"> <% out.print(icones.estrela());%> </spam>                
            </div>        


<!--            <div class="estrelas">
                <spam> <img class="img-fase" src="assets/img/SAVANA/SAVANA-01.png"> </spam>
                <spam> <img class="img-fase" src="assets/img/SAVANA/SAVANA-02.png"> </spam>
                <spam> <img class="img-fase" src="assets/img/SAVANA/SAVANA-03.png"> </spam>
                <spam> <img class="img-fase" src="assets/img/SAVANA/SAVANA-04.png"> </spam>
                <spam> <img class="img-fase" src="assets/img/SAVANA/SAVANA-05.png"> </spam>                
                <spam> <img class="img-fase" src="assets/img/SAVANA/SAVANA-06.png"> </spam>                
                <spam> <img class="img-fase" src="assets/img/SAVANA/SAVANA-07.png"> </spam>                
                <spam> <img class="img-fase" src="assets/img/SAVANA/SAVANA-08.png"> </spam>                
            </div>     -->
            
            <canvas id="puzzleCanvas" width="1870" height="880"></canvas>


        </div>

        <script>
            const canvas = document.getElementById("puzzleCanvas");
            const ctx = canvas.getContext("2d");

            const rows = 2; // N�mero de linhas
            const cols = 2; // N�mero de colunas
            const pieceWidth = 1280 / cols;
            const pieceHeight = 720 / rows;

            const image = new Image();
            image.src = "../assets/img/morena.png"; // Use uma imagem qualquer
//            image.src = "assets/img/img.png"; // Use uma imagem qualquer

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
                            Math.abs(this.canvasX - (this.imgX + 300)) < 50 &&
                            Math.abs(this.canvasY - (this.imgY + 150)) < 50
                            );
                }

                lockPosition() {
                    this.canvasX = this.imgX + 300;
                    this.canvasY = this.imgY + 150;
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

                // �rea de montagem (1280x720)
                ctx.fillStyle = 'rgba(0, 0, 0, 0.1)';
                ctx.strokeStyle = '#ddd'; // Cor da borda
                ctx.lineWidth = 5;       // Largura da borda
                // Desenhar a "borda"
                ctx.strokeRect(300, 150, 1280, 720);
                ctx.fillRect(300, 150, 1280, 720); // �rea onde as pe�as devem ser encaixadas

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
                    // Verifica se a pe�a foi colocada no lugar certo
                    if (draggingPiece.isInCorrectPosition()) {
                        draggingPiece.lockPosition(); // Fixar a pe�a no lugar
                    }
                    draggingPiece = null;
                    drawAll();
                }
            });
        </script>



    </body>

</html>