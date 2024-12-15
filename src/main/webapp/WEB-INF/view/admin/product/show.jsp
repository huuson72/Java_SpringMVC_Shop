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
                <title>Tổng quan - Hỏi Dân IT</title>
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
                                <h1 class="mt-4">Quản lí sản phẩm</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Tổng quan</a></li>
                                    <li class="breadcrumb-item active">Sản phẩm</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <h3>Danh sách sản phẩm</h3>

                                                <form class="d-flex" action="/admin/product/search" method="get">
                                                    <input class="form-control me-2" type="search" name="keyword"
                                                        placeholder="Tìm sản phẩm" aria-label="Search">
                                                    <!-- Tìm kiếm theo các tiêu chí -->
                                                    <select class="form-select me-2" name="searchOption">
                                                        <option value="">Tìm kiếm theo...</option>
                                                        <!-- Tìm kiếm theo tên -->
                                                        <optgroup label="Tên sản phẩm">
                                                            <option value="name_harry">Sản phẩm tên 'Harry'</option>
                                                            <option value="name_macbook">Sản phẩm tên 'Macbook'</option>
                                                        </optgroup>

                                                        <!-- Tìm kiếm theo giá -->
                                                        <optgroup label="Giá">
                                                            <option value="price_0-500000">Dưới 500,000 VND</option>
                                                            <option value="price_500000-1000000">500,000 - 1,000,000 VND
                                                            </option>
                                                            <option value="price_1000000-5000000">1,000,000 - 5,000,000
                                                                VND</option>
                                                            <option value="price_5000000">Trên 5,000,000 VND</option>
                                                        </optgroup>

                                                        <!-- Tìm kiếm theo hãng -->
                                                        <optgroup label="Hãng sản xuất">
                                                            <c:forEach var="factory" items="${factories}">
                                                                <option value="factory_${factory}">Hãng: ${factory}
                                                                </option>
                                                            </c:forEach>
                                                        </optgroup>
                                                    </select>
                                                    <button class="btn btn-outline-success" type="submit">Tìm</button>
                                                </form>
                                                <a href="/admin/product/create" class="btn btn-primary">Tạo sản phẩm</a>
                                            </div>

                                            <hr />
                                            <table class=" table table-bordered table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Tên sản phẩm</th>
                                                        <th>Giá</th>
                                                        <th>Nhà sản xuất</th>
                                                        <th>Xử lí</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="product" items="${products}">
                                                        <tr>
                                                            <th>${product.id}</th>
                                                            <td>${product.name}</td>
                                                            <td>
                                                                <fmt:formatNumber type="number"
                                                                    value="${product.price}" /> đ
                                                            </td>
                                                            <td>${product.factory}</td>
                                                            <td>
                                                                <a href="/admin/product/${product.id}"
                                                                    class="btn btn-success">Xem</a>
                                                                <a href="/admin/product/update/${product.id}"
                                                                    class="btn btn-warning  mx-2">Cập nhật</a>
                                                                <a href="/admin/product/delete/${product.id}"
                                                                    class="btn btn-danger">Xóa</a>
                                                            </td>
                                                        </tr>

                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination justify-content-center">
                                                    <li class="page-item">
                                                        <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                            href="/admin/product?page=${currentPage - 1}"
                                                            aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                        </a>
                                                    </li>
                                                    <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                                        <li class="page-item">
                                                            <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                                                href="/admin/product?page=${loop.index + 1}">
                                                                ${loop.index + 1}
                                                            </a>
                                                        </li>
                                                    </c:forEach>
                                                    <li class="page-item">
                                                        <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                            href="/admin/product?page=${currentPage + 1}"
                                                            aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </nav>
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