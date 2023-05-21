<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
  <head>
      <meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <link rel="stylesheet" href="./assets/font/stylesheet.css" />
      <link rel="stylesheet" href="./assets/css/reset.css" />
      <link rel="stylesheet" href="./assets/css/style-login-register.css" />
      <title>Đăng Ký</title>
  </head>

  <body>
    <div class="content">
      <div class="sub_content sub_content--register">
        <div class="logo_img"><a href="index.jsp"><img src="./assets/img/logo.png" alt="Thợ Code Bán Giày" /></a></div>

        <h1 class="h1--register">Đăng Ký</h1>

        <form class="info-reg" method="post" action="Register">
          <div class="desc"><label for="query">Họ và Tên</label></div>
          <div class="frame">
              <input type="text" id="query" name="fullname" placeholder="Họ và tên"/>
          </div>
          <div class="desc"><label for="query">Số điện thoại</label></div>
          <div class="frame">
              <input type="text" id="query" name="phoneNums" placeholder="Số điện thoại"/>
          </div>
          <div class="desc"><label for="query">Tên Đăng Nhập</label></div>
          <div class="frame">
              <input type="text" id="query" name="userId" placeholder="Tên Đăng Nhập"/>
          </div>
          <div class="desc"><label for="query">Mật khẩu</label></div>
          <div class="frame">
              <input type="password" id="password" name="password" placeholder="Mật khẩu"/>
          </div>
          <p class="frame_display_password">
            <input id="display_password" type="checkbox" onclick="display_password_func()" />
            <script>
              function display_password_func() {
                var x = document.getElementById("password");
                if (x.type === "password") {
                    x.type = "text";
                } else {
                    x.type = "password";
                }
              }
            </script>
            <label for="display_password">Hiện Mật Khẩu</label>
          </p>
          <br/>
          <div class="frame reg">
            <input class="reg" type="submit" value="Đăng ký" />
          </div>
        </form>
        ${message}
      </div>
    </div>
  </body>
</html>