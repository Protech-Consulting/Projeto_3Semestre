<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cadastrar Usuario | Calabreso's</title>
    <link rel="shortcut icon" href="../imgs/pizza.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>

<body>

    <!-- NAV BAR -->
    <nav class="navbar navbar-expand-lg px-3">
        <div class="container-fluid">
            <a class="navbar-brand d-flex align-items-center" href="#">
                <img src="../imgs/calabreso's.jpeg" alt="Logo dos calabreso's" width="85em">
                <p style="color: #E32323; font-weight: 700; font-size: 1.3em; margin: 0.1em 0 0 .2em;">Calabreso's</p>
            </a>
        </div>
        <span class="navbar-text d-flex align-items-center px-4">
            <img src="../imgs/sacola.png" alt="Imagem de uma sacola" width="50em">
        </span>
    </nav>


    <!-- MAIN -->
    <main>
        <div class="container">

            <!-- Linha 1 (Cadastro | Pizza.img)-->
            <div class="row text-center">

                <!-- Coluna 1 -->
                <div class="col-sm d-flex align-items-center justify-content-end">
                    <h1 class="text-center mb-4" style="font-size: 3em; letter-spacing: 0.15em; font-weight: bold;">
                        Login</h1>
                </div>

                <!-- Coluna 2 -->
                <div class="col-sm d-flex justify-content-start">
                    <img src="../imgs/pizza.png" alt="Imagem de uma Pizza" width="230px">
                </div>

            </div>

            <!-- Linha 2 (formulário) -->
            <div class="row">

                <!-- Coluna 1 -->
                <div class="col-sm">
                    <!-- Formulário -->
                    <form class="d-grid gap-4" action="../logarUsuario" method="POST">

                        <!-- Linha 3 (Usuário) -->
                        <div class="row">
                            <div class="col-sm">
                            </div>
                            <div class="col-sm">
                                <!-- Usuário -->
                                <div class="form-group">
                                    <label for="nome-usuario" class="my-2" style="font-size: 1.5em;">Usuário</label>
                                    <input type="text" class="form-control" name="txtUsuario" id="nome-usuario"
                                        placeholder="Digite seu nome" style="font-size: 1.2em;">
                                </div>
                            </div>
                            <div class="col-sm">
                            </div>

                        </div>

                        <!-- Linha 4 (Senha) -->
                        <div class="row">
                            <div class="col-sm">
                            </div>
                            <div class="col-sm">
                                <!-- Senha -->
                                <div class="form-group">
                                    <label for="senha-usuario" class="my-2" style="font-size: 1.5em;">Senha</label>
                                    <input type="text" class="form-control" id="senha-usuario" name="txtSenha"
                                        placeholder="Digite sua senha" style="font-size: 1.2em;">
                                </div>
                            </div>
                            <div class="col-sm">
                            </div>

                        </div>

                        <!-- Linha 5 (Botão Logar Usuário) -->
                        <div class="row">
                            <div class="text-center mt-4 mb-5">
                                <!-- Botão Logar -->
                                <button class="btn btn-danger" style="font-size: 1.5em;">Entrar</button>
                            </div>
                        </div>

                    </form>

                    <!-- Linha 6 (Caso possua conta | clique aqui) -->
                    <div class="row text-center mb-4" style="font-size: 1.5em;">
                        <p>Caso não possua uma conta <a class="link-opacity-100" href="../viewCadastrarUsuario">clique aqui</a></p>
                    </div>

                </div>
            </div>
        </div>
    </main>









    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>