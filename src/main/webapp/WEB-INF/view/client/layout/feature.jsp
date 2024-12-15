<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <head>
            <style>
                .features {
                    display: flex;
                    flex-wrap: wrap;
                    justify-content: center;
                }

                .features .features-item {
                    display: flex;
                    flex-direction: column;
                    justify-content: space-between;
                    height: 130px;
                    /* Ensures the height is flexible and equal */
                }

                .features .features-item {
                    min-height: 150px;
                    /* Optional: sets a minimum height */
                    padding: 20px;
                    border-radius: 8px;
                    background-color: #f8f9fa;
                    /* Matches the light background */
                    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                    /* Adds a subtle shadow */
                }

                .features .features-icon {
                    height: 80px;
                    /* Ensures icon container size consistency */
                    width: 80px;
                }
            </style>
        </head>
        <!-- Features Section Start -->
        <!-- Features Section Start -->
        <div class="container-fluid features py-5">
            <div class="container py-5">
                <div class="row g-4 text-center">
                    <div class="col-md-6 col-lg-3">
                        <div class="features-item bg-light p-4 rounded h-100">
                            <div
                                class="features-icon btn-square bg-white rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center">
                                <i class="fas fa-shield-alt fa-3x text-danger"></i>
                            </div>
                            <h5>Thương hiệu đảm bảo</h5>
                            <p class="mb-0">Nhập khẩu, bảo hành chính hãng</p>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="features-item bg-light p-4 rounded h-100">
                            <div
                                class="features-icon btn-square bg-white rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center">
                                <i class="fas fa-exchange-alt fa-3x text-danger"></i>
                            </div>
                            <h5>Đổi trả dễ dàng</h5>
                            <p class="mb-0">Theo chính sách đổi trả tại FPT Shop</p>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="features-item bg-light p-4 rounded h-100">
                            <div
                                class="features-icon btn-square bg-white rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center">
                                <i class="fas fa-tools fa-3x text-danger"></i>
                            </div>
                            <h5>Sản phẩm chất lượng</h5>
                            <p class="mb-0">Đảm bảo tương thích và độ bền cao</p>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="features-item bg-light p-4 rounded h-100">
                            <div
                                class="features-icon btn-square bg-white rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center">
                                <i class="fas fa-shipping-fast fa-3x text-danger"></i>
                            </div>
                            <h5>Giao hàng tận nơi</h5>
                            <p class="mb-0">Tại 63 tỉnh thành</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Features Section End -->