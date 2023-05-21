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
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./assets/css/reset.css" />
        <link rel="preconnect" href="https://cdnjs.cloudflare.com" />
        <!-- Favicon -->
        <link rel="apple-touch-icon" sizes="57x57" href="./assets/favicon/apple-icon-57x57.png" />
        <link rel="apple-touch-icon" sizes="60x60" href="./assets/favicon/apple-icon-60x60.png" />
        <link rel="apple-touch-icon" sizes="72x72" href="./assets/favicon/apple-icon-72x72.png" />
        <link rel="apple-touch-icon" sizes="76x76" href="./assets/favicon/apple-icon-76x76.png" />
        <link rel="apple-touch-icon" sizes="114x114" href="./assets/favicon/apple-icon-114x114.png" />
        <link rel="apple-touch-icon" sizes="120x120" href="./assets/favicon/apple-icon-120x120.png" />
        <link rel="apple-touch-icon" sizes="144x144" href="./assets/favicon/apple-icon-144x144.png" />
        <link rel="apple-touch-icon" sizes="152x152" href="./assets/favicon/apple-icon-152x152.png" />
        <link rel="apple-touch-icon" sizes="180x180" href="./assets/favicon/apple-icon-180x180.png" />
        <link rel="icon" type="image/png" sizes="192x192" href="./assets/favicon/android-icon-192x192.png" />
        <link rel="icon" type="image/png" sizes="32x32" href="./assets/favicon/favicon-32x32.png" />
        <link rel="icon" type="image/png" sizes="96x96" href="./assets/favicon/favicon-96x96.png" />
        <link rel="icon" type="image/png" sizes="16x16" href="./assets/favicon/favicon-16x16.png" />
        <link rel="manifest" href="./assets/favicon/manifest.json" />
        <meta name="msapplication-TileColor" content="#ffffff" />
        <meta name="msapplication-TileImage" content="./assets/favicon/ms-icon-144x144.png" />
        <meta name="theme-color" content="#ffffff" />
        <!-- Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./assets/css/style.css" />
        <link rel="stylesheet" href="./assets/css/base.css" />
        <link rel="stylesheet" href="./assets/css/header.css" />
        <link rel="stylesheet" href="./assets/css/footer.css" />
        <link rel="stylesheet" href="./assets/css/style-adidas-all.css" />
        <link rel="stylesheet" href="./assets/css/select-input.css" />
        <link rel="stylesheet" href="./assets/css/style-superstar.css" />
        <script src="components/header.js" type="text/javascript" defer></script>
        <script src="components/footer.js" type="text/javascript" defer></script>
        <script src="components/adidas.js" type="text/javascript" defer></script>
        <script src="components/nike.js" type="text/javascript" defer></script>
        <script src="components/select-input.js" type="text/javascript" defer></script>

        <title>Nike</title>
    </head>
    <body>
        <%
            User user = (User) request.getAttribute("user");
            String price = (String) request.getAttribute("price");
            String sort = (String) request.getAttribute("sort");
            double priceFilter1 = 100000000;
            double priceFilter2 = 0;
            if(price != null) {
                if(price.equals("less-3")) priceFilter1 = 3000000;
                else if(price.equals("greater-3")) priceFilter2 = 3000000;
            }
            ArrayList<Double> sortedCost = new ArrayList<Double>();
            for(int i = 0; i < ManagerService.products.size(); i++) {
                sortedCost.add(ManagerService.products.get(i).getUnitPrice() * ManagerService.products.get(i).getSaleoff());
            }
            if(sort != null) {
                if(sort.equals("dec")) {
                    Collections.sort(sortedCost, Collections.reverseOrder());
                } else if(sort.equals("inc")) {
                    Collections.sort(sortedCost);
                }
            }
            ArrayList<ProductForSale> copyProducts = new ArrayList<ProductForSale>();
            ArrayList<String> copyProductsName = new ArrayList<String>();
            for(int i = 0, j = 0; j < sortedCost.size(); i++) {
                if(ManagerService.products.get(i).getUnitPrice() * ManagerService.products.get(i).getSaleoff() == sortedCost.get(j) && !copyProductsName.contains(ManagerService.products.get(i).getName())) {
                    copyProductsName.add(ManagerService.products.get(i).getName());
                    copyProducts.add(ManagerService.products.get(i));
                    i = -1;
                    j++;
                }
            }
        %>
        <script>
            console.log('<%=copyProducts.get(0).getName()%>;;;');
            console.log('<%=copyProducts.get(1).getName()%>;;;');
            console.log('<%=copyProducts.get(2).getName()%>;;;');
            console.log('<%=copyProducts.get(3).getName()%>;;;');
            console.log('<%=copyProducts.get(4).getName()%>;;;');
            console.log('<%=copyProducts.get(5).getName()%>;;;');
            console.log('<%=copyProducts.get(6).getName()%>;;;');
        </script>
        <%
            /*if(sort != null) {
                if(sort.equals("dec")) {
                    Collections.sort(sortedCost, Collections.reverseOrder());
                    for(int i = 0, j = 0; j < sortedCost.size(); i++) {
                        if(ManagerService.products.get(i).getUnitPrice() * ManagerService.products.get(i).getSaleoff() == sortedCost.get(j) && !copyProducts.contains(ManagerService.products.get(i).getName())) {
                            copyProductsName.add(ManagerService.products.get(i).getName());
                            copyProducts.add(ManagerService.products.get(i));
                            i = -1;
                            j++;
                        }
                    }
                } else if(sort.equals("inc")) {
                    Collections.sort(sortedCost);
                    for(int i = 0, j = 0; j < sortedCost.size(); i++) {
                        if(ManagerService.products.get(i).getUnitPrice() * ManagerService.products.get(i).getSaleoff() == sortedCost.get(j) && !copyProducts.contains(ManagerService.products.get(i).getName())) {
                            copyProductsName.add(ManagerService.products.get(i).getName());
                            copyProducts.add(ManagerService.products.get(i));
                            i = -1;
                            j++;
                        }
                    }
                } else {

                }
            }*/
            ArrayList<ProductForSale> products = ManagerService.products;
            NumberFormat formatter = NumberFormat.getNumberInstance();
            ObjectMapper objectMapper = new ObjectMapper();
            String userJson = objectMapper.writeValueAsString(user);
			int size = 0;
        %>
        <script>
            console.log('<%=copyProducts.size()%>');
            console.log('<%=sortedCost.size()%>');
            console.log('<%=sortedCost.get(14)%>');
        </script>
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
        <div class="selection">
            <div class="sub_content">
                <div class="filter">
                    <!-- Tạo thanh tìm kiếm -->
                    <!-- <div class="select-input">
                        <div class="custom-select" style="width: 200px">
                            <select name="size" id="size" form="filter-form">
                                <option value="none" selected>Chọn Size Giày</option>
                                <option value="39">39</option>
                                <option value="40">40</option>
                                <option value="41">41</option>
                                <option value="41">42</option>
                                <option value="41">43</option>
                                <option value="41">44</option>
                                <option value="41">45</option>
                            </select>
                        </div>
                    </div> -->
                    <div class="select-input">
                        <div class="custom-select" style="width: 200px">
                            <select name="price" id="price" form="filter-form">
                                <option value="none" selected>Khoảng Giá</option>
                                <option value="less-3">Dưới 3 Triệu</option>
                                <option value="greater-3">Trên 3 Triệu</option>
                            </select>
                        </div>
                    </div>
                    <div class="select-input">
                        <div class="custom-select" style="width: 200px">
                            <select name="brand" id="brand" form="filter-form">
                                <option value="none" selected>Thương Hiệu</option>
                                <option value="adidas">Adidas</option>
                                <option value="nike">Nike</option>
                            </select>
                        </div>
                    </div>
                    <div class="select-input">
                        <div class="custom-select" style="width: 200px">
                            <select name="classify" id="classify" form="filter-form">
                                <option value="none" selected>Phân Loại</option>
                                <option value="crush">Giày Đi Với Crush</option>
                                <option value="sport">Giày Thể Thao</option>
                            </select>
                        </div>
                    </div>
                    <div class="select-input">
                        <div class="custom-select" style="width: 200px">
                            <select name="sort" id="sort" form="filter-form">
                                <option value="none" selected>Sắp Xếp Theo</option>
                                <option value="inc">Giá Thấp Đến Cao</option>
                                <option value="dec">Giá Cao Đến Thấp</option>
                            </select>
                        </div>
                    </div>
                    <div class="select-input select-input_last">
                        <form id="filter-form" action="adidas">
                            <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>" />
                            <input type="hidden" name="filter" value="true"/>
                            <input class="select-input select-input_last" type="submit" value="Tìm kiếm ngay"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="product">
            <div class="sub_content">
                <div class="new_product">
                    <div class="product_list">
                        <ul class="list">
                        <%if(sort != null) {
                            for(int i = 0; i < copyProducts.size(); i++) {
                                String productJson = objectMapper.writeValueAsString(copyProducts.get(i));
                                if(copyProducts.get(i).getCategory().equals("Nike") && (copyProducts.get(i).getUnitPrice() * copyProducts.get(i).getSaleoff() < priceFilter1) && (copyProducts.get(i).getUnitPrice() * copyProducts.get(i).getSaleoff() >= priceFilter2)) {%>
                                <li class="list_item">
                                    <%if(copyProducts.get(i).getSaleoff() < 1.0) {%>
                                        <span class="status status_sale">-<%=Math.round((1-copyProducts.get(i).getSaleoff()) * 100)%>%</span>
                                    <%} else if(copyProducts.get(i).getNewOrHot() == true) {%>
                                        <span class="status">NEW</span>
                                    <%} else {%>
                                        <span class="status status status_hot">HOT</span>
                                    <%}%>
                                    <form action="product" method="post" id="product-form<%=i%>">
                                        <a href="#product<%=i%>">
                                            <img id="product<%=i%>" src="<%=copyProducts.get(i).getImage()%>" alt="<%=copyProducts.get(i).getName()%>" class="img"/>
                                        </a>
                                        <div class="name"><%=copyProducts.get(i).getName()%></div>
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
                                    <a class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </a>
                                    <%if(copyProducts.get(i).getSaleoff() < 1.0) {%>
                                        <span class="price"><%=formatter.format(Math.round(copyProducts.get(i).getSaleoff() * copyProducts.get(i).getUnitPrice()))%>đ</span>
                                        <span class="old_price"><%=formatter.format(copyProducts.get(i).getUnitPrice())%>đ</span>
                                    <%} else {%>
                                        <span class="price"><%=formatter.format(copyProducts.get(i).getUnitPrice())%>đ</span>
                                    <%}%>
                                </li>
                                <%}%>
                            <%}%>
                        </ul>
                        <%} else {%>
                        <ul class="list">
                            <%for(int i = 0; i < products.size(); i++) {
                                String productJson = objectMapper.writeValueAsString(products.get(i));
                                if(products.get(i).getCategory().equals("Nike") && (products.get(i).getUnitPrice() * products.get(i).getSaleoff() < priceFilter1) && (products.get(i).getUnitPrice() * products.get(i).getSaleoff() >= priceFilter2)) {%>
                                <li class="list_item">
                                    <%if(products.get(i).getSaleoff() < 1.0) {%>
                                        <span class="status status_sale">-<%=Math.round((1-products.get(i).getSaleoff()) * 100)%>%</span>
                                    <%} else if(products.get(i).getNewOrHot() == true) {%>
                                        <span class="status">NEW</span>
                                    <%} else {%>
                                        <span class="status status status_hot">HOT</span>
                                    <%}%>
                                    <form action="product" method="post" id="product-form<%=i%>">
                                        <a href="#product<%=i%>">
                                            <img id="product<%=i%>" src="<%=products.get(i).getImage()%>" alt="<%=products.get(i).getName()%>" class="img"/>
                                        </a>
                                        <div class="name"><%=products.get(i).getName()%></div>
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
                                    <a class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </a>
                                    <%if(products.get(i).getSaleoff() < 1.0) {%>
                                        <span class="price"><%=formatter.format(Math.round(products.get(i).getSaleoff() * products.get(i).getUnitPrice()))%>đ</span>
                                        <span class="old_price"><%=formatter.format(products.get(i).getUnitPrice())%>đ</span>
                                    <%} else {%>
                                        <span class="price"><%=formatter.format(products.get(i).getUnitPrice())%>đ</span>
                                    <%}%>
                                </li>
                                <%}%>
                            <%}%>
                        </ul>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
        <footer-component></footer-component>
    </body>
</html>
