<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Promotion List" />
                <title>Promotion List</title>
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
                                <h1 class="mt-4">Danh sách khuyến mãi</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Tổng quan</a></li>
                                    <li class="breadcrumb-item active">Danh sách khuyến mãi</li>
                                </ol>
                                <form action="/searchPromotion" method="get" class="mb-4 float-end">
                                    <!-- float-end để đưa form sang bên phải -->
                                    <div class="input-group " style="width: 250px;">
                                        <!-- Đặt chiều rộng cụ thể cho form -->
                                        <input type="text" name="searchQuery" class="form-control form-control-sm"
                                            placeholder="Tìm kiếm" aria-label="Search">
                                        <button class="btn btn-outline-primary btn-sm" type="submit">Tìm</button>
                                    </div>
                                </form>

                                <div class="mt-5">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Tên khuyến mãi</th>

                                                <th>Sản phẩm</th>
                                                <th>Giá trị khuyến mãi (%)</th>
                                                <th>Ngày bắt đầu</th>
                                                <th>Ngày kết thúc</th>
                                                <th>Xử lí</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th>1</th>
                                                <th>Khuyến mãi tựu trường</th>
                                                <td>Laptop A</td>
                                                <td>20</td>
                                                <td>2024-09-01</td>
                                                <td>2024-09-30</td>
                                                <td>
                                                    <button class="btn btn-danger" data-bs-toggle="modal"
                                                        data-bs-target="#deleteModal3">Xóa </button>
                                                    <button class="btn btn-primary" data-bs-toggle="modal"
                                                        data-bs-target="#deleteModal3">Tạo </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>2</th>
                                                <th>Khuyến mãi tựu trường</th>
                                                <td>Laptop B</td>
                                                <td>15</td>
                                                <td>2024-09-10</td>
                                                <td>2024-10-10</td>
                                                <td>
                                                    <button class="btn btn-danger" data-bs-toggle="modal"
                                                        data-bs-target="#deleteModal3">Xóa </button>
                                                    <button class="btn btn-primary" data-bs-toggle="modal"
                                                        data-bs-target="#deleteModal3">Tạo </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>3</th>
                                                <th>Khuyến mãi tựu trường</th>
                                                <td>Laptop C</td>
                                                <td>10</td>
                                                <td>2024-09-15</td>
                                                <td>2024-09-25</td>
                                                <td>
                                                    <button class="btn btn-danger" data-bs-toggle="modal"
                                                        data-bs-target="#deleteModal3">Xóa </button>
                                                    <button class="btn btn-primary" data-bs-toggle="modal"
                                                        data-bs-target="#deleteModal3">Tạo </button>
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
                                <h5 class="modal-title" id="deleteModalLabel">Xác Nhận Xóa</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Bạn có chắc chắn muốn xóa khuyến mãi cho sản phẩm Laptop A không?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                <a href="/admin/promotion/delete/1" class="btn btn-danger">Xóa</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="deleteModal2" tabindex="-1" aria-labelledby="deleteModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteModalLabel"> Xóa Khuyến Mãi</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Bạn có chắc chắn muốn xóa khuyến mãi cho sản phẩm Laptop B không?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                <a href="/admin/promotion/delete/2" class="btn btn-danger">Xóa</a>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="deleteModal3" tabindex="-1" aria-labelledby="deleteModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteModalLabel">Xác Nhận Xóa</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Bạn có chắc chắn muốn xóa khuyến mãi cho sản phẩm Laptop C không?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                <a href="/admin/promotion/delete/3" class="btn btn-danger">Xóa</a>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>