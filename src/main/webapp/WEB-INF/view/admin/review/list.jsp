<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Sản phẩm Review Management" />
                <title>Quản lí đánh giá sản phẩm</title>
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
                                <h1 class="mt-4">Quản lí đánh giá sản phẩm</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin"
                                            style="color: black;text-decoration: none;">Tổng quan </a></li>
                                    <li class="breadcrumb-item active">Đánh giá sản phẩm của khách hàng</li>
                                </ol>
                                <div class="mt-5">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Sản phẩm</th>
                                                <th>Người đánh giá</th>
                                                <th>Đánh giá</th>
                                                <th>Nhận xét</th>
                                                <th>Xử lí</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th>1</th>
                                                <td>Laptop A</td>
                                                <td>Hữu Sơn</td>
                                                <td>5</td>
                                                <td>Sản phẩm tốt</td>
                                                <td>
                                                    <button class="btn btn-danger" data-bs-toggle="modal"
                                                        data-bs-target="#deleteModal1">Xóa</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>2</th>
                                                <td>Laptop B</td>
                                                <td>Jane Smith</td>
                                                <td>4</td>
                                                <td>Very good performance.</td>
                                                <td>
                                                    <button class="btn btn-danger" data-bs-toggle="modal"
                                                        data-bs-target="#deleteModal2">Xóa</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>3</th>
                                                <td>Laptop C</td>
                                                <td>Mike Johnson</td>
                                                <td>3</td>
                                                <td>Average quality.</td>
                                                <td>
                                                    <button class="btn btn-danger" data-bs-toggle="modal"
                                                        data-bs-target="#deleteModal3">Xóa</button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>

                <!-- Modal for Delete Confirmation -->
                <div class="modal fade" id="deleteModal1" tabindex="-1" aria-labelledby="deleteModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteModalLabel">Xác Nhận Xóa Đánh Giá</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Bạn có chắc chắn muốn xóa đánh giá của John Doe cho sản phẩm Laptop A không?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                <a href="/admin/review/delete/1" class="btn btn-danger">Xóa</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="deleteModal2" tabindex="-1" aria-labelledby="deleteModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteModalLabel">Xác Nhận Xóa Đánh Giá</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Bạn có chắc chắn muốn xóa đánh giá của Jane Smith cho sản phẩm Laptop B không?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                <a href="/admin/review/delete/2" class="btn btn-danger">Xóa</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="deleteModal3" tabindex="-1" aria-labelledby="deleteModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteModalLabel">Xác Nhận Xóa Đánh Giá</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Bạn có chắc chắn muốn xóa đánh giá của Mike Johnson cho sản phẩm Laptop C không?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                <a href="/admin/review/delete/3" class="btn btn-danger">Xóa</a>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>