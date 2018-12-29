<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
    <title>Quản lý tài khoản khách hàng - Công ty In ấn Ao Sen đệ nhất photo</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Load normalize.css -->
    <link rel="stylesheet" href="src/lib/normalize.css">
    <!-- Load skeleton.css -->
    <link rel="stylesheet" href="src/lib/skeleton.css">
    <!-- Load fontawesome -->
    <link rel="stylesheet" href="src/lib/fontawesome/all.css">
    <!-- Load custom css -->
    <link rel="stylesheet" type="text/css" href="src/css/admin-main.css">
</head>

<body data-page-name="manage-customer">
    <%-- HEADER --%>
    <%@ include file="includes/admin-header.jsp" %>

    <%-- NAVIGATION --%>
    <jsp:include page="/includes/admin-nav.jsp" />

    <%-- CONTENT --%>

    <main class="main-content container" id="main-content">
        <h2 class="main-content__title">Quản lý tài khoản khách hàng</h2>

        <section class="section">
            <button class="action__button action__button--add" onclick="location.href='add-customer.jsp'">
                <i class="fas fa-plus"></i>&nbsp;Thêm tài khoản khách hàng mới
            </button>

            <div class="row">
                <%
                    if ("add-customer".equalsIgnoreCase((String)request.getAttribute("action")) && "success".equalsIgnoreCase((String)request.getAttribute("status"))) {
                %>
                <div class="message_div">
                    <div class="dialog__container dialog__container--success">
                        <div class="dialog__dismiss-button dialog__dismiss-button--success js-dialogDismissButton">
                            <i class="fas fa-times"></i>
                        </div>
                        <div class="dialog__content">
                            <p>Thêm tài khoản khách hàng mới thành công!</p>
                        </div>
                    </div>
                </div>
                <%  
                    }    
                %>
            </div>
        </section>

        <section class="section">
            <h3 class="main-content__sub-title">Thống kê tài khoản khách hàng</h3>
            
            <div class="row">
                <%
                    if ("edit-customer".equalsIgnoreCase((String)request.getAttribute("action")) && "success".equalsIgnoreCase((String)request.getAttribute("status"))) {
                %>
                <div class="message_div">
                    <div class="dialog__container dialog__container--success">
                        <div class="dialog__dismiss-button dialog__dismiss-button--success js-dialogDismissButton">
                            <i class="fas fa-times"></i>
                        </div>
                        <div class="dialog__content">
                            <p>Cập nhật tài khoản khách hàng thành công!</p>
                        </div>
                    </div>
                </div>
                <%  
                    }
                %>
                <%
                    if ("delete-customer".equalsIgnoreCase((String)request.getAttribute("action")) && "success".equalsIgnoreCase((String)request.getAttribute("status"))) {
                %>
                <div class="message_div">
                    <div class="dialog__container dialog__container--success">
                        <div class="dialog__dismiss-button dialog__dismiss-button--success js-dialogDismissButton">
                            <i class="fas fa-times"></i>
                        </div>
                        <div class="dialog__content">
                            <p>Xóa tài khoản khách hàng thành công!</p>
                        </div>
                    </div>
                </div>
                <%  
                    }
                %>
            </div>

            <table class="crud-table" id="all-customers">
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Họ và tên</th>
                        <th>Email</th>
                        <th>Số điện thoại</th>
                        <th>Địa chỉ</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <button class="action__button action__button--view">
                                <i class="fas fa-eye"></i>
                            </button>
                            <button class="action__button action__button--edit" onclick="location.href='edit-customer.jsp'">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="action__button action__button--delete">
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </section>
    </main>

    <!-- FOOTER -->
    <%@ include file="includes/admin-footer.jsp" %>

    <script src="src/lib/jquery-3.3.1.min.js"></script>
    <script src="src/js/main.js"></script>

</body>

</html>