<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
    <title>Liên hệ - Công ty In ấn Ao Sen đệ nhất photo</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Load normalize.css -->
    <link rel="stylesheet" href="src/lib/normalize.css">
    <!-- Load skeleton.css -->
    <link rel="stylesheet" href="src/lib/skeleton.css">
    <!-- Load fontawesome -->
    <link rel="stylesheet" href="src/lib/fontawesome/all.css">
    <!-- Load Owl Carousel theme -->
    <link rel="stylesheet" href="src/lib/owlcarousel/owl.carousel.min.css">
    <link rel="stylesheet" href="src/lib/owlcarousel/owl.theme.default.min.css">
    <!-- Load custom css -->
    <link rel="stylesheet" type="text/css" href="src/css/main.css">
</head>

<body data-page-name="contact">
    <%-- HEADER --%>
    <%@ include file="/includes/header.jsp" %>

    <%-- NAVIGATION --%>
    <jsp:include page="/includes/nav.jsp" />

    <%-- CONTENT --%>
    <section class="section" id="">
        <div class="container">
            <h2 class="section__main-title">Liên hệ</h2>

            <div class="row">
                <div class="six columns layout__left-col">
                    <h4>Hãy để lại thông tin, chúng tôi sẽ tư vấn cho bạn những dịch vụ tốt nhất</h4>
                    <form action="#" id="contact-form">
                        <fieldset>
                            <div class="row form__line-wrapper">
                                <div class="four columns form__label-container">
                                    <label class="form__label required" for="customer-name">Họ và tên</label>
                                </div>
                                <div class="eight columns">
                                    <input type="text" id="customer-name" name="customer-name" required>
                                </div>
                            </div>
                            <div class="row form__line-wrapper">
                                <div class="four columns form__label-container">
                                    <label class="form__label required" for="customer-tel">Số điện thoại</label>
                                </div>
                                <div class="eight columns">
                                    <input type="tel" id="customer-tel" name="customer-tel" required>
                                </div>
                            </div>
                            <div class="row form__line-wrapper">
                                <div class="four columns form__label-container">
                                    <label class="form__label required" for="customer-email">Email</label>
                                </div>
                                <div class="eight columns">
                                    <input type="email" id="customer-email" name="customer-email" required>
                                </div>
                            </div>
                            <div class="row form__line-wrapper">
                                <div class="four columns form__label-container">
                                    <label class="form__label" for="customer-inform">Nội dung liên hệ</label>
                                </div>
                                <div class="eight columns">
                                    <textarea name="customer-inform" id="customer-inform" cols="18" rows="15"></textarea>
                                </div>
                            </div>
                            <div class="row form__line-wrapper">
                                <div class="six columns form__button-container">
                                    <input type="submit" value="Gửi" id="submit-button" class="form__button form__button--submit">
                                </div>
                                <div class="six columns form__button-container">
                                    <input type="reset" value="Điền lại" id="reset-button" class="form__button form__button--reset">
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
                <div class="six columns layout__right-col">
                    <h4>...hoặc hãy đến tham quan xưởng in của chúng tôi</h4>
                    <div class="mapouter">
                        <div class="gmap_canvas"><iframe width="300" height="300" id="gmap_canvas" src="https://maps.google.com/maps?q=ao%20sen&t=&z=13&ie=UTF8&iwloc=&output=embed"
                                frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- FOOTER -->
    <%@ include file="/includes/footer.jsp" %>

    <script src="src/lib/jquery-3.3.1.min.js"></script>
    <script src="src/js/main.js"></script>
</body>

</html>