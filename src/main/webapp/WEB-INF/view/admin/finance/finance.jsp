<%@page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
            <meta name="author" content="Hỏi Dân IT" />
            <title>Finance Hstore</title>
            <link href="/css/styles.css" rel="stylesheet" />
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        </head>

        <body class="sb-nav-fixed">
            <jsp:include page="../layout/header.jsp" />
            <div id="layoutSidenav">
                <jsp:include page="../layout/sidebar.jsp" />
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4 mt-5 pt-5">
                            <h2 class="text-center mb-4">Quản Lý Tài Chính</h2>

                            <div class="row">
                                <div class="col-md-12">
                                    <h4 class="mb-3">1. Tổng Quan Doanh Thu</h4>
                                    <p>Tổng doanh thu trong tháng này: <strong>10,000,000 VNĐ</strong></p>

                                    <!-- Nút xem doanh thu -->
                                    <div class="btn-group mb-3" role="group" aria-label="Basic outlined example">
                                        <button type="button" class="btn btn-outline-secondary view-revenue"
                                            data-period="Tháng">Theo Tháng</button>
                                        <button type="button" class="btn btn-outline-secondary view-revenue"
                                            data-period="Quý">Theo Quý</button>
                                        <button type="button" class="btn btn-outline-secondary view-revenue"
                                            data-period="Năm">Theo Năm</button>
                                    </div>

                                    <h5 id="revenueTitle" class="card-title">Doanh Thu Tháng</h5>
                                    <div class="card mb-4">
                                        <div class="card-body">
                                            <canvas id="revenueChart" width="400" height="200"></canvas>
                                        </div>
                                    </div>

                                    <h4 class="mb-3">2. Chi Phí Tháng Này</h4>
                                    <p>Tổng chi phí trong tháng này: <strong>7,000,000 VNĐ</strong></p>

                                    <!-- Nút xem chi phí -->
                                    <div class="btn-group mb-3" role="group" aria-label="Basic outlined example">
                                        <button type="button" class="btn btn-outline-secondary view-expense"
                                            data-period="Tháng">Theo Tháng</button>
                                        <button type="button" class="btn btn-outline-secondary view-expense"
                                            data-period="Quý">Theo Quý</button>
                                        <button type="button" class="btn btn-outline-secondary view-expense"
                                            data-period="Năm">Theo Năm</button>
                                    </div>

                                    <h5 id="expenseTitle" class="card-title">Chi Phí Tháng</h5>
                                    <div class="card mb-4">
                                        <div class="card-body">
                                            <canvas id="expenseChart" width="400" height="200"></canvas>
                                        </div>
                                    </div>

                                    <h4 class="mb-3">3. Báo Cáo Giao Dịch</h4>
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Ngày</th>
                                                <th>Nội Dung</th>
                                                <th>Doanh Thu</th>
                                                <th>Chi Phí</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>01/09/2024</td>
                                                <td>Bán Laptop X</td>
                                                <td>5,000,000 VNĐ</td>
                                                <td>1,000,000 VNĐ</td>
                                            </tr>
                                            <tr>
                                                <td>05/09/2024</td>
                                                <td>Bán Laptop Y</td>
                                                <td>3,000,000 VNĐ</td>
                                                <td>500,000 VNĐ</td>
                                            </tr>
                                            <tr>
                                                <td>10/09/2024</td>
                                                <td>Chi phí quảng cáo</td>
                                                <td>0 VNĐ</td>
                                                <td>2,000,000 VNĐ</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </main>
                    <jsp:include page="../layout/footer.jsp" />
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script>
                // Doanh thu
                const revenueCtx = document.getElementById('revenueChart').getContext('2d');
                const revenueChart = new Chart(revenueCtx, {
                    type: 'bar',
                    data: {
                        labels: ['Tuần 1', 'Tuần 2', 'Tuần 3', 'Tuần 4'],
                        datasets: [{
                            label: 'Doanh Thu',
                            data: [2000000, 3000000, 2500000, 2500000], // Dữ liệu mặc định
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });

                // Chi phí
                const expenseCtx = document.getElementById('expenseChart').getContext('2d');
                const expenseChart = new Chart(expenseCtx, {
                    type: 'bar',
                    data: {
                        labels: ['Tuần 1', 'Tuần 2', 'Tuần 3', 'Tuần 4'],
                        datasets: [{
                            label: 'Chi Phí',
                            data: [1500000, 2000000, 1000000, 2500000], // Dữ liệu mặc định
                            backgroundColor: 'rgba(255, 99, 132, 0.2)',
                            borderColor: 'rgba(255, 99, 132, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });

                $(document).ready(() => {
                    // Thay đổi tiêu đề và cập nhật dữ liệu giả lập cho doanh thu
                    $(".view-revenue").click(function () {
                        const period = $(this).data("period");
                        $("#revenueTitle").text("Doanh Thu " + period);
                        updateRevenueData(period);
                    });

                    // Thay đổi tiêu đề và cập nhật dữ liệu giả lập cho chi phí
                    $(".view-expense").click(function () {
                        const period = $(this).data("period");
                        $("#expenseTitle").text("Chi Phí " + period);
                        updateExpenseData(period);
                    });
                });

                function updateRevenueData(period) {
                    let revenueData = {
                        "Tháng": [2000000, 3000000, 2500000, 2500000],
                        "Quý": [8000000, 9000000, 7500000],
                        "Năm": [20000000, 25000000, 23000000]
                    };

                    revenueChart.data.datasets[0].data = revenueData[period];
                    revenueChart.update();
                }

                function updateExpenseData(period) {
                    let expenseData = {
                        "Tháng": [1500000, 2000000, 1000000, 2500000],
                        "Quý": [3000000, 4000000, 3500000],
                        "Năm": [20000000, 25000000, 23000000]
                    };

                    expenseChart.data.datasets[0].data = expenseData[period];
                    expenseChart.update();
                }
            </script>
        </body>

        </html>