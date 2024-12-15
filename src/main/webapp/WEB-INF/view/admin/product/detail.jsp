<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                    <meta name="author" content="Hỏi Dân IT" />
                    <title>Detail Product - Hỏi Dân IT</title>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Quản lí sản phẩm</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/admin">Tổng quan</a></li>
                                        <li class="breadcrumb-item"><a href="/admin/product">Sản phẩm</a></li>
                                        <li class="breadcrumb-item active">Xem chi tiết sản phẩm</li>
                                    </ol>
                                    <div class="container mt-5">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <div class="d-flex justify-content-between">
                                                    <h3>Thông tin sản phẩm với ID = ${id}</h3>
                                                </div>

                                                <hr />

                                                <!-- Chia thành 2 cột: 4 cột cho ảnh và 8 cột cho thông tin sản phẩm -->
                                                <div class="row">
                                                    <!-- Cột chứa ảnh -->
                                                    <div class="col-md-4">
                                                        <img class="img-fluid" src="/images/product/${product.image}"
                                                            alt="Hình ảnh sản phẩm">
                                                    </div>

                                                    <!-- Cột chứa thông tin sản phẩm -->
                                                    <div class="col-md-8">
                                                        <div class="card">
                                                            <div class="card-header">
                                                                Thông tin sản phẩm
                                                            </div>
                                                            <ul class="list-group list-group-flush">
                                                                <li class="list-group-item">ID: ${product.id}</li>
                                                                <li class="list-group-item">Tên sản phẩm:
                                                                    ${product.name}</li>
                                                                <li class="list-group-item">Giá:
                                                                    <fmt:formatNumber value="${product.price}"
                                                                        type="currency" currencySymbol="" />
                                                                </li>
                                                                <li class="list-group-item">Hãng sản xuất: Asus</li>
                                                                <li class="list-group-item">Cấu hình: Intel Core i9<br>
                                                                    RTX 4090<br> 32GB RAM<br> Màn hình 144hz</li>
                                                                <li class="list-group-item">Giới thiệu: Đây là sản phẩm
                                                                    laptop cao cấp với hiệu suất mạnh mẽ, phù hợp cho
                                                                    các nhu cầu chơi game, làm việc đồ họa và lập trình.
                                                                    Thiết kế tinh tế cùng với phần cứng hiện đại
                                                                    sẽ mang lại trải nghiệm tuyệt vời cho người dùng.
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>

                                                <a href="/admin/product" class="btn btn-success mt-3">Trở về</a>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </main>
                            <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/scripts.js"></script>
                </body>

                </html>