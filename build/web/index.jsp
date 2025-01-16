<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="pt-br" data-bs-theme="auto">
    <head><script src="assets/js/color-modes.js"></script>
        <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="style.css" rel="stylesheet">
    </head>
    <body>    
        <main>
            <nav class="navbar navbar-expand-sm navbar-dark bg-dark d-none d-md-block fixed-top mb-5" aria-label="Third navbar example">
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
                                <a class="nav-link active" aria-current="page" href="listarProfessor.jsp"  target="centro">PROFESSORES</a>
                            </li>                           

                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="listarTurma.jsp"  target="centro">TURMAS</a>
                            </li>                           

                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="listarDisciplina.jsp"  target="centro">DISCIPLINAS</a>
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


            <div class="container-xl"> 

                <svg xmlns="http://www.w3.org/2000/svg" class="d-none">            
                
                <symbol id="apple" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M10 1.5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5zm-5 0A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5v1A1.5 1.5 0 0 1 9.5 4h-3A1.5 1.5 0 0 1 5 2.5zm-2 0h1v1A2.5 2.5 0 0 0 6.5 5h3A2.5 2.5 0 0 0 12 2.5v-1h1a2 2 0 0 1 2 2V14a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V3.5a2 2 0 0 1 2-2"/>
                </symbol>
                
                <symbol id="novo-nome" viewBox="0 0 16 16">
                    <path d='M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z'/>
                    <path d='M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z'/>
                </symbol>


                <symbol id="music-note-beamed" viewBox="0 0 16 16">
                    <path d="M6 13c0 1.105-1.12 2-2.5 2S1 14.105 1 13c0-1.104 1.12-2 2.5-2s2.5.896 2.5 2zm9-2c0 1.105-1.12 2-2.5 2s-2.5-.895-2.5-2 1.12-2 2.5-2 2.5.895 2.5 2z"/>
                    <path fill-rule="evenodd" d="M14 11V2h1v9h-1zM6 3v10H5V3h1z"/>
                    <path d="M5 2.905a1 1 0 0 1 .9-.995l8-.8a1 1 0 0 1 1.1.995V3L5 4V2.905z"/>
                </symbol>

                <symbol id="image-fill" viewBox="0 0 16 16">
                    <path d="M.002 3a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-12a2 2 0 0 1-2-2V3zm1 9v1a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V9.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12zm5-6.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0z"/>
                </symbol>

                <symbol id="question-circle" viewBox="0 0 16 16">
                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                    <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"/>
                </symbol>

                <symbol id="bootstrap" viewBox="0 0 118 94">
                    <title>Bootstrap</title>
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"></path>
                </symbol>

                <symbol id="facebook" viewBox="0 0 16 16">
                    <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"/>
                </symbol>

                <symbol id="instagram" viewBox="0 0 16 16">
                    <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"/>
                </symbol>

                <symbol id="twitter" viewBox="0 0 16 16">
                    <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"/>
                </symbol>        

                </svg>

                <h2 class="mb-1 my-5">Disciplinas</h2>
                <div class="d-flex flex-column flex-md-row gap-4 align-items-center justify-content-center">

                    <div class="col-5 p-3 rounded-3 shadow-lg row mx-1">



                        <nav class="col-6 border-end ">
                            <ul class="list-unstyled d-flex flex-column gap-2">
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#apple"/></svg>
                                        <div>
                                            <strong class="d-block">Média de notas</strong>
                                            <small>Média 87.3 total de 52.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#music-note-beamed"/></svg>
                                        <div>
                                            <strong class="d-block">Notas baixa</strong>
                                            <small>22 alunos com notas.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#question-circle"/></svg>
                                        <div>
                                            <strong class="d-block">Média de </strong>
                                            <small>Get help from our.</small>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </nav>


                        <nav class="col-6">
                            <ul class="list-unstyled d-flex flex-column gap-2">
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#image-fill"/></svg>
                                        <div>
                                            <strong class="d-block">Média de notas</strong>
                                            <small>Média 87.3 com 52.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#music-note-beamed"/></svg>
                                        <div>
                                            <strong class="d-block">Notas baixa</strong>
                                            <small>22 alunos.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#question-circle"/></svg>
                                        <div>
                                            <strong class="d-block">Média de </strong>
                                            <small>Get help from our.</small>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </nav>

                    </div>                    

                    <div class="col-5 p-3 rounded-3 shadow-lg row mx-1">
                        <nav class="col-8 border-end ">
                            <ul class="list-unstyled d-flex flex-column gap-2">
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#image-fill"/></svg>
                                        <div>
                                            <strong class="d-block">Média de notas</strong>
                                            <small>Média 87.3 total de 52 alunos.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#music-note-beamed"/></svg>
                                        <div>
                                            <strong class="d-block">Alunos com notas baixa</strong>
                                            <small>22 alunos com notas baixa.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#question-circle"/></svg>
                                        <div>
                                            <strong class="d-block">Média de </strong>
                                            <small>Get help from our.</small>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </nav>

                        <nav class="col-4">
                            <ul class="d-flex flex-column gap-2 list-unstyled small">
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">novo aluno</a></li>
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">todos alunos</a></li>
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">com notas baixa</a></li>
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">relatório completo</a></li>
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">relatório completo</a></li>
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">relatório completo</a></li>
                            </ul>
                        </nav>
                    </div>  

                </div>                

                <h2 class="mb-1 my-5">Alunos</h2>
                <div class="d-flex flex-column flex-md-row gap-4 align-items-center justify-content-center">

                    <div class="col-5 p-3 rounded-3 shadow-lg row mx-1">



                        <nav class="col-6 border-end ">
                            <ul class="list-unstyled d-flex flex-column gap-2">
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#image-fill"/></svg>
                                        <div>
                                            <strong class="d-block">Média de notas</strong>
                                            <small>Média 87.3 total de 52.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#music-note-beamed"/></svg>
                                        <div>
                                            <strong class="d-block">Notas baixa</strong>
                                            <small>22 alunos com notas.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#question-circle"/></svg>
                                        <div>
                                            <strong class="d-block">Média de </strong>
                                            <small>Get help from our.</small>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </nav>


                        <nav class="col-6">
                            <ul class="list-unstyled d-flex flex-column gap-2">
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#image-fill"/></svg>
                                        <div>
                                            <strong class="d-block">Média de notas</strong>
                                            <small>Média 87.3 com 52.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#music-note-beamed"/></svg>
                                        <div>
                                            <strong class="d-block">Notas baixa</strong>
                                            <small>22 alunos.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#question-circle"/></svg>
                                        <div>
                                            <strong class="d-block">Média de </strong>
                                            <small>Get help from our.</small>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </nav>

                    </div>                    

                    <div class="col-5 p-3 rounded-3 shadow-lg row mx-1">
                        <nav class="col-8 border-end ">
                            <ul class="list-unstyled d-flex flex-column gap-2">
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#image-fill"/></svg>
                                        <div>
                                            <strong class="d-block">Média de notas</strong>
                                            <small>Média 87.3 total de 52 alunos.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#music-note-beamed"/></svg>
                                        <div>
                                            <strong class="d-block">Alunos com notas baixa</strong>
                                            <small>22 alunos com notas baixa.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#question-circle"/></svg>
                                        <div>
                                            <strong class="d-block">Média de </strong>
                                            <small>Get help from our.</small>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </nav>

                        <nav class="col-4">
                            <ul class="d-flex flex-column gap-2 list-unstyled small">
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">novo aluno</a></li>
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">todos alunos</a></li>
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">com notas baixa</a></li>
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">relatório completo</a></li>
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">relatório completo</a></li>
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">relatório completo</a></li>
                            </ul>
                        </nav>
                    </div>  

                </div>              

                <h2 class="mb-1 my-5">Turmas</h2>
                <div class="d-flex flex-column flex-md-row gap-4 align-items-center justify-content-center">

                    <div class="col-5 p-3 rounded-3 shadow-lg row mx-1">



                        <nav class="col-6 border-end ">
                            <ul class="list-unstyled d-flex flex-column gap-2">
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#image-fill"/></svg>
                                        <div>
                                            <strong class="d-block">Média de notas</strong>
                                            <small>Média 87.3 total de 52.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#music-note-beamed"/></svg>
                                        <div>
                                            <strong class="d-block">Notas baixa</strong>
                                            <small>22 alunos com notas.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#question-circle"/></svg>
                                        <div>
                                            <strong class="d-block">Média de </strong>
                                            <small>Get help from our.</small>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </nav>


                        <nav class="col-6">
                            <ul class="list-unstyled d-flex flex-column gap-2">
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#image-fill"/></svg>
                                        <div>
                                            <strong class="d-block">Média de notas</strong>
                                            <small>Média 87.3 com 52.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#music-note-beamed"/></svg>
                                        <div>
                                            <strong class="d-block">Notas baixa</strong>
                                            <small>22 alunos.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#question-circle"/></svg>
                                        <div>
                                            <strong class="d-block">Média de </strong>
                                            <small>Get help from our.</small>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </nav>

                    </div>                    

                    <div class="col-5 p-3 rounded-3 shadow-lg row mx-1">
                        <nav class="col-8 border-end ">
                            <ul class="list-unstyled d-flex flex-column gap-2">
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#image-fill"/></svg>
                                        <div>
                                            <strong class="d-block">Média de notas</strong>
                                            <small>Média 87.3 total de 52 alunos.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#music-note-beamed"/></svg>
                                        <div>
                                            <strong class="d-block">Alunos com notas baixa</strong>
                                            <small>22 alunos com notas baixa.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#question-circle"/></svg>
                                        <div>
                                            <strong class="d-block">Média de </strong>
                                            <small>Get help from our.</small>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </nav>

                        <nav class="col-4">
                            <ul class="d-flex flex-column gap-2 list-unstyled small">
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">novo aluno</a></li>
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">todos alunos</a></li>
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">com notas baixa</a></li>
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">relatório completo</a></li>
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">relatório completo</a></li>
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">relatório completo</a></li>
                            </ul>
                        </nav>
                    </div>  

                </div>

                <h2 class="mb-1 my-5">Professores</h2>
                <div class="d-flex flex-column flex-md-row gap-4 align-items-center justify-content-center">

                    <div class="col-5 p-3 rounded-3 shadow-lg row mx-1">



                        <nav class="col-6 border-end ">
                            <ul class="list-unstyled d-flex flex-column gap-2">
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#image-fill"/></svg>
                                        <div>
                                            <strong class="d-block">Média de notas</strong>
                                            <small>Média 87.3 total de 52.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#music-note-beamed"/></svg>
                                        <div>
                                            <strong class="d-block">Notas baixa</strong>
                                            <small>22 alunos com notas.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#question-circle"/></svg>
                                        <div>
                                            <strong class="d-block">Média de </strong>
                                            <small>Get help from our.</small>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </nav>


                        <nav class="col-6">
                            <ul class="list-unstyled d-flex flex-column gap-2">
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#image-fill"/></svg>
                                        <div>
                                            <strong class="d-block">Média de notas</strong>
                                            <small>Média 87.3 com 52.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#music-note-beamed"/></svg>
                                        <div>
                                            <strong class="d-block">Notas baixa</strong>
                                            <small>22 alunos.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#question-circle"/></svg>
                                        <div>
                                            <strong class="d-block">Média de </strong>
                                            <small>Get help from our.</small>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </nav>

                    </div>                    

                    <div class="col-5 p-3 rounded-3 shadow-lg row mx-1">
                        <nav class="col-8 border-end ">
                            <ul class="list-unstyled d-flex flex-column gap-2">
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#image-fill"/></svg>
                                        <div>
                                            <strong class="d-block">Média de notas</strong>
                                            <small>Média 87.3 total de 52 alunos.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#music-note-beamed"/></svg>
                                        <div>
                                            <strong class="d-block">Alunos com notas baixa</strong>
                                            <small>22 alunos com notas baixa.</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn btn-hover-light rounded-2 d-flex align-items-start gap-2 py-1 px-3 lh-sm text-start">
                                        <svg class="bi" width="24" height="24"><use xlink:href="#question-circle"/></svg>
                                        <div>
                                            <strong class="d-block">Média de </strong>
                                            <small>Get help from our.</small>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </nav>

                        <nav class="col-4">
                            <ul class="d-flex flex-column gap-2 list-unstyled small">
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">novo aluno</a></li>
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">todos alunos</a></li>
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">com notas baixa</a></li>
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">relatório completo</a></li>
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">relatório completo</a></li>
                                <li><a href="#" class="link-offset-2 link-underline link-underline-opacity-25 link-underline-opacity-75-hover">relatório completo</a></li>
                            </ul>
                        </nav>
                    </div>  

                </div>            

            </div>


            <div class="container-fluid bg-dark">
                <footer class="container-xl  text-white mt-5 py-3">
                    <div class="row">
                        <div class="col-6 col-md-2 mb-3">
                            <h5>Section</h5>
                            <ul class="nav flex-column">
                                <li class="nav-item mb-2"><a href="#" class="nav-link p-0">Home</a></li>
                                <li class="nav-item mb-2"><a href="#" class="nav-link p-0">Features</a></li>
                                <li class="nav-item mb-2"><a href="#" class="nav-link p-0">Pricing</a></li>
                                <li class="nav-item mb-2"><a href="#" class="nav-link p-0">FAQs</a></li>
                                <li class="nav-item mb-2"><a href="#" class="nav-link p-0">About</a></li>
                            </ul>
                        </div>

                        <div class="col-6 col-md-2 mb-3">
                            <h5>Section</h5>
                            <ul class="nav flex-column">
                                <li class="nav-item mb-2"><a href="#" class="nav-link p-0">Home</a></li>
                                <li class="nav-item mb-2"><a href="#" class="nav-link p-0">Features</a></li>
                                <li class="nav-item mb-2"><a href="#" class="nav-link p-0">Pricing</a></li>
                                <li class="nav-item mb-2"><a href="#" class="nav-link p-0">FAQs</a></li>
                                <li class="nav-item mb-2"><a href="#" class="nav-link p-0">About</a></li>
                            </ul>
                        </div>

                        <div class="col-6 col-md-2 mb-3">
                            <h5>Section</h5>
                            <ul class="nav flex-column">
                                <li class="nav-item mb-2"><a href="#" class="nav-link p-0">Home</a></li>
                                <li class="nav-item mb-2"><a href="#" class="nav-link p-0">Features</a></li>
                                <li class="nav-item mb-2"><a href="#" class="nav-link p-0">Pricing</a></li>
                                <li class="nav-item mb-2"><a href="#" class="nav-link p-0">FAQs</a></li>
                                <li class="nav-item mb-2"><a href="#" class="nav-link p-0">About</a></li>
                            </ul>
                        </div>

                        <div class="col-md-5 offset-md-1 mb-3">
                            <form>
                                <h5>Subscribe to our newsletter</h5>
                                <p>Monthly digest of what's new and exciting from us.</p>
                                <div class="d-flex flex-column flex-sm-row w-100 gap-2">
                                    <label for="newsletter1" class="visually-hidden">Email address</label>
                                    <input id="newsletter1" type="text" class="form-control" placeholder="Email address">
                                    <button class="btn btn-primary" type="button">Subscribe</button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="d-flex flex-column flex-sm-row justify-content-between pt-3 border-top">
                        <p>&copy; 2024 Company, Inc. All rights reserved.</p>
                        <ul class="list-unstyled d-flex">
                            <li class="ms-3"><a class="link-body-emphasis" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#twitter"/></svg></a></li>
                            <li class="ms-3"><a class="link-body-emphasis" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#instagram"/></svg></a></li>
                            <li class="ms-3"><a class="link-body-emphasis" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#facebook"/></svg></a></li>
                        </ul>
                    </div>
                </footer>
            </div>            

        </main>
        <!--        <div>
                    <iframe src="apresentacao.html" name="centro"></iframe>
                </div>-->
        <script src="assets/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
