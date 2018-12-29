<%@page import="Model.User"%>
<%@page import="DAO.UserDAO"%>
<%@page import="java.util.ArrayList"%>
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

<%
    ArrayList<User> userList = UserDAO.getAllUser();
%>

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
                        <th>Tên đăng nhập</th>
                        <th>Họ và tên</th>
                        <th>Email</th>
                        <th>Số điện thoại</th>
                        <th>Địa chỉ</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>

                    <% 
                            for (int i = 0; i < userList.size(); i++) {
                            User customer = new User();
                            customer = userList.get(i);
                        %>

                    <tr>
                        <td>
                            <%=customer.getId()%>
                        </td>
                        <td>
                            <%=customer.getUserName()%>
                        </td>
                        <td>
                            <%=customer.getFullname()%>
                        </td>
                        <td>
                            <%=customer.getEmail()%>
                        </td>
                        <td>
                            <%=customer.getPhoneNumber()%>
                        </td>
                        <td>
                            <%=customer.getAddress()%>
                        </td>
                        <td>
                            <form class="action-form" action="CustomerCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="edit">
                                <input type="hidden" name="id" value="<%=customer.getId()%>">
                                <button type="submit" class="action__button action__button--edit">
                                    <i class="fas fa-edit"></i>
                                </button>
                            </form>
                            <form class="action-form" action="CustomerCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<%=customer.getId()%>">
                                <button type="submit" class="action__button action__button--delete" onclick="return confirm('Bạn có chắc muốn xóa bản ghi này?')">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%
                          };
                      %>
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