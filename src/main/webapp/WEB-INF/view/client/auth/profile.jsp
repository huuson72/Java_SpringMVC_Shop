<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <jsp:include page="../layout/header.jsp" />

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
                .page-link.disabled {
                    color: var(--bs-pagination-disabled-color);
                    pointer-events: none;
                    background-color: var(--bs-pagination-disabled-bg);
                }
            </style>
        </head>
        <div class="container mt-5 pt-5">
            <h2 class="text-center mb-4">Quản Lý Thông Tin Cá Nhân</h2>
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <form action="/updateProfile" method="post" class="bg-light p-4 rounded shadow-sm">
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email"
                                value="${sessionScope.email}" required>
                        </div>
                        <div class="mb-3">
                            <label for="fullName" class="form-label">Tên</label>
                            <input type="text" class="form-control" id="fullName" name="fullName"
                                value="${sessionScope.fullName}" required>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Số Điện Thoại</label>
                            <input type="tel" class="form-control" id="phone" name="phone" value="${sessionScope.phone}"
                                required>
                        </div>

                        <button type="submit" class="btn btn-primary">Cập Nhật Thông Tin</button>
                    </form>
                </div>
            </div>
        </div>

        <jsp:include page="../layout/footer.jsp" />