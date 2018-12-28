<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
    <title>Thông tin khách hàng - Công ty In ấn Ao Sen đệ nhất photo</title>
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
            <h2 class="main-content__title">Thông tin khách hàng</h2>

            <div class="info-card">
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Họ và tên</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">Nguyễn Văn A</div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Email</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">anv@email.com</div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Số điện thoại</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">0123456789</div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Địa chỉ</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">Lorem ipsum dolor sit amet consectetur adipisicing elit.
                            Dolores tempora delectus dolorum, quibusdam modi voluptates corrupti aperiam amet sequi
                            quasi quidem, dolore molestiae officia natus cumque at vero sapiente adipisci?
                        </div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Tên đăng nhập</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">nguyenvana</div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Mật khẩu</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">12345</div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- FOOTER -->
    <%@ include file="includes/admin-footer.jsp" %>

    <script src="src/lib/jquery-3.3.1.min.js"></script>
    <script src="src/js/main.js"></script>
    <script src="src/js/universal-form.js"></script>

</body>

</html>