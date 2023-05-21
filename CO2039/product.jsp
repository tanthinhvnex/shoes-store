<%@ page language="java"
import="java.net.*"
import="java.lang.*"
import="java.util.*"
import="java.text.*"
import="java.time.*"
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
<!DOCTYPE html>
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
        <link rel="stylesheet" href="./assets/css/select-input.css" />
        <link rel="stylesheet" href="./assets/css/style-superstar.css" />
        <script src="./components/header.js" type="text/javascript" defer></script>
        <script src="./components/footer.js" type="text/javascript" defer></script>
        <script src="./components/adidas.js" type="text/javascript" defer></script>
        <script src="./components/nike.js" type="text/javascript" defer></script>
        <script src="./components/select-input.js" type="text/javascript" defer></script>

        <title>Thợ Code Bán Giày</title>
    </head>
    <body>
        <%
            User user = (User) request.getAttribute("user");
            ProductForSale product = (ProductForSale) request.getAttribute("product");
            for(int i = 0; i < ManagerService.products.size(); i++) {
                if(ManagerService.products.get(i).getName().equals(product.getName())) {
                    product = ManagerService.products.get(i);
                    break;
                }
            }
            NumberFormat formatter = NumberFormat.getNumberInstance();
            ObjectMapper objectMapper = new ObjectMapper();
            String userJson = objectMapper.writeValueAsString(user);
            String productJson = objectMapper.writeValueAsString(product);
			int size = 0;
        %>
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
                                        <%size = user.getCartState().products.size();
                                        if(size > 4) size = 4;
                                        for(int i = 0; i < size; i++) {
                                            productJson = objectMapper.writeValueAsString(user.getCartState().products.get(i));%>
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
		<div class="product_detail">
            <div class="sub_content">
                <div class="main_content">
                    <%if(product.getName().equals("SUPERSTAR")) {%>
                    <div class="small_image">
                        <div class="small_image-link">
                            <a href="./assets/img/superstar detail 1.jpeg">
                                <img
                                    src="./assets/img/superstar detail 1.jpeg"
                                    alt="<%=product.getName()%>"
                                    class="small_image-img" />
                            </a>
                        </div>
                        <div class="small_image-link">
                            <a href="./assets/img/superstar detail 2.jpeg">
                                <img
									src="./assets/img/superstar detail 2.jpeg"
									alt="<%=product.getName()%>"
									class="small_image-img" />
                            </a>
                        </div>
                        <div class="small_image-link">
                            <a href="./assets/img/superstar detail 3.jpeg">
                                <img
									src="./assets/img/superstar detail 3.jpeg"
									alt="<%=product.getName()%>"
									class="small_image-img" />
                            </a>
                        </div>
                    </div>
                    <%} else if(product.getName().equals("ULTRABOOST 21")) {%>
                        <div class="small_image">
                            <div class="small_image-link">
                                <a href="./assets/img/adidas ultra 4dfwd detail 1.png">
                                    <img
                                        src="./assets/img/adidas ultra 4dfwd detail 1.png"
                                        alt="<%=product.getName()%>"
                                        class="small_image-img" />
                                </a>
                            </div>
                            <div class="small_image-link">
                                <a href="./assets/img/adidas ultra 4dfwd detail 2.png">
                                    <img
                                        src="./assets/img/adidas ultra 4dfwd detail 2.png"
                                        alt="<%=product.getName()%>"
                                        class="small_image-img" />
                                </a>
                            </div>
                            <div class="small_image-link">
                                <a href="./assets/img/adidas ultra 4dfwd detail 3.png">
                                    <img
                                        src="./assets/img/adidas ultra 4dfwd detail 3.png"
                                        alt="<%=product.getName()%>"
                                        class="small_image-img" />
                                </a>
                            </div>
                        </div>
                    <%} else if(product.getName().equals("ADIDAS ULTRA 4DFWD")) {%>
                        <div class="small_image">
                            <div class="small_image-link">
                                <a href="./assets/img/adidas ultra 4dfwd detail 1.png">
                                    <img
                                        src="./assets/img/adidas ultra 4dfwd detail 1.png"
                                        alt="<%=product.getName()%>"
                                        class="small_image-img" />
                                </a>
                            </div>
                            <div class="small_image-link">
                                <a href="./assets/img/adidas ultra 4dfwd detail 2.png">
                                    <img
                                        src="./assets/img/adidas ultra 4dfwd detail 2.png"
                                        alt="<%=product.getName()%>"
                                        class="small_image-img" />
                                </a>
                            </div>
                            <div class="small_image-link">
                                <a href="./assets/img/adidas ultra 4dfwd detail 3.png">
                                    <img
                                        src="./assets/img/adidas ultra 4dfwd detail 3.png"
                                        alt="<%=product.getName()%>"
                                        class="small_image-img" />
                                </a>
                            </div>
                        </div>
                    <%} else if(product.getName().equals("JORDAN 1 MID TURF ORANGE")) {%>
                        <div class="small_image">
                            <div class="small_image-link">
                                <a href="./assets/img/jordan 1 mid turf orange detail 1.jpg">
                                    <img
                                        src="./assets/img/jordan 1 mid turf orange detail 1.jpg"
                                        alt="<%=product.getName()%>"
                                        class="small_image-img" />
                                </a>
                            </div>
                            <div class="small_image-link">
                                <a href="./assets/img/jordan 1 mid turf orange detail 2.jpg">
                                    <img
                                        src="./assets/img/jordan 1 mid turf orange detail 2.jpg"
                                        alt="<%=product.getName()%>"
                                        class="small_image-img" />
                                </a>
                            </div>
                            <div class="small_image-link">
                                <a href="./assets/img/jordan 1 mid turf orange detail 3.jpg">
                                    <img
                                        src="./assets/img/jordan 1 mid turf orange detail 3.jpg"
                                        alt="<%=product.getName()%>"
                                        class="small_image-img" />
                                </a>
                            </div>
                        </div>
                    <%} else if(product.getName().equals("NIKE AIR JORDAN 1 LOW ELEVATE")) {%>
                    <div class="small_image">
                        <div class="small_image-link">
                            <a href="./assets/img/jordan 1 low elevate detail 1.png">
                                <img
                                    src="./assets/img/jordan 1 low elevate detail 1.png"
                                    alt="<%=product.getName()%>"
                                    class="small_image-img" />
                            </a>
                        </div>
                        <div class="small_image-link">
                            <a href="./assets/img/jordan 1 low elevate detail 2.pngg">
                                <img
                                    src="./assets/img/jordan 1 low elevate detail 2.png"
                                    alt="<%=product.getName()%>"
                                    class="small_image-img" />
                            </a>
                        </div>
                        <div class="small_image-link">
                            <a href="./assets/img/jordan 1 low elevate detail 3.png">
                                <img
                                    src="./assets/img/jordan 1 low elevate detail 3.png"
                                    alt="<%=product.getName()%>"
                                    class="small_image-img" />
                            </a>
                        </div>
                    </div>
                    <%}%>
                    <div class="main_image">
                        <img src="<%=product.getImage()%>" alt="<%=product.getName()%>" class="main_image-img" />
                    </div>
                    <div class="info_buy">
                        <div class="name"><%=product.getName()%></div>
                        <div class="star">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                        </div>
                        <div class="display_ui_own">
                            <div class="ui_own">
                                <div class="option-size">
                                    <%if(product.getQuantity() <= 0) {%>
                                    <div class="desc-size">Tạm hết hàng</div><br/>
                                    <%} else {%>
                                    <div class="desc-size">Còn hàng</div><br/>
                                    <%}%>
                                    <div class="desc-size">Đã bán: <%=product.getNoOfSolds()%></div>
                                </div>
                            </div>
                        </div>
                        <div class="ui_user">
                            <div class="price"><%=formatter.format(Math.round(product.getSaleoff() * product.getUnitPrice()))%>đ</div>
                            <%if(product.getSaleoff() < 1.0) {%>
                            <div class="old_price"><%=formatter.format(product.getUnitPrice())%>đ</div>
                            <%}%>
                        </div>
                        <%if(product.getQuantity() > 0) {%>
                            <%if(user != null) {
                                productJson = objectMapper.writeValueAsString(product);%>
                            <script>
                                function increaseValue() {
                                    var value = parseInt(document.getElementById('number').value, 10);
                                    value = isNaN(value) ? 1 : value;
                                    value > <%=product.getQuantity()%> - 1 ? value = <%=product.getQuantity()%> - 1: '';
                                    value++;
                                    document.getElementById('number').value = value;
                                    document.getElementById('quantityOrder').value = value;
                                    document.getElementById('outputQuantity').textContent = value;
                                }
                                function decreaseValue() {
                                    var value = parseInt(document.getElementById('number').value, 10);
                                    value = isNaN(value) ? 1 : value;
                                    value < 2 ? value = 2 : '';
                                    value--;
                                    document.getElementById('number').value = value;
                                    document.getElementById('quantityOrder').value = value;
                                    document.getElementById('outputQuantity').textContent = value;
                                }
                                
                                function increaseSize() {
                                    var value = parseInt(document.getElementById('choose-size').value, 10);
                                    value = isNaN(value) ? 39 : value;
                                    value > 44 ? value = 44 : '';
                                    value++;
                                    document.getElementById('choose-size').value = value;
                                    document.getElementById('sizeOrder').value = value;
                                    document.getElementById('outputSize').textContent = value;
                                }
                                function decreaseSize() {
                                    var value = parseInt(document.getElementById('choose-size').value, 10);
                                    value = isNaN(value) ? 0 : value;
                                    value < 40 ? value = 40 : '';
                                    value--;
                                    document.getElementById('choose-size').value = value;
                                    document.getElementById('sizeOrder').value = value;
                                    document.getElementById('outputSize').textContent = value;
                                }
                            </script>
                            <br>
                            <span class="desc-size">Chọn số lượng:</span>
                            <form class="select-input">
                                <div class="filter_page-btn" id="decrease" onclick="decreaseValue()" value="Decrease Value">
                                    <i class="fa-solid fa-minus"></i>
                                </div>
                                <span class="count" id="outputQuantity">1</span>
                                <input form="upd-ct" type="hidden" id="number" name = "quantity" value="1"/>
                                <div class="filter_page-btn" id="increase" onclick="increaseValue()" value="Increase Value">
                                    <i class="fa-solid fa-plus"></i>
                                </div>                               
                            </form>
                            <div class="option-size">
                                <span class="desc-size">Chọn kích Thước:</span>
                                <form class="select-input">
                                    <!-- <div class="value-button" id="decrease" onclick="decreaseValue()" value="Decrease Value">-</div> -->
                                    <div class="filter_page-btn" id="decrease" onclick="decreaseSize()" value="Decrease Size">
                                        <i class="fa-solid fa-minus"></i>
                                    </div>
                                    <span class="count" id="outputSize">39</span>
                                    <input form="upd-ct" type="hidden" id="choose-size" name = "size" value="39"/>
                                    <div class="filter_page-btn" id="increase" onclick="increaseSize()" value="Increase Size">
                                        <i class="fa-solid fa-plus"></i>
                                    </div>                               
                                </form>
                            </div>
                            <div class="action-buy">
                                <a href="#add-to-cart" id="add-to-cart" class="action-btn">
                                    <form method="post" id="upd-ct" action="upd-ct">
                                        <input type="hidden" name="product" value="true"/>
                                        <input type="hidden" name="productJson" value="<%=URLEncoder.encode(productJson, "UTF-8")%>"/>
                                        <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                                        <i class="fa-solid fa-cart-plus"></i>
                                    </form> 
                                    <span>Thêm Vào Giỏ</span>
                                </a>
                                <a class="action-btn" id="pmt" href="#pmt">
                                    <i style="color: #ededed" class="fa-solid fa-money-check-dollar"></i>
                                    <form method="post" id="pmt-form" action="upd-ct">
                                        <input type="hidden" name="order" value="true"/>
                                        <input type="hidden" id="quantityOrder" name="quantity" value="1">
                                        <input type="hidden" id="sizeOrder" name="size" value="39">
                                        <input type="hidden" name="productJson" value="<%=URLEncoder.encode(productJson, "UTF-8")%>"/>
                                        <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                                    </form> 
                                    <span style="color: #ededed">Mua Ngay</span>
                                </a>
                            </div>
                            <script>
                                const addToCartButton = document.getElementById('add-to-cart');
                                const addToCartForm = document.getElementById('upd-ct');
                                addToCartButton.addEventListener('click',function() {
                                    addToCartForm.submit();
                                });
                                const buyButton = document.getElementById('pmt');
                                const buyForm = document.getElementById('pmt-form');
                                buyButton.addEventListener('click',function() {
                                    buyForm.submit();
                                });
                            </script>
                            <%} else {%>
                            <br>
                            <span class="desc-size">Chọn số lượng:</span>
                            <form class="select-input">
                                <div class="filter_page-btn" id="decrease" onclick="decreaseValue()" value="Decrease Value">
                                    <i class="fa-solid fa-minus"></i>
                                </div>
                                <span class="count" id="outputQuantity">1</span>
                                <input form="upd-ct" type="hidden" id="number" name = "quantity" value="1"/>
                                <div class="filter_page-btn" id="increase" onclick="increaseValue()" value="Increase Value">
                                    <i class="fa-solid fa-plus"></i>
                                </div>                               
                            </form>
                            <div class="option-size">
                                <span class="desc-size">Chọn kích Thước:</span>
                                <form class="select-input">
                                    <!-- <div class="value-button" id="decrease" onclick="decreaseValue()" value="Decrease Value">-</div> -->
                                    <div class="filter_page-btn" id="decrease" onclick="decreaseSize()" value="Decrease Size">
                                        <i class="fa-solid fa-minus"></i>
                                    </div>
                                    <span class="count" id="outputSize">39</span>
                                    <input form="upd-ct" type="hidden" id="choose-size" name = "size" value="39"/>
                                    <div class="filter_page-btn" id="increase" onclick="increaseSize()" value="Increase Size">
                                        <i class="fa-solid fa-plus"></i>
                                    </div>                               
                                </form>
                            </div>
                            <div class="action-buy">
                                <a href="login.jsp" class="action-btn">
                                    <i class="fa-solid fa-cart-plus"></i>
                                    <span>Thêm Vào Giỏ</span>
                                </a>
                                <a class="action-btn" href="login.jsp">
                                    <i style="color: #ededed" class="fa-solid fa-money-check-dollar"></i>
                                    <span style="color: #ededed">Mua Ngay</span>
                                </a>
                            </div>
                            <%}
                        }%>
                    </div>
                </div>
            </div>
            <%if(product.getName().equals("SUPERSTAR") || product.getName().equals("superstar")) {%>
            <div class="desc_detail">
                <div class="reason">4 LÝ DO BẠN KHÔNG NÊN BỎ LỠ SUPERSTAR</div>
                <div class="paragraph">
                    Hàng ngày nhìn thấy những đôi giày Adidas Superstar được rất nhiều các bạn trẻ mang trên đường phố
                    đã bao giờ bạn thắc mắc tại sao đôi giày này lại có sức hút lớn như vậy chưa? Rất có thể đọc xong
                    bài viết này bạn sẽ lập tức muốn sở hữu đôi giày huyền thoại này đấy!
                </div>
                <div class="reason">1. Mẫu giày không bao giờ lỗi thời</div>
                <div class="paragraph">
                    Adidas Superstar Authentic là mẫu giày vô cùng classic được liệt kê vào danh sách những đôi giày
                    kinh điển, trường tồn và không bao giờ lỗi thời. Đôi giày được ra mắt vào năm 1969 và đã trở thành
                    một trong những yếu tố có ảnh hưởng vô cùng mạnh mẽ trong các giới thể thao, thời trang và văn hóa
                    hip-hop lúc bấy giờ. Thậm chí, năm 1986, Run D.M.C còn cho ra ca khúc “My adidas” nằm trong album
                    “Raising Hell”, khẳng định một lần nữa vị thế của dòng giày Superstar trong từng ngõ ngách của đường
                    phố.
                </div>
                <div class="img-desc">
                    <img src="./assets/img/superstar desc 1.jpg" alt="superstar" />
                </div>
                <div class="reason">2. Khả năng mix đồ không giới hạn</div>
                <div class="paragraph">
                    Đôi giày Adidas Superstar này có thể nói là một con tắc kè hoa chính hiệu. Chúng có khả năng biến
                    hóa vô cùng linh hoạt, phù hợp với mọi giới tính, mọi tính cách và mọi hoàn cảnh. Với các bạn nữ,
                    nếu các bạn muốn có một vẻ ngoài năng động, khỏe khoắn và phá cách một chút thì một chiếc quần jeans
                    rách gối và một đôi giày adidas Superstar sẽ là một lựa chọn không sai vào đâu được. Thế nhưng, nếu
                    bạn lại là một cô nàng bánh bèo thì sao nhỉ? Hãy yên tâm rằng điều đó cũng không làm khó được đôi
                    giày adidas huyền thoại này đâu! Bạn chỉ cần kết hợp với một chiếc váy xòe, vậy là sẽ có một vẻ
                    ngoài ngọt ngào, đáng yêu ngay thôi!
                </div>
                <div class="img-desc">
                    <img src="./assets/img/superstar desc 2.jpg" alt="superstar" />
                </div>
                <div class="reason">3. Mức giá dễ chịu</div>
                <div class="paragraph">
                    Đây là một trong số ít những đôi high end (cao cấp) mà lại có giá cả rất phải chăng. Mức giá của đôi
                    giày chính hãng Adidas Superstar này giao động từ 2.100.000- 2.500.000. Tuy nhiên khi mua hàng các
                    bạn cũng nên cân nhắc thật kĩ tránh trường hợp vì ham giá rẻ mà chọn những nơi mua hàng không đảm
                    bảo chất lượng. Tại Thợ Code Bán Giày, giá đôi Adidas Superstar hiện tại chỉ còn 1.900.000đ. Cực êm
                    ái và phù hợp cho túi tiền của các bạn ngân sách không nhiều nhưng lại thích sở hữu cho hình một đôi
                    giày đúng nghĩa.
                </div>
                <div class="img-desc">
                    <img src="./assets/img/superstar desc 3.jpg" alt="superstar" />
                </div>

                <div class="reason">4. Bảo quản dễ dàng</div>
                <div class="paragraph">
                    Với thiết kế chủ yếu được làm bằng chất liệu da nên đôi giày không bị bám bụi và rất dễ dàng trong
                    việc làm sạch và bảo quản. Nếu chẳng may bị dính bẩn, bạn chỉ cần dùng một chiếc giẻ ẩm, lau đi ngay
                    lúc đó là vết bẩn sẽ tự động biến mất thôi. Còn nếu trong trường hợp gặp những vết bẩn cứng đầu hơn,
                    bạn có thể sử dụng các loại tẩy rửa chuyên dụng như Crep.
                </div>
                <div class="img-desc">
                    <img src="./assets/img/superstar desc 4.jpg" alt="superstar" />
                </div>
            </div>
            <%} else if(product.getName().equals("ULTRABOOST 21")) {%>
            <div class="desc_detail">
                <!-- Sửa: phần được viết ở class="reason" sẽ được in đậm
                Đây là phần mô tả sản phẩm chi tiết, đi copy trang kingshoes
                rồi dán vào đây -->
                <!-- Sửa: với các sản phẩm không được viết mô tả chi tiết
                trên trang kingshoes, có thể tạo một nội dung văn bản không
                có ý nghĩa bằng cách gõ lorem10 + phím tab để tạo ra 10 từ
                không có ý nghĩa nội dung, thay đổi số 10 để tạo số lượng từ
                như mong muốn -->
                <div class="reason">4 LÝ DO BẠN KHÔNG NÊN BỎ LỠ ADIDAS</div>
                <!-- Sửa: phần được viết ở class="paragraph" là viết thường -->
                <div class="paragraph">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Non ipsum excepturi quas dolores tempore aut soluta, repellat labore omnis? Ad.
                </div>
                <div class="reason">1. Mẫu giày không bao giờ lỗi thời</div>
                <div class="paragraph">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, aspernatur.
                </div>
                <div class="img-desc">
                    <!-- Sửa: src với alt -->
                    <img src="./assets/img/ultraboost 21 desc 1.png" alt="ultraboost21" />
                </div>
                <div class="reason">2. Khả năng mix đồ không giới hạn</div>
                <div class="paragraph">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, illum.
                </div>
                <div class="img-desc">
                    <!-- Sửa: src với alt -->
                    <img src="./assets/img/ultraboost 21 desc 2.png" alt="ultraboost21" />
                </div>
                <div class="reason">3. Mức giá dễ chịu</div>
                <div class="paragraph">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae, blanditiis.
                </div>
                <div class="img-desc">
                    <!-- Sửa: src với alt -->
                    <img src="./assets/img/ultraboost 21 desc 3.png" alt="ultraboost21" />
                </div>

                <div class="reason">4. Bảo quản dễ dàng</div>
                <div class="paragraph">
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sint, ipsam.
                </div>
                <div class="img-desc">
                    <!-- Sửa: src với alt -->
                    <img src="./assets/img/ultraboost 21 desc 4.png" alt="ultraboost21" />
                </div>
            </div>
            <%} else if(product.getName().equals("ULTRABOOST 20 CLOUD WHITE")) {%>
                <div class="desc_detail">
                    <!-- Sửa: phần được viết ở class="reason" sẽ được in đậm
                    Đây là phần mô tả sản phẩm chi tiết, đi copy trang kingshoes
                    rồi dán vào đây -->
                    <!-- Sửa: với các sản phẩm không được viết mô tả chi tiết
                    trên trang kingshoes, có thể tạo một nội dung văn bản không
                    có ý nghĩa bằng cách gõ lorem10 + phím tab để tạo ra 10 từ
                    không có ý nghĩa nội dung, thay đổi số 10 để tạo số lượng từ
                    như mong muốn -->
                    <div class="reason">4 LÝ DO BẠN KHÔNG NÊN BỎ LỠ ADIDAS</div>
                    <!-- Sửa: phần được viết ở class="paragraph" là viết thường -->
                    <div class="paragraph">
                        Lorem, ipsum dolor sit amet consectetur adipisicing elit. Error, magni repellendus quam aliquid esse recusandae natus fugiat repudiandae molestias eius?
                    </div>
                    <div class="reason">1. Mẫu giày không bao giờ lỗi thời</div>
                    <div class="paragraph">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, aspernatur.
                    </div>
                    <div class="img-desc">
                        <!-- Sửa: src với alt -->
                        <img src="./assets/img/ultraboost 20 cloud white desc 1.png" alt="ultraboostcloud" />
                    </div>
                    <div class="reason">2. Khả năng mix đồ không giới hạn</div>
                    <div class="paragraph">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, illum.
                    </div>
                    <div class="img-desc">
                        <!-- Sửa: src với alt -->
                        <img src="./assets/img/ultraboost 20 cloud white desc 2.png" alt="ultraboostcloud" />
                    </div>
                    <div class="reason">3. Mức giá dễ chịu</div>
                    <div class="paragraph">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae, blanditiis.
                    </div>
                    <div class="img-desc">
                        <!-- Sửa: src với alt -->
                        <img src="./assets/img/ultraboost 20 cloud white desc 3.png" alt="ultraboostcloud" />
                    </div>
    
                    <div class="reason">4. Bảo quản dễ dàng</div>
                    <div class="paragraph">
                        Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sint, ipsam.
                    </div>
                    <div class="img-desc">
                        <!-- Sửa: src với alt -->
                        <img src="./assets/img/ultraboost 20 cloud white desc 4.png" alt="ultraboostcloud" />
                    </div>
                </div>
            <%} else if(product.getName().equals("NIKE AIR FORCE 1 SUMMIT WHITE COMMAND FORCE")) {%>
                <div class="desc_detail">
                    <!-- Sửa: phần được viết ở class="reason" sẽ được in đậm
                    Đây là phần mô tả sản phẩm chi tiết, đi copy trang kingshoes
                    rồi dán vào đây -->
                    <!-- Sửa: với các sản phẩm không được viết mô tả chi tiết
                    trên trang kingshoes, có thể tạo một nội dung văn bản không
                    có ý nghĩa bằng cách gõ lorem10 + phím tab để tạo ra 10 từ
                    không có ý nghĩa nội dung, thay đổi số 10 để tạo số lượng từ
                    như mong muốn -->
                    <div class="reason">4 LÝ DO BẠN KHÔNG NÊN BỎ LỠ ADIDAS</div>
                    <!-- Sửa: phần được viết ở class="paragraph" là viết thường -->
                    <div class="paragraph">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Blanditiis, natus nostrum maiores soluta tenetur culpa ullam explicabo aliquam. Ullam, dolorum.
                    </div>
                    <div class="reason">1. Mẫu giày không bao giờ lỗi thời</div>
                    <div class="paragraph">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, aspernatur.
                    </div>
                    <div class="img-desc">
                        <!-- Sửa: src với alt -->
                        <img src="./assets/img/nike summit white command force desc 1.png" alt="commandforce" />
                    </div>
                    <div class="reason">2. Khả năng mix đồ không giới hạn</div>
                    <div class="paragraph">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, illum.
                    </div>
                    <div class="img-desc">
                        <!-- Sửa: src với alt -->
                        <img src="./assets/img/nike summit white command force desc 2.png" alt="commandforce" />
                    </div>
                    <div class="reason">3. Mức giá dễ chịu</div>
                    <div class="paragraph">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae, blanditiis.
                    </div>
                    <div class="img-desc">
                        <!-- Sửa: src với alt -->
                        <img src="./assets/img/nike summit white command force desc 3.png" alt="commandforce" />
                    </div>
    
                    <div class="reason">4. Bảo quản dễ dàng</div>
                    <div class="paragraph">
                        Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sint, ipsam.
                    </div>
                    <div class="img-desc">
                        <!-- Sửa: src với alt -->
                        <img src="./assets/img/nike summit white command force desc 4.png" alt="commandforce" />
                    </div>
                </div>
            <%} else if(product.getName().equals("AIR MAX BLISS")) {%>
                <div class="desc_detail">
                    <!-- Sửa: phần được viết ở class="reason" sẽ được in đậm
                    Đây là phần mô tả sản phẩm chi tiết, đi copy trang kingshoes
                    rồi dán vào đây -->
                    <!-- Sửa: với các sản phẩm không được viết mô tả chi tiết
                    trên trang kingshoes, có thể tạo một nội dung văn bản không
                    có ý nghĩa bằng cách gõ lorem10 + phím tab để tạo ra 10 từ
                    không có ý nghĩa nội dung, thay đổi số 10 để tạo số lượng từ
                    như mong muốn -->
                    <div class="reason">4 LÝ DO BẠN KHÔNG NÊN BỎ LỠ ADIDAS</div>
                    <!-- Sửa: phần được viết ở class="paragraph" là viết thường -->
                    <div class="paragraph">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Cupiditate, ab nemo beatae sequi inventore tenetur ullam magnam doloribus maxime nam!
                    </div>
                    <div class="reason">1. Mẫu giày không bao giờ lỗi thời</div>
                    <div class="paragraph">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, aspernatur.
                    </div>
                    <div class="img-desc">
                        <!-- Sửa: src với alt -->
                        <img src="./assets/img/nike air max bliss desc 1.png" alt="airmaxbliss" />
                    </div>
                    <div class="reason">2. Khả năng mix đồ không giới hạn</div>
                    <div class="paragraph">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, illum.
                    </div>
                    <div class="img-desc">
                        <!-- Sửa: src với alt -->
                        <img src="./assets/img/nike air max bliss desc 2.png" alt="airmaxbliss" />
                    </div>
                    <div class="reason">3. Mức giá dễ chịu</div>
                    <div class="paragraph">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae, blanditiis.
                    </div>
                    <div class="img-desc">
                        <!-- Sửa: src với alt -->
                        <img src="./assets/img/nike air max bliss desc 3.png" alt="airmaxbliss" />
                    </div>
    
                    <div class="reason">4. Bảo quản dễ dàng</div>
                    <div class="paragraph">
                        Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sint, ipsam.
                    </div>
                    <div class="img-desc">
                        <!-- Sửa: src với alt -->
                        <img src="./assets/img/nike air max bliss desc 4.png" alt="airmaxbliss" />
                    </div>
                </div>
            <%} else if(product.getName().equals("JORDAN 1 MID TURF ORANGE")) {%>
                <div class="desc_detail">
                <!-- Sửa: phần được viết ở class="reason" sẽ được in đậm
                Đây là phần mô tả sản phẩm chi tiết, đi copy trang kingshoes
                rồi dán vào đây -->
                <!-- Sửa: với các sản phẩm không được viết mô tả chi tiết
                trên trang kingshoes, có thể tạo một nội dung văn bản không
                có ý nghĩa bằng cách gõ lorem10 + phím tab để tạo ra 10 từ
                không có ý nghĩa nội dung, thay đổi số 10 để tạo số lượng từ
                như mong muốn -->
                <div class="reason">4 LÝ DO BẠN KHÔNG NÊN BỎ LỠ ADIDAS</div>
                <!-- Sửa: phần được viết ở class="paragraph" là viết thường -->
                <div class="paragraph">
                    Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugit similique voluptatibus repellat illum! Modi eaque laudantium, cumque reprehenderit labore officia!
                </div>
                <div class="reason">1. Mẫu giày không bao giờ lỗi thời</div>
                <div class="paragraph">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, aspernatur.
                </div>
                <div class="img-desc">
                    <!-- Sửa: src với alt -->
                    <img src="./assets/img/jordan 1 mid turf orange desc 1.jpg" alt="turforange" />
                </div>
                <div class="reason">2. Khả năng mix đồ không giới hạn</div>
                <div class="paragraph">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, illum.
                </div>
                <div class="img-desc">
                    <!-- Sửa: src với alt -->
                    <img src="./assets/img/jordan 1 mid turf orange desc 2.jpg" alt="turforange" />
                </div>
                <div class="reason">3. Mức giá dễ chịu</div>
                <div class="paragraph">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae, blanditiis.
                </div>
                <div class="img-desc">
                    <!-- Sửa: src với alt -->
                    <img src="./assets/img/jordan 1 mid turf orange desc 3.jpg" alt="turforange" />
                </div>

                <div class="reason">4. Bảo quản dễ dàng</div>
                <div class="paragraph">
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sint, ipsam.
                </div>
                <div class="img-desc">
                    <!-- Sửa: src với alt -->
                    <img src="./assets/img/jordan 1 mid turf orange desc 4.jpg" alt="turforange" />
                </div>
            </div>
            <%} else if(product.getName().equals("ADIDAS ULTRA 4DFWD")) {%>
                <div class="desc_detail">
                    <!-- Sửa: phần được viết ở class="reason" sẽ được in đậm
                    Đây là phần mô tả sản phẩm chi tiết, đi copy trang kingshoes
                    rồi dán vào đây -->
                    <!-- Sửa: với các sản phẩm không được viết mô tả chi tiết
                    trên trang kingshoes, có thể tạo một nội dung văn bản không
                    có ý nghĩa bằng cách gõ lorem10 + phím tab để tạo ra 10 từ
                    không có ý nghĩa nội dung, thay đổi số 10 để tạo số lượng từ
                    như mong muốn -->
                    <div class="reason">4 LÝ DO BẠN KHÔNG NÊN BỎ LỠ ADIDAS</div>
                    <!-- Sửa: phần được viết ở class="paragraph" là viết thường -->
                    <div class="paragraph">
                        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quasi, dolore. Eum consequuntur, temporibus magni earum soluta ut dolorem illum accusamus.
                    </div>
                    <div class="reason">1. Mẫu giày không bao giờ lỗi thời</div>
                    <div class="paragraph">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, aspernatur.
                    </div>
                    <div class="img-desc">
                        <!-- Sửa: src với alt -->
                        <img src="./assets/img/adidas ultra 4dfwd desc 1.png" alt="ultra4dfwd" />
                    </div>
                    <div class="reason">2. Khả năng mix đồ không giới hạn</div>
                    <div class="paragraph">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, illum.
                    </div>
                    <div class="img-desc">
                        <!-- Sửa: src với alt -->
                        <img src="./assets/img/adidas ultra 4dfwd desc 2.png" alt="ultra4dfwd" />
                    </div>
                    <div class="reason">3. Mức giá dễ chịu</div>
                    <div class="paragraph">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae, blanditiis.
                    </div>
                    <div class="img-desc">
                        <!-- Sửa: src với alt -->
                        <img src="./assets/img/adidas ultra 4dfwd desc 3.png" alt="ultra4dfwd" />
                    </div>
    
                    <div class="reason">4. Bảo quản dễ dàng</div>
                    <div class="paragraph">
                        Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sint, ipsam.
                    </div>
                    <div class="img-desc">
                        <!-- Sửa: src với alt -->
                        <img src="./assets/img/adidas ultra 4dfwd desc 4.png" alt="ultra4dfwd" />
                    </div>
                </div>
            <%} else if(product.getName().equals("NIKE AIR JORDAN 1 LOW ELEVATE")) {%>
            <div class="desc_detail">
                <!-- Sửa: phần được viết ở class="reason" sẽ được in đậm
                Đây là phần mô tả sản phẩm chi tiết, đi copy trang kingshoes
                rồi dán vào đây -->
                <!-- Sửa: với các sản phẩm không được viết mô tả chi tiết
                trên trang kingshoes, có thể tạo một nội dung văn bản không
                có ý nghĩa bằng cách gõ lorem10 + phím tab để tạo ra 10 từ
                không có ý nghĩa nội dung, thay đổi số 10 để tạo số lượng từ
                như mong muốn -->
                <div class="reason">4 LÝ DO BẠN KHÔNG NÊN BỎ LỠ NIKE AIR JORDAN 1 LOW ELEVATE</div>
                <!-- Sửa: phần được viết ở class="paragraph" là viết thường -->
                <div class="paragraph">
                    Nike Air Jordan 1 với lịch sử hơn 30 năm luôn được nhìn nhận như một trong những dòng sản phẩm 
                    thành công nhất của Nike. Nike Jordan 1 luôn bán hết một cách nhanh chóng ngay từ khi ra mắt đến nay, 
                    luôn là sản phẩm được các tín đồ thời trang chú ý hàng đầu. Air Jordan được đặt dựa theo ngôi sao 
                    bóng rổ lừng danh Michael Jordan, huyền thoại của NBA.
                </div>
                <div class="reason">1. Mẫu giày không bao giờ lỗi thời</div>
                <div class="paragraph">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, aspernatur.
                </div>
                <div class="img-desc">
                    <!-- Sửa: src với alt -->
                    <img src="./assets/img/jordan 1 low elevate desc 1.png" alt="lowelevate" />
                </div>
                <div class="reason">2. Khả năng mix đồ không giới hạn</div>
                <div class="paragraph">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, illum.
                </div>
                <div class="img-desc">
                    <!-- Sửa: src với alt -->
                    <img src="./assets/img/jordan 1 low elevate desc 2.png" alt="lowelevate" />
                </div>
                <div class="reason">3. Mức giá dễ chịu</div>
                <div class="paragraph">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae, blanditiis.
                </div>
                <div class="img-desc">
                    <!-- Sửa: src với alt -->
                    <img src="./assets/img/jordan 1 low elevate desc 3.png" alt="lowelevate" />
                </div>

                <div class="reason">4. Bảo quản dễ dàng</div>
                <div class="paragraph">
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sint, ipsam.
                </div>
                <div class="img-desc">
                    <!-- Sửa: src với alt -->
                    <img src="./assets/img/jordan 1 low elevate desc 4.png" alt="lowelevate" />
                </div>
            </div>
            <%} else {%>
            <div class="desc_detail">
                <div class="reason">Mô tả sản phẩm</div>
                    <div class="paragraph">
                    <%=product.getDescription()%>
                    </div>
                </div> 
            </div>
            <%}%>
            <div class="comment">
                <%if(user != null) {
                    for(int i = 0; i < user.getbuyingHistory().products.size(); i++) {
                        if(user.getbuyingHistory().products.get(i).getName().equals(product.getName()) && user.getbuyingHistory().hasAsset.get(i) == false) {%>
                            <p class="reason">Đánh giá của bạn:</p>
                            <div class="rating star">
                                <script>
                                    var noOfStars = 0;
                                </script>
                                <img id="star1" src="http://laz-img-cdn.alicdn.com/tfs/TB18ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png" style="width: 31.92px; height: 31.92px;" onclick="asset1()">
                                <img id="star2" src="http://laz-img-cdn.alicdn.com/tfs/TB18ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png" style="width: 31.92px; height: 31.92px;" onclick="asset2()">
                                <img id="star3" src="http://laz-img-cdn.alicdn.com/tfs/TB18ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png" style="width: 31.92px; height: 31.92px;" onclick="asset3()">
                                <img id="star4" src="http://laz-img-cdn.alicdn.com/tfs/TB18ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png" style="width: 31.92px; height: 31.92px;" onclick="asset4()">
                                <img id="star5" src="http://laz-img-cdn.alicdn.com/tfs/TB18ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png" style="width: 31.92px; height: 31.92px;" onclick="asset5()">
                                <script>
                                    function asset1() {
                                        var id = document.getElementById('star1');
                                        id.src = "http://laz-img-cdn.alicdn.com/tfs/TB19ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png";
                                        document.getElementById('noOfStars').value = 1;
                                    }
                                    function asset2() {
                                        asset1();
                                        var id = document.getElementById('star2');
                                        id.src = "http://laz-img-cdn.alicdn.com/tfs/TB19ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png";
                                        document.getElementById('noOfStars').value = 2;
                                    }
                                    function asset3() {
                                        asset1();
                                        asset2();
                                        var id = document.getElementById('star3');
                                        id.src = "http://laz-img-cdn.alicdn.com/tfs/TB19ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png";
                                        document.getElementById('noOfStars').value = 3;
                                    }
                                    function asset4() {
                                        asset1();
                                        asset2();
                                        asset3();
                                        var id = document.getElementById('star4');
                                        id.src = "http://laz-img-cdn.alicdn.com/tfs/TB19ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png";
                                        document.getElementById('noOfStars').value = 4;
                                    }
                                    function asset5() {
                                        asset1();
                                        asset2();
                                        asset3();
                                        asset4();
                                        var id = document.getElementById('star5');
                                        id.src = "http://laz-img-cdn.alicdn.com/tfs/TB19ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png";
                                        document.getElementById('noOfStars').value = 5;
                                    }
                                </script>
                            </div>
                            <form method="post" action="a-r">
                                <div class="frame">
                                    <input type="hidden" id="noOfStars" name="noOfStars" value="0"/>
                                    <textarea type="text" name="review" id="comment-box" placeholder="Nhập đánh giá của bạn" value=""></textarea>
                                    <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>">
                                    <input type="hidden" name="productJson" value="<%=URLEncoder.encode(productJson, "UTF-8")%>">
                                </div>
                                <input type="submit" id="post" value="Đánh giá"/>
                            </form>
                        <%break;
                        }
                    }
                }%>
                <ul id="unordered">
                    <%if(product.getCrs().size() == 0) {%>
                        Sản phẩm chưa có đánh giá nào.
                    <%} else {
                        for(int i = 0; i < product.getCrs().size(); i++) {%>
                            <li>
                                <div>
                                    <%for(int j = 0; j < product.getCrs().get(i).getNoOfStars(); j++) {%>
                                    <img class="rating star" src="http://laz-img-cdn.alicdn.com/tfs/TB19ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png" style="width: 20.46px; height: 20.46px;">
                                    <%}%>
                                    <%for(int j = 0; j < 5 - product.getCrs().get(i).getNoOfStars(); j++) {%>
                                    <img class="rating star" src="http://laz-img-cdn.alicdn.com/tfs/TB18ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png" style="width: 20.46px; height: 20.46px;">
                                    <%}%>
                                    <%=LocalDate.now().toString()%>
                                </div>
                                <div class="user_name"><%=product.getCrs().get(i).getFromUser()%></div>
                                <div class="comment_content"><%=product.getCrs().get(i).getReview()%></div>
                                <div class="react heart-solid">
                                    <!-- Heart: heart-full -->
                                    <a href="#!"><i class="fa-regular fa-heart"></i></a>
                                    <a href="#!"><i class="fa-solid fa-heart"></i></a>
                                    <span class="react_count">1</span>
                                </div>
                            </li>
                        <%}
                    }%>
                </ul>
            </div>
        </div>
        <footer-component></footer-component>
    </body>
</html>