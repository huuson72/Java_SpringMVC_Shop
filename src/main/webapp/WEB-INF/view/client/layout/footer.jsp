<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!-- Footer Start -->
        <div class="container-fluid footer bg-dark text-white pt-5">
            <div class="container">
                <!-- Row for Logo and Description -->
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="footer-logo">
                            <a href="/" class="text-decoration-none">
                                <h2 class="text-primary">HStore</h2>
                                <p class="text-light">Your premium laptop store</p>
                            </a>
                        </div>
                    </div>
                    <!-- Quick Links Section -->
                    <div class="col-lg-2 col-md-6">
                        <h5 class="text-light">Quick Links</h5>
                        <ul class="list-unstyled">
                            <li><a href="#" class="text-light hover-effect">About Us</a></li>
                            <li><a href="#" class="text-light hover-effect">Shop</a></li>
                            <li><a href="#" class="text-light hover-effect">Contact</a></li>
                            <li><a href="#" class="text-light hover-effect">FAQs</a></li>
                        </ul>
                    </div>
                    <!-- Customer Support Section -->
                    <div class="col-lg-2 col-md-6">
                        <h5 class="text-light">Customer Support</h5>
                        <ul class="list-unstyled">
                            <li><a href="#" class="text-light hover-effect">Track Order</a></li>
                            <li><a href="#" class="text-light hover-effect">Return Policy</a></li>
                            <li><a href="#" class="text-light hover-effect">Shipping Info</a></li>
                            <li><a href="#" class="text-light hover-effect">Warranty</a></li>
                        </ul>
                    </div>
                    <!-- Social Media Section -->
                    <div class="col-lg-4 col-md-6">
                        <h5 class="text-light">Follow Us</h5>
                        <div class="social-links">
                            <a href="https://facebook.com" target="_blank" class="text-light me-3 hover-effect">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a href="https://twitter.com" target="_blank" class="text-light me-3 hover-effect">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a href="https://instagram.com" target="_blank" class="text-light me-3 hover-effect">
                                <i class="fab fa-instagram"></i>
                            </a>
                            <a href="https://linkedin.com" target="_blank" class="text-light hover-effect">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Footer Bottom -->
                <div class="row mt-4 pt-4 border-top border-light">
                    <div class="col-md-6 text-center text-md-start">
                        <span class="text-light">&copy; 2024 HStore, All Rights Reserved</span>
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                        <span class="text-light">Made with ❤️ by HStore Team</span>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->

        <!-- Add Font Awesome for Icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

        <style>
            /* Footer general style */
            .footer {
                background-color: #232323;
                /* Dark background */
                color: #fff;
            }

            /* Footer links and hover effects */
            .hover-effect:hover {
                color: #FFD700 !important;
                /* Gold color for hover effect */
                text-decoration: none;
            }

            /* Social media icons */
            .social-links a {
                font-size: 24px;
                transition: transform 0.3s ease;
            }

            .social-links a:hover {
                transform: scale(1.2);
                /* Slightly enlarge icons */
            }

            /* Footer Bottom */
            .footer .border-top {
                border-top: 1px solid #444;
                /* Lighter border at the top */
            }

            /* Footer headings */
            .footer h5 {
                font-weight: bold;
            }

            /* Logo style */
            .footer-logo h2 {
                font-family: 'Roboto', sans-serif;
                font-weight: 700;
            }
        </style>