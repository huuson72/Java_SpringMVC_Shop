<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="utf-8">
            <title> Sản Phẩm - Laptopshop</title>
            <meta content="width=device-width, initial-scale=1.0" name="viewport">
            <meta content="" name="keywords">
            <meta content="" name="description">

            <!-- Google Web Fonts -->
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link
                href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                rel="stylesheet">

            <!-- Icon Font Stylesheet -->
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

            <!-- Libraries Stylesheet -->
            <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
            <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


            <!-- Customized Bootstrap Stylesheet -->
            <link href="/client/css/bootstrap.min.css" rel="stylesheet">

            <!-- Template Stylesheet -->
            <link href="/client/css/style.css" rel="stylesheet">
            <style>
                .promo-image {
                    height: 150px;
                    /* Thay đổi chiều cao tùy theo yêu cầu */
                    object-fit: cover;
                    /* Đảm bảo hình ảnh không bị méo */
                    width: 80%;
                    /* Đảm bảo hình ảnh trải rộng hết chiều rộng */
                }
            </style>
        </head>

        <body>

            <!-- Navbar Start -->
            <div class="container-fluid fixed-top">
                <div class="container px-0">
                    <nav class="navbar navbar-light bg-white navbar-expand-xl">
                        <a href="/" class="navbar-brand">
                            <h1 class="text-dark display-6">Hstore</h1>
                        </a>
                        <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarCollapse">
                            <span class="fa fa-bars text-primary"></span>
                        </button>
                        <div class="collapse navbar-collapse bg-white justify-content-between mx-5" id="navbarCollapse">
                            <div class="navbar-nav">
                                <a href="/" class="nav-item nav-link">Trang Chủ</a>
                                <a href="/products" class="nav-item nav-link">Sản Phẩm</a>
                                <a href="/khuyenmai" class="nav-item nav-link active">Khuyến Mãi</a>
                                <a href="/contact" class="nav-item nav-link">Liên hệ</a>
                            </div>
                            <form class="d-flex" method="get" action="/search">
                                <input class="form-control me-2" type="search" placeholder="Bạn muốn mua gì?"
                                    aria-label="Search" name="query">
                                <button class="btn btn-outline-black" type="submit">Tìm</button>
                            </form>
                            <div class="d-flex m-3 me-0">
                                <c:if test="${not empty pageContext.request.userPrincipal}">
                                    <a href="/cart" class="position-relative me-4 my-auto">
                                        <i class="fa fa-shopping-bag fa-2x" style="color: black;"></i>
                                        <span
                                            class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                                            style="top: -5px; left: 15px; height: 20px; min-width: 20px;" id="sumCart">
                                            ${sessionScope.sum}
                                        </span>
                                    </a>
                                    <div class="dropdown my-auto">
                                        <a href="#" class="dropdown" role="button" id="dropdownMenuLink"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                            <i class="fas fa-user fa-2x" style="color: rgb(0, 0, 0);"></i>
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-end p-4"
                                            aria-labelledby="dropdownMenuLink">
                                            <li class="d-flex align-items-center flex-column" style="min-width: 300px;">
                                                <img style="width: 150px; height: 150px; border-radius: 50%; overflow: hidden;"
                                                    src="/images/avatar/${sessionScope.avatar}" />
                                                <div class="text-center my-3">
                                                    <c:out value="${sessionScope.fullName}" />
                                                </div>
                                            </li>
                                            <li><a class="dropdown-item" href="#">Quản lý tài khoản</a></li>
                                            <li><a class="dropdown-item" href="/order-history">Lịch sử mua hàng</a></li>
                                            <li>
                                                <hr class="dropdown-divider">
                                            </li>
                                            <li>
                                                <form method="post" action="/logout">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <button class="dropdown-item">Đăng xuất</button>
                                                </form>
                                            </li>
                                        </ul>
                                    </div>
                                </c:if>
                                <c:if test="${empty pageContext.request.userPrincipal}">
                                    <a href="/login" class="a-login position-relative me-4 my-auto">Đăng nhập</a>
                                </c:if>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
            <!-- Navbar End -->

            <!-- Main Content Start -->
            <div class="container mt-5 pt-5">
                <h2 class="text-center mb-4">Thông Tin Khuyến Mãi Khi Mua Laptop</h2>
                <div class="row">
                    <div class="col-md-12">
                        <h4 class="mb-3">1. Giảm giá 10% cho tất cả sản phẩm Laptop</h4>
                        <img src="/images/promotions/discount.jpg" class="img-fluid promo-image mb-3"
                            alt="Giảm giá 10%">
                        <p>Nhận ngay ưu đãi giảm giá 10% khi mua bất kỳ sản phẩm Laptop nào trong tháng này. Chương
                            trình áp dụng cho tất cả khách hàng.</p>

                        <h4 class="mb-3">2. Quà tặng kèm theo đơn hàng</h4>
                        <img src="/images/promotions/gift.jpg" class="img-fluid promo-image mb-3"
                            alt="Quà tặng kèm theo">
                        <p>Nhận một túi đựng laptop miễn phí cho mỗi đơn hàng từ 5 triệu đồng trở lên.</p>


                    </div>
                </div>
                <button class="black button">Back</button>

            </div>

            <!-- Main Content End -->

            <!-- Footer Start -->
            <jsp:include page="../layout/footer.jsp" />
            <!-- Footer End -->

            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>