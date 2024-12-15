<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
            <meta name="author" content="Hỏi Dân IT" />
            <title>Finance Hstore - Quản Lý Lợi Nhuận</title>
            <link href="/css/styles.css" rel="stylesheet" />
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

            <script>
                $(document).ready(() => {
                    // Thay đổi tiêu đề và cập nhật dữ liệu lợi nhuận
                    $(".view-profit").click(function () {
                        const period = $(this).data("period");
                        $("#profitTitle").text("Lợi Nhuận " + period);
                        updateProfitData(period);
                    });
                });

                function updateProfitData(period) {
                    let profitData = {
                        "Tháng": [500000, 1000000, 1500000, 2000000],
                        "Quý": [5000000, 6000000, 4000000],
                        "Năm": [7000000, 9000000, 12000000]
                    };

                    profitChart.data.datasets[0].data = profitData[period];
                    profitChart.update();
                }
            </script>
        </head>

        <body class="sb-nav-fixed">
            <jsp:include page="../layout/header.jsp" />
            <div id="layoutSidenav">
                <jsp:include page="../layout/sidebar.jsp" />
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4 mt-5 pt-5">
                            <h2 class="text-center mb-4">Quản Lý Tài Chính - Lợi Nhuận</h2>

                            <h4 class="mb-3">Tổng Quan Lợi Nhuận</h4>
                            <p>Tổng lợi nhuận trong tháng này: <strong>3,000,000 VNĐ</strong></p>

                            <!-- Nút xem lợi nhuận -->
                            <div class="btn-group mb-3" role="group" aria-label="Basic outlined example">
                                <button type="button" class="btn btn-outline-secondary view-profit"
                                    data-period="Tháng">Theo Tháng</button>
                                <button type="button" class="btn btn-outline-secondary view-profit"
                                    data-period="Quý">Theo Quý</button>
                                <button type="button" class="btn btn-outline-secondary view-profit"
                                    data-period="Năm">Theo Năm</button>
                            </div>

                            <h5 id="profitTitle" class="card-title">Lợi Nhuận Tháng</h5>
                            <div class="card mb-4">
                                <div class="card-body">
                                    <canvas id="profitChart" width="400" height="200"></canvas>
                                </div>
                            </div>
                        </div>
                    </main>
                    <jsp:include page="../layout/footer.jsp" />
                </div>
            </div>

            <script>
                // Biểu đồ lợi nhuận
                const profitCtx = document.getElementById('profitChart').getContext('2d');
                const profitChart = new Chart(profitCtx, {
                    type: 'bar',
                    data: {
                        labels: ['Tuần 1', 'Tuần 2', 'Tuần 3', 'Tuần 4'],
                        datasets: [{
                            label: 'Lợi Nhuận',
                            data: [500000, 1000000, 1500000, 2000000], // Dữ liệu mặc định
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
            </script>
        </body>

        </html>