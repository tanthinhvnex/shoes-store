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
        %>
        <header_manager-component></header_manager-component>
        <div class="sub_content">
            <div class="frame">
                <style>
                    .col_6 {
                        flex: 0.3;
                    }
                </style>
                <div class="right">
                    <div class="title">Lịch Sử Mua Hàng Của Khách Hàng: <%=user.getFullName()%></div>
                    <div class="frame_statistical">
                        <div class="statistical" style="background-color: var(--primary-color)">
                            <div class="col_6"><div class="col_name">Stt</div></div>
                            <div class="col_1"><div class="col_name">Người nhận</div></div>
                            <div class="col_1"><div class="col_name">Số điện thoại</div></div>
                            <div class="col_1"><div class="col_name">Địa chỉ</div></div>
                            <div class="col_2"><div class="col_name">Email</div></div>
                            <div class="col_1"><div class="col_name">Ghi chú</div></div>
                            <div class="col_6"><div class="col_name">Ngày đặt</div></div>
                            <div class="col_1"><div class="col_name">Tổng tiền</div></div>
                        </div>
                        <!-- Có SP phù hợp: available_product -->
                        <%if(user.getbuyingHistory().infoDeliverys.size() == 0) {%>
                        <div class="product">
                            <i class="fa-regular fa-clipboard"></i>
                            <br />
                            Chưa có đơn hàng nào
                        </div>
                        <%} else {%>
                        <div class="available_product">
                            <ul class="list">
                                <%for(int i = 0; i < user.getbuyingHistory().infoDeliverys.size(); i++) {
                                    String infoDeliveryJson = objectMapper.writeValueAsString(user.getbuyingHistory().infoDeliverys.get(i));%>
                                <li class="list_item">
                                    <a href="#order-detail<%=i%>" id="order-detail<%=i%>" class="statistical">
                                        <div class="col_6"><div class="col_item"><%=i + 1%></div></div>
                                        <div class="col_1"><div class="col_item"><%=user.getbuyingHistory().infoDeliverys.get(i).getFullName()%></div></div>
                                        <div class="col_1"><div class="col_item"><%=user.getbuyingHistory().infoDeliverys.get(i).getPhoneNums()%></div></div>
                                        <div class="col_1"><div class="col_item"><%=user.getbuyingHistory().infoDeliverys.get(i).getAddress()%></div></div>
                                        <div class="col_2"><div class="col_item"><%=user.getbuyingHistory().infoDeliverys.get(i).getEmail()%></div></div>
                                        <div class="col_1"><div class="col_item"><%=user.getbuyingHistory().infoDeliverys.get(i).getNote()%></div></div>
                                        <div class="col_6"><div class="col_item"><%=user.getbuyingHistory().infoDeliverys.get(i).getOrderDate()%></div></div>
                                        <div class="col_1"><div class="col_item"><%=formatter.format(user.getbuyingHistory().infoDeliverys.get(i).totalCost)%>đ</div></div>
                                        <form action="order-detail.jsp" method="post" id="order-detail-form<%=i%>">
                                            <input type="hidden" name="userJson" value="<%=userJson%>"/>
                                            <input type="hidden" name="i" value="<%=i%>"/>
                                            <script>
                                                const odButton<%=i%> = document.getElementById('order-detail<%=i%>');
                                                const odForm<%=i%> = document.getElementById('order-detail-form<%=i%>');
                                                odButton<%=i%>.addEventListener('click',function() {
                                                    odForm<%=i%>.submit();
                                                });
                                            </script>
                                        </form>
                                    </a>
                                </li>
                                <%}%>
                            </ul>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
        <script src="./select-custom.js"></script>
    </body>
</html>