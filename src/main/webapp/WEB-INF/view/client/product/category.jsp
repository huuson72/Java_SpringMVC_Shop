<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <title>Danh mục sản phẩm - Laptopshop</title>

                <!-- CSS Libraries -->
                <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css"
                    rel="stylesheet">
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="/client/css/style.css" rel="stylesheet">

                <style>
                    .product-card {
                        border: 1px solid #ddd;
                        border-radius: 10px;
                        overflow: hidden;
                        position: relative;
                        transition: transform 0.3s ease;
                        height: 100%;
                        /* Card chiếm toàn bộ chiều cao */
                        display: flex;
                        flex-direction: column;
                        /* Đảm bảo chia đều thành các phần */
                        justify-content: space-between;
                        /* Đẩy nội dung xuống cuối card nếu cần */
                    }

                    .product-card:hover {
                        transform: scale(1.02);
                    }

                    .product-card img {
                        width: 100%;
                        height: 200px;
                        /* Cố định chiều cao của ảnh */
                        object-fit: cover;
                        /* Đảm bảo ảnh không bị méo */
                    }

                    .discount-badge {
                        position: absolute;
                        top: 10px;
                        right: 10px;
                        background-color: red;
                        color: white;
                        padding: 5px 10px;
                        font-size: 1rem;
                        border-radius: 5px;
                    }

                    .product-info {
                        padding: 15px;
                        text-align: center;
                        flex-grow: 1;
                        /* Đảm bảo phần nội dung có thể mở rộng */
                        display: flex;
                        flex-direction: column;
                        justify-content: space-between;
                    }

                    .product-info h5 {
                        font-size: 18px;
                        font-weight: bold;
                        margin-bottom: 10px;
                    }

                    .product-info p {
                        margin: 0;
                        font-size: 14px;
                    }

                    .product-info .price {
                        color: #ff4d4d;
                        font-size: 16px;
                        text-decoration: line-through;
                    }

                    .product-info .final-price {
                        color: #28a745;
                        font-size: 18px;
                        font-weight: bold;
                        margin-top: 5px;
                    }

                    .btn-add-to-cart {
                        margin-top: 10px;
                        background-color: #007bff;
                        color: white;
                        border-radius: 20px;
                        padding: 5px 15px;
                        border: none;
                        transition: background-color 0.3s ease;
                    }

                    .btn-add-to-cart:hover {
                        background-color: #0056b3;
                    }

                    .category-title {
                        text-align: center;
                        margin-bottom: 30px;
                        font-size: 24px;
                        font-weight: bold;
                    }
                </style>
            </head>

            <body>
                <!-- Include Header -->
                <jsp:include page="../layout/header.jsp" />

                <div class="container py-5">
                    <div class="category-title">
                        <h1>Danh mục sản phẩm: ${categoryName}</h1>
                    </div>
                    <div class="row g-4">
                        <c:forEach var="product" items="${products}">
                            <div class="col-md-6 col-lg-4 col-xl-3">
                                <div class="product-card">
                                    <div class="product-img">
                                        <img src="/images/product/${product.image}" alt="${product.name}">
                                    </div>
                                    <div class="product-info">
                                        <h5><a href="/product/${product.id}">${product.name}</a></h5>
                                        <p>${product.shortDesc}</p>
                                        <p class="price">
                                            <fmt:formatNumber value="${product.price}" type="number" /> đ
                                        </p>
                                        <p class="final-price">
                                            <fmt:formatNumber value="${product.price * 0.8}" type="number" /> đ
                                        </p>
                                        <button class="btn btn-add-to-cart" data-product-id="${product.id}">
                                            <i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>
                    </div>
                </div>

                <!-- Include Footer -->
                <jsp:include page="../layout/footer.jsp" />

                <!-- JavaScript Libraries -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    $(document).ready(function () {
                        $("#spinner").hide(); // Ẩn spinner khi trang đã tải xong
                    });
                </script>
            </body>

            </html>