<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Trang chủ - Laptopshop</title>

                <!-- Google Web Fonts -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                    rel="stylesheet">

                <!-- Icon Font Stylesheet -->
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <!-- Libraries Stylesheet -->
                <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                <!-- Customized Bootstrap Stylesheet -->
                <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link href="/client/css/style.css" rel="stylesheet">

                <meta name="_csrf" content="${_csrf.token}" />
                <!-- default header name is X-CSRF-TOKEN -->
                <meta name="_csrf_header" content="${_csrf.headerName}" />

                <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
                    rel="stylesheet">
                <style>
                    /* Đảm bảo tất cả các hình ảnh có kích thước đồng đều */
                    .fruite-img img {
                        width: 100%;
                        /* Đảm bảo hình ảnh chiếm đầy chiều rộng của phần tử chứa */
                        height: 200px;
                        /* Cố định chiều cao */
                        object-fit: cover;
                        /* Cắt phần hình ảnh vượt ra ngoài khung */
                    }

                    /* Nút giảm giá */
                    .discount-price {
                        color: #ff4d4d;
                        font-size: 16px;
                        font-weight: bold;
                        text-decoration: line-through;
                    }

                    /* Nút thêm vào giỏ hàng */
                    .product-add-btn {
                        position: absolute;
                        top: 10px;
                        right: 10px;
                        background-color: #ff4d4d;
                        color: #fff;
                        border: none;
                        padding: 10px 15px;
                        border-radius: 50%;
                        font-size: 20px;
                        cursor: pointer;
                    }

                    /* Phân trang container */
                    .pagination {
                        display: flex;
                        justify-content: center;
                        margin-top: 20px;
                        margin-bottom: 30px;
                    }

                    /* Các liên kết và nút phân trang */
                    .pagination a,
                    .pagination span {
                        margin: 0 5px;
                        padding: 8px 20px;
                        border: 1px solid #ddd;
                        border-radius: 5px;
                        text-decoration: none;
                        color: #333;
                        font-size: 14px;
                        transition: background-color 0.3s, color 0.3s;
                        display: inline-block;
                    }

                    /* Nút khi hover */
                    .pagination a:hover {
                        background-color: #007bff;
                        /* Màu xanh dương khi hover */
                        color: #fff;
                        /* Màu chữ trắng */
                    }

                    /* Trang hiện tại (active) */
                    .pagination .active a {
                        background-color: #0056b3;
                        /* Màu nền đậm hơn cho trang hiện tại */
                        color: #fff;
                        pointer-events: none;
                        /* Không cho phép click vào trang hiện tại */
                    }

                    /* Các trang không có hiệu lực (disabled) */
                    .pagination .disabled a {
                        color: #aaa;
                        border-color: #ddd;
                        pointer-events: none;
                        /* Không cho phép click vào các trang không có hiệu lực */
                    }

                    /* Nút trang trước và trang tiếp theo */
                    .pagination .page-item a {
                        font-weight: 600;
                        /* Làm chữ đậm cho các nút trang trước, tiếp theo */
                    }

                    /* Thêm hiệu ứng cho các nút khi hover */
                    .pagination a:hover {
                        cursor: pointer;
                        transform: scale(1.05);
                        /* Tăng kích thước nút nhẹ khi hover */
                    }

                    .discount-badge {
                        position: absolute;
                        top: 10px;
                        right: 10px;
                        background-color: red;
                        /* Màu nền đỏ */
                        color: white;
                        /* Màu chữ trắng */
                        padding: 5px 10px;
                        font-size: 1.2rem;
                        font-weight: bold;
                        border-radius: 5px;
                        z-index: 1;
                        /* Đảm bảo hiển thị trên các phần tử khác */
                    }

                    .btnAddToCartHomepage {
                        background-color: #007bff;
                        color: #fff;
                        padding: 5px 15px;
                        border-radius: 20px;
                        border: none;
                        transition: background-color 0.3s;
                    }

                    .btnAddToCartHomepage:hover {
                        background-color: #0056b3;
                        color: white;
                    }
                </style>


            </head>

            <body>

                <!-- Spinner Start -->
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>
                <!-- Spinner End -->

                <jsp:include page="../layout/header.jsp" />


                <jsp:include page="../layout/banner.jsp" />





                <div class="container-fluid fruite py-5">
                    <div class="container py-5">
                        <div class="tab-class text-center">
                            <div class="row g-4">
                                <div class="col-lg-4 text-start">
                                    <h1>Sản phẩm nổi bật</h1>
                                </div>
                                <div class="col-lg-8 text-end">
                                    <ul class="nav nav-pills d-inline-flex text-center mb-5">
                                        <li class="nav-item">
                                            <a class="d-flex m-2 py-2 bg-light rounded-pill active" href="/products">
                                                <span class="text-dark" style="width: 130px;">All Products</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="tab-content">
                                <div id="tab-1" class="tab-pane fade show p-0 active">
                                    <div class="row g-4">
                                        <div class="col-lg-12">
                                            <div class="row g-4">
                                                <c:forEach var="product" items="${products}">
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/images/product/${product.image}"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <!-- Nút đỏ trên góc phải -->
                                                            <div class="discount-badge">
                                                                -20%
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                style="top: 10px; left: 10px;">Laptop</div>
                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <h4 style="font-size: 15px;">
                                                                    <a href="/product/${product.id}">
                                                                        ${product.name}
                                                                    </a>
                                                                </h4>
                                                                <p style="font-size: 13px;">${product.shortDesc}</p>
                                                                <div
                                                                    class="d-flex flex-lg-wrap justify-content-center flex-column">
                                                                    <!-- Giá cũ bị gạch -->
                                                                    <p style="font-size: 15px; text-align: center; width: 100%;"
                                                                        class="discount-price">
                                                                        <fmt:formatNumber type="number"
                                                                            value="${product.price}" /> đ
                                                                    </p>
                                                                    <!-- Giá sau giảm 20% -->
                                                                    <p style="font-size: 15px; text-align: center; width: 100%;"
                                                                        class="text-dark fw-bold mb-3">
                                                                        <fmt:formatNumber type="number"
                                                                            value="${product.price * 0.8}" /> đ
                                                                    </p>

                                                                    <button data-product-id="${product.id}"
                                                                        class="btnAddToCartHomepage mx-auto btn border rounded-pill px-3">
                                                                        <i class="fa fa-shopping-bag me-2"
                                                                            style="color: #6af32a"></i>
                                                                        Thêm vào giỏ hàng
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>

                                            <!-- Pagination Start -->
                                            <div>
                                                <ul class="pagination">
                                                    <c:if test="${currentPage > 0}">
                                                        <li class="page-item">
                                                            <a class="page-link" href="/page/${currentPage - 1}">Trang
                                                                trước</a>
                                                        </li>
                                                    </c:if>
                                                    <c:forEach var="i" begin="0" end="${totalPages - 1}">
                                                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                            <a class="page-link" href="/page/${i}">${i + 1}</a>
                                                        </li>
                                                    </c:forEach>
                                                    <c:if test="${currentPage < totalPages - 1}">
                                                        <li class="page-item">
                                                            <a class="page-link" href="/page/${currentPage + 1}">Trang
                                                                sau</a>
                                                        </li>
                                                    </c:if>
                                                </ul>
                                            </div>
                                            <!-- Pagination End -->

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Fruits Shop End-->

                <jsp:include page="../layout/feature.jsp" />

                <jsp:include page="../layout/footer.jsp" />


                <!-- Back to Top -->
                <!-- <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                        class="fa fa-arrow-up"></i></a> -->


                <!-- JavaScript Libraries -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/lib/easing/easing.min.js"></script>
                <script src="/client/lib/waypoints/waypoints.min.js"></script>
                <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                <!-- Template Javascript -->
                <script src="/client/js/main.js"></script>
                <script
                    src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
            </body>

            </html>