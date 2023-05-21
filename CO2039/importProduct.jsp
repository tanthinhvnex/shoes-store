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
            int size = 0;
            String image = null;
            String smallImg1 = null;
            String smallImg2 = null;
            String smallImg3 = null;
            String description = null;
            String name = null;
            String category = null;
            int quantity = 0;
            int initPrice = 0;
            int unitPrice = 0;
            image = request.getParameter("image");
            smallImg1 = request.getParameter("smlImg1");
            smallImg2 = request.getParameter("smlImg2");
            smallImg3 = request.getParameter("smlImg3");
            description = request.getParameter("description");
            name = request.getParameter("name");
            category = request.getParameter("category");
            if(request.getParameter("quantity") != null) {
                quantity = Integer.parseInt(request.getParameter("quantity"));
                initPrice = Integer.parseInt(request.getParameter("initPrice"));
                unitPrice = Integer.parseInt(request.getParameter("unitPrice"));
            }
        %>
        <header_manager-component></header_manager-component>
        <div class="sub_content">
            <div class="frame">
                <div class="left">
                    <div class="title">Hàng Hóa</div>
                    <div class="frame_radio">
                        <h2 class="desc">Thương Hiệu</h2>
                        <input type="radio" id="adidas" name="brand" value="HTML" />
                        <label for="adidas">Nike</label><br />
                        <br/>
                        <input type="radio" id="nike" name="brand" value="CSS" />
                        <label for="nike">Adidas</label><br />
                    </div>
                    <div class="frame_radio">
                        <h2 class="desc">Phân Loại</h2>
                        <input type="radio" id="crush" name="classify" value="HTML" />
                        <label for="crush">Giày đi với crush</label><br />
                        <br/>
                        <input type="radio" id="sport" name="classify" value="CSS" />
                        <label for="sport">Giày thể thao</label><br />
                    </div>
                    <div class="frame_radio">
                        <h2 class="desc">Tồn Kho</h2>
                        <input type="radio" id="available_out" name="warehouse" value="HTML" />
                        <label for="availble_out">Sắp Hết Sản Phẩm</label><br />
                        <br />
                        <input type="radio" id="available" name="warehouse" value="HTML" />
                        <label for="available">Còn Sản Phẩm</label><br />
                        <br />
                        <input type="radio" id="out_of_stock" name="warehouse" value="CSS" />
                        <label for="out_of_stock">Hết Sản Phẩm</label><br />
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
                                    Thêm Mới
                                </div>
                            </div>
                        </button>
                        <style>
                            .modal_importProduct {
                                display: flex;
                                /* display: none; */
                                position: fixed;
                                z-index: 1;
                                inset: 0;
                                background-color: rgba(0, 0, 0, 0.4);
                            }
                        </style>
                        <div class="modal_importProduct">
                            <div class="body">
                                <div class="header">
                                    Thêm Sản Phẩm
                                    <button style=" border: none; background-color: transparent; cursor: pointer; font-size: 2.4rem; ">
                                        <a class="fa-solid fa-xmark" href="warehouse.jsp"></a>
                                    </button>
                                </div>
                                <div class="wrap">
                                    <div class="info">
                                        <form>
                                            <%if(name != null) {%>
                                            <label for="name_product">Tên Sản Phẩm</label>
                                            <input type="text" id="name_product" placeholder="<%=name%>" />
                                            <label for="id_product">Mã Sản Phẩm</label>
                                            <input type="text" id="id_product" name="id_product" placeholder="CW2288 111" /> 
                                            <label for="brand_product">Thương Hiệu</label>
                                            <div class="custom-select">
                                                <select id="brand_product" name="category" form="submit-form">
                                                    <%if(category.equals("Adidas")) {%>
                                                        <option value="Adidas" selected>Adidas</option>
                                                        <option value="Nike">Nike</option>
                                                    <%} else {%>   
                                                        <option value="Nike" selected>Nike</option>
                                                        <option value="Adidas">Adidas</option>
                                                    <%}%>
                                                </select>
                                            </div>

                                            <label for="classify_product">Phân Loại</label>
                                            <div class="custom-select">
                                                <select id="classify_product">
                                                    <option value="crush">Giày đi với crush</option>
                                                    <option value="fix_bug">Giày thể thao</option>
                                                </select>
                                            </div>
                                            <%} else {%>
                                            <label for="name_product">Tên Sản Phẩm</label>
                                            <input type="text" id="name_product" placeholder="Air Force 1..." />
                                            <label for="id_product">Mã Sản Phẩm</label>
                                            <input type="text" id="id_product" name="id_product" placeholder="CW2288 111" /> 
                                            <label for="brand_product">Thương Hiệu</label>
                                            <div class="custom-select">
                                                <select id="brand_product" name="category" form="submit-form">
                                                    <option value="Adidas">Adidas</option>
                                                    <option value="Nike">Nike</option>
                                                </select>
                                            </div>

                                            <label for="classify_product">Phân Loại</label>
                                            <div class="custom-select">
                                                <select id="classify_product">
                                                    <option value="crush">Giày đi với crush</option>
                                                    <option value="fix_bug">Giày thể thao</option>
                                                </select>
                                            </div>
                                            <%}%>
                                        </form>
                                    </div>
                                    <div class="info">
                                        <form>
                                            <%if(image != null) {%>
                                            <label for="cost_price">Giá Vốn</label>
                                            <input type="text" id="cost_price" placeholder="<%=initPrice%>" />

                                            <label for="price">Giá Bán</label>
                                            <input type="text" id="price" placeholder="<%=unitPrice%>" style="margin-top: 6px" />

                                            <label for="amount">Số Lượng</label>
                                            <input type="text" id="amount" placeholder="<%=quantity%>" style="margin-top: 8px" />
                                            <%} else {%>
                                            <label for="cost_price">Giá Vốn</label>
                                            <input type="text" id="cost_price" placeholder="" />

                                            <label for="price">Giá Bán</label>
                                            <input type="text" id="price" placeholder="" style="margin-top: 6px" />

                                            <label for="amount">Số Lượng</label>
                                            <input type="text" id="amount" placeholder="" style="margin-top: 8px" />
                                            <%}%>
                                        </form>
                                    </div>
                                </div>
                                <div class="add_file">
                                    <input type="file" form="submit-form" name="file" id="file" class="inputfile" value=""/>
                                    <label for="file"></label>
                                    <form>
                                        <%if(description != null) {%>
                                        <textarea form="submit-form" name="description" placeholder="<%=description%>" value="<%=description%>"><%=description%></textarea>
                                        <%} else {%>
                                        <textarea form="submit-form" name="description" placeholder="Mô tả sản phẩm"></textarea>
                                        <%}%>
                                    </form>
                                </div>
                                <form method="get" id="submit-form" action="update_product-manager.jsp">
                                    <div class="frame_submit">
                                        <input type="hidden" id="image" name="image" value="<%=image%>"/>
                                        <input type="hidden" id="name" name="name" value="<%=name%>"/>
                                        <input type="hidden" id="unitPrice" name="unitPrice" value="<%=unitPrice%>"/>
                                        <input type="hidden" id="initPrice" name="initPrice" value="<%=initPrice%>"/>
                                        <input type="hidden" id="quantity" name="quantity" value="<%=quantity%>"/>
                                        <input type="submit" value="Lưu Thông Tin"/>
                                        <script>
                                            document.getElementById('name_product').addEventListener('input', () => {
                                                // Update the value of the hidden input field
                                                document.getElementById('name').value = document.getElementById('name_product').value;
                                            });
                                            document.getElementById('cost_price').addEventListener('input', () => {
                                                // Update the value of the hidden input field
                                                document.getElementById('initPrice').value = document.getElementById('cost_price').value;
                                            });
                                            document.getElementById('price').addEventListener('input', () => {
                                                // Update the value of the hidden input field
                                                document.getElementById('unitPrice').value = document.getElementById('price').value;
                                            });
                                            document.getElementById('amount').addEventListener('input', () => {
                                                // Update the value of the hidden input field
                                                document.getElementById('quantity').value = document.getElementById('amount').value;
                                            });
                                        </script>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="frame_statistical">
                        <div class="statistical" style="background-color: #dcf4fc">
                            <div class="col_1"><div class="col_name">Mã Sản Phẩm</div></div>
                            <div class="col_2"><div class="col_name">Tên Sản Phẩm</div></div>
                            <div class="col_3"><div class="col_name">Giá Bán</div></div>
                            <div class="col_4"><div class="col_name">Giá Vốn</div></div>
                            <div class="col_5"><div class="col_name">Tồn Kho</div></div>
                        </div>
                        <!-- Có SP phù hợp: available_product -->
                        <div class="available_product">
                            <div class="product">
                                <i class="fa-regular fa-clipboard"></i>
                                <br />
                                Không Tìm Thấy Sản Phẩm Phù Hợp
                            </div>
                            <ul class="list">
                                <li class="list_item">
                                    <div class="statistical" style="background-color: #fefced">
                                        <div class="col_1"><div class="col_item"></div></div>
                                        <div class="col_2"><div class="col_item"></div></div>
                                        <div class="col_3"><div class="col_item"></div></div>
                                        <div class="col_4"><div class="col_item"></div></div>
                                        <div class="col_5">
                                            <div class="col_item" style="color: #111; font-weight: 700">54</div>
                                        </div>
                                    </div>
                                </li>
                                <li class="list_item">
                                    <a href="./superstar.html" class="statistical">
                                        <div class="col_1"><div class="col_item">EG4958</div></div>
                                        <div class="col_2"><div class="col_item">Superstar</div></div>
                                        <div class="col_3"><div class="col_item">2,200,000</div></div>
                                        <div class="col_4"><div class="col_item">1,000,000</div></div>
                                        <div class="col_5"><div class="col_item">15</div></div>
                                    </a>
                                </li>
                                <li class="list_item">
                                    <a href="#!" class="statistical">
                                        <div class="col_1"><div class="col_item">CW2288 111</div></div>
                                        <div class="col_2"><div class="col_item">Air Force 1</div></div>
                                        <div class="col_3"><div class="col_item">3,300,000</div></div>
                                        <div class="col_4"><div class="col_item">1,600,000</div></div>
                                        <div class="col_5"><div class="col_item">19</div></div>
                                    </a>
                                </li>
                                <li class="list_item">
                                    <a href="#!" class="statistical">
                                        <div class="col_1"><div class="col_item">CI0919 118</div></div>
                                        <div class="col_2">
                                            <div class="col_item">Air Force 1 Shadow Multicolor</div>
                                        </div>
                                        <div class="col_3"><div class="col_item">3,900,000</div></div>
                                        <div class="col_4"><div class="col_item">2,600,000</div></div>
                                        <div class="col_5"><div class="col_item">6</div></div>
                                    </a>
                                </li>
                                <li class="list_item">
                                    <a href="#!" class="statistical">
                                        <div class="col_1"><div class="col_item">DD6834 802</div></div>
                                        <div class="col_2"><div class="col_item">Jordan 1 Mid Tuft Orange</div></div>
                                        <div class="col_3"><div class="col_item">5,800,000</div></div>
                                        <div class="col_4"><div class="col_item">4,000,000</div></div>
                                        <div class="col_5"><div class="col_item">14</div></div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="./select-custom.js"></script>
    </body>
</html>
