<%@page import="Model.Admin"%>
<%@page import="DAO.AdminDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Tài khoản - Công ty In ấn Ao Sen đệ nhất photo</title>
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
    ArrayList<Admin> adminList = AdminDAO.getAllAdmin();
%>

<body data-page-name="manage-admin">
    <!-- HEADER -->
    <%@ include file="includes/admin-header.jsp" %>

    <!-- NAVIGATION -->
    <jsp:include page="/includes/admin-nav.jsp" />

    <main class="main-content container" id="main-content">
        <h2 class="main-content__title">Quản lý Tài khoản Quản trị viên</h2>

        <section class="section" id="change-password">
            <h3 class="main-content__sub-title">Tổng hợp Tài khoản Quản trị viên</h3>

            <div class="row">
                <%
                    if ("edit-admin".equalsIgnoreCase((String)request.getAttribute("action")) && "success".equalsIgnoreCase((String)request.getAttribute("status"))){
                %>
                <div class="message_div">
                    <div class="dialog__container dialog__container--success">
                        <div class="dialog__dismiss-button dialog__dismiss-button--success js-dialogDismissButton">
                            <i class="fas fa-times"></i>
                        </div>
                        <div class="dialog__content">
                            <p>Cập nhật thông tin tài khoản quản trị viên thành công!</p>
                        </div>
                    </div>
                </div>
                <%  
                    }
                %>
                <%
                    if ("delete-admin".equalsIgnoreCase((String)request.getAttribute("action")) && "success".equalsIgnoreCase((String)request.getAttribute("status"))){
                %>
                <div class="message_div">
                    <div class="dialog__container dialog__container--success">
                        <div class="dialog__dismiss-button dialog__dismiss-button--success js-dialogDismissButton">
                            <i class="fas fa-times"></i>
                        </div>
                        <div class="dialog__content">
                            <p>Xóa tài khoản quản trị viên thành công!</p>
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
                        <th>Mật khẩu</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        for (int i = 0; i < adminList.size(); i++) {
                        Admin admin = new Admin();
                        admin = adminList.get(i);
                    %>
                    <tr>
                        <td>
                            <%=admin.getId()%>
                        </td>
                        <td>
                            <%=admin.getUsername()%>
                        </td>
                        <td>
                            <%=admin.getPassword()%>
                        </td>
                        <td>
                            <form class="action-form" action="AdminCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="edit">
                                <input type="hidden" name="id" value="<%=admin.getId()%>">
                                <button type="submit" class="action__button action__button--edit">
                                    <i class="fas fa-edit"></i>
                                </button>
                            </form>
                            <form class="action-form" action="AdminCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<%=admin.getId()%>">
                                <button type="submit" class="action__button action__button--delete" onclick="return confirm('Bạn có chắc muốn xóa bản ghi này?')">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%  
                        } // end for
                    %>
                </tbody>
            </table>
        </section>

        <section class="section" id="">
            <h3 class="main-content__sub-title">Tạo Tài khoản Quản trị viên</h3>

            <form action="CreateNewAdmin" method="POST" class="form" id="create-new-admin-form">
                <input type="hidden" id="user-type" name="user-type" value="admin">
                <fieldset>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="username">Tên tài khoản</label>
                        </div>
                        <div class="seven columns">
                            <input type="text" id="username" name="username" required>
                            <div class="theme__input__validity" id="js-usernameValidityDisplay"></div>
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="password">Mật khẩu</label>
                        </div>
                        <div class="seven columns">
                            <input type="password" id="password" name="password" required>
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="password-repeat">Nhập lại mật khẩu</label>
                        </div>
                        <div class="seven columns">
                            <input type="password" id="password-repeat" name="password-repeat" required>
                            <div class="theme__input__validity" id="js-passwordRepeatValidityDisplay"></div>
                        </div>
                    </div>
                </fieldset>

                <div class="row form__line-wrapper">
                    <div class="six columns form__button-container">
                        <input class="form__button form__button--submit" type="submit" value="Tạo" id="submit-button">
                    </div>
                    <div class="six columns form__button-container">
                        <input class="form__button form__button--reset" type="reset" value="Điền lại" id="reset-button">
                    </div>
                </div>
            </form>
        </section>

        <section class="section">
            <form action="LogoutServlet" method="POST" id="logout-form">
                <input type="hidden" name="user-type" value="admin">
                <button type="submit" class="button" id="logout-button">Đăng xuất</button>
            </form>
        </section>
    </main>

    <!-- FOOTER -->
    <%@ include file="includes/admin-footer.jsp" %>

    <script src="src/lib/jquery-3.3.1.min.js"></script>
    <script src="src/js/main.js"></script>
    <script src="src/js/universal-form.js"></script>
    <script src="src/js/register.js"></script>
</body>

</html>