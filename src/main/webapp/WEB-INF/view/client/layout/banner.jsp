<%@page contentType="text/html" pageEncoding="UTF-8" %>

    <style>
        /* Đặt chiều cao cố định cho cả hai phần */
        .hero-banner {
            height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            border-radius: 8px;
        }

        .hero-banner img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Carousel: đảm bảo các slide có chiều cao bằng nhau */
        .carousel-inner {
            height: 100%;
        }

        .carousel-item {
            height: 100%;
            position: relative;
        }

        .carousel-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Căn chỉnh nút ở giữa slide */
        .carousel-item a {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 10;
            background-color: #C0C0C0;
            padding: 15px 30px;
            /* Tăng kích thước padding */
            font-size: 18px;
            /* Tăng kích thước font chữ */
            font-weight: bold;
            /* Tăng độ đậm chữ */
            color: white;
            border-radius: 8px;
            /* Làm nút bo góc đẹp hơn */
            text-decoration: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            /* Hiệu ứng đổ bóng */
            text-align: center;
        }

        .carousel-item a:hover {
            background-color: #A0A0A0;
            /* Thêm hiệu ứng hover */
        }

        /* Nút next/previous */
        .carousel-control-prev-icon,
        .carousel-control-next-icon {
            filter: invert(100%);
        }

        .carousel-control-prev,
        .carousel-control-next {
            width: 40px;
            height: 40px;
            background: none;
            border: none;
            outline: none;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .carousel-control-prev:hover,
        .carousel-control-next:hover {
            background: rgba(0, 0, 0, 0.2);
            border-radius: 50%;
        }
    </style>

    <div class="container-fluid py-5 mb-5 hero-header">
        <div class="container py-5">
            <div class="row g-5 align-items-center">
                <!-- Phần bên trái: Banner hình ảnh -->
                <div class="col-md-12 col-lg-6">
                    <div class="hero-banner">
                        <img src="/client/img/banner_0.jpg" alt="Main Banner">
                    </div>
                </div>

                <!-- Phần bên phải: Carousel -->
                <div class="col-md-12 col-lg-6">
                    <div class="hero-banner">
                        <div id="carouselId" class="carousel slide w-100 h-100" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="/client/img/banner_1.jpg" alt="First slide">
                                    <a href="#">Gaming</a>
                                </div>
                                <div class="carousel-item">
                                    <img src="/client/img/banner_2.png" alt="Second slide">
                                    <a href="#">Laptop</a>
                                </div>
                                <div class="carousel-item">
                                    <img src="/client/img/banner3.png" alt="Third slide">
                                    <a href="#">Phụ kiện</a>
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselId"
                                data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselId"
                                data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>