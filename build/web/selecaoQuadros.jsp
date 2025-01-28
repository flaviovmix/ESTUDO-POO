<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Galeria de Imagens</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="style.css" rel="stylesheet">
        <link href="card-fase.css" rel="stylesheet">
    </head>
    <body>



        <main class="container">
            <%@ include file="interface/navbar.html" %>


            <div class="row row-cols-1 row-cols-sm-2 row-cols-xxl-4 row-cols-xl-4 row-cols-lg-3 row-cols-md-3 g-4">

                <script>
                    for (var i = 0; i < 8; i++) {
                        document.write(`
                            <div class="col">
                                <div class="card-fases">
                                <div class="area-efeito">
                                    <img src="assets/img/img.png" class="card-img-top-fases" alt="Imagem 1">
                                </div>
                              <div class="card-body">   
                              <div class="descricao">
                              <a href="quebra-cabeca.jsp" class="btn btn-light w-100">Carregar fase 1</a>
                              </div>
                              </div>

                              </div>
            </div>   
`);


                    }
                </script>


            </div>

        </main>





        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
