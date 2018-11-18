<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
    <title>Báo giá - Công ty In ấn Ao Sen đệ nhất photo</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Load normalize.css -->
    <link rel="stylesheet" href="src/lib/normalize.css">
    <!-- Load skeleton.css -->
    <link rel="stylesheet" href="src/lib/skeleton.css">
    <!-- Load fontawesome -->
    <link rel="stylesheet" href="src/lib/fontawesome/all.css">
    <!-- Load Owl Carousel theme -->
    <link rel="stylesheet" href="src/lib/owlcarousel/owl.carousel.min.css">
    <link rel="stylesheet" href="src/lib/owlcarousel/owl.theme.default.min.css">
    <!-- Load custom css -->
    <link rel="stylesheet" type="text/css" href="src/css/main.css">
</head>

<body data-page-name="pricing">
    <%-- HEADER --%>
    <%@ include file="src/includes/header.jsp" %>

    <%-- NAVIGATION --%>
    <%@ include file="src/includes/nav.jsp" %>

    <%-- CONTENT --%>
    <section class="section" id="">
        <div class="container">
            <h2 class="section__title">Báo giá</h2>

            <table id="pricing-table">
                <tr>
                    <th>Danh mục</th>
                    <th>Tên</th>
                    <th>Đơn vị</th>
                    <th>Giá</th>
                    <th>Ghi chú</th>
                </tr>
                <tr>
                    <td rowspan="4">Khổ giấy</td>
                    <td>A4</td>
                    <td rowspan="4">Tờ</td>
                    <td>1000đ</td>
                    <td></td>
                </tr>
                <tr>
                    <td>A3</td>
                    <td>2000đ</td>
                    <td></td>
                </tr>
            </table>
        </div>
    </section>

    <!-- FOOTER -->
    <%@ include file="src/includes/footer.jsp" %>

    <script src="src/lib/jquery-3.3.1.min.js"></script>
    <script src="src/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="src/js/main.js"></script>
</body>

</html>