<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="style.css">
    <link rel="shortcut icon" href="imgs/pizza.png" type="image/x-icon">
    <title>Pizzaria Calabreso's</title>
    <style>
        header {
            width: 95vw;

            img {
                width: 85%;
            }
        }

        .icone_rede_social {
            border-radius: 50%;
            transition: scale 0.2s, box-shadow 0.2s;
        }

        .icone_rede_social:hover {
            scale: 1.05;
            cursor: pointer;
            box-shadow: 2px 2px 3px #0005;
        }
    </style>
</head>

<body>

    <!-- NAV BAR -->
    <nav class="navbar navbar-expand-lg px-3">
        <div class="">
            <a class="navbar-brand d-flex align-items-center" href="#">
                <img src="imgs/calabreso's.jpeg" alt="Logo dos calabreso's" width="85em">
                <p style="color: #E32323; font-weight: 700; font-size: 1.3em; margin: 0.1em 0 0 .2em;">Calabreso's</p>
            </a>
        </div>

        <ul class="navbar-nav mr-auto d-flex" style="font-size: 1.4em; margin-left: auto;">
            <li class="nav-item">
                <a class="nav-link" href="viewCadastrarUsuario">Cadastro</a>
            </li>
            <li class="nav-item">
                <a class="nav-link"  href="viewLoginUsuario">Login</a>
            </li>
        </ul>

        <span class="navbar-text d-flex align-items-center px-4">
            <img src="imgs/sacola.png" alt="Imagem de uma sacola" width="50em">
        </span>
    </nav>

    <!-- SLOGAN -->
    <header>
        <div class="container">
            <div class="row">
                <div class="col d-flex justify-content-center">
                    <img src="imgs/tela_inicial/slogan.png" alt="">
                </div>
            </div>
        </div>
    </header>


    <main>
        <!-- PROMOÇÕES -->
        <h2 class="text-center my-4" style="font-size: 3.5em; font-weight: bold;">Promoções</h2>
        <!-- 3 Pizzas com Promoções -->
        <div class="container mb-5">
            <div class="row my-3">
                <!-- Coluna 1 (pizza 1) -->
                <div class="col-4 text-center">
                    <!-- Ilustração Pizza -->
                    <div class="bg-$gray-100 p-3 rounded"
                        style="background-color: #F2F2F2; box-shadow: #0004 0 9px 5.1px;">
                        <!-- Imagem Pizza -->
                        <img src="imgs/pizza.png" alt="Imagem de uma Pizza" width="220em">
                        <!-- Nome Pizza -->
                        <h2>Pizza Portuguesa</h2>
                        <!-- Tipo Pizza -->
                        <h4 class="text-center py-1"
                            style="background-color: #860000; border-radius: 10em; color: #fff; font-size: 1.2em; margin: 1.2em 5em;">
                            Salgada</h4>
                        <!-- Descrição Pizza -->
                        <p class="text-start mx-4">Uma pizza portuguesa: molho, queijo, presunto, ovos, cebola,
                            azeitonas e orégano.</p>
                        <!-- Botão Comprar Pizza -->
                        <div class="mb-3">
                            <button class="btn btn-danger" style="font-size: 1.6em;">Comprar</button>
                        </div>
                        <!-- Preço Pizza -->
                        <h2 class="mb-4">R$52,40</h2>
                    </div>
                </div>

                <!-- Coluna 2 (pizza 2) -->
                <div class="col-4 text-center">
                    <!-- Ilustração Pizza -->
                    <div class="bg-$gray-100 p-3 rounded"
                        style="background-color: #F2F2F2; box-shadow: #0004 0 9px 5.1px;">
                        <!-- Imagem Pizza -->
                        <img src="imgs/pizza.png" alt="Imagem de uma Pizza" width="220em">
                        <!-- Nome Pizza -->
                        <h2>Pizza Portuguesa</h2>
                        <!-- Tipo Pizza -->
                        <h4 class="text-center py-1"
                            style="background-color: #860000; border-radius: 10em; color: #fff; font-size: 1.2em; margin: 1.2em 5em;">
                            Salgada</h4>
                        <!-- Descrição Pizza -->
                        <p class="text-start mx-4">Uma pizza portuguesa: molho, queijo, presunto, ovos, cebola,
                            azeitonas e orégano.</p>
                        <!-- Botão Comprar Pizza -->
                        <div class="mb-3">
                            <button class="btn btn-danger" style="font-size: 1.6em;">Comprar</button>
                        </div>
                        <!-- Preço Pizza -->
                        <h2 class="mb-4">R$52,40</h2>
                    </div>
                </div>

                <!-- Coluna 3 (pizza 3) -->
                <div class="col-4 text-center">
                    <!-- Ilustração Pizza -->
                    <div class="bg-$gray-100 p-3 rounded"
                        style="background-color: #F2F2F2; box-shadow: #0004 0 9px 5.1px;">
                        <!-- Imagem Pizza -->
                        <img src="imgs/pizza.png" alt="Imagem de uma Pizza" width="220em">
                        <!-- Nome Pizza -->
                        <h2>Pizza Portuguesa</h2>
                        <!-- Tipo Pizza -->
                        <h4 class="text-center py-1"
                            style="background-color: #860000; border-radius: 10em; color: #fff; font-size: 1.2em; margin: 1.2em 5em;">
                            Salgada</h4>
                        <!-- Descrição Pizza -->
                        <p class="text-start mx-4">Uma pizza portuguesa: molho, queijo, presunto, ovos, cebola,
                            azeitonas e orégano.</p>
                        <!-- Botão Comprar Pizza -->
                        <div class="mb-3">
                            <button class="btn btn-danger" style="font-size: 1.6em;">Comprar</button>
                        </div>
                        <!-- Preço Pizza -->
                        <h2 class="mb-4">R$52,40</h2>
                    </div>
                </div>
            </div>
        </div>


        <!-- CARDÁPIO -->
        <div class="d-flex">

            <div class="col d-flex align-items-center flex-column mb-5">

                <div class="cardapio-img">
                    <img src="imgs/menu.png" alt="">
                </div>

                <div style="width: 45vw;">
                    <p class="text-center mb-5" style="font-size: 1.3em;">Explore nosso menu repleto de pizzas
                        artesanais, preparadas com os
                        melhores ingredientes para garantir uma experiência gastronômica inesquecível. Delicie-se com
                        nossas entradas, sobremesas e uma seleção especial de vinhos e bebidas. Acesse nosso menu e
                        descubra o sabor autêntico da pizza italiana. Buon appetito!</p>
                </div>
                <button class="btn btn-danger my4" style="font-size: 2em; font-weight: 600;">Ver Menu</button>
            </div>

        </div>

    </main>

    <footer style="margin-top: 5em;">
        <div class="d-flex justify-content-center gap-3">
            <img src="imgs/facebook_icone.png" alt="" class="icone_rede_social">
            <img src="imgs/youtube_icone.png" alt="" class="icone_rede_social">
            <img src="imgs/pinterest_icone.png" alt="" class="icone_rede_social">
            <img src="imgs/twitter_icone.png" alt="" class="icone_rede_social">
            <img src="imgs/linkedin_icone.png" alt="" class="icone_rede_social">
        </div>
        <p class="my-3 text-center" style="font-size: 1.5em;">© 2024 Pizzaria Calabreso's. Todos os direitos reservados
        </p>
    </footer>

</body>

</html>