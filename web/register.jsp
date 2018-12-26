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
    <%request.setCharacterEncoding("UTF-8");%>

    <!-- HEADER -->
    <%@ include file="includes/header.jsp" %>

    <!-- NAVIGATION -->
    <jsp:include page="/includes/nav.jsp" />

    <main class="main-content container" id="main-content">
        <h2 class="main-content__title">Đăng ký</h2>

        <div style="margin-bottom: 15px;" id="link-to-login">
            Đã tài khoản? <a href="login.jsp" class="theme__text--info">Bấm vào đây để đăng nhập</a>
        </div>

        <form action="RegisterServlet" method="POST" class="form" id="login-form">
            <fieldset id="account-info">
                <legend>Thông tin tài khoản</legend>
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
                        <input type="email" id="email" name="email" required>
                    </div>
                </div>
                <div class="row form__line-wrapper">
                    <div class="five columns form__label-container">
                        <label class="form__label required" for="phonenumber">Số điện thoại</label>
                    </div>
                    <div class="seven columns">
                        <input type="text" id="phonenumber" name="phonenumber" required>
                    </div>
                </div>
                <div class="row form__line-wrapper">
                    <div class="five columns form__label-container">
                        <label class="form__label" for="customer-address">Địa chỉ</label>
                    </div>
                    <div class="seven columns">
                        <textarea name="customer-address" id="customer-address" rows="10"></textarea>
                    </div>
                </div>
            </fieldset>
            <div class="row form__line-wrapper">
                <div class="six columns form__button-container">
                    <input class="form__button form__button--submit" type="submit" value="Đăng ký" id="submit-button">
                </div>
                <div class="six columns form__button-container">
                    <input class="form__button form__button--reset" type="reset" value="Điền lại" id="reset-button">
                </div>
            </div>
        </form>
    </main>

    <!-- FOOTER -->
    <%@ include file="includes/footer.jsp" %>

    <script src="src/lib/jquery-3.3.1.min.js"></script>
    <script src="src/js/main.js"></script>
    <script src="src/js/universal-form.js"></script>
    <script src="src/js/register.js"></script>
</body>

</html>