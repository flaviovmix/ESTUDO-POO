<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="pt-br" data-bs-theme="auto">
    <head><script src="assets/js/color-modes.js"></script>
        <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="style.css" rel="stylesheet">
    </head>
    <body>    
        <main>
            <nav class="navbar navbar-expand-sm navbar-dark bg-dark d-none d-md-block" aria-label="Third navbar example">
                <div class="container-xl">
                    <a class="navbar-brand" href="apresentacao.html"  target="centro">SISTEMA</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarsExample03">
                        <ul class="navbar-nav me-auto mb-2 mb-sm-0">

                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="listarAluno.jsp"  target="centro">ALUNOS</a>
                            </li>       
                            
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="listarAluno_1.jsp"  target="centro">DISCIPLINAS</a>
                            </li>                           
<!--
                            <li class="nav-item dropdown">
                                <a class="nav-link active dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">DROPDOWN </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="cadastroProduto.html" target="centro">Cadastrar</a></li>
                                    <li><a class="dropdown-item" href="listaProduto.jsp"  target="centro">Listar</a></li>
                                    <li><a class="dropdown-item" href="#"  target="centro">Excluir</a></li>
                                    <li><a class="dropdown-item" href="#"  target="centro">Alterar</a></li>
                                </ul>
                            </li>
-->
                        </ul>
<!--                        <form role="search">
                                <input class="form-control" type="search" placeholder="Search" aria-label="Search">
                            </form>-->
                    </div>
                </div>
            </nav>


            <nav class="navbar navbar-dark bg-dark d-block d-md-none">
                <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <a class="navbar-brand" href="#">SISTEMA</a>
                </div>
            </nav>

            <div class="offcanvas offcanvas-start d-block d-md-none" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Menu</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body d-block d-md-none">
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">

                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">PRODUTOS</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#">ALUNOS</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                DROPDOWN
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="cadastroProduto.html" target="centro">Cadastrar</a></li>
                                <li><a class="dropdown-item" href="listaProduto.jsp"  target="centro">Listar</a></li>
                                <li><a class="dropdown-item" href="#"  target="centro">Excluir</a></li>
                                <li><a class="dropdown-item" href="#"  target="centro">Alterar</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>            
        </main>
        <div>
            <iframe src="listarAluno_1.jsp" name="centro"></iframe>
        </div>
        <script src="assets/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
