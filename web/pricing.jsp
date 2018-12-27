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
    <!-- Load custom css -->
    <link rel="stylesheet" type="text/css" href="src/css/main.css">
</head>

<body data-page-name="pricing">
    <%-- HEADER --%>
    <%@ include file="/includes/customer-header.jsp" %>

    <%-- NAVIGATION --%>
    <jsp:include page="/includes/customer-nav.jsp" />

    <%-- CONTENT --%>
    <main class="main-content container" id="main-content">
        <h2 class="main-content__title">Báo giá</h2>

        <table id="pricing-table">
            <thead>
                <tr>
                    <th>Danh mục</th>
                    <th>Tên</th>
                    <th>Đơn vị</th>
                    <th>Giá</th>
                    <th>Ghi chú</th>
                </tr>
            </thead>
            <tbody>
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
            </tbody>
        </table>
    </main>

    <!-- FOOTER -->
    <%@ include file="/includes/customer-footer.jsp" %>

    <script src="src/lib/jquery-3.3.1.min.js"></script>
    <script src="src/js/main.js"></script>
</body>

</html>