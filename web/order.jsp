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
    <link rel="stylesheet" href="src/lib/fontawesome/all.css">
    <!-- Load custom css -->
    <link rel="stylesheet" type="text/css" href="src/css/main.css">
</head>

<body>
    <!-- HEADER -->
    <%@ include file="src/includes/header.jsp" %>

    <!-- NAVIGATION -->
    <%@ include file="src/includes/nav.jsp" %>

    <!-- CONTENT -->
    <section class="section">
        <div class="container">
            <h2 class="section__title">Đặt in/photo</h2>
            <form action="#" class="form" id="order-form">
                <fieldset id="press-info">
                    <legend>Thông tin bản in/photo</legend>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="number-of-pages"><i class="far fa-question-circle"></i>
                                Tổng số trang</label>
                        </div>
                        <div class="seven columns">
                            <input type="number" min="1" value="1" id="number-of-pages" required>
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="number-of-copy">Số bản</label>
                        </div>
                        <div class="seven columns">
                            <input type="number" min="1" value="1" id="number-of-copy" required>
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="number-of-side">Số mặt in</label>
                        </div>
                        <div class="seven columns">
                            <select name="number-of-side" id="number-of-side" required>
                                <option value="1-side">1 mặt</option>
                                <option value="2-sides">2 mặt</option>
                            </select>
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="paper-size">Khổ giấy</label>
                        </div>
                        <div class="seven columns">
                            <select name="paper-size" id="paper-size" required>
                                <option value="a0">A0</option>
                                <option value="a1">A1</option>
                                <option value="a2">A2</option>
                                <option value="a3">A3</option>
                                <option value="a4">A4</option>
                                <option value="a5">A5</option>
                            </select>
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="paper">Chất liệu giấy ruột</label>
                        </div>
                        <div class="seven columns">
                            <select name="paper" id="paper" required>
                                <option value="bb60">Bãi bằng 60</option>
                                <option value="bb70">Bãi bằng 70</option>
                                <option value="offset60">Offset 60</option>
                                <option value="offset70">Offset 70</option>
                            </select>
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label" for="bookbinding">Đóng quyển</label>
                        </div>
                        <div class="seven columns">
                            <input type="checkbox" value="yes" id="bookbinding">
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label" for="bookbinding-method">Quy cách</label>
                        </div>
                        <div class="seven columns">
                            <select name="bookbinding-method" id="bookbinding-method" required>
                                <option value="spring">Gáy xoắn</option>
                                <option value="sewn">Gáy khâu</option>
                                <option value="taped">Phay keo</option>
                            </select>
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label" for="cover">Chất liệu bìa</label>
                        </div>
                        <div class="seven columns">
                            <select name="cover" id="cover" required>
                                <option value="couches150">Couches 150</option>
                                <option value="couches200">Couches 200</option>
                                <option value="couches250">Couches 250</option>
                                <option value="couches300">Couches 300</option>
                            </select>
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label" for="extra-requirement">Yêu cầu khác</label>
                        </div>
                        <div class="seven columns">
                            <textarea name="extra-requirement" id="extra-requirement" cols="30" rows="15"></textarea>
                        </div>
                    </div>
                </fieldset>
                <fieldset id="customer-info">
                    <legend>Thông tin khách hàng</legend>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="customer-name">Họ và tên</label>
                        </div>
                        <div class="seven columns">
                            <input type="text" id="customer-name" name="customer-name" required>
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="customer-tel">Số điện thoại</label>
                        </div>
                        <div class="seven columns">
                            <input type="tel" id="customer-tel" name="customer-tel" required>
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="customer-email">Email</label>
                        </div>
                        <div class="seven columns">
                            <input type="email" id="customer-email" name="customer-email" required>
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
                    <div class="six columns form__button-container">
                        <input type="reset" value="Điền lại" id="reset-button">
                    </div>
                    <div class="six columns form__button-container">
                        <input type="submit" value="Đặt hàng" id="submit-button">
                    </div>
                </div>
            </form>
        </div>
    </section>

    <!-- FOOTER -->
    <%@ include file="src/includes/footer.jsp" %>

    <script src="src/js/main.js"></script>
</body>

</html>