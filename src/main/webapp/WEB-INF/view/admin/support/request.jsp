<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <title>Quản Lý Hỗ Trợ Khách Hàng</title>
            <link href="/css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <style>
                /* Thêm một số kiểu CSS cho form */
                .modal {
                    display: none;
                    position: fixed;
                    z-index: 1;
                    left: 0;
                    top: 0;
                    width: 100%;
                    height: 100%;
                    overflow: auto;
                    background-color: rgb(0, 0, 0);
                    background-color: rgba(0, 0, 0, 0.4);
                }

                .modal-content {
                    background-color: #fefefe;
                    margin: 15% auto;
                    padding: 20px;
                    border: 1px solid #888;
                    width: 80%;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <h1 class="mt-4">Quản Lý Hỗ Trợ Khách Hàng</h1>
                <h2 class="mt-4">Danh sách yêu cầu</h2>
                <div class="mt-5">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên Khách Hàng</th>
                                <th>Nội Dung</th>
                                <th>Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Dữ liệu tĩnh -->
                            <tr>
                                <td>1</td>
                                <td>Nguyễn Văn A</td>
                                <td>Cần hỗ trợ về sản phẩm A.</td>
                                <td>
                                    <button class="btn btn-primary" onclick="showReplyForm(1)">Trả Lời</button>
                                    <button class="btn btn-danger" onclick="confirmDelete(1)">Xóa</button>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Trần Thị B</td>
                                <td>Sản phẩm B không hoạt động.</td>
                                <td>
                                    <button class="btn btn-primary" onclick="showReplyForm(2)">Trả Lời</button>
                                    <button class="btn btn-danger" onclick="confirmDelete(2)">Xóa</button>
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Lê Văn C</td>
                                <td>Hỏi về bảo hành sản phẩm C.</td>
                                <td>
                                    <button class="btn btn-primary" onclick="showReplyForm(3)">Trả Lời</button>
                                    <button class="btn btn-danger" onclick="confirmDelete(3)">Xóa</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Thêm khoảng trống cho phân trang -->
                <br><br> <!-- Thêm hai thẻ <br> để tạo khoảng trống -->

                <!-- Form trả lời -->
                <div id="replyForm" class="modal">
                    <div class="modal-content">
                        <span class="close" onclick="closeReplyForm()">&times;</span>
                        <h2>Trả Lời Yêu Cầu</h2>
                        <form action="/admin/support/reply" method="post">
                            <input type="hidden" id="requestId" name="id">
                            <div class="mb-3">
                                <label for="replyContent" class="form-label">Nội Dung Trả Lời:</label>
                                <textarea class="form-control" id="replyContent" name="replyContent"
                                    required></textarea>
                            </div>
                            <button type="submit" class="btn btn-success">Gửi</button>
                            <button type="button" class="btn btn-secondary" onclick="closeReplyForm()">Hủy</button>
                        </form>
                    </div>
                </div>

                <!-- Thêm mã phân trang ở đây -->
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item active">
                            <a class="page-link" href="#">1</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">4</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">5</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- Kết thúc mã phân trang -->

                <!-- Form xác nhận xóa -->
                <div id="deleteConfirm" class="modal">
                    <div class="modal-content">
                        <span class="close" onclick="closeDeleteConfirm()">&times;</span>
                        <h2>Xóa yêu cầu</h2>
                        <p>Bạn có chắc chắn muốn xóa yêu cầu này không?</p>
                        <div class="d-flex justify-content-center" style="gap: 10px; margin-top: 20px;">
                            <button id="confirmDeleteBtn" class="btn btn-danger btn-sm">Xóa</button>
                            <button class="btn btn-secondary btn-sm" onclick="closeDeleteConfirm()">Hủy</button>
                        </div>
                    </div>
                </div>

                <script>
                    let deleteId = null;

                    function showReplyForm(id) {
                        document.getElementById('requestId').value = id;
                        document.getElementById('replyForm').style.display = 'block';
                    }

                    function closeReplyForm() {
                        document.getElementById('replyForm').style.display = 'none';
                    }

                    function confirmDelete(id) {
                        deleteId = id; // Lưu ID yêu cầu cần xóa
                        document.getElementById('deleteConfirm').style.display = 'block';
                    }

                    function closeDeleteConfirm() {
                        document.getElementById('deleteConfirm').style.display = 'none';
                        deleteId = null; // Reset ID
                    }

                    document.getElementById('confirmDeleteBtn').onclick = function () {
                        if (deleteId !== null) {
                            // Logic xóa yêu cầu, có thể redirect hoặc gửi yêu cầu AJAX
                            alert('Yêu cầu ' + deleteId + ' đã được xóa.');
                            closeDeleteConfirm();
                            // Ở đây có thể gọi một hàm AJAX để thực hiện xóa trên server
                        }
                    };
                </script>
            </div>
        </body>

        </html>