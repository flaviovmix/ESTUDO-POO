<%@page import="MontarCard.Card"%>
<%@page import="Vegetal.VegetalBean"%>
<%@page import="Vegetal.VegetalDAO"%>
<%@page import="java.util.List"%>
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

        <link id="tema" rel="stylesheet" href="../../assets/css/temas/variaveis-tema-claro.css">      
        <link rel="stylesheet" href="../../assets/css/ajustes/normalize.css">

        <link rel="stylesheet" href="../../assets/css/nav/barra-menu.css">
        <link rel="stylesheet" href="../../assets/css/nav/footer.css">
        <link rel="stylesheet" href="../../assets/css/cards/card.css">
        <link rel="stylesheet" href="../../assets/css/cards/table.css">
        <link rel="stylesheet" href="../../assets/css/cards/ancoras.css">
        <link rel="stylesheet" href="../../assets/css/cards/info.css">      
        <link rel="stylesheet" href="../../assets/css/ajustes/ativo-inativo.css">      

        <link rel="stylesheet" href="../assets/css/ajustes/responsividade.css">


    </head>

    <body>

        <%@ include file="../../interface/navbarAzul.jsp" %>

        <main>

            <div id="estilo-card">

                <div  class="container-xl">


                    <div class='card'>
                        <div class='area-img-info'>

                            <img 
                                class="img-principal ativo" 
                                src="../../assets/vegetais/14.1.png"
                                alt="imagem da personagem 1"
                                />   

                            <div class="info-personagem">
                                <div class="ecolha-thumb">
                                    <a href="#">
                                        <img class="ativo" src="../../assets/vegetais/t-1.png" />
                                    </a>

                                    <a href="#">
                                        <img class="ativo" src="../../assets/vegetais/t-2.png" />
                                    </a>

                                    <a href="#">
                                        <img class="ativo" src="../../assets/vegetais/t-3.png" />
                                    </a>

                                    <a href="#">
                                        <img class="ativo" src="../../assets/vegetais/t-4.png" />
                                    </a>

                                    <a href="#">
                                        <img class="ativo" src="../../assets/vegetais/t-5.png" />
                                        
                                    </a>
                                    
                                    <img class="bandeira ativo" src="../../assets/vegetais/Brasil.png" /> 

                                </div>
                            </div>

                        </div>
                        <div class='area-links'></div>
                    </div>

                    <%
                        
                        String query = "select * from vegetais";

                        VegetalDAO dao = new VegetalDAO();

                        List<VegetalBean> vegetais = dao.listarVegetais(query);

                        for (VegetalBean bean : vegetais) {
                            out.print(Card.DesenharCard(bean));
                        }

                    %>

                </div>

            </div>

        </main>

    </body>
</html>