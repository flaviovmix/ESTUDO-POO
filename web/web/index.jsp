<%-- 
    Document   : index
    Created on : 26 de fev. de 2025, 12:36:24
    Author     : WINDOWS 11
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/solid.css"
    integrity="sha384-Tv5i09RULyHKMwX0E8wJUqSOaXlyu3SQxORObAI08iUwIalMmN5L6AvlPX2LMoSE" crossorigin="anonymous" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/fontawesome.css"
    integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous" />

  <link rel="stylesheet" href="./assets/css/ajustes/normalize.css">
  <link id="tema" rel="stylesheet" href="./assets/css/temas/variaveis-tema-claro.css">
  <link rel="stylesheet" href="./assets/css/nav/barra-menu.css">
  <link rel="stylesheet" href="./assets/css/cards/card.css">
  <link rel="stylesheet" href="./assets/css/cards/table.css">
  <link rel="stylesheet" href="./assets/css/cards/ancoras.css">
  <link rel="stylesheet" href="./assets/css/cards/info.css">

  <link rel="stylesheet" href="./assets/css/ajustes/responsividade.css">
</head>

<body>
  <nav class="menu-principal">
    <ul>
      <div class="container-nav">
        <div>
          <li><a href="#home">NOVO REGISTRO</a></li>
          <li><a href="#" onclick="mostrarCard()">Estilo Cards</a></li>
          <li><a href="#" onclick="mostrarTable()">Estilo Tabela</a></li>
        </div>
        <button id="btnTema" onclick="mudarTema()">Mudar para modo escuro</button>
      </div>
    </ul>
  </nav>

  <main>

    <div id="estilo-card" class="ativo">
      <div  class="container-xl">

        <div class="card">
          <div class="area-img-info">
            <img class="img-principal" src="./assets/img/personagens/1.png" alt="imagem da personagem 1" />
            <div class="info-personagem">
              <div class="img-nome-personagem">
                <img class="imagem-circular" src="./assets/img/personagens/r-1.png" alt="">
                <div>
                  <h2>Camila Turner Brown</h2>
                  <p>adora cozinhar</p>
                </div>
              </div>

              <table>

                <tr>
                  <td><strong>Idade:</strong></td>
                  <td>22 anos</td>
                </tr>
                <tr>
                  <td><strong>Busto:</strong></td>
                  <td>145 cm</td>
                </tr>
                <tr>
                  <td><strong>Quadril:</strong></td>
                  <td>28 cm</td>
                </tr>
                <tr>
                  <td><strong>Cintura:</strong></td>
                  <td>36 cm</td>
                </tr>
                <tr>
                  <td><strong>Altura:</strong></td>
                  <td>1,78 cm</td>
                </tr>
                <tr>
                  <td><strong>Peso:</strong></td>
                  <td>58 Kg</td>
                </tr>
                <tr>
                  <td colspan="2" class="obs">Lorem Ipsum is simply dummy text of the printing and typesetting</td>
                </tr>


              </table>
              <h3>Brasileira</h3>
              <div class="editar-excluir-dentro-info">
                <a href="#"><span class="fa fa-pen"></span></a>
                <a href="#"><span class="fa fa-trash"></span></a>

              </div>
            </div>
          </div>
          <div class="area-links">
            <div class="area-estrelas">
              <a href="#"><span class="fa fa-star"></a></span>
              <a href="#"><span class="fa fa-star"></a></span>
              <a href="#"><span class="fa fa-star"></a></span>
              <a href="#"><span class="fa fa-star"></a></span>
              <a href="#"><span class="fa fa-star"></a></span>
            </div>
          </div>
        </div>


        <script>
          // Loop for que se repete de i = 1 até i < 10 (ou seja, de 1 a 9)
          for (let i = 2; i < 15; i++) {
            document.write(` 
         <div class="card">
        <div class="area-img-info">
          <img class="img-principal" src="./assets/img/personagens/${i}.png" alt="imagem da personagem ${i}" />
          <div class="info-personagem">
            <div class="img-nome-personagem">
              <img class="imagem-circular" src="./assets/img/personagens/r-${i}.png" alt="">
              <div>
                <h2>Camila Turner Brown</h2>
                <p>adora cozinhar</p>
              </div>
            </div>

              <table>

                <tr>
                  <td><strong>Idade:</strong></td>
                  <td>22 anos</td>
                </tr>
                <tr>
                  <td><strong>Busto:</strong></td>
                  <td>145 cm</td>
                </tr>
                <tr>
                  <td><strong>Quadril:</strong></td>
                  <td>28 cm</td>
                </tr>
                <tr>
                  <td><strong>Cintura:</strong></td>
                  <td>36 cm</td>
                </tr>
                <tr>
                  <td><strong>Altura:</strong></td>
                  <td>1,78 cm</td>
                </tr>
                <tr>
                  <td><strong>Peso:</strong></td>
                  <td>58 Kg</td>
                </tr>
                <tr>
                  <td colspan="2" class="obs">Lorem Ipsum is simply dummy text of the printing and typesetting</td>
                </tr>


              </table>
            <h3>Brasileira</h3>
            <div class="editar-excluir-dentro-info">
              <a href="#"><span class="fa fa-pen"></span></a>
              <a href="#"><span class="fa fa-trash"></span></a>

            </div>
          </div>
        </div>
        <div class="area-links">
          <div class="area-estrelas">
            <a href="#"><span class="fa fa-star"></a></span>
            <a href="#"><span class="fa fa-star"></a></span>
            <a href="#"><span class="fa fa-star"></a></span>
            <a href="#"><span class="fa fa-star"></a></span>
            <a href="#"><span class="fa fa-star"></a></span>
          </div>
        </div>
      </div>
        `);
          }
          // A cada repetição, i aumenta +1 e um novo bloco HTML é escrito na página.
          // A imagem agora usa ${i}, para mudar conforme o número da iteração.      
        </script>
      </div>
    </div>

    <div id="estilo-tabela" class="tabela-personagem oculto">
      <table>

        <tr>
          <td><strong>Idade:</strong></td>
          <td><strong>Busto:</strong></td>
          <td><strong>Quadril:</strong></td>
          <td><strong>Cintura:</strong></td>
          <td><strong>Altura:</strong></td>
          <td><strong>Peso:</strong></td>
          <td><strong>Obs:</strong></td>
        </tr>

        <script>
          for (let i = 2; i < 15; i++) {
            document.write(` 
          <tr>
            <td>22 anos</td>
            <td>145 cm</td>
            <td>28 cm</td>
            <td>36 cm</td>
            <td>1,78 cm</td>
            <td>58 Kg</td>
            <td colspan="2" class="obs">Lorem Ipsum is</td>
          </tr>
         `);

          }
        </script>

      </table>
    </div>
  </main>

  <script>
    function mudarTema() {
      const linkTema = document.getElementById("tema");
      const btnTema = document.getElementById("btnTema");
      const temaClaro = "./assets/css/temas/variaveis-tema-claro.css";
      const temaEscuro = "./assets/css/temas/variaveis-tema-escuro.css";

      if (linkTema.getAttribute("href") === temaClaro) {
        // Muda para tema escuro
        linkTema.setAttribute("href", temaEscuro);
        btnTema.textContent = "Mudar para modo claro";
      } else {
        // Muda para tema claro
        linkTema.setAttribute("href", temaClaro);
        btnTema.textContent = "Mudar para modo escuro";
      }
    }


    function mostrarCard() {
      // Oculta todas as divs
      document.getElementById('estilo-card').classList.add('ativo');
      document.getElementById('estilo-card').classList.remove('oculto');

      document.getElementById('estilo-tabela').classList.add('oculto');
      document.getElementById('estilo-tabela').classList.remove('ativo');
    }          

    function mostrarTable() {
      // Oculta todas as divs
      document.getElementById('estilo-card').classList.add('oculto');
      document.getElementById('estilo-card').classList.remove('ativo');

      document.getElementById('estilo-tabela').classList.add('ativo');
      document.getElementById('estilo-tabela').classList.remove('oculto');
    }       
  </script>

</body>

</html>