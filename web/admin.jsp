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
    <link rel="stylesheet" type="text/css" href="src/css/admin-main.css">
</head>

    <%
        if (session.getAttribute("loggedIn") == null) {
            response.sendRedirect("login.jsp");
        }
    %>
<body data-page-name="home">
    <!-- Not logged in -->
    <%
        if(session.getAttribute("loggedIn") == null) {
    %>
    <main class="main-content container">
        <%-- LOGIN FORM --%>
        <section class="section">
            <h1 class="main-content__title">Đăng nhập Quản trị viên</h1>

            <div class="row">
                <%
                    if("error".equalsIgnoreCase((String)request.getAttribute("status"))){
                %>
                <div class="message_div">
                    <div class="dialog__container dialog__container--error">
                        <div class="dialog__dismiss-button dialog__dismiss-button-error js-dialogDismissButton">
                            <i class="fas fa-times"></i>
                        </div>
                        <div class="dialog__content">
                            <p>Tên đăng nhập hoặc mật khẩu không chính xác</p>
                        </div>
                    </div>
                </div>
                <%  
                    }    
                %>

            </div>

            <form action="LoginServlet" method="POST" class="form" id="login-form">
                <input type="hidden" name="user-type" value="admin">
                <fieldset>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label" for="username">Tên tài khoản</label>
                        </div>
                        <div class="seven columns">
                            <input type="text" id="username" name="username" required>
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label" for="password">Mật khẩu</label>
                        </div>
                        <div class="seven columns">
                            <input type="password" id="password" name="password" required>
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label" for="remember-login">Ghi nhớ đăng nhập</label>
                        </div>
                        <div class="seven columns">
                            <input type="checkbox" id="remember-login">
                        </div>
                    </div>
                </fieldset>
                <div class="row form__line-wrapper">
                    <div class="six columns form__button-container">
                        <input class="form__button form__button--submit" type="submit" value="Đăng nhập" id="submit-button">
                    </div>
                    <div class="six columns form__button-container">
                        <input class="form__button form__button--reset" type="reset" value="Điền lại" id="reset-button">
                    </div>
                </div>
            </form>
        </section>

    </main>
    <%
        }
    %>

    <!-- User logged in -->
    <%
        if(session.getAttribute("loggedIn") != null) {
    %>


    <%-- CONTENT --%>
    <main class="main-content container" id="main-content">
        <h2 class="main-content__title">Bảng điều khiển</h2>

        <section class="section">
            <h3 class="main-content__sub-title">Thống kê tài khoản khách hàng</h3>
          
            <%
                ArrayList<User> userList = (ArrayList<User>)request.getAttribute("userList");
            %>
          
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
                  
                    <% 
                        for(int i = 0; i < userList.size(); i++) {
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
                  <%
                      };
                  %>
                </tbody>
            </table>
        </section>

        <section class="section">
            <h3 class="main-content__sub-title">Đơn hàng đang chờ</h3>
            <table class="crud-table" id="all-customers">
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Ngày đặt</th>
                        <th>Tên khách hàng</th>
                        <th>Mô tả</th>
                        <th>Thành tiền</th>
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
                            <button class="action__button action__button--accept">
                                <i class="fas fa-check"></i>
                            </button>
                            <button class="action__button action__button--reject">
                                <i class="fas fa-times"></i>
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </section>

        <section class="section">
            <h3 class="main-content__sub-title">Yêu cầu liên hệ đang chờ</h3>
            <table class="crud-table" id="all-customers">
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Ngày gửi</th>
                        <th>Tên khách hàng</th>
                        <th>Email</th>
                        <th>Số điện thoại</th>
                        <th>Nội dung</th>
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
                        <td></td>
                        <td>
                            <button class="action__button action__button--view">
                                <i class="fas fa-eye"></i>
                            </button>
                            <button class="action__button action__button--done">
                                <i class="fas fa-check"></i>
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </section>
    </main>

    <!-- FOOTER -->
    <%@ include file="includes/admin-footer.jsp" %>
    <%
        }
    %>

    <script src="src/lib/jquery-3.3.1.min.js"></script>
    <script src="src/js/main.js"></script>


</body>

</html>