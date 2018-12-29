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

        <table class="pricing-table" id="pricing-table">
            <thead>
                <tr>
                    <th>Danh mục</th>
                    <th>Nội dung</th>
                    <th>Đơn vị</th>
                    <th>Giá</th>
                    <th>Ghi chú</th>
                </tr>
            </thead>
            <tbody>
                <!-- Paper size -->
                <tr>
                    <td rowspan="6" class="pricing-table__label">Khổ giấy</td>
                    <td>A5</td>
                    <td rowspan="6" class="pricing-table__unit">Tờ</td>
                    <td>x1</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="theme__not-first--cell">A4</td>
                    <td>x1.5</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="theme__not-first--cell">A3</td>
                    <td>x2</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="theme__not-first--cell">A2</td>
                    <td>x3</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="theme__not-first--cell">A1</td>
                    <td>x4</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="theme__not-first--cell">A0</td>
                    <td>x5</td>
                    <td></td>
                </tr>

                <!-- Paper quality -->
                <tr>
                    <td rowspan="4" class="pricing-table__label">Chất liệu ruột</td>
                    <td>Bãi bằng 60</td>
                    <td rowspan="4" class="pricing-table__unit">Tờ</td>
                    <td>1000đ</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="theme__not-first--cell">Bãi bằng 70</td>
                    <td>2000đ</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="theme__not-first--cell">Offset 60</td>
                    <td>3000đ</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="theme__not-first--cell">Offset 70</td>
                    <td>4000đ</td>
                    <td></td>
                </tr>

                <!-- Bookbinding method -->
                <tr>
                    <td rowspan="3" class="pricing-table__label">Quy cách đóng quyển</td>
                    <td>Gáy xoắn</td>
                    <td rowspan="3" class="pricing-table__unit">Quyển</td>
                    <td>5000đ</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="theme__not-first--cell">Gáy khâu</td>
                    <td>3000đ</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="theme__not-first--cell">Phay keo</td>
                    <td>2000đ</td>
                    <td></td>
                </tr>

                <!-- Cover quality -->
                <tr>
                    <td rowspan="4" class="pricing-table__label">Chất liệu bìa</td>
                    <td>Couches 150</td>
                    <td rowspan="4" class="pricing-table__unit">Tờ</td>
                    <td>1000đ</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="theme__not-first--cell">Couches 200</td>
                    <td>2000đ</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="theme__not-first--cell">Couches 250</td>
                    <td>3000đ</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="theme__not-first--cell">Couches 300</td>
                    <td>4000đ</td>
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