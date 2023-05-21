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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
        <link rel="stylesheet" href="./assets/css/base.css" />
        <link rel="stylesheet" href="./assets/css/header-manager.css" />
        <link rel="stylesheet" href="./assets/css/select-custom.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        <script src="./components/header_manager.js" type="text/javascript" defer></script>
        <script src="./select-custom.js"></script>
        <title>Quản lý</title>
    </head>
    <body>
        <%
        NumberFormat formatter = NumberFormat.getNumberInstance();
        %>
        <header_manager-component></header_manager-component>
        <div class="content_2">
            <div class="sub_content">
                <div class="result">
                    <div class="title">Kết Quả Bán Hàng</div>
                    <div class="result_frame">
                        <div class="icon">
                            <i class="fa-solid fa-dollar-sign"></i>
                        </div>
                        <div class="text">
                            <div class="desc">Đã bán: <%=ManagerService.noOfOrders%> hóa đơn</div>
                            <div class="count" style="color: #0094da"><%=formatter.format(ManagerService.accounting.getRevenue())%>đ</div>
                            <div class="note">Doanh thu</div>
                        </div>
                        <div class="icon" style="background-color: #ff8030">
                            <i class="fa-solid fa-dollar-sign"></i>
                        </div>
                        <div class="text">
                            <%int totalImportedProduct = 0;
                            int totalNoOfSolds = 0;
                            for(int i = 0; i < ManagerService.products.size(); i++) {
                                totalNoOfSolds += ManagerService.products.get(i).getNoOfSolds();
                            }
                            %>
                            <div class="count" style="color: #ff8030"><%=formatter.format(ManagerService.accounting.getExpense())%>đ</div>
                            <div class="note">Chi tiêu</div>
                        </div>
                    </div>
                </div>
                <div class="graphic">
                    <div class="wrap_1">
                        <div class="wrap_left">
                            <div class="title">Doanh Thu Thuần</div>
                        </div>
                        <div class="wrap_right">
                            Tổng: <%=formatter.format(ManagerService.accounting.getRevenue())%>đ
                        </div>
                    </div>
                    <div class="wrap_2">
                        <canvas id="plot_1" style="width: 90%; max-width: 800px"></canvas>
                        <script>
                            var string = "<%=ManagerService.productsName.toString()%>";
                            var xValues = string.substring(1, string.length - 1).split(", ");
                            string = "<%=ManagerService.noOfSolds.toString()%>";
                            var yValues = string.substring(1, string.length - 1).split(", ");
                            var barColors = "#0094da";

                            new Chart("plot_1", {
                                type: "bar",
                                data: {
                                    labels: xValues,
                                    datasets: [
                                        {
                                            backgroundColor: barColors,
                                            data: yValues,
                                        },
                                    ],
                                },
                                options: {
                                    legend: { display: false },
                                    scales: {
                                        yAxes: [
                                            {
                                                ticks: {
                                                    beginAtZero: true,
                                                },
                                            },
                                        ],
                                    },
                                },
                            });
                        </script>
                    </div>
                </div>
                <div class="graphic">
                    <div class="wrap_1">
                        <div class="wrap_left">
                            <div class="title">Top Hàng Hóa Bán Chạy</div>
                        </div>
                        <!-- <div class="custom-select" style="width: 200px">
                            <select>
                                <option value="revenue">Theo Doanh Thu</option>
                                <option value="amount">Theo Số Lượng</option>
                            </select>
                        </div> -->
                    </div>
                    <div class="wrap_2">
                        <canvas id="plot_2" style="width: 90%; max-width: 800px"></canvas>
                        <script>
                            <%ArrayList<Integer> copy = new ArrayList<Integer>(ManagerService.noOfSolds);
                                Collections.sort(copy, Collections.reverseOrder());%>
                            var string = "<%=copy.subList(0, 5)%>";
                            var yValues = string.substring(1, string.length - 1).split(", ");
                            <%ArrayList<String> top5 = new ArrayList<String>();
                            for(int i = 0, j = 0; j < 5; i++) {
                                if(ManagerService.products.get(i).getNoOfSolds() == copy.get(j) && !top5.contains(ManagerService.productsName.get(i))) {
                                    top5.add(ManagerService.productsName.get(i));
                                    j++;
                                    i = -1;
                                }
                            }
                            %>
                            string = "<%=top5.toString()%>";
                            var xValues = string.substring(1, string.length - 1).split(", ");
                            var barColors = "#0094da";
                            new Chart("plot_2", {
                                type: "horizontalBar",
                                data: {
                                    labels: xValues,
                                    datasets: [
                                        {
                                            backgroundColor: barColors,
                                            data: yValues,
                                        },
                                    ],
                                },
                                options: {
                                    legend: { display: false },
                                    title: {
                                        display: true,
                                        // text: "World Wine Production 2018",
                                    },
                                    scales: {
                                        xAxes: [{
                                            ticks: { 
                                                beginAtZero: true,
                                            }
                                        }],
                                    },
                                },
                            });
                        </script>
                    </div>
                </div>
            </div>
        </div>
        <script src="./select-custom.js"></script>
    </body>
</html>
