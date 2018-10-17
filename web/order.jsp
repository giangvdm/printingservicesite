<%-- 
    Document   : index
    Created on : Oct 15, 2018, 12:16:14 PM
    Author     : vumin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
    <title>Đặt in/photo - Công ty In ấn Ao Sen đệ nhất photo</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Load normalize.css -->
    <link rel="stylesheet" href="src/lib/normalize.css">
    <!-- Load skeleton.css -->
    <link rel="stylesheet" href="src/lib/skeleton.css">
    <!-- Load fontawesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
        crossorigin="anonymous">
    <!-- Load custom css -->
    <link rel="stylesheet" type="text/css" href="src/css/main.css">
</head>

<body>
    <header class="header" id="header">
        <!-- -->
        <div class="container">
            <img src="assets/icons/printer-logo.png" alt="printer logo" class="header__logo">
            <h1 class="header__site-name">Ao Sen đệ nhất photo</h1>
        </div>
    </header>

    <nav class="navigation" id="navigation">
        <div class="container">
            <ul class="navigation__list">
                <li class="navigation__list__item">
                    <a href="#"><i class="fas fa-home"></i> Trang chủ</a>
                </li>
                <li class="navigation__list__item">
                    <a href="#"><i class="fas fa-address-card"></i> Giới thiệu</a>
                </li>
                <li class="navigation__list__item">
                    <a href="#"><i class="fas fa-dollar-sign"></i> Báo giá</a>
                </li>
                <li class="navigation__list__item active">
                    <a href="#"><i class="fas fa-receipt"></i> Đặt hàng</a>
                </li>
                <li class="navigation__list__item">
                    <a href="#"><i class="fas fa-phone"></i> Liên hệ</a>
                </li>
            </ul>
        </div>
    </nav>

    <section class="section">
        <div class="container">
            <h2 class="section__title">Đặt in/photo</h2>
            <form action="#" class="form" id="order-form">
                <div class="row">
                    <div class="five columns form__label-container">
                        <label for="number-of-copy">Số bản</label>
                    </div>
                    <div class="seven columns">
                        <input type="number" min="1" value="1" id="number-of-copy">
                    </div>
                </div>
                <div class="row">
                    <div class="five columns form__label-container">
                        <label for="paper-size">Khổ giấy</label>
                    </div>
                    <div class="seven columns">
                        <select name="paper-size" id="paper-size">
                            <option value="a0">A0</option>
                            <option value="a1">A1</option>
                            <option value="a2">A2</option>
                            <option value="a3">A3</option>
                            <option value="a4">A4</option>
                            <option value="a5">A5</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="five columns form__label-container">
                        <label for="number-of-pages">Số trang</label>
                    </div>
                    <div class="seven columns">
                        <input type="number" min="1" value="1" id="number-of-pages">
                    </div>
                </div>
                <div class="row">
                    <div class="five columns form__label-container">
                        <label for="">Đóng quyển</label>
                    </div>
                    <div class="seven columns">
                        <select name="" id=""></select>
                    </div>
                </div>
                <div class="row">
                    <div class="five columns form__label-container">
                        <label for="">Quy cách</label>
                    </div>
                    <div class="seven columns">
                        <select name="" id=""></select>
                    </div>
                </div>
                <div class="row">
                    <div class="five columns form__label-container">
                        <label for="">Chất liệu bìa</label>
                    </div>
                    <div class="seven columns">
                        <select name="" id=""></select>
                    </div>
                </div>
                <div class="row">
                    <div class="five columns form__label-container">
                        <label for="">Chất liệu ruột</label>
                    </div>
                    <div class="seven columns">
                        <select name="" id=""></select>
                    </div>
                </div>
                <div class="row">
                    <div class="six columns">
                        <input type="submit" value="Đặt hàng">
                    </div>
                    <div class="six columns"></div>
                </div>
            </form>
        </div>
    </section>

    <footer class="footer" id="footer">
        <div class="container u-full-width">
            <div class="row">
                <div class="six columns footer__site-info">
                    <div>Công ty In ấn Ao Sen đệ nhất photo</div>
                    <div>Địa chỉ: Ngõ xxx Ao Sen, Hà Đông, Hà Nội</div>
                    <div>Điện thoại: 0123456789</div>
                </div>
                <div class="six columns footer__social-media">
                    <div>Kết nối với chúng tôi</div>
                    <div class="social-media__link-wrapper">
                        <a href="https://facebook.com" class="social-media__link" id="facebook-link"><i class="fab fa-facebook-f"></i></a>
                        <a href="https://twitter.com" class="social-media__link" id="twitter-link"><i class="fab fa-twitter"></i></a>
                        <a href="https://youtube.com" class="social-media__link" id="youtube-link"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="twelve columns footer__copyright">
                    <div>Copyright &copy; 2018</div>
                    <div>Thiết kế bởi công ty Phần mềm ABC</div>
                </div>
            </div>
        </div>
    </footer>

    <script src="src/js/main.js"></script>
</body>

</html>