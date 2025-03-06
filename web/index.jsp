<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link id="tema" rel="stylesheet" href="assets/css/temas/variaveis-tema-claro.css"> 
  <link rel="stylesheet" href="assets/css/login.css">
  <title>Document</title>
</head>
<body>
    <div class="container">
        <div class="blueBg">
            <div class="box signin">
                <h2>Já tem uma conta?</h2>
                <button class="signinBtn">Sign in</button>
            </div>
            <div class="box signup">
                <h2>Ainda não tem uma conta?</h2>
                <button class="signupBtn">Sign up</button>
            </div>            
        </div>
        <div class="formBx">
            <div class="form signinForm">
                <form>
                    <h3>Logar</h3>
                    <input type="text" placeholder="usuário" />
                    <input type="password" placeholder="senha" />
                    <!--<input type="submit" value="Login" />-->
                    <a class="btn-logar" href="<%= request.getContextPath() %>/entidades/personagem/listarPersonagem.jsp">Logar</a>
                    <a class="link" href="#">Esqueci minha senha</a>
                </form>
            <div>
                
            <div class="form signupForm">
                <form>
                    <h3>Cadastrar</h3>
                    <input type="text" placeholder="usuário" />
                    <input type="text" placeholder="e-mail" />
                    <input type="password" placeholder="senha" />
                    <input type="password" placeholder="confirma a senha" />
                    <a class="btn-logar" href="<%= request.getContextPath() %>/entidades/personagem/listarPersonagem.jsp">Cadastrar</a>
                </form>
            <div>                
        </div>
    </div>
    
    <script>
        const signinBtn = document.querySelector('.signinBtn');
        const signupBtn = document.querySelector('.signupBtn');
        const formBx = document.querySelector('.formBx');
        const body = document.querySelector('body');
        
        signupBtn.onclick = function() {
            formBx.classList.add('ativa');
            body.classList.add('ativa');
        }
        
        signinBtn.onclick = function() {
            formBx.classList.remove('ativa');
            body.classList.remove('ativa');
        }        
    </script>
</body>
</html>