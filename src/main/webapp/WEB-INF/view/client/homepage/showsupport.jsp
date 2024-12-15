<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Hỗ Trợ Khách Hàng</title>
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>

    <body>
        <jsp:include page="../layout/header.jsp" />

        <div class="container">
            <h1 class="mt-4">Hỗ Trợ Khách Hàng</h1>
            <div class="mt-4">
                <h2>Liên Hệ Chúng Tôi</h2>
                <p>Nếu bạn cần hỗ trợ, hãy liên hệ với chúng tôi qua:</p>
                <ul>
                    <li>Email: support@example.com</li>
                    <li>Điện Thoại: 0123-456-789</li>
                    <li>Giờ Làm Việc: Thứ Hai đến Thứ Sáu, 9:00 - 18:00</li>
                </ul>
            </div>

            <div class="mt-4">
                <h2>Câu Hỏi Thường Gặp (FAQs)</h2>
                <ul>
                    <li><strong>Câu hỏi 1:</strong> Làm thế nào để tôi đặt hàng?</li>
                    <li><strong>Trả lời:</strong> Bạn chỉ cần chọn sản phẩm và thêm vào giỏ hàng, sau đó làm theo hướng
                        dẫn để thanh toán.</li>

                    <li><strong>Câu hỏi 2:</strong> Tôi có thể trả hàng không?</li>
                    <li><strong>Trả lời:</strong> Có, bạn có thể trả hàng trong vòng 30 ngày sau khi nhận hàng, với điều
                        kiện sản phẩm chưa được sử dụng.</li>


                </ul>
            </div>

            <div class="mt-5">
                <h2>Gửi Yêu Cầu Hỗ Trợ</h2>
                <form action="/support/sendRequest" method="post">
                    <div class="mb-3">
                        <label for="userName" class="form-label">Tên của bạn:</label>
                        <input type="text" class="form-control" id="userName" name="userName" required>
                    </div>

                    <div class="mb-3">
                        <label for="userMessage" class="form-label">Nội dung yêu cầu:</label>
                        <textarea class="form-control" id="userMessage" name="userMessage" rows="4" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Gửi</button>
                </form>
            </div>
        </div>
    </body>

    </html>