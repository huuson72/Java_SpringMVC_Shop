<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <jsp:include page="../layout/header.jsp" />

        <head>
            <meta charset="utf-8">
            <title>Đổi Thông Tin Cá Nhân - Laptopshop</title>
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
        </head>

        <div class="container mt-5 pt-5">
            <h2 class="text-center mb-4">Đổi Thông Tin Cá Nhân</h2>
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <!-- Hiển thị thông báo thành công -->
                    <c:if test="${not empty message}">
                        <div class="alert alert-success" role="alert">
                            <i class="fas fa-check-circle"></i> ${message}
                        </div>
                    </c:if>
                    <!-- Hiển thị thông báo lỗi -->
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger" role="alert">
                            <i class="fas fa-exclamation-circle"></i> ${error}
                        </div>
                    </c:if>

                    <!-- Form đổi thông tin -->
                    <form action="/user/changeinfo" method="post" class="bg-light p-4 rounded shadow-sm">
                        <input type="hidden" name="_csrf" value="${_csrf.token}" />

                        <div class="mb-3">
                            <label for="fullName" class="form-label">Họ và Tên</label>
                            <input type="text" class="form-control" id="fullName" name="fullName"
                                value="${userDTO.fullName}" required>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Số Điện Thoại</label>
                            <input type="text" class="form-control" id="phone" name="phone" value="${userDTO.phone}"
                                required>
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">Địa Chỉ</label>
                            <input type="text" class="form-control" id="address" name="address"
                                value="${userDTO.address}" required>
                        </div>

                        <button type="submit" class="btn btn-primary">Cập Nhật Thông Tin</button>
                    </form>

                </div>
            </div>
        </div>

        <jsp:include page="../layout/footer.jsp" />