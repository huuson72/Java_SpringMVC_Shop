<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <jsp:include page="../layout/header.jsp" />

        <head>

            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
            <meta name="author" content="Hỏi Dân IT" />
            <title>Finance Hstore</title>
            <link href="/css/styles.css" rel="stylesheet" />
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        </head>

        <div class="container mt-5 pt-5">
            <h2 class="text-center mb-4">Báo Cáo Tài Chính</h2>

            <div class="row">
                <div class="col-md-12">
                    <h4 class="mb-3">Tạo Báo Cáo</h4>

                    <form method="POST" action="generateReport">
                        <div class="form-group mb-3">
                            <label for="reportType">Loại Báo Cáo</label>
                            <select class="form-control" id="reportType" name="reportType">
                                <option value="monthly">Theo Tháng</option>
                                <option value="quarterly">Theo Quý</option>
                                <option value="yearly">Theo Năm</option>
                            </select>
                        </div>

                        <div class="form-group mb-3">
                            <label for="reportFormat">Định Dạng Báo Cáo</label>
                            <select class="form-control" id="reportFormat" name="reportFormat">
                                <option value="csv">CSV</option>
                                <option value="excel">Excel</option>
                                <option value="pdf">PDF</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary">Tạo Báo Cáo</button>
                        <button type="submit" class="btn btn-danger">Hủy</button>
                    </form>
                </div>
            </div>
        </div>