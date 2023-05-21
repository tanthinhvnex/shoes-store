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
        ArrayList<ProductForSale> products = ManagerService.products;
        NumberFormat formatter = NumberFormat.getNumberInstance();
        ObjectMapper objectMapper = new ObjectMapper();
        %>
        <header_manager-component></header_manager-component>
        <div class="sub_content">
            <div class="frame">
                <div class="left">
                    <div class="title">Hàng Hóa</div>
                    <div class="frame_radio">
                        <h2 class="desc">Thương Hiệu</h2>
                        <input form="filter" type="radio" id="nike" name="brand" value="Adidas" />
                        <label for="nike">Adidas</label><br />
                        <br />
                        <input form="filter" type="radio" id="adidas" name="brand" value="Nike" />
                        <label for="adidas">Nike</label><br />
                    </div>
                    <!-- <div class="frame_radio">
                        <h2 class="desc">Phân Loại</h2>
                        <input form="filter" type="radio" id="crush" name="classify" value="HTML" />
                        <label for="crush">Giày đi với crush</label><br />
                        <br />
                        <input form="filter" type="radio" id="fix_bug" name="classify" value="CSS" />
                        <label for="fix_bug">Giày thể thao</label><br />
                    </div> -->
                    <div class="frame_radio">
                        <h2 class="desc">Tồn Kho</h2>
                        <input form="filter" type="radio" id="available_out" name="state" value="emptySoon"/>
                        <label for="availble_out">Sắp Hết Sản Phẩm</label><br />
                        <br />
                        <input form="filter" type="radio" id="available" name="state" value="notEmpty" />
                        <label for="available">Còn Sản Phẩm</label><br />
                        <br />
                        <input form="filter" type="radio" id="out_of_stock" name="state" value="empty" />
                        <label for="out_of_stock">Hết Sản Phẩm</label><br />
                    </div>
                    <div class="frame_radio">
                        <%if(request.getParameter("brand") == null && request.getParameter("state") == null) {%>
                            <form id="filter" method="get" action="warehouse.jsp">
                                <input type="submit" value="Tìm Kiếm" />
                            </form>
                        <%} else {%>
                            <form id="filter" method="get" action="warehouse.jsp">
                                <input type="submit" value="Tất cả" />
                            </form>
                        <%}%>
                    </div>
                </div>
                <div class="right">
                    <div class="search_action">
                        <div class="search">
                            <i class="fa-solid fa-magnifying-glass"></i>
                            <input type="text" id="search" name="fname" placeholder="Theo mã SP, tên SP" />
                        </div>
                        <button style="background-color: var(--primary-color); border: none; cursor: pointer">
                            <div class="add-btn">
                                <div class="add_new_product">
                                    <i class="fa-solid fa-plus"></i>
                                    <a href="importProduct.jsp">Thêm Mới</a>
                                </div>
                            </div>
                        </button>
                    </div>
                    <div class="frame_statistical">
                        <div class="statistical" style="background-color: var(--primary-color)">
                            <div class="col_2"><div class="col_name">Tên Sản Phẩm</div></div>
                            <div class="col_1"><div class="col_name">Giá Bán</div></div>
                            <div class="col_3"><div class="col_name">Giá Vốn</div></div>
                            <div class="col_4"><div class="col_name">Tồn Kho</div></div>
                            <div class="col_5"><div class="col_name">Đã bán</div></div>
                        </div>
                        <!-- Có SP phù hợp: available_product -->
                        <%if(products.size() == 0) {%>
                        <div class="product">
                            <i class="fa-regular fa-clipboard"></i>
                            <br />
                            Không có sản phẩm trong kho
                        </div>
                        <%} else {%>
                        <div class="available_product">
                            <ul class="list">
                                <li class="list_item">
                                    <div class="statistical" style="background-color: #fefced">
                                        <div class="col_1"><div class="col_item"></div></div>
                                        <div class="col_2"><div class="col_item"></div></div>
                                        <div class="col_3"><div class="col_item"></div></div>
                                        <div class="col_5">
                                            <%int noOfProducts = 0;
                                            int noOfSolds = 0;
                                            String brand = request.getParameter("brand");
                                            String state = request.getParameter("state");
                                            if(brand == null && state == null) {
                                                for(int i = 0; i < products.size(); i++) {
                                                    noOfProducts += products.get(i).getQuantity();
                                                    noOfSolds += products.get(i).getNoOfSolds();
                                                }
                                            }
                                            else if(brand != null && state == null) {
                                                for(int i = 0; i < products.size(); i++) {
                                                    if(products.get(i).getCategory().equals(brand)) {
                                                        noOfProducts += products.get(i).getQuantity();
                                                        noOfSolds += products.get(i).getNoOfSolds();
                                                    }
                                                }
                                            } else if(brand == null && state != null) {
                                                if(state.equals("empty")) {
                                                    for(int i = 0; i < products.size(); i++) {
                                                        if(products.get(i).getQuantity() <= 0) {
                                                            noOfProducts += products.get(i).getQuantity();
                                                            noOfSolds += products.get(i).getNoOfSolds();
                                                        }
                                                    }
                                                } else if(state.equals("emptySoon")) {
                                                    for(int i = 0; i < products.size(); i++) {
                                                        if(products.get(i).getQuantity() < 5 && products.get(i).getQuantity() > 0) {
                                                            noOfProducts += products.get(i).getQuantity();
                                                            noOfSolds += products.get(i).getNoOfSolds();
                                                        }
                                                    }
                                                } else {
                                                    for(int i = 0; i < products.size(); i++) {
                                                        if(products.get(i).getQuantity() > 0) {
                                                            noOfProducts += products.get(i).getQuantity();
                                                            noOfSolds += products.get(i).getNoOfSolds();
                                                        }
                                                    }
                                                }
                                            } else {
                                                if(state.equals("empty")) {
                                                    for(int i = 0; i < products.size(); i++) {
                                                        if(products.get(i).getCategory().equals(brand) && products.get(i).getQuantity() <= 0) {
                                                            noOfProducts += products.get(i).getQuantity();
                                                            noOfSolds += products.get(i).getNoOfSolds();
                                                        }
                                                    }
                                                } else if(state.equals("emptySoon")) {
                                                    for(int i = 0; i < products.size(); i++) {
                                                        if(products.get(i).getCategory().equals(brand) && products.get(i).getQuantity() < 5 && products.get(i).getQuantity() > 0) {
                                                            noOfProducts += products.get(i).getQuantity();
                                                            noOfSolds += products.get(i).getNoOfSolds();
                                                        }
                                                    }
                                                } else {
                                                    for(int i = 0; i < products.size(); i++) {
                                                        if(products.get(i).getCategory().equals(brand) && products.get(i).getQuantity() > 0) {
                                                            noOfProducts += products.get(i).getQuantity();
                                                            noOfSolds += products.get(i).getNoOfSolds();
                                                        }
                                                    }
                                                }
                                            }
                                            %>
                                            <div class="col_item" style="color: #111; font-weight: 700"><%=noOfProducts%></div>
                                        </div>
                                        <div class="col_4">
                                            <div class="col_item" style="color: #111; font-weight: 700"><%=noOfSolds%></div>
                                        </div>
                                    </div>
                                </li>
                                <%for(int i = 0; i < products.size(); i++) {
                                    String productJson = objectMapper.writeValueAsString(products.get(i));%>
                                <li class="list_item">
                                    <%if(brand != null) {
                                        if(products.get(i).getCategory().equals(brand)) {
                                            if(state != null) {
                                                if(state.equals("empty")) {
                                                    if(products.get(i).getQuantity() <= 0) {%>
                                                    <a href="#p-m<%=i%>" id="p-m<%=i%>" class="statistical">
                                                        <div class="col_2"><div class="col_item"><%=products.get(i).getName()%></div></div>
                                                        <div class="col_1"><div class="col_item"><%=formatter.format(products.get(i).getUnitPrice() * products.get(i).getSaleoff())%>đ</div></div>
                                                        <div class="col_3"><div class="col_item"><%=formatter.format(products.get(i).getInitPrice())%>đ</div></div>
                                                        <div class="col_4"><div class="col_item"><%=products.get(i).getQuantity()%></div></div>
                                                        <div class="col_5"><div class="col_item"><%=products.get(i).getNoOfSolds()%></div></div>
                                                    </a>
                                                    <form action="product-manager.jsp" method="post" id="p-m-form<%=i%>">
                                                        <input type="hidden" name="productJson" value="<%=URLEncoder.encode(productJson, "UTF-8")%>"/>
                                                        <script>
                                                            const pmButton<%=i%>= document.getElementById('p-m<%=i%>');
                                                            const pmForm<%=i%> = document.getElementById('p-m-form<%=i%>');
                                                            pmButton<%=i%>.addEventListener('click',function() {
                                                                pmForm<%=i%>.submit();
                                                            });
                                                        </script>
                                                    </form>
                                                    <%}
                                                } else if(state.equals("emptySoon")) {
                                                    if(products.get(i).getQuantity() < 5 && products.get(i).getQuantity() > 0) {%>
                                                    <a href="#p-m<%=i%>" id="p-m<%=i%>" class="statistical">
                                                        <div class="col_2"><div class="col_item"><%=products.get(i).getName()%></div></div>
                                                        <div class="col_1"><div class="col_item"><%=formatter.format(products.get(i).getUnitPrice() * products.get(i).getSaleoff())%>đ</div></div>
                                                        <div class="col_3"><div class="col_item"><%=formatter.format(products.get(i).getInitPrice())%>đ</div></div>
                                                        <div class="col_4"><div class="col_item"><%=products.get(i).getQuantity()%></div></div>
                                                        <div class="col_5"><div class="col_item"><%=products.get(i).getNoOfSolds()%></div></div>
                                                    </a>
                                                    <form action="product-manager.jsp" method="post" id="p-m-form<%=i%>">
                                                        <input type="hidden" name="productJson" value="<%=URLEncoder.encode(productJson, "UTF-8")%>"/>
                                                        <script>
                                                            const pmButton<%=i%>= document.getElementById('p-m<%=i%>');
                                                            const pmForm<%=i%> = document.getElementById('p-m-form<%=i%>');
                                                            pmButton<%=i%>.addEventListener('click',function() {
                                                                pmForm<%=i%>.submit();
                                                            });
                                                        </script>
                                                    </form>
                                                    <%}
                                                } else {
                                                    if(products.get(i).getQuantity() > 0) {%>
                                                    <a href="#p-m<%=i%>" id="p-m<%=i%>" class="statistical">
                                                        <div class="col_2"><div class="col_item"><%=products.get(i).getName()%></div></div>
                                                        <div class="col_1"><div class="col_item"><%=formatter.format(products.get(i).getUnitPrice() * products.get(i).getSaleoff())%>đ</div></div>
                                                        <div class="col_3"><div class="col_item"><%=formatter.format(products.get(i).getInitPrice())%>đ</div></div>
                                                        <div class="col_4"><div class="col_item"><%=products.get(i).getQuantity()%></div></div>
                                                        <div class="col_5"><div class="col_item"><%=products.get(i).getNoOfSolds()%></div></div>
                                                    </a>
                                                    <form action="product-manager.jsp" method="post" id="p-m-form<%=i%>">
                                                        <input type="hidden" name="productJson" value="<%=URLEncoder.encode(productJson, "UTF-8")%>"/>
                                                        <script>
                                                            const pmButton<%=i%>= document.getElementById('p-m<%=i%>');
                                                            const pmForm<%=i%> = document.getElementById('p-m-form<%=i%>');
                                                            pmButton<%=i%>.addEventListener('click',function() {
                                                                pmForm<%=i%>.submit();
                                                            });
                                                        </script>
                                                    </form>
                                                    <%}
                                                }
                                            } else {%>
                                                <a href="#p-m<%=i%>" id="p-m<%=i%>" class="statistical">
                                                    <div class="col_2"><div class="col_item"><%=products.get(i).getName()%></div></div>
                                                    <div class="col_1"><div class="col_item"><%=formatter.format(products.get(i).getUnitPrice() * products.get(i).getSaleoff())%>đ</div></div>
                                                    <div class="col_3"><div class="col_item"><%=formatter.format(products.get(i).getInitPrice())%>đ</div></div>
                                                    <div class="col_4"><div class="col_item"><%=products.get(i).getQuantity()%></div></div>
                                                    <div class="col_5"><div class="col_item"><%=products.get(i).getNoOfSolds()%></div></div>
                                                </a>
                                                <form action="product-manager.jsp" method="post" id="p-m-form<%=i%>">
                                                    <input type="hidden" name="productJson" value="<%=URLEncoder.encode(productJson, "UTF-8")%>"/>
                                                    <script>
                                                        const pmButton<%=i%>= document.getElementById('p-m<%=i%>');
                                                        const pmForm<%=i%> = document.getElementById('p-m-form<%=i%>');
                                                        pmButton<%=i%>.addEventListener('click',function() {
                                                            pmForm<%=i%>.submit();
                                                        });
                                                    </script>
                                                </form>
                                            <%}
                                        }
                                    } else {
                                        if(state != null) {
                                            if(state.equals("empty")) {
                                                if(products.get(i).getQuantity() <= 0) {%>
                                                <a href="#p-m<%=i%>" id="p-m<%=i%>" class="statistical">
                                                    <div class="col_2"><div class="col_item"><%=products.get(i).getName()%></div></div>
                                                    <div class="col_1"><div class="col_item"><%=formatter.format(products.get(i).getUnitPrice() * products.get(i).getSaleoff())%>đ</div></div>
                                                    <div class="col_3"><div class="col_item"><%=formatter.format(products.get(i).getInitPrice())%>đ</div></div>
                                                    <div class="col_4"><div class="col_item"><%=products.get(i).getQuantity()%></div></div>
                                                    <div class="col_5"><div class="col_item"><%=products.get(i).getNoOfSolds()%></div></div>
                                                </a>
                                                <form action="product-manager.jsp" method="post" id="p-m-form<%=i%>">
                                                    <input type="hidden" name="productJson" value="<%=URLEncoder.encode(productJson, "UTF-8")%>"/>
                                                    <script>
                                                        const pmButton<%=i%>= document.getElementById('p-m<%=i%>');
                                                        const pmForm<%=i%> = document.getElementById('p-m-form<%=i%>');
                                                        pmButton<%=i%>.addEventListener('click',function() {
                                                            pmForm<%=i%>.submit();
                                                        });
                                                    </script>
                                                </form>
                                                <%}
                                            } else if(state.equals("emptySoon")) {
                                                if(products.get(i).getQuantity() < 5 && products.get(i).getQuantity() > 0) {%>
                                                <a href="#p-m<%=i%>" id="p-m<%=i%>" class="statistical">
                                                    <div class="col_2"><div class="col_item"><%=products.get(i).getName()%></div></div>
                                                    <div class="col_1"><div class="col_item"><%=formatter.format(products.get(i).getUnitPrice() * products.get(i).getSaleoff())%>đ</div></div>
                                                    <div class="col_3"><div class="col_item"><%=formatter.format(products.get(i).getInitPrice())%>đ</div></div>
                                                    <div class="col_4"><div class="col_item"><%=products.get(i).getQuantity()%></div></div>
                                                    <div class="col_5"><div class="col_item"><%=products.get(i).getNoOfSolds()%></div></div>
                                                </a>
                                                <form action="product-manager.jsp" method="post" id="p-m-form<%=i%>">
                                                    <input type="hidden" name="productJson" value="<%=URLEncoder.encode(productJson, "UTF-8")%>"/>
                                                    <script>
                                                        const pmButton<%=i%>= document.getElementById('p-m<%=i%>');
                                                        const pmForm<%=i%> = document.getElementById('p-m-form<%=i%>');
                                                        pmButton<%=i%>.addEventListener('click',function() {
                                                            pmForm<%=i%>.submit();
                                                        });
                                                    </script>
                                                </form>
                                                <%}
                                            } else {
                                                if(products.get(i).getQuantity() > 0) {%>
                                                <a href="#p-m<%=i%>" id="p-m<%=i%>" class="statistical">
                                                    <div class="col_2"><div class="col_item"><%=products.get(i).getName()%></div></div>
                                                    <div class="col_1"><div class="col_item"><%=formatter.format(products.get(i).getUnitPrice() * products.get(i).getSaleoff())%>đ</div></div>
                                                    <div class="col_3"><div class="col_item"><%=formatter.format(products.get(i).getInitPrice())%>đ</div></div>
                                                    <div class="col_4"><div class="col_item"><%=products.get(i).getQuantity()%></div></div>
                                                    <div class="col_5"><div class="col_item"><%=products.get(i).getNoOfSolds()%></div></div>
                                                </a>
                                                <form action="product-manager.jsp" method="post" id="p-m-form<%=i%>">
                                                    <input type="hidden" name="productJson" value="<%=URLEncoder.encode(productJson, "UTF-8")%>"/>
                                                    <script>
                                                        const pmButton<%=i%>= document.getElementById('p-m<%=i%>');
                                                        const pmForm<%=i%> = document.getElementById('p-m-form<%=i%>');
                                                        pmButton<%=i%>.addEventListener('click',function() {
                                                            pmForm<%=i%>.submit();
                                                        });
                                                    </script>
                                                </form>
                                                <%}
                                            }
                                        } else {%>
                                            <a href="#p-m<%=i%>" id="p-m<%=i%>" class="statistical">
                                                <div class="col_2"><div class="col_item"><%=products.get(i).getName()%></div></div>
                                                <div class="col_1"><div class="col_item"><%=formatter.format(products.get(i).getUnitPrice() * products.get(i).getSaleoff())%>đ</div></div>
                                                <div class="col_3"><div class="col_item"><%=formatter.format(products.get(i).getInitPrice())%>đ</div></div>
                                                <div class="col_4"><div class="col_item"><%=products.get(i).getQuantity()%></div></div>
                                                <div class="col_5"><div class="col_item"><%=products.get(i).getNoOfSolds()%></div></div>
                                            </a>
                                            <form action="product-manager.jsp" method="post" id="p-m-form<%=i%>">
                                                <input type="hidden" name="productJson" value="<%=URLEncoder.encode(productJson, "UTF-8")%>"/>
                                                <script>
                                                    const pmButton<%=i%>= document.getElementById('p-m<%=i%>');
                                                    const pmForm<%=i%> = document.getElementById('p-m-form<%=i%>');
                                                    pmButton<%=i%>.addEventListener('click',function() {
                                                        pmForm<%=i%>.submit();
                                                    });
                                                </script>
                                            </form>
                                        <%}
                                    }%>
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
