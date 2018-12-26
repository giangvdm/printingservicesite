<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
    <title>Trang chủ - Công ty In ấn Ao Sen đệ nhất photo</title>
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

<body data-page-name="home">
    <%-- HEADER --%>
    <%@ include file="includes/header.jsp" %>

    <%-- NAVIGATION --%>
    <jsp:include page="/includes/nav.jsp" />

    <%-- CONTENT --%>
    <main class="main-content container" id="main-content">
        <h2 class="main-content__title">Trang chủ</h2>

        <section class="section">
            <div class="owl-carousel">
                <div class="">
                    <img src="assets/images/carousel/1.jfif" alt="">
                </div>
                <div class="">
                    <img src="assets/images/carousel/2.jfif" alt="">
                </div>
                <div class="">
                    <img src="assets/images/carousel/3.jfif" alt="">
                </div>
            </div>
        </section>

        <article class="article" id="mot-so-san-pham">
            <h3 class="article__title">Một số sản phẩm đã thực hiện</h3>
            <div class="image-grid__container">
                <div class="small">
                    <img src="assets/images/grid/blank-books.jpg" alt="blank books">
                </div>
                <div class="horizontal">
                    <img src="assets/images/grid/newspaper-1.jpg" alt="newspaper">
                </div>
                <div class="vertical">
                    <img src="assets/images/grid/magazine-1.jpg" alt="magazine">
                </div>
                <div class="horizontal">
                    <img src="assets/images/grid/newspaper-2.jpg" alt="newspaper">
                </div>
                <div class="small">
                    <img src="assets/images/grid/encyclopedia.jpg" alt="encyclopedia">
                </div>
                <div class="big">
                    <img src="assets/images/grid/magazine-2.jpg" alt="magazine">
                </div>
                <div class="big">
                    <img src="assets/images/grid/map.jpg" alt="world map">
                </div>
            </div>
        </article>

        <article class="article" id="phan-hoi">
            <h3 class="article__title">Phản hồi của khách hàng</h3>
            <!-- Customer review cards -->
            <div class="horizontal-card__container">
                <div class="horizontal-card__customer-avt-holder">
                    <img src="assets/icons/male-user.png" alt="male user icon" class="horizontal-card__customer-avt">
                </div>
                <div class="horizontal-card__content-holder">
                    <div class="horizontal-card__customer-holder">
                        <div class="horizontal-card__customer-name theme__text--strong">(Ông) Quang Vĩ</div>
                        <div class="horizontal-card__customer-info theme__text--italic">Giám đốc doanh nghiệp tư
                            nhân</div>
                    </div>
                    <div class="horizontal-card__content">
                        Doanh nghiệp của tôi đã là khách hàng của Ao Sen Đệ nhất được 3 năm nay, và không có ý định
                        hợp tác, sử dụng dịch vụ in ấn của một bên nào khác.
                        Tôi khuyên dùng dịch vụ của Ao Sen Đệ nhất cho giải pháp in ấn giấy tờ dành cho doanh
                        nghiệp.
                    </div>
                </div>
            </div>
            <div class="horizontal-card__container">
                <div class="horizontal-card__customer-avt-holder">
                    <img src="assets/icons/female-user.png" alt="female user icon" class="horizontal-card__customer-avt">
                </div>
                <div class="horizontal-card__content-holder">
                    <div class="horizontal-card__customer-holder">
                        <div class="horizontal-card__customer-name theme__text--strong">(Bà) Nguyễn Quỳnh Chi</div>
                        <div class="horizontal-card__customer-info theme__text--italic">Quản lý dự án</div>
                    </div>
                    <div class="horizontal-card__content">
                        Là một chuyên viên quản lý dự án cấp cao, tôi thường xuyên phải in rất nhiều tài liệu, văn
                        bản phục vụ công việc.
                        Cơ sở vật chất, máy móc phục vụ in, photo tại công ty tôi đang làm việc không thiếu nhưng
                        với khối lượng công việc nặng thì việc tự in thủ công tốn rất nhiều thời gian. Nhờ có dịch vụ
                        tuyệt vời tại Ao Sen
                        Đệ nhất mà tôi vừa tiết kiệm được thời gian cho việc chuẩn bị giấy tờ, vừa có thể hoàn thành
                        sớm công việc và dành thêm
                        thời gian cho gia đình thân yêu.
                    </div>
                </div>
            </div>
            <div class="horizontal-card__container">
                <div class="horizontal-card__customer-avt-holder">
                    <img src="assets/icons/male-user.png" alt="male user icon" class="horizontal-card__customer-avt">
                </div>
                <div class="horizontal-card__content-holder">
                    <div class="horizontal-card__customer-holder">
                        <div class="horizontal-card__customer-name theme__text--strong">(Ông) Cường Dương</div>
                        <div class="horizontal-card__customer-info theme__text--italic">Chuyên viên quảng cáo</div>
                    </div>
                    <div class="horizontal-card__content">
                        Quảng cáo là một ngành không những đòi hỏi sự sáng tạo mà còn yêu cầu rất cao về khối lượng
                        công việc cần thực hiện,
                        từ vẽ đồ họa trên máy tính đến khi in ra thành phẩm như các tấm panel, standee hay thậm chí là
                        những tấm biển cực lớn - quả
                        là không hề đơn giản. Thế nhưng, đội ngũ kỹ thuật viên có chuyên môn cao tại Ao Sen Đệ nhất
                        dường như chứng minh điều ngược lại.
                        Các dự án quảng cáo hợp tác với Ao Sen Đệ nhất đã được thực hiện một cách bài bản, chuyên
                        nghiệp, không tốn quá nhiều nỗ lực mà
                        vẫn cho ra các thành phẩm chất lượng cao. Tôi tin dùng dịch vụ tại Ao Sen Đệ nhất!
                    </div>
                </div>
            </div>
        </article>
    </main>

    <!-- FOOTER -->
    <%@ include file="includes/footer.jsp" %>

    <script src="src/lib/jquery-3.3.1.min.js"></script>
    <script src="src/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="src/js/main.js"></script>
    <!-- Call the Owl initializer function -->
    <script>
        $(document).ready(function () {
            $(".owl-carousel").owlCarousel({
                items: 1,
                loop: true,
                margin: 10,
                autoplay: true,
                autoHeight: true
            });
        });
    </script>
</body>

</html>