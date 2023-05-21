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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer"        />
        <link rel="stylesheet" href="./assets/css/style.css" />
        <link rel="stylesheet" href="./assets/css/base.css" />
        <link rel="stylesheet" href="./assets/css/header.css" />
        <link rel="stylesheet" href="./assets/css/footer.css" />
        <link rel="stylesheet" href="./assets/css/style-superstar.css" />
        <link rel="stylesheet" href="./assets/css/select-input.css" />
        <script src="./components/header.js" type="text/javascript" defer></script>
        <script src="./components/footer.js" type="text/javascript" defer></script>
        <script src="./components/adidas.js" type="text/javascript" defer></script>
        <script src="./components/nike.js" type="text/javascript" defer></script>

        <title>Thợ Code Bán Giày</title>
    </head>
    <body>
        <%
            ArrayList<ProductForSale> newProducts = ManagerService.newProducts;  
            ArrayList<ProductForSale> hotProducts = ManagerService.hotProducts;  
            ArrayList<ProductForSale> saleOffProducts = ManagerService.saleOffProducts;  
            NumberFormat formatter = NumberFormat.getNumberInstance();
            User user = (User) request.getAttribute("user");
            ObjectMapper objectMapper = new ObjectMapper();
            String userJson = objectMapper.writeValueAsString(user);
        %>
        <!-- <header class="header"> -->
        <div class="content_1">
            <div class="sub_content">
                <div class="navbar">
                    <!-- Logo -->
                    <form action="home" method="post" id="home-form" class="logo">
                        <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                        <a href="#home">
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
                                <%
                                if(user.getCartState().totalQuantity == 0) {%>
                                <!-- No cart: header_cart-list--no-cart -->
                                <div class="header_cart-list header_cart-list--no-cart">
                                    <img
                                        src="./assets/img/no_cart.jpg"
                                        alt=""
                                        class="header_cart-no-cart-img"
                                    />
                                    <div class="header_cart-list-no-cart-msg">
                                        Chưa Có Sản Phẩm
                                    </div>
                                </div>
                                <%} else {%> 
                                <div class="header_cart-list">
                                    <!-- Cart Cart Cart -->
                                    <h4 class="header_cart-heading">Sản Phẩm Đã Thêm: <%=user.getCartState().products.size()%></h4>
                                    <ul class="header_cart-list-item">
                                        <!-- Cart item -->
                                        <%int size = user.getCartState().products.size();
                                        if(size > 4) size = 4;
                                        for(int i = 0; i < size; i++) {
                                            String productJson = objectMapper.writeValueAsString(user.getCartState().products.get(i));%>
                                        <li>
                                            <div class="header_cart-anchor header_cart-item">
                                                <div class="img-wrap">
                                                    <img
                                                        src="<%=user.getCartState().products.get(i).getImage()%>"
                                                        alt="<%=user.getCartState().products.get(i).getName()%>"
                                                        class="header_cart-img"
                                                    />
                                                </div>
                                                <div class="header_cart-item-info">
                                                    <div class="header_cart-item-head">
                                                        <form action="Cart" method="post" id="cart-form2" class="header_cart-item-name">
                                                            <a href="#to-cart2" id="to-cart2" class="header_cart-item-name"><%=user.getCartState().products.get(i).getName()%></a>
                                                            <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                                                            <script>
                                                                const cartButton2 = document.getElementById('to-cart2');
                                                                const cartForm2 = document.getElementById('cart-form2');
                                                                cartButton2.addEventListener('click',function() {
                                                                    cartForm2.submit();
                                                                });
                                                            </script>
                                                        </form>
                                                        <div class="header_cart-item-head">
                                                            <span class="header_cart-item-price"><%=formatter.format(Math.round(user.getCartState().products.get(i).getSaleoff() * user.getCartState().products.get(i).getUnitPrice()))%>đ</span>
                                                            <span class="header_cart-item-multiply">x</span>
                                                            <span class="header_cart-item-qnt"><%=user.getCartState().quantityEachProduct.get(i)%></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <%} if(user.getCartState().products.size() > 4) {%>
                                            <div class="title">
                                                <div class="more">
                                                    <a href="#to-cart3" id="to-cart3">
                                                        ...
                                                        <form action="Cart" method="post" id="cart-form3">
                                                            <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                                                            <script>
                                                                const cartButton3 = document.getElementById('to-cart3');
                                                                const cartForm3 = document.getElementById('cart-form3');
                                                                cartButton3.addEventListener('click',function() {
                                                                    cartForm3.submit();
                                                                });
                                                            </script>
                                                        </form>
                                                    </a>
                                                </div>
                                            </div>
                                        <%}%>
                                    </ul>
                                    <div class="total_price">
                                        <div class="desc">Tổng Cộng:</div>
                                        <div class="number"><%=formatter.format(user.getCartState().totalCost)%>đ</div>
                                    </div>
                                    <form action="Cart" method="post" id="cart-form4" class="header_cart-view-cart action-btn">
                                        <span id="to-cart4">Xem giỏ hàng</span>
                                        <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                                        <script>
                                            const cartButton4 = document.getElementById('to-cart4');
                                            const cartForm4 = document.getElementById('cart-form4');
                                            cartButton4.addEventListener('click',function() {
                                                cartForm4.submit();
                                            });
                                        </script>
                                    </form>
                                </div>
                                <%}%>
                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
        <div class="content_2">
            <div class="slider">
                <div class="slides">
                    <!-- Tao cac nut bam -->
                    <input type="radio" name="radio-btn" id="radio1" />
                    <input type="radio" name="radio-btn" id="radio2" />
                    <input type="radio" name="radio-btn" id="radio3" />
                    <input type="radio" name="radio-btn" id="radio4" />
                    <!-- Tai len cac anh -->
                    <div class="slide first">
                        <img src="./assets/img/background_1.jpg" alt="" />
                    </div>
                    <div class="slide">
                        <img src="./assets/img/background_2.jpg" alt="" />
                    </div>
                    <div class="slide">
                        <img src="./assets/img/background_3.jpg" alt="" />
                    </div>
                    <div class="slide">
                        <img src="./assets/img/background_4.jpg" alt="" />
                    </div>
                    <!-- Tu dong chuyen slide -->
                    <div class="navigation_auto">
                        <div class="auto_btn1"></div>
                        <div class="auto_btn2"></div>
                        <div class="auto_btn3"></div>
                        <div class="auto_btn4"></div>
                    </div>
                    <!-- Thu cong -->
                    <div class="navigation_manual">
                        <label for="radio1" class="manual_btn"></label>
                        <label for="radio2" class="manual_btn"></label>
                        <label for="radio3" class="manual_btn"></label>
                        <label for="radio4" class="manual_btn"></label>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            var counter = 1;
            setInterval(function () {
                document.getElementById("radio" + counter).checked = true;
                counter++;
                if (counter > 4) {
                    counter = 1;
                }
            }, 5000);
        </script>
        <!-- </header> -->
        <div class="service">
            <div class="sub_content">
                <ul class="list">
                    <li class="list_item">
                        <div class="desc_1">
                            <i class="fa-regular fa-handshake"></i>
                        </div>
                        <div class="title">UY TÍN HÀNG ĐẦU</div>
                        <div class="desc_2">Cam kết sản phẩm 100% chính hãng</div>
                    </li>
                    <li class="list_item">
                        <div class="desc_1">
                            <i class="fa-solid fa-truck-moving"></i>
                        </div>
                        <div class="title">GIAO HÀNG HỎA TỐC</div>
                        <div class="desc_2">Vận chuyển hoả tốc trong 2h nội thành</div>
                    </li>
                    <li class="list_item">
                        <div class="desc_1">
                            <i class="fa-solid fa-phone"></i>
                        </div>
                        <div class="title">HỖ TRỢ 24/24</div>
                        <a href="tel: +84782844906" class="desc_2">Gọi ngay</a>
                    </li>
                </ul>
            </div>
        </div>
        <!----------------------- New Products -------------------------->
        <div class="product">
            <div class="sub_content">
                <div class="new_product" id="new_product">
                    <div class="title">
                        <h2 class="heading action-btn">
                            <a href="#!">SẢN PHẨM MỚI</a>
                        </h2>
                        <div class="more">
                            <form action="newProducts" method="post" id="new2-form">
                                <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                                <a id="new2" href="#new2">Xem thêm</a>
                                <i class="fa-solid fa-arrow-right"></i>
                                <script>
                                    const new2Button = document.getElementById('new2');
                                    const new2Form = document.getElementById('new2-form');
                                    new2Button.addEventListener('click',function() {
                                        new2Form.submit();
                                    });
                                </script>
                            </form>
                        </div>
                    </div>
                    <div class="product_list">
                        <ul class="list">
                            <%for(int i = 0; i < 5; i++) {
                                String productJson = objectMapper.writeValueAsString(newProducts.get(i));%>
                                <li class="list_item">
                                    <span class="status">NEW</span>
                                    <form action="product" method="post" id="newProduct-form<%=i%>">
                                        <a href="#newProduct<%=i%>">
                                            <img id="newProduct<%=i%>" src="<%=newProducts.get(i).getImage()%>" alt="<%=newProducts.get(i).getName()%>" class="img"/>
                                        </a>
                                        <div class="name"><%=newProducts.get(i).getName()%></div>
                                        <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                                        <input type="hidden" name="productJson" value="<%=URLEncoder.encode(productJson, "UTF-8")%>"/>
                                        <script>
                                            const newProductButton<%=i%> = document.getElementById('newProduct<%=i%>');
                                            const newProductForm<%=i%> = document.getElementById('newProduct-form<%=i%>');
                                                newProductButton<%=i%>.addEventListener('click',function() {
                                                newProductForm<%=i%>.submit();
                                            });
                                        </script>
                                    </form>
                                    <a class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </a>
                                    <span class="price"><%=formatter.format(newProducts.get(i).getUnitPrice())%>đ</span>
                                </li>
                            <%}%>
                        </ul>
                    </div>
                </div>
                <div class="hot_product" id="hot_product">
                    <div class="title">
                        <h2 class="heading action-btn">
                            <a href="#!">SẢN PHẨM HOT</a>
                        </h2>
                        <div class="more">
                            <form action="hotProducts" method="post" id="hot2-form">
                                <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                                <a id="hot2" href="#hot2">Xem thêm</a>
                                <i class="fa-solid fa-arrow-right"></i>
                                <script>
                                    const hot2Button = document.getElementById('hot2');
                                    const hot2Form = document.getElementById('hot2-form');
                                    hot2Button.addEventListener('click',function() {
                                        hot2Form.submit();
                                    });
                                </script>
                            </form>
                        </div>
                    </div>
                    <div class="product_list">
                        <ul class="list">
                            <%for(int i = 0; i < 5; i++) {
                                String productJson = objectMapper.writeValueAsString(hotProducts.get(i));%>
                                <li class="list_item">
                                    <span class="status status status_hot">HOT</span>
                                    <form action="product" method="post" id="hotProduct-form<%=i%>">
                                        <a href="#hotProduct<%=i%>">
                                            <img id="hotProduct<%=i%>" src="<%=hotProducts.get(i).getImage()%>" alt="<%=hotProducts.get(i).getName()%>" class="img"/>
                                        </a>
                                        <div class="name"><%=hotProducts.get(i).getName()%></div>
                                        <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                                        <input type="hidden" name="productJson" value="<%=URLEncoder.encode(productJson, "UTF-8")%>"/>
                                        <script>
                                            const hotProductButton<%=i%> = document.getElementById('hotProduct<%=i%>');
                                            const hotProductForm<%=i%> = document.getElementById('hotProduct-form<%=i%>');
                                                hotProductButton<%=i%>.addEventListener('click',function() {
                                                hotProductForm<%=i%>.submit();
                                            });
                                        </script>
                                    </form>
                                    <a class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </a>
                                    <span class="price"><%=formatter.format(hotProducts.get(i).getUnitPrice())%>đ</span>
                                </li>
                            <%}%>
                        </ul>
                    </div>
                </div>
                <div class="hot_product">
                    <div class="title">
                        <h2 class="heading action-btn">
                            <a href="#!">SẢN PHẨM KHUYẾN MÃI</a>
                        </h2>
                        <div class="more">
                            <form action="saleoffProducts" method="post" id="saleoff2-form">
                                <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                                <a id="saleoff2" href="#saleoff2">Xem thêm</a>
                                <i class="fa-solid fa-arrow-right"></i>
                                <script>
                                    const saleoff2Button = document.getElementById('saleoff2');
                                    const saleoff2Form = document.getElementById('saleoff2-form');
                                    saleoff2Button.addEventListener('click',function() {
                                        saleoff2Form.submit();
                                    });
                                </script>
                            </form>
                        </div>
                    </div>
                    <div class="product_list">
                        <ul class="list">
                            <%for(int i = 0; i < 5; i++) {
                                String productJson = objectMapper.writeValueAsString(saleOffProducts.get(i));%>
                                <li class="list_item">
                                    <span class="status status_sale">-<%=Math.round((1-saleOffProducts.get(i).getSaleoff()) * 100)%>%</span>
                                    <form action="product" method="post" id="saleOffProduct-form<%=i%>">
                                        <a href="#saleOffProduct<%=i%>">
                                            <img id="saleOffProduct<%=i%>" src="<%=saleOffProducts.get(i).getImage()%>" alt="<%=saleOffProducts.get(i).getName()%>" class="img"/>
                                        </a>
                                        <div class="name"><%=saleOffProducts.get(i).getName()%></div>
                                        <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                                        <input type="hidden" name="productJson" value="<%=URLEncoder.encode(productJson, "UTF-8")%>"/>
                                        <script>
                                            const saleOffProductButton<%=i%> = document.getElementById('saleOffProduct<%=i%>');
                                            const saleOffProductForm<%=i%> = document.getElementById('saleOffProduct-form<%=i%>');
                                                saleOffProductButton<%=i%>.addEventListener('click',function() {
                                                saleOffProductForm<%=i%>.submit();
                                            });
                                        </script>
                                    </form>
                                    <a class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </a>
                                    <span class="price"><%=formatter.format(Math.round(saleOffProducts.get(i).getSaleoff() * saleOffProducts.get(i).getUnitPrice()))%>đ</span>
                                    <span class="old_price"><%=formatter.format(saleOffProducts.get(i).getUnitPrice())%>đ</span>
                                </li>
                            <%}%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <footer-component></footer-component>
    </body>
</html>
