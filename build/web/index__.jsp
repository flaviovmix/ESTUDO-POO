<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="pt-br" data-bs-theme="auto">
    <head><script src="assets/js/color-modes.js"></script>
        <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="style.css" rel="stylesheet">
    </head>
    <body>    
        <main>
           <%@ include file="../interface/navbar.html" %>
           
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


            


            <%@ include file="interface/footer.html" %>
            
            <% response.sendRedirect("entidades/aluno/listarAluno.jsp"); %>

        </main>
        <!--        <div>
                    <iframe src="apresentacao.html" name="centro"></iframe>
                </div>-->
        <script src="assets/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
