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
        <link rel="stylesheet" href="./assets/css/style.css" />
        <link rel="stylesheet" href="./assets/css/base.css" />
        <link rel="stylesheet" href="./assets/css/header.css" />
        <link rel="stylesheet" href="./assets/css/footer.css" />
        <link rel="stylesheet" href="./assets/css/select-input.css" />
        <link rel="stylesheet" href="./assets/css/style-superstar.css" />
        <link rel="stylesheet" href="./assets/css/header-manager.css" />
        <script src="./components/header.js" type="text/javascript" defer></script>
        <script src="./components/footer.js" type="text/javascript" defer></script>
        <script src="./components/adidas.js" type="text/javascript" defer></script>
        <script src="./components/nike.js" type="text/javascript" defer></script>
        <script src="./components/select-input.js" type="text/javascript" defer></script>
        <script src="./components/header_manager.js" type="text/javascript" defer></script>
        
        <title>Thợ Code Bán Giày</title>
    </head>
    <body>
        <%
            ProductForSale product = (ProductForSale) request.getAttribute("product");
            NumberFormat formatter = NumberFormat.getNumberInstance();
            ObjectMapper objectMapper = new ObjectMapper();
            String productJson = objectMapper.writeValueAsString(product);
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
            if(product == null) {
                if(request.getParameter("file").length() > 0) image = "./assets/img/" + request.getParameter("file");
                else image = request.getParameter("image");
                smallImg1 = request.getParameter("smlImg1");
                smallImg2 = request.getParameter("smlImg2");
                smallImg3 = request.getParameter("smlImg3");
                description = request.getParameter("description");
                name = request.getParameter("name");
                category = request.getParameter("category");
                quantity = Integer.parseInt(request.getParameter("quantity"));
                initPrice = Integer.parseInt(request.getParameter("initPrice"));
                unitPrice = Integer.parseInt(request.getParameter("unitPrice"));
            } 
            else {
                image = product.getImage();
                smallImg1 = product.getSmallImg1();
                smallImg2 = product.getSmallImg2();
                smallImg3 = product.getSmallImg3();
                description = product.getDescription();
                name = product.getName();;
                category = product.getCategory();
                quantity = product.getQuantity();
                initPrice = product.getInitPrice();
                unitPrice = product.getUnitPrice();
            }
        %>
        <!-- <header-component></header-component> -->
        <!-- <select_input-component></select_input-component> -->
        <header_manager-component></header_manager-component>
        <div class="title" style="margin: 0 auto; width: 25%;">
            <h2 class="heading action-btn">${message}</h2>
        </div>
        <div class="product_detail">
            <div class="sub_content">
                <div class="main_content">
                    <%if(name.equals("SUPERSTAR")) {%>
                    <div class="small_image">
                        <div class="small_image-link">
                            <a href="./assets/img/superstar detail 1.jpeg">
                                <img
                                    src="./assets/img/superstar detail 1.jpeg"
                                    alt="<%=name%>"
                                    class="small_image-img" />
                            </a>
                        </div>
                        <div class="small_image-link">
                            <a href="./assets/img/superstar detail 2.jpeg">
                                <img
                                    src="./assets/img/superstar detail 2.jpeg"
                                    alt="<%=name%>"
                                    class="small_image-img" />
                            </a>
                        </div>
                        <div class="small_image-link">
                            <a href="./assets/img/superstar detail 3.jpeg">
                                <img
                                    src="./assets/img/superstar detail 3.jpeg"
                                    alt="<%=name%>"
                                    class="small_image-img" />
                            </a>
                        </div>
                    </div>
                    <%}%>
                    <div class="main_image">
                        <img src="<%=image%>" alt="<%=name%>" class="main_image-img" />
                    </div>
                    <div class="info_buy">
                        <div class="name"><%=name%></div>
                        <div class="star">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                        </div>
                        <!-- Hiển thị giao diện quản lý: display_ui_own -->
                        <div class="display_ui_own">
                            <div class="ui_own">
                                <div class="price_own">Giá Bán: <%=formatter.format(unitPrice)%>đ</div>
                                <div class="price_own">Giá Vốn: <%=formatter.format(initPrice)%>đ</div>
                                <div class="option-size">
                                    <div class="desc-size">Tồn Kho: <%=quantity%></div>
                                    <ul class="size-list">
                                        <li class="size-item">39</li>
                                        <li class="size-item">40</li>
                                        <li class="size-item">41</li>
                                        <li class="size-item">42</li>
                                        <li class="size-item">43</li>
                                        <li class="size-item">44</li>
                                        <li class="size-item">45</li>
                                    </ul>
                                </div>
                                <%String message = (String) request.getAttribute("message");
                                if(message == null) {%>
                                <div class="action-buy">
                                    <%if(request.getParameter("file").length() > 0) {%>
                                    <a class="action-btn" href="imp-p?image=<%=image%>&description=<%=description%>&name=<%=name%>&category=<%=category%>&quantity=<%=quantity%>&initPrice=<%=initPrice%>&unitPrice=<%=unitPrice%>">
                                        <%} else {%>
                                    <a class="action-btn" href="upd-product?image=<%=image%>&description=<%=description%>&name=<%=name%>&category=<%=category%>&quantity=<%=quantity%>&initPrice=<%=initPrice%>&unitPrice=<%=unitPrice%>">
                                        <%}%>
                                        <div>
                                            <i class="fa-regular fa-pen-to-square"></i>
                                            <span>Cập Nhật</span>
                                        </div>
                                    </a>
                                    <a class="action-btn" href="importProduct.jsp">
                                        <div >
                                            <i style="color: #ededed" class="fa-regular fa-trash-can"></i>
                                            <span style="color: #ededed">Xóa</span>
                                        </div>
                                    </a>
                                </div>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%if(name.equals("SUPERSTAR") || name.equals("superstar")) {%>
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
            <%} else {%>
            <div class="desc_detail">
                <div class="reason">Mô tả sản phẩm</div>
                    <div class="paragraph">
                    <%=description%>
                    </div>
                </div> 
            </div>
            <%}%>
        </div>

        <footer-component></footer-component>
    </body>
</html>
