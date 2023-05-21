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
        <link rel="stylesheet" href="./assets/css/select-custom-warehouse.css" />
        <link rel="stylesheet" href="./assets/css/base.css" />
        <link rel="stylesheet" href="./assets/css/header-manager.css" />
        <link rel="stylesheet" href="./assets/css/warehouse.css" />
        <script src="./select-custom.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        <script src="./components/header_manager.js" type="text/javascript" defer></script>
        <title>Quản lý</title>
    </head>
    <body>
        <%
        String userJson = request.getParameter("userJson");
        NumberFormat formatter = NumberFormat.getNumberInstance();
        String decodedValue = URLDecoder.decode(userJson, "UTF-8");
        ObjectMapper objectMapper = new ObjectMapper();
        User user = (User) objectMapper.readValue(decodedValue, User.class);    
        InfoDelivery infoDelivery = user.getbuyingHistory().infoDeliverys.get(Integer.parseInt(request.getParameter("i")));
        %>
        <header_manager-component></header_manager-component>
        <div class="sub_content">
            <div class="frame">
                <div class="right">
                    <div class="title">Danh Sách Sản Phẩm</div>
                    <div class="frame_statistical">
                        <style>
                            .col_6 {
                                flex: 0.2;
                            }
                        </style>
                        <div class="statistical" style="background-color: var(--primary-color)">
                            <div class="col_6"><div class="col_name">Stt</div></div>
                            <div class="col_1"><div class="col_name">Tên sản phẩm</div></div>
                            <div class="col_1"><div class="col_name">Số lượng</div></div>
                            <div class="col_1"><div class="col_name">Kích thước</div></div>
                            <div class="col_1"><div class="col_name">Tổng tiền</div></div>
                        </div>
                        <!-- Có SP phù hợp: available_product -->
                        <div class="available_product">
                            <ul class="list">
                                <%for(int i = 0; i < infoDelivery.products.size(); i++) {%>
                                <li class="list_item">
                                    <div href="#!" class="statistical">
                                        <div class="col_6"><div class="col_item"><%=i + 1%></div></div>
                                        <div class="col_1"><div class="col_item"><%=infoDelivery.products.get(i).getName()%></div></div>
                                        <div class="col_1"><div class="col_item"><%=infoDelivery.quantityEachProduct.get(i)%></div></div>
                                        <div class="col_1"><div class="col_item"><%=infoDelivery.products.get(i).getSize()%></div></div>
                                        <div class="col_1"><div class="col_item"><%=formatter.format(infoDelivery.products.get(i).getUnitPrice() * infoDelivery.products.get(i).getSaleoff() * infoDelivery.quantityEachProduct.get(i))%>đ</div></div>
                                    </div>
                                </li>
                                <%}%>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="./select-custom.js"></script>
    </body>
</html>