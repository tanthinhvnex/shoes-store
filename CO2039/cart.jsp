<%@ page language="java"
import="java.net.*"
import="java.lang.*"
import="java.util.*"
import="java.text.*"
import="com.example.model.user.*"
import="com.example.model.user.User.BankAccount"
import="com.example.model.manager.*"
import="com.example.model.*"
import="com.fasterxml.jackson.databind.*"
import="com.fasterxml.jackson.annotation.*"
import="com.fasterxml.jackson.core.*"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
%>
<!-- <!DOCTYPE html> -->
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./assets/css/reset.css" />
        <link rel="preconnect" href="https://cdnjs.cloudflare.com" />
        <!-- Favicon -->
        <link rel="apple-touch-icon" sizes="57x57" href="./assets/favicon/apple-icon-57x57.png"/>
        <link rel="apple-touch-icon" sizes="60x60" href="./assets/favicon/apple-icon-60x60.png"/>
        <link rel="apple-touch-icon" sizes="72x72" href="./assets/favicon/apple-icon-72x72.png"/>
        <link rel="apple-touch-icon" sizes="76x76" href="./assets/favicon/apple-icon-76x76.png"/>
        <link rel="apple-touch-icon" sizes="114x114" href="./assets/favicon/apple-icon-114x114.png"/>
        <link rel="apple-touch-icon" sizes="120x120" href="./assets/favicon/apple-icon-120x120.png"/>
        <link rel="apple-touch-icon" sizes="144x144" href="./assets/favicon/apple-icon-144x144.png"/>
        <link rel="apple-touch-icon" sizes="152x152" href="./assets/favicon/apple-icon-152x152.png"/>
        <link rel="apple-touch-icon" sizes="180x180" href="./assets/favicon/apple-icon-180x180.png"/>
        <link rel="icon" type="image/png" sizes="192x192" href="./assets/favicon/android-icon-192x192.png"/>
        <link rel="icon" type="image/png" sizes="32x32" href="./assets/favicon/favicon-32x32.png"/>
        <link rel="icon" type="image/png" sizes="96x96" href="./assets/favicon/favicon-96x96.png"/>
        <link rel="icon" type="image/png" sizes="16x16" href="./assets/favicon/favicon-16x16.png"/>
        <link rel="manifest" href="./assets/favicon/manifest.json" />
        <meta name="msapplication-TileColor" content="#ffffff" />
        <meta name="msapplication-TileImage" content="./assets/favicon/ms-icon-144x144.png"/>
        <meta name="theme-color" content="#ffffff" />
        <!-- Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
        <link rel="stylesheet" href="./assets/css/style.css" />
        <link rel="stylesheet" href="./assets/css/base.css" />
        <link rel="stylesheet" href="./assets/css/header.css" />
        <link rel="stylesheet" href="./assets/css/footer.css" />
        <link rel="stylesheet" href="./assets/css/cart.css" />
        <link rel="stylesheet" href="./assets/css/style-superstar.css" />
        <link rel="stylesheet" href="./assets/css/select-input.css" />
        <script src="./components/header.js" type="text/javascript" defer></script>
        <script src="./components/footer.js" type="text/javascript" defer></script>

        <title>Giỏ hàng</title>
    </head>
    <body>
        <%
            User user = (User) request.getAttribute("user");
            NumberFormat formatter = NumberFormat.getNumberInstance();
            ObjectMapper objectMapper = new ObjectMapper();
            String userJson = objectMapper.writeValueAsString(user);
            User.CartState cart = user.getCartState();
        %>
        <!-- <header class="header"> -->
        <div class="content_1">
            <div class="sub_content">
                <div class="navbar">
                    <!-- Logo -->
                    <form action="home" method="post" id="home-form" class="logo">
                        <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                        <a id="home" href="#home">
                            <img id="home" src="./assets/img/logo.png" alt="Thợ Code Bán Giày"/>
                        </a>
                        <script>
                            const homeButton = document.getElementById('home');
                            const homeForm = document.getElementById('home-form');
                            homeButton.addEventListener('click',function() {
                                homeForm.submit();
                            });
                        </script>
                    </form>
                    <!-- Navigation -->
                    <ul class="list">
                        <li>
                            <a href="#!"><i>THƯƠNG HIỆU</i></a>
                            <ul class="sub-list">
                                <li>
                                    <form action="adidas" method="post" id="adidas-form">
                                        <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                                        <div id="adidas"><a href="#adidas">Adidas</a></div>
                                        <script>
                                            const adidasButton = document.getElementById('adidas');
                                            const adidasForm = document.getElementById('adidas-form');
                                            adidasButton.addEventListener('click',function() {
                                                adidasForm.submit();
                                            });
                                        </script>
                                    </form>
                                </li>
                                <li>
                                    <form action="nike" method="post" id="nike-form">
                                        <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                                        <div id="nike"><a href="#nike">Nike</a></div>
                                        <script>
                                            const nikeButton = document.getElementById('nike');
                                            const nikeForm = document.getElementById('nike-form');
                                            nikeButton.addEventListener('click',function() {
                                                nikeForm.submit();
                                            });
                                        </script>
                                    </form>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#!"><i>PHÂN LOẠI</i></a>
                            <ul class="sub-list">
                                <li>
                                    <a href="#!">Giày đi với crush</a>
                                </li>
                                <li>
                                    <a href="#!">Giày đi chơi</a>
                                </li>        
                            </ul>
                        </li>
                        <li>
                            <form action="saleoffProducts" method="post" id="saleoff-form">
                                <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                                <div id="saleoff"><a href="#saleoff">KHUYẾN MÃI</a></div>
                                <script>
                                    const saleoffButton = document.getElementById('saleoff');
                                    const saleoffForm = document.getElementById('saleoff-form');
                                    saleoffButton.addEventListener('click',function() {
                                        saleoffForm.submit();
                                    });
                                </script>
                            </form>
                        </li>
                        <li>
                            <form action="newProducts" method="post" id="new-form">
                                <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                                <div id="new"><a href="#new">SẢN PHẨM MỚI</a></div>
                                <script>
                                    const newButton = document.getElementById('new');
                                    const newForm = document.getElementById('new-form');
                                    newButton.addEventListener('click',function() {
                                        newForm.submit();
                                    });
                                </script>
                            </form>
                        </li>
                        <li>
                            <form action="hotProducts" method="post" id="hot-form">
                                <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                                <div id="hot"><a href="#hot">SẢN PHẨM HOT</a></div>
                                <script>
                                    const hotButton = document.getElementById('hot');
                                    const hotForm = document.getElementById('hot-form');
                                    hotButton.addEventListener('click',function() {
                                        hotForm.submit();
                                    });
                                </script>
                            </form>
                        </li>
                    </ul>
                    <!-- Searchbar -->
                    <div class="header_search">
                        <input type="text" class="header_search-input" placeholder="Tìm kiếm sản phẩm"/>
                        <button class="header_search-btn">
                            <i class="header_search-btn-icon fa-solid fa-magnifying-glass"></i>
                        </button>
                    </div>
                    <!-- Action -->
                    <%if(user == null) {%>
                    <div class="action">
                        <a href="login.jsp" class="action-btn">
                            <i class="fa-regular fa-user"></i>
                        </a>
                        <div class="header_cart">
                            <div class="header_cart-wrap">
                                <a href="login.jsp?cart=true" class="action-btn cart">
                                    <i class="header_cart-ico fa-solid fa-cart-plus"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <%} else {%>
                    <div class="action">
                        <div class="user-wrap">
                            <a href="#!" class="action-btn"><i class="fa-regular fa-user"></i></a>
                            <form action="Logout" method="post" id="logout-form">
                                <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                                <a href="#logout" id="logout" class="user_list">Đăng xuất</a>
                                <script>
                                    const logoutButton = document.getElementById('logout');
                                    const logoutForm = document.getElementById('logout-form');
                                    logoutButton.addEventListener('click',function() {
                                        logoutForm.submit();
                                    });
                                </script>
                            </form>
                        </div>
                        <div class="header_cart">
                            <div class="header_cart-wrap">
                                <form action="Cart" method="post" id="cart-form" class="action-btn cart">
                                    <i id="to-cart" class="header_cart-icon fa-solid fa-cart-plus"></i>
                                    <span class="header_cart-notice"><%=user.getCartState().totalQuantity%></span>
                                    <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                                    <script>
                                        const cartButton = document.getElementById('to-cart');
                                        const cartForm = document.getElementById('cart-form');
                                        cartButton.addEventListener('click',function() {
                                            cartForm.submit();
                                        });
                                    </script>
                                </form>
                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
        <!----------------------- Cart -------------------------->
        <%String message = (String) request.getAttribute("message");
        if(message != null) {%>
            <div class="title" style="margin: 0 auto; width: 25%;">
                <h2 class="heading action-btn">
                    ${message}
                </h2>
            </div>
        <%}
        if(cart.totalQuantity == 0) {%>
        <div class="cart-detail">
            <!-- Không có sản phẩm -->
            <div class="no-cart">
                <img class="img-no-cart" src="./assets/img/no_cart.jpg" alt="" />
                <span class="desc-no-cart">Không có sản phẩm nào trong giỏ hàng</span>
                <div class="frame_buy">
                    <form action="home" method="post" id="to-horm-form">
                        <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                        <button id="to-home" class="action-btn action-btn-custom">Trang Chủ</button>
                        <script>
                            const toHomeButton = document.getElementById('to-home');
                            const toHomeForm = document.getElementById('to-home-form');
                            toHomeButton.addEventListener('click',function() {
                                toHomeForm.submit();
                            });
                        </script>
                    </form>
                </div>
            </div>
        </div>
        <%} else {%>
        <div class="cart-detail have-cart">
            <!-- Có sản phẩm -->
            <div class="cart-detail_content">
                <div class="title">Giỏ Hàng</div>
                <ul class="list_item">
                    <%for(int i = 0; i < cart.products.size(); i++) {
                        String productJson = objectMapper.writeValueAsString(cart.products.get(i));%>
                    <script>
                        function increaseValue<%=Integer.toString(i)%>() {
                            var value = parseInt(document.getElementById('number<%=Integer.toString(i)%>').value, 10);
                            value = isNaN(value) ? 1 : value;
                            value++;
                            document.getElementById('number<%=Integer.toString(i)%>').value = value;
                            document.getElementById('outputQuantity<%=Integer.toString(i)%>').textContent = value;
                        }
                        function decreaseValue<%=Integer.toString(i)%>() {
                            var value = parseInt(document.getElementById('number<%=Integer.toString(i)%>').value, 10);
                            value = isNaN(value) ? 1 : value;
                            value < 2 ? value = 2 : '';
                            value--;
                            document.getElementById('number<%=Integer.toString(i)%>').value = value;
                            document.getElementById('outputQuantity<%=Integer.toString(i)%>').textContent = value;
                        }
                    </script>
                    <li class="item">
                        <div class="frame_img">
                            <form action="product" method="post" id="product-form<%=i%>">
                                <a href="#product<%=i%>">
                                    <img class="img_item" id="product<%=i%>" src="<%=cart.products.get(i).getImage()%>" alt="<%=cart.products.get(i).getName()%>"/>
                                </a>
                                <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                                <input type="hidden" name="productJson" value="<%=URLEncoder.encode(productJson, "UTF-8")%>"/>
                                <script>
                                    const productButton<%=i%> = document.getElementById('product<%=i%>');
                                    const productForm<%=i%> = document.getElementById('product-form<%=i%>');
                                        productButton<%=i%>.addEventListener('click',function() {
                                        productForm<%=i%>.submit();
                                    });
                                </script>
                            </form>
                        </div>
                        <div class="content_item">
                            <div class="name">
                                <a href="#"></a>
                                <form action="product" method="post" id="productName-form<%=i%>">
                                    <a href="#productName<%=i%>" id="productName<%=i%>">
                                        <%=cart.products.get(i).getName()%>
                                    </a>
                                    <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                                    <input type="hidden" name="productJson" value="<%=URLEncoder.encode(productJson, "UTF-8")%>"/>
                                    <script>
                                        const productNameButton<%=i%> = document.getElementById('productName<%=i%>');
                                        const productNameForm<%=i%> = document.getElementById('productName-form<%=i%>');
                                            productNameButton<%=i%>.addEventListener('click',function() {
                                            productNameForm<%=i%>.submit();
                                        });
                                    </script>
                                </form>
                            </div>
                            <div class="size_item">
                                <span class="size_item_content">Size Giày: <%=cart.products.get(i).getSize()%></span>
                            </div>
                            <div class="count_multi">
                                <div class="frame_count">
                                    <button class="count-btn" id="decrease<%=Integer.toString(i)%>" onclick="decreaseValue<%=Integer.toString(i)%>()">
                                        <i class="fa-solid fa-minus"></i>
                                    </button>
                                    <span class="count_content" id="outputQuantity<%=Integer.toString(i)%>"><%=Integer.toString(cart.quantityEachProduct.get(i))%></span>
                                    <input type="hidden" form="upd-ct-form<%=i%>" id="number<%=Integer.toString(i)%>" name = "quantity" value="<%=Integer.toString(cart.quantityEachProduct.get(i))%>"/>
                                    <input type="hidden" form="upd-ct-form<%=i%>" id="size<%=Integer.toString(i)%>" name = "size" value="<%=Integer.toString(cart.products.get(i).getSize())%>"/>
                                    <button class="count-btn" id="increase<%=Integer.toString(i)%>" onclick="increaseValue<%=Integer.toString(i)%>()">
                                        <i class="fa-solid fa-plus"></i>
                                    </button>
                                    <button class="count-btn">
                                        <form action="upd-ct" method="post" id="upd-ct-form<%=i%>">
                                            <a href="#upd-ct<%=i%>" id="upd-ct<%=i%>">
                                                Áp dụng
                                            </a>
                                            <input type="hidden" name="cart" value="true"/>
                                            <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                                            <input type="hidden" name="productJson" value="<%=URLEncoder.encode(productJson, "UTF-8")%>"/>
                                            <script>
                                                const updctButton<%=i%> = document.getElementById('upd-ct<%=i%>');
                                                const updctForm<%=i%> = document.getElementById('upd-ct-form<%=i%>');
                                                    updctButton<%=i%>.addEventListener('click',function() {
                                                    updctForm<%=i%>.submit();
                                                });
                                            </script>
                                        </form>
                                    </button>
                                </div>
                                <span class="multi"><i class="fa-solid fa-xmark"></i></span>
                                <span class="unit_price"><%=formatter.format(Math.round(cart.products.get(i).getSaleoff() * cart.products.get(i).getUnitPrice()))%>đ</span>
                            </div>
                            <div class="frame_price">
                                <span class="desc_price">Thành tiền:</span>
                                <span class="total_price-item"><%=formatter.format(Math.round(cart.products.get(i).getSaleoff() * cart.products.get(i).getUnitPrice() * cart.quantityEachProduct.get(i)))%>đ</span>
                            </div>
                        </div>
                        <div class="remove-btn">
                            <form action="upd-ct" method="post" id="upd-ct-form-rm<%=i%>">
                                <a href="#upd-ct-rm<%=i%>" id="upd-ct-rm<%=i%>">
                                    <i class="fa-solid fa-circle-xmark"></i>
                                </a>
                                <input type="hidden" name="cart" value="true"/>
                                <input type="hidden" name="quantity" value="0"/>
                                <input type="hidden" name="size" value="39"/>
                                <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                                <input type="hidden" name="productJson" value="<%=URLEncoder.encode(productJson, "UTF-8")%>"/>
                                <script>
                                    const updctRmButton<%=i%> = document.getElementById('upd-ct-rm<%=i%>');
                                    const updctRmForm<%=i%> = document.getElementById('upd-ct-form-rm<%=i%>');
                                        updctRmButton<%=i%>.addEventListener('click',function() {
                                        updctRmForm<%=i%>.submit();
                                    });
                                </script>
                            </form>
                        </div>
                    </li>
                    <%}%>
                    </ul>
                    <div class="summary">
                        <div class="unit_price"><%=formatter.format(Math.round(cart.totalCost))%>đ</div>
                        <div class="desc_price" style="color: #000">Tổng tiền:</div>
                    </div>
                    <div class="frame_buy">
                        <form action="info-delivery.jsp" method="post" id="buy">
                            <a class="action-btn action-btn-custom" href="#buy" id="buy">
                                Mua Hàng
                            </a>
                            <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                            <script>
                                const buyButton = document.getElementById('buy');
                                const buyForm = document.getElementById('buy');
                                    buyButton.addEventListener('click',function() {
                                    buyForm.submit();
                                });
                            </script>
                        </form>
                    </div>
                </div>
            </div>
        <%}%>
        <footer-component></footer-component>
    </body>
</html>
