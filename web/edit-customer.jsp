<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
    <title>Chỉnh sửa tài khoản khách hàng - Công ty In ấn Ao Sen đệ nhất photo</title>
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
    <main class="main-content container">
        <section class="section">
            <h2 class="main-content__title">Chỉnh sửa tài khoản khách hàng</h2>

            <form action="EditCustomerProfile" method="POST" class="form" id="edit-customer-form">
                <input type="hidden" name="id" value="${requestScope.customer.getId()}">
                <fieldset>
                    <legend>Thông tin tài khoản</legend>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="customer-username">Tên tài khoản</label>
                        </div>
                        <div class="seven columns">
                            <input type="text" id="customer-username" name="customer-username" required value="${requestScope.customer.getUserName()}">
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="customer-password">Mật khẩu</label>
                        </div>
                        <div class="seven columns">
                            <input type="password" id="customer-password" name="customer-password" required value="${requestScope.customer.getUserPassword()}">
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Thông tin cá nhân</legend>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="customer-name">Họ và tên</label>
                        </div>
                        <div class="seven columns">
                            <input type="text" id="customer-name" name="customer-name" required value="${requestScope.customer.getFullname()}">
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="customer-email">Email</label>
                        </div>
                        <div class="seven columns">
                            <input type="email" id="customer-email" name="customer-email" required value="${requestScope.customer.getEmail()}">
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="customer-tel">Số điện thoại</label>
                        </div>
                        <div class="seven columns">
                            <input type="text" id="customer-tel" name="customer-tel" required value="${requestScope.customer.getPhoneNumber()}">
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label" for="customer-address">Địa chỉ</label>
                        </div>
                        <div class="seven columns">
                            <textarea name="customer-address" id="customer-address" rows="10">${requestScope.customer.getAddress()}</textarea>
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="six columns form__button-container">
                            <input class="form__button form__button--submit" type="submit" value="Cập nhật" id="submit-button">
                        </div>
                        <div class="six columns form__button-container">
                            <input class="form__button form__button--reset" type="reset" value="Điền lại" id="reset-button">
                        </div>
                    </div>
                </fieldset>
            </form>
        </section>
    </main>

    <!-- FOOTER -->
    <%@ include file="includes/admin-footer.jsp" %>

    <script src="src/lib/jquery-3.3.1.min.js"></script>
    <script src="src/js/main.js"></script>
    <script src="src/js/universal-form.js"></script>

</body>

</html>