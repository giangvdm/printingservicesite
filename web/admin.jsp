<%@page import="Model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
    <title>Trang Quản lý - Công ty In ấn Ao Sen đệ nhất photo</title>
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

    <%
        if (session.getAttribute("loggedIn") == null) {
            response.sendRedirect("login.jsp");
        }
    %>
<body data-page-name="home">
    <%-- HEADER --%>
    <%@ include file="includes/header.jsp" %>

    <%-- NAVIGATION --%>
    <jsp:include page="/includes/nav.jsp" />
    <jsp:include page="/UserServlet" />
    <%-- CONTENT --%>
    <main class="main-content container" id="main-content">
        <h2 class="main-content__title">Trang chủ</h2>
            <%
                ArrayList<User> userList = (ArrayList<User>)request.getAttribute("userList");
            %>
        <table>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Họ tên</th>
                    <th>Tên đăng nhập</th>
                    <th>Số điện thoại</th>
                    <th>Email</th>
                    <th>Địa chỉ</th>
                </tr>
            </thead>
            <tbody>
                <% for(int i = 0; i < userList.size(); i++) {
                    User customer = new User();
                    customer = userList.get(i);
                %>


                <tr>
                    <td><%=customer.getId()%></td>
                    <td><%=customer.getFullname()%></td>
                    <td><%=customer.getUserName()%></td>
                    <td><%=customer.getPhoneNumber()%></td>
                    <td><%=customer.getEmail()%></td>
                    <td><%=customer.getAddress()%></td>
                   </tr>
                <%
                };
                %>
            </tbody>
        </table>

    </main>

    <!-- FOOTER -->
    <%@ include file="includes/footer.jsp" %>

    <script src="src/lib/jquery-3.3.1.min.js"></script>
    <script>
            $(document).ready(function () {
            _self.usernameInput.change(function () {
                    // console.log("Preparing...");
                    $.ajax({
                        method: "POST",
                        url: "UserServlet",
                        data: "username=" + username,
                        success: function (msg) {
                            $(document).ajaxComplete(function (event, request, settings) {
                                if (msg == "invalid") {
                                    _self.usernameValidityDisplay.html("Tên đăng nhập đã tồn tại!");
                                    _self.usernameInput.get(0).setCustomValidity("Hãy chọn một tên đăng nhập khác."); // call get(0) to cast jQuery object to JavaScript in order to use JS setCustomValidity method
                                }
                                else {
                                    _self.usernameValidityDisplay.html("Tên đăng nhập khả dụng!");
                                    _self.usernameInput.get(0).setCustomValidity('');
                                }
                                // console.log(msg);
                            });
                        }
                    });
        });
    </script>

</body>

</html>