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
<html lang="vi">
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
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./assets/css/style.css" />
        <link rel="stylesheet" href="./assets/css/base.css" />
        <link rel="stylesheet" href="./assets/css/header.css" />
        <link rel="stylesheet" href="./assets/css/footer.css" />
        <link rel="stylesheet" href="./assets/css/info-delivery.css" />
        <script src="components/header.js" type="text/javascript" defer></script>
        <script src="components/footer.js" type="text/javascript" defer></script>

        <title>Thông Tin Giao Hàng</title>
    </head>
    <body>
        <%
        User user = (User) request.getAttribute("user");
        ObjectMapper objectMapper = new ObjectMapper();
        String userJson = null;
        if(request.getAttribute("user") != null) userJson = objectMapper.writeValueAsString(user);    
        else {
            String decodedValue = URLDecoder.decode(request.getParameter("userJson"), "UTF-8");
            user = (User) objectMapper.readValue(decodedValue, User.class);
            userJson = objectMapper.writeValueAsString(user);
        }
        %>
        <div class="container">
            <div class="frame">
                <form action="home" method="post" id="home-form">
                    <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                    <a href="#home_icon">
                        <img id="home_icon" class="img_logo" src="./assets/img/logo.png" alt="Thợ Code Bán Giày"/>
                    </a>
                    <script>
                        const homeButton = document.getElementById('home');
                        const homeForm = document.getElementById('home-form');
                        homeButton.addEventListener('click',function() {
                            homeForm.submit();
                        });
                    </script>
                </form>
                <div class="title">Thông tin giao hàng</div>
                <form method="post" action="pmt">
                    <div class="row">
                        <div class="col-75">
                            <input type="text" id="fname" name="fullName" placeholder="Họ và tên" value=""/>
                            <input type="text" id="phone" name="phoneNums" placeholder="Số điện thoại" value=""/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-75">
                            <input type="text" id="adress" name="address" placeholder="Địa chỉ" value=""/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-75">
                            <input type="text" id="email" name="email" placeholder="Email:" value=""/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-75">
                            <textarea id="subject" name="note" rows="4" cols="50" placeholder="Ghi chú" value=""></textarea>
                        </div>
                    </div>
                    <br />
                    <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                    <div class="row">
                        <input type="submit" value="Đặt Hàng" />
                    </div>
                </form>
            </div>
            <%String message = (String) request.getAttribute("message");
            if(message != null) {%>
            <div class="modal">
                <div class="modal_content">
                    <i class="fa-solid fa-check"></i>
                    <div class="success">${message}</div>
                        <%if(message.equals("Đặt Hàng Thành Công")) {%>
                        <form action="home" method="post" id="home-form">
                            <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                            <a href="#home" id="home" class="return">Trang Chủ</a>
                            <script>
                                const submitButton = document.getElementById('home');
                                const form = document.getElementById('home-form');
                                submitButton.addEventListener('click',function() {
                                    form.submit();
                                });
                            </script>
                        </form>
                        <%} else {%>
                        <form action="Cart" method="post" id="cart-form">
                            <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                            <button id="cart" class="return">Trở lại giỏ hàng</button>
                            <script>
                                const cartButton = document.getElementById('cart');
                                const cartForm = document.getElementById('cart-form');
                                cartButton.addEventListener('click',function() {
                                    cartForm.submit();
                                });
                            </script>
                            <%}%>
                        </form>
                    </div>
                </div>
            <%}%>
        </div>
        <footer-component></footer-component>
    </body>
</html>
