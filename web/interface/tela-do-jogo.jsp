<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Galeria de Imagens</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="../style.css" rel="stylesheet">
        <link href="../gamer.css" rel="stylesheet">
    </head>
    <body>

        <main class="container">
            <%@ include file="navbar.html" %>

            <div class="container-xl"> 
                <h2 class="d-none d-md-block">GAMER DAS GAROTAS</h2>   
            </div>
            <div class="row row-cols-1 row-cols-sm-5">
                <div class="col">
                    <div class="card">
                        <img src="../assets/img/01.png" class="card-img-top" alt="Imagem 1">
                        <div class="info-overlay">

                            <h6>Morroquina</h6>
                            <p>Heterossexual</p>
                            <table>
                                <tbody>
                                    <tr>
                                        <th>Idade:</th>
                                        <td>27 anos</td>
                                        <th>Peso:</th>
                                        <td>52 kgs</td>
                                    </tr>

                                    <tr>
                                        <th>Busto:</th>
                                        <td>41</td>
                                        <th>Quadil:</th>
                                        <td>38</td>
                                    </tr>

                                    <tr>
                                        <th>Civil:</th>
                                        <td>Casada</td>
                                        <th>Hobbies:</th>
                                        <td>Ler</td>
                                    </tr>                              

                                </tbody>
                            </table>
                            <span>Lorem Ipsum is simply dummy text, Ipsum is simply dumm.</span>
                        </div>
                        <div class="card-body">
                            <div class="descricao">
                                <h5 class="card-title">Imagem 1</h5>
                                <button class="btn btn-light">Jogar agora</button>
                            </div>
                        </div>
                    </div>
                </div>
                        
            </div>
        </main>
        
            <%@ include file="footer.html" %>      

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
