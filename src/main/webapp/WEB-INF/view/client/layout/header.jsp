<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="/" class="navbar-brand">
                        <img src="/client/img/logo.png" alt="Logo"
                            style="height: 60px; margin-right: 10px; border-radius: 50px;">
                    </a>

                    <a href="/" class="navbar-brand">

                        <h1 class="text-dark display-6">HStore</h1>

                    </a>


                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white justify-content-between mx-4" id="navbarCollapse">
                        <div class="navbar-nav d-flex align-items-center">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    Danh Mục
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <c:forEach items="${factories}" var="category">
                                        <li><a class="dropdown-item" href="/category/${category}">${category}</a></li>
                                    </c:forEach>
                                </ul>
                            </li>




                            <a href="/products" class="nav-item nav-link text-nowrap">Sản Phẩm</a>



                        </div>
                        <form class="d-flex custom-search-form" method="get" action="/search">
                            <input class="custom-search-input me-2" type="search" placeholder="Bạn muốn mua gì?"
                                name="query">
                            <button class="btn custom-search-button" type="submit">
                                <i class="fa fa-search"></i>
                            </button>
                        </form>

                        <div class="d-flex m-3 me-0">
                            <c:if test="${not empty pageContext.request.userPrincipal}">
                                <!-- Giỏ hàng -->
                                <a href="/cart" class="cart-button d-flex align-items-center position-relative me-4">
                                    <div class="custom-icon-border position-relative">
                                        <i class="fa fa-shopping-cart fa-lg text-white"></i>
                                        <!-- Số lượng sản phẩm -->
                                        <span
                                            class="position-absolute bg-danger rounded-circle d-flex align-items-center justify-content-center text-white"
                                            style="top: -5px; right: -5px; height: 20px; min-width: 20px;" id="sumCart">
                                            ${sessionScope.sum}
                                        </span>
                                    </div>
                                    <span class="cart-label ms-2">Giỏ hàng</span>
                                </a>


                                <!-- Tài khoản -->
                                <div class="dropdown my-auto">
                                    <a href="#" class="account-icon-border" role="button" id="dropdownMenuLink"
                                        data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="fas fa-user fa-lg"></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end p-4" aria-labelledby="dropdownMenuLink">
                                        <li class="d-flex align-items-center flex-column" style="min-width: 300px;">
                                            <img style="width: 150px; height: 150px; border-radius: 50%; overflow: hidden;"
                                                src="/images/avatar/${sessionScope.avatar}" />
                                            <div class="text-center my-3">
                                                <c:out value="${sessionScope.fullName}" />
                                            </div>
                                        </li>
                                        <li><a class="dropdown-item" href="/profile">Quản lý tài khoản</a></li>
                                        <li><a class="dropdown-item" href="/order-history">Lịch sử mua hàng</a></li>
                                        <li><a class="dropdown-item" href="/user/changepass">Đổi mật khẩu</a></li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li>
                                            <form method="post" action="/logout">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <button class="dropdown-item">Đăng xuất</button>
                                            </form>
                                        </li>
                                    </ul>
                                </div>
                            </c:if>
                            <c:if test="${empty pageContext.request.userPrincipal}">
                                <a href="/login" class="custom-icon position-relative me-4 my-auto">
                                    Đăng nhập
                                </a>
                            </c:if>
                        </div>

                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->