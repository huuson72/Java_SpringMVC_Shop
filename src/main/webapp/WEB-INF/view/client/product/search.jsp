<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Kết quả tìm kiếm</title>
                <!-- Import CSS -->
                <link href="/client/css/bootstrap.min.css" rel="stylesheet">
                <link href="/client/css/style.css" rel="stylesheet">
                <style>
                    /* Đảm bảo grid luôn có chiều cao cố định cho mỗi sản phẩm */
                    .product-grid {
                        display: grid;
                        grid-template-columns: repeat(4, 1fr);
                        gap: 20px;
                        grid-auto-rows: minmax(300px, auto);
                        /* Đảm bảo mỗi item có chiều cao tối thiểu */
                    }

                    /* Thiết lập card sản phẩm với chiều cao tối thiểu và linh hoạt */
                    .product-card {
                        position: relative;
                        border: 1px solid #ddd;
                        border-radius: 10px;
                        overflow: hidden;
                        background: #fff;
                        display: flex;
                        flex-direction: column;
                        justify-content: space-between;
                        /* Đảm bảo các phần tử trong card căn đều */
                        min-height: 350px;
                        /* Đảm bảo chiều cao đủ cho nội dung */
                        transition: transform 0.3s, box-shadow 0.3s;
                    }

                    .product-card img {
                        width: 100%;
                        height: 200px;
                        object-fit: cover;
                    }

                    .product-card .product-info {
                        padding: 15px;
                        text-align: center;
                        display: flex;
                        flex-direction: column;
                        justify-content: space-between;
                        flex-grow: 1;
                        /* Đảm bảo product-info tự động lấp đầy không gian còn lại */
                    }

                    /* Cắt ngắn mô tả nếu quá dài */
                    .product-card p {
                        font-size: 0.9rem;
                        color: #555;
                        margin-bottom: 10px;
                        text-overflow: ellipsis;
                        white-space: nowrap;
                        overflow: hidden;
                    }

                    /* Đảm bảo nút "Thêm vào giỏ hàng" luôn ở dưới cùng */
                    .product-card form {
                        margin-top: auto;
                    }

                    .product-card .btn-add-to-cart {
                        background-color: #007bff;
                        color: #fff;
                        padding: 5px 15px;
                        border-radius: 20px;
                        border: none;
                        transition: background-color 0.3s;
                    }

                    .product-card .btn-add-to-cart:hover {
                        background-color: #0056b3;
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

                    /* Tiêu đề tìm kiếm */
                    .search-title {
                        font-size: 2rem;
                        font-weight: bold;
                        text-align: center;
                        color: #333;
                        margin-bottom: 40px;
                    }

                    .product-grid {
                        display: grid;
                        grid-template-columns: repeat(4, 1fr);
                        /* 4 cột cố định */
                        gap: 20px;
                    }

                    /* Card sản phẩm */
                    /* .product-card {
                        border: 1px solid #ddd;
                        border-radius: 10px;
                        overflow: hidden;
                        background: #fff;
                        transition: transform 0.3s, box-shadow 0.3s;
                    } */
                    .product-card {
                        position: relative;
                        /* Để căn vị trí thông báo giảm giá */
                        border: 1px solid #ddd;
                        border-radius: 10px;
                        overflow: hidden;
                        background: #fff;
                        transition: transform 0.3s, box-shadow 0.3s;
                    }

                    .product-card:hover {
                        transform: scale(1.05);
                        box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
                    }

                    .product-card img {
                        width: 100%;
                        height: 200px;
                        object-fit: cover;
                    }

                    .product-card .product-info {
                        padding: 15px;
                        text-align: center;
                    }

                    .product-card .product-name {
                        font-size: 1.2rem;
                        font-weight: bold;
                        color: #81C408;
                        text-decoration: none;
                    }

                    .product-card .product-name:hover {
                        text-decoration: underline;
                    }

                    .product-card .product-price {
                        font-size: 1.2rem;
                        font-weight: bold;
                        color: #e60023;
                        margin: 10px 0;
                    }

                    .product-card .btn-add-to-cart {
                        background-color: #007bff;
                        color: #fff;
                        padding: 5px 15px;
                        border-radius: 20px;
                        border: none;
                        transition: background-color 0.3s;
                    }

                    .product-card .btn-add-to-cart:hover {
                        background-color: #0056b3;
                    }

                    /* Pagination */
                    .pagination {
                        display: flex;
                        justify-content: center;
                        margin-top: 30px;
                        gap: 10px;
                    }

                    .pagination .page-link {
                        border-radius: 50%;
                        width: 40px;
                        height: 40px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        border: 1px solid #ddd;
                        color: #007bff;
                    }

                    .pagination .page-link:hover {
                        background-color: #007bff;
                        color: white;
                    }

                    .pagination .active {
                        background-color: #007bff;
                        color: white;
                        border: none;
                    }

                    .product-card .product-price {
                        font-size: 1.2rem;
                        font-weight: bold;
                        color: #e60023;
                        margin: 10px 0;
                    }

                    .product-card .product-price .old-price {
                        text-decoration: line-through;
                        color: #888;
                        /* Màu xám cho giá cũ */
                        margin-right: 10px;
                    }

                    .product-card .product-price .discount-price-label {
                        font-weight: normal;
                        color: #333;
                        margin-right: 5px;
                    }

                    .product-card .product-price .discounted-price {
                        color: #ff5722;
                        /* Màu nổi bật cho giá giảm */
                        font-size: 1.5rem;
                        margin-top: 10px;
                    }
                </style>
            </head>

            <body>
                <!-- Include header -->
                <jsp:include page="../layout/header.jsp" />

                <!-- Kết quả tìm kiếm -->
                <div class="container py-5">
                    <!-- Tiêu đề -->
                    <h2 class="search-title">
                        <c:choose>
                            <c:when test="${not empty searchKeyword}">
                                Kết quả tìm kiếm cho "${searchKeyword}"
                            </c:when>
                            <c:otherwise>
                                Kết quả tìm kiếm
                            </c:otherwise>
                        </c:choose>
                    </h2>

                    <!-- Danh sách sản phẩm -->
                    <div class="product-grid">
                        <c:forEach var="product" items="${products}">
                            <div class="product-card">
                                <div class="discount-badge">
                                    -20%
                                </div>
                                <img src="/images/product/${product.image}" alt="${product.name}">
                                <div class="product-info">
                                    <a href="/product/${product.id}" class="product-name">${product.name}</a>
                                    <p>${product.shortDesc}</p>
                                    <!-- Hiển thị giá cũ và giá giảm 20% -->
                                    <p class="product-price">
                                        <span class="old-price">
                                            <fmt:formatNumber value="${product.price}" /> đ
                                        </span>
                                    </p>
                                    <p class="product-price discounted-price">

                                        <fmt:formatNumber value="${product.price * 0.8}" /> đ
                                    </p>

                                    <form action="/add-product-to-cart/${product.id}" method="post">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                        <button type="submit" class="btn btn-add-to-cart"> <i
                                                class="fa fa-shopping-bag me-2" style="color: #6af32a"></i>Thêm vào giỏ
                                            hàng</button>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <!-- Phân trang -->
                    <c:if test="${totalPages > 0}">
                        <div class="pagination">
                            <c:forEach begin="1" end="${totalPages}" varStatus="status">
                                <a href="/search?page=${status.index}&query=${searchKeyword}"
                                    class="page-link ${status.index eq currentPage ? 'active' : ''}">
                                    ${status.index}
                                </a>
                            </c:forEach>
                        </div>
                    </c:if>
                </div>

                <!-- Include footer -->
                <jsp:include page="../layout/footer.jsp" />

                <!-- JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>