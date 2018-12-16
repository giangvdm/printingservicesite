<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Đăng nhập - Công ty In ấn Ao Sen đệ nhất photo</title>
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
    <%@ include file="includes/header.jsp" %>

    <!-- NAVIGATION -->
    <jsp:include page="/includes/nav.jsp" />

    <section class="section">
        <div class="container">
            <h2 class="section__main-title">Đăng nhập</h2>

            <div class="twelve columns theme__text--info" id="link-to-register">
                Chưa có tài khoản? <a href="register.jsp">Bấm vào đây để đăng ký</a>
            </div>

            <form action="LoginServlet" method="POST" class="form" id="login-form">
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
        </div>
    </section>

    <!-- FOOTER -->
    <%@ include file="includes/footer.jsp" %>

    <script src="src/js/main.js"></script>
</body>

</html>