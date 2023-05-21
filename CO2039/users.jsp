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
        ArrayList<User> users = ManagerService.users;
        NumberFormat formatter = NumberFormat.getNumberInstance();
        ObjectMapper objectMapper = new ObjectMapper();
        %>
        <header_manager-component></header_manager-component>
        <div class="sub_content">
            <div class="frame">
                <div class="right">
                    <div class="title">Danh Sách Khách Hàng</div>
                    <div class="frame_statistical">
                        <div class="statistical" style="background-color: var(--primary-color)">
                            <div class="col_2"><div class="col_name">Họ và tên</div></div>
                            <div class="col_1"><div class="col_name">Số điện thoại</div></div>
                            <div class="col_3"><div class="col_name">Số đơn đã mua</div></div>
                            <div class="col_4"><div class="col_name">Tổng tiền</div></div>
                        </div>
                        <!-- Có SP phù hợp: available_product -->
                        <%if(users.size() == 0) {%>
                        <div class="product">
                            <i class="fa-regular fa-clipboard"></i>
                            <br />
                            Chưa có khách hàng nào
                        </div>
                        <%} else {%>
                        <div class="available_product">
                            <ul class="list">
                                <%for(int i = 0; i < users.size(); i++) {
                                    String userJson = objectMapper.writeValueAsString(users.get(i));%>
                                <li class="list_item">
                                    <a href="#b-h<%=i%>" id="b-h<%=i%>" class="statistical">
                                        <div class="col_2"><div class="col_item"><%=users.get(i).getFullName()%></div></div>
                                        <div class="col_1"><div class="col_item"><%=users.get(i).getPhoneNums()%></div></div>
                                        <div class="col_3"><div class="col_item"><%=users.get(i).getbuyingHistory().quantityEachProduct.size()%></div></div>
                                        <div class="col_4"><div class="col_item"><%=formatter.format(users.get(i).getbuyingHistory().totalCost)%>đ</div></div>
                                    </a>
                                    <form action="buyingHistory.jsp" method="post" id="b-h-form<%=i%>">
                                        <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>"/>
                                        <script>
                                            const bhButton<%=i%> = document.getElementById('b-h<%=i%>');
                                            const bhForm<%=i%> = document.getElementById('b-h-form<%=i%>');
                                            bhButton<%=i%>.addEventListener('click',function() {
                                                bhForm<%=i%>.submit();
                                            });
                                        </script>
                                    </form>
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
