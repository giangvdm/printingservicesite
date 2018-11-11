<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Đăng ký - Công ty In ấn Ao Sen đệ nhất photo</title>
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

<body data-page-name="account">
    <!-- HEADER -->
    <%@ include file="src/includes/header.jsp" %>

    <!-- NAVIGATION -->
    <%@ include file="src/includes/nav.jsp" %>

    <section class="section">
        <div class="container">
            <h2 class="section__title">Đăng ký</h2>
            <form action="#" class="form" id="login-form">
                <fieldset id="account-info">
                    <legend>Thông tin tài khoản</legend>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="username">Tên tài khoản</label>
                        </div>
                        <div class="seven columns">
                            <input type="text" id="username" name="username" required>
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
                            <label class="form__label required" for="repeat-password">Nhập lại mật khẩu</label>
                        </div>
                        <div class="seven columns">
                            <input type="password" id="repeat-password" name="repeat-password" required>
                        </div>
                    </div>
                </fieldset>
                <fieldset id="personal-info">
                    <legend>Thông tin cá nhân</legend>

                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="fullname">Họ và tên</label>
                        </div>
                        <div class="seven columns">
                            <input type="text" id="fullname" name="fullname" required>
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="email">Email</label>
                        </div>
                        <div class="seven columns">
                            <input type="text" id="email" name="email" required>
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label" for="customer-address">Địa chỉ</label>
                        </div>
                        <div class="seven columns">
                            <textarea name="customer-address" id="customer-address" cols="30" rows="10"></textarea>
                        </div>
                    </div>
                </fieldset>
                <div class="row form__line-wrapper">
                    <div class="twelve columns form__button-container">
                        <input type="reset" value="Điền lại" id="reset-button">
                        <input type="submit" value="Đăng ký" id="submit-button">
                    </div>
                </div>
                <div class="twelve columns">
                    Đã tài khoản? <a href="login.jsp">Bấm vào đây để đăng nhập</a>
                </div>
            </form>
        </div>
    </section>

    <!-- FOOTER -->
    <%@ include file="src/includes/footer.jsp" %>

    <script src="src/js/main.js"></script>
</body>

</html>