<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title> ${product.name} - Laptopshop</title>
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
                        .fruite-categorie li {
                            margin-bottom: 15px;
                            /* Tạo khoảng cách giữa các mục */
                        }

                        .fruite-categorie img {
                            width: 40px;
                            height: 40px;
                            object-fit: cover;
                            border-radius: 50%;
                            margin-right: 10px;
                            /* Khoảng cách giữa ảnh và tên danh mục */
                        }

                        .fruite-categorie img {
                            width: 40px;
                            /* Đặt kích thước chiều rộng */
                            height: 40px;
                            /* Đặt kích thước chiều cao */
                            object-fit: cover;
                            /* Đảm bảo ảnh không bị méo */
                            border-radius: 50%;
                            /* Bo tròn hình ảnh thành hình tròn */
                        }

                        /* Di chuyển popup xuống một chút */
                        .modal-dialog {
                            margin-top: 230px;

                            /* Điều chỉnh giá trị này để popup di chuyển xuống */
                        }

                        /* Nếu bạn muốn modal header cũng có chút khoảng cách trên */
                        .modal-header {
                            padding-top: 15px;
                            /* Tăng thêm khoảng cách trên */
                        }

                        /* Tùy chỉnh giao diện chip (Chip CPU và RAM) */
                        .chip,
                        .ram {
                            padding: 8px 15px;
                            font-size: 16px;
                            cursor: pointer;
                            background-color: black;
                            border: 1px solid #ddd;
                            transition: all 0.3s ease;
                            margin: 5px;
                        }

                        .chip:hover,
                        .ram:hover {
                            background-color: #007bff;
                            color: white;
                            border-color: #007bff;
                        }

                        /* Khi chip hoặc RAM được chọn */
                        .chip.selected,
                        .ram.selected {
                            background-color: #007bff;
                            color: white;
                            border-color: #007bff;
                        }

                        /* Tùy chỉnh modal */
                        .modal-content {
                            border-radius: 15px;
                            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                        }

                        .modal-header {
                            border-bottom: 2px solid #f0f0f0;
                        }

                        .modal-footer {
                            border-top: 2px solid #f0f0f0;
                        }

                        /* Di chuyển popup xuống một chút */
                        .modal-dialog {
                            margin-top: 230px;
                            /* Điều chỉnh giá trị này để popup di chuyển xuống */
                        }

                        /* Nếu bạn muốn modal header cũng có chút khoảng cách trên */
                        .modal-header {
                            padding-top: 15px;
                            /* Tăng thêm khoảng cách trên */
                        }

                        .header-container {
                            border-bottom: 2px solid #000;
                            /* Đường thẳng đen dày 2px */
                            height: 1px;
                            /* Thêm chiều cao nhỏ để chắc chắn có đường viền */
                        }

                        /* Đảm bảo các cột có chiều cao đồng đều */
                        .col-md-6,
                        .col-lg-4,
                        .col-xl-3 {
                            display: flex;
                            flex-direction: column;
                            justify-content: space-between;
                            height: 100%;
                            /* Cho phép các sản phẩm trong các cột có chiều cao đồng đều */
                            margin-bottom: 30px;
                            /* Tạo khoảng cách giữa các cột */
                        }

                        .product-img img {
                            width: 100%;
                            height: 200px;
                            /* Thay đổi chiều cao để tất cả ảnh có cùng kích thước */
                            object-fit: cover;
                            /* Đảm bảo ảnh không bị méo, cắt theo tỷ lệ */
                        }

                        /* Cải thiện căn giữa cho các trường */
                        .product-name {
                            text-align: center;
                            margin-bottom: 10px;
                            font-size: 15px;
                        }

                        .product-desc {
                            text-align: center;
                            font-size: 13px;
                            margin-bottom: 10px;
                        }

                        /* Căn giữa các đoạn văn bản và giá */
                        .discount-price,
                        .text-dark {
                            text-align: center;
                            font-size: 15px;
                            width: 100%;
                        }

                        .product-item {
                            display: flex;
                            flex-direction: column;
                            height: 100%;
                            max-height: 450px;
                            justify-content: space-between;
                            /* Giúp chia đều không gian cho các phần tử trong card */
                            border-radius: 10px;
                            overflow: hidden;
                            /* Đảm bảo không có phần tử tràn ra ngoài */
                            transition: transform 0.3s ease, box-shadow 0.3s ease;
                            background-color: white;
                            transition: transform 0.3s ease, box-shadow 0.3s ease;
                        }

                        .product-item:hover {
                            transform: translateY(-5px);
                            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
                        }


                        .discount-badge {
                            position: absolute;
                            top: 10px;
                            right: 10px;
                            background-color: red;
                            color: white;
                            padding: 5px 10px;
                            border-radius: 10px;
                            font-weight: bold;
                        }

                        .category-badge {
                            position: absolute;
                            top: 10px;
                            left: 10px;
                        }

                        /* Nút "Thêm vào giỏ hàng" */
                        .btnAddToCart {
                            background-color: #007bff;
                            color: white;
                            border-radius: 50px;
                            text-transform: uppercase;
                        }

                        .btnAddToCart:hover {
                            background-color: #0056b3;
                            color: white;
                        }

                        /* Đảm bảo chiều cao của mỗi sản phẩm liên quan luôn đồng đều */
                        .product-item {
                            display: flex;
                            flex-direction: column;
                            height: 100%;
                        }

                        .product-item .product-img {
                            height: 200px;
                            /* Đảm bảo tất cả ảnh đều có chiều cao bằng nhau */
                            overflow: hidden;
                            /* Đảm bảo ảnh không bị kéo dài ngoài giới hạn */
                            display: flex;
                            align-items: center;
                            justify-content: center;
                        }

                        .product-item .product-img img {
                            width: 100%;
                            object-fit: cover;
                            /* Đảm bảo ảnh chiếm toàn bộ không gian mà không bị méo */
                        }

                        .product-item .p-4 {
                            flex-grow: 1;
                            /* Lấp đầy không gian còn lại */
                        }

                        .product-item .btnAddToCart {
                            margin-top: auto;
                            /* Đảm bảo nút luôn ở cuối cùng trong card */
                        }

                        /* Đảm bảo văn bản mô tả sản phẩm (shortDesc) không quá dài */
                        .product-item .product-desc {
                            height: 40px;
                            /* Giới hạn chiều cao để đồng đều */
                            overflow: hidden;
                            /* Ẩn văn bản thừa nếu có */
                        }

                        /* Thiết lập để sản phẩm có cùng kích thước */
                        @media (min-width: 768px) {
                            .product-item {
                                max-width: 100%;
                            }
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

                    <div class="header-container">
                        <jsp:include page="../layout/header.jsp" />
                    </div>
                    <hr style="border: 2px solid #000;">




                    <!-- Single Product Start -->
                    <div class="container-fluid py-5 mt-5">
                        <div class="container py-5">
                            <div class="row g-4 mb-5">
                                <div>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Chi Tiết Sản Phẩm
                                            </li>
                                        </ol>
                                    </nav>
                                </div>
                                <div class="col-lg-8 col-xl-9">
                                    <div class="row g-4">
                                        <div class="col-lg-6">
                                            <div class="border rounded">
                                                <a href="#">
                                                    <img src="/images/product/${product.image}"
                                                        class="img-fluid rounded" alt="Image">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <h4 class="fw-bold mb-3"> ${product.name}</h4>
                                            <p class="mb-3">${product.factory}</p>
                                            <h5 class="fw-bold mb-3">
                                                <fmt:formatNumber type="number" value="${product.price}" /> đ

                                            </h5>
                                            <div class="d-flex mb-4">
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <p class="mb-4">
                                                ${product.shortDesc}
                                            </p>

                                            <div class="input-group quantity mb-5" style="width: 100px;">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                        <i class="fa fa-minus"></i>
                                                    </button>
                                                </div>
                                                <input type="text"
                                                    class="form-control form-control-sm text-center border-0" value="1"
                                                    data-cart-detail-index="0">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <!-- <form action="/add-product-from-view-detail" method="post"
                                                modelAttribute="product"> -->
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <input class="form-control d-none" type="text" value="${product.id}"
                                                name="id" />

                                            <input class="form-control d-none" type="text" name="quantity"
                                                id="cartDetails0.quantity" value="1" />
                                            <button data-product-id="${product.id}" onclick="openPopup()"
                                                class="btnAddToCartDetail btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary">
                                                <i class="fa fa-shopping-bag me-2" style="color: #6af32a"></i>
                                                Thêm vào giỏ
                                            </button>
                                            <!-- </form> -->

                                        </div>
                                        <div class="col-lg-12">
                                            <nav>
                                                <div class="nav nav-tabs mb-3">
                                                    <button class="nav-link active border-white border-bottom-0"
                                                        type="button" role="tab" id="nav-about-tab" data-bs-toggle="tab"
                                                        data-bs-target="#nav-about" aria-controls="nav-about"
                                                        aria-selected="true">Description</button>
                                                </div>
                                            </nav>
                                            <div class="tab-content mb-5">
                                                <div class="tab-pane active" id="nav-about" role="tabpanel"
                                                    aria-labelledby="nav-about-tab">
                                                    <p>
                                                        ${product.detailDesc}
                                                    </p>

                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-xl-3">
                                    <div class="row g-4 fruite">
                                        <div class="col-lg-12">

                                            <div class="mb-4">
                                                <h4>Categories</h4>
                                                <ul class="list-unstyled fruite-categorie">
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="#" style="color: black;">
                                                                <img src="/images/product/apple2.png" alt="Apple Logo"
                                                                    class="me-2">
                                                                Apple
                                                            </a>
                                                            <span>(3)</span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="#" style="color: black;">
                                                                <img src="/images/product/dell2.png" alt="Dell Logo"
                                                                    class="me-2">
                                                                Dell
                                                            </a>
                                                            <span>(3)</span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="#" style="color: black;">
                                                                <img src="/images/product/asus.png" alt="Asus Logo"
                                                                    class="me-2">
                                                                Asus
                                                            </a>
                                                            <span>(3)</span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="#" style="color: black;">
                                                                <img src="/images/product/acer2.png" alt="Acer Logo"
                                                                    class="me-2">
                                                                Acer
                                                            </a>
                                                            <span>(3)</span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="#" style="color: black;">
                                                                <img src="/images/product/lenovo1.png" alt="Lenovo Logo"
                                                                    class="me-2">
                                                                Lenovo
                                                            </a>
                                                            <span>(3)</span>
                                                        </div>
                                                    </li>
                                                </ul>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Related Products Start -->
                            <div class="container-fluid py-5">
                                <div class="container">
                                    <h4 class="fw-bold mb-4 text-center">Sản Phẩm Liên Quan</h4>
                                    <div class="row g-4">
                                        <c:forEach var="relatedProduct" items="${relatedProducts}">
                                            <div class="col-md-6 col-lg-4 col-xl-3">
                                                <div class="rounded position-relative product-item">
                                                    <div class="product-img">
                                                        <img src="/images/product/${relatedProduct.image}"
                                                            class="img-fluid w-100 rounded-top"
                                                            alt="${relatedProduct.name}">
                                                    </div>
                                                    <div class="discount-badge">
                                                        -20%
                                                    </div>
                                                    <div class="category-badge text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                        style="top: 10px; left: 10px;">Laptop</div>
                                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom d-flex flex-column justify-content-between"
                                                        style="height: 100%;">
                                                        <!-- Chiều cao của sản phẩm sẽ được điều chỉnh để đồng đều -->
                                                        <h4 class="product-name">
                                                            <a href="/product-detail/${relatedProduct.id}"
                                                                class="text-white">
                                                                ${relatedProduct.name}
                                                            </a>
                                                        </h4>
                                                        <p class="product-desc">${relatedProduct.shortDesc}</p>
                                                        <div class="d-flex flex-column justify-content-between mt-auto">
                                                            <p class="discount-price text-decoration-line-through">
                                                                <fmt:formatNumber type="number"
                                                                    value="${relatedProduct.price}" /> đ
                                                            </p>
                                                            <p class="text-dark fw-bold mb-3">
                                                                <fmt:formatNumber type="number"
                                                                    value="${relatedProduct.price * 0.8}" /> đ
                                                            </p>
                                                            <button data-product-id="${relatedProduct.id}"
                                                                class="btnAddToCart mx-auto btn rounded-pill px-3">
                                                                <i class="fa fa-shopping-bag me-2"
                                                                    style="color: #6af32a"></i> Thêm vào giỏ hàng
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>


                            <!-- Related Products End -->



                        </div>


                    </div>





                    <!-- Single Product End -->

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
                <!-- <script>
                    // Hàm mở popup
                    function openPopup() {
                        var modal = new bootstrap.Modal(document.getElementById('popupModal'));
                        modal.show();
                    }

                    // Hàm chọn chip (CPU)
                    const chips = document.querySelectorAll('.chip');
                    chips.forEach(chip => {
                        chip.addEventListener('click', function () {
                            // Xóa chọn tất cả chip
                            chips.forEach(c => c.classList.remove('selected'));
                            // Thêm chọn chip hiện tại
                            this.classList.add('selected');
                        });
                    });

                    // Hàm chọn RAM
                    const rams = document.querySelectorAll('.ram');
                    rams.forEach(ram => {
                        ram.addEventListener('click', function () {
                            // Xóa chọn tất cả RAM
                            rams.forEach(r => r.classList.remove('selected'));
                            // Thêm chọn RAM hiện tại
                            this.classList.add('selected');
                        });
                    });

                    // Hàm tăng số lượng
                    document.getElementById('increaseQty').addEventListener('click', function () {
                        var quantity = document.getElementById('quantity');
                        quantity.value = parseInt(quantity.value) + 1;
                    });

                    // Hàm giảm số lượng
                    document.getElementById('decreaseQty').addEventListener('click', function () {
                        var quantity = document.getElementById('quantity');
                        if (parseInt(quantity.value) > 1) {
                            quantity.value = parseInt(quantity.value) - 1;
                        }
                    });

                    // Xử lý thêm vào giỏ hàng
                    document.getElementById('addToCartBtn').addEventListener('click', function () {
                        var selectedChip = document.querySelector('.chip.selected');
                        var selectedRam = document.querySelector('.ram.selected');
                        if (!selectedChip || !selectedRam) {
                            alert('Vui lòng chọn chip và RAM!');
                            return;
                        }
                        var chipValue = selectedChip.dataset.value;
                        var ramValue = selectedRam.dataset.value;
                        var quantity = document.getElementById('quantity').value;
                        alert('Đã thêm vào giỏ hàng: Chip - ' + chipValue + ', RAM - ' + ramValue + ', Số lượng: ' + quantity);
                        // Đóng popup sau khi thêm vào giỏ hàng
                        var modal = bootstrap.Modal.getInstance(document.getElementById('popupModal'));
                        modal.hide();
                    });
                </script> -->