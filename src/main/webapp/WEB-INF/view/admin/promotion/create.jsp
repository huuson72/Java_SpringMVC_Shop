<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                <meta name="author" content="Hỏi Dân IT" />
                <title>Tạo khuyến mãi</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Tạo khuyến mãi</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Tổng quan</a></li>
                                    <li class="breadcrumb-item active">Tạo khuyến mãi</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <form action="/admin/promotion/create" method="post">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h5>Thông tin khuyến mãi</h5>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="mb-3">
                                                            <label for="promotionName" class="form-label"><span
                                                                    style="color: red;">*</span> Tên khuyến
                                                                mãi</label>
                                                            <input type="text" class="form-control" id="promotionName"
                                                                name="promotionName" required />
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="productId" class="form-label"><span
                                                                    style="color: red;">*</span> Sản phẩm khuyến
                                                                mãi</label>
                                                            <select class="form-select" id="productId" name="productId"
                                                                required>
                                                                <option value="">Chọn sản phẩm</option>
                                                                <c:forEach var="product" items="${products}">
                                                                    <option value="${product.id}">${product.name}
                                                                    </option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="discountValue" class="form-label"><span
                                                                    style="color: red;">*</span> Giá trị Khuyến
                                                                Mãi
                                                                (%)</label>

                                                            <input type="number" class="form-control" id="discountValue"
                                                                name="discountValue" min="0" max="100" required />
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="startDate" class="form-label"><span
                                                                    style="color: red;">*</span> Ngày bắt
                                                                đầu</label>

                                                            <input type="date" class="form-control" id="startDate"
                                                                name="startDate" required />
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="endDate" class="form-label"><span
                                                                    style="color: red;">*</span> Ngày kết
                                                                thúc</label>
                                                            <input type="date" class="form-control" id="endDate"
                                                                name="endDate" required />
                                                        </div>
                                                    </div>
                                                    <span style="color: red;">* Các trường bắt buộc phải nhập</span>
                                                    <div class="card-footer">

                                                        <button type="submit" class="btn btn-primary">Tạo khuyến
                                                            mãi</button>
                                                        <a href="/admin" class="btn btn-secondary">Trở về</a>
                                                    </div>
                                                </div>
                                            </form>
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