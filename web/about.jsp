<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
    <title>Giới thiệu - Công ty In ấn Ao Sen đệ nhất photo</title>
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

<body data-page-name="about">
    <%-- HEADER --%>
    <%@ include file="includes/header.jsp" %>

    <%-- NAVIGATION --%>
    <jsp:include page="/includes/nav.jsp" />

    <%-- CONTENT --%>
    <main class="main-content container" id="main-content">
        <h2 class="main-content__title">Giới thiệu</h2>

        <article class="article" id="lich-su-cong-ty">
            <h3 class="article__title">Lịch sử công ty</h3>
            <div class="article__content">
                <p class="content__item content__text">
                    Công ty In ấn Ao Sen Đệ nhất là công ty chuyên cung cấp các dịch vụ thiết kế, in ấn,
                    quảng cáo. Với sức trẻ năng động cùng đội ngũ công, nhân viên nhiều năm hoạt động trong lĩnh
                    vực in ấn, quảng cáo … Công ty Ao Sen Đệ nhất đã có được chỗ đứng trên thị trường In Ấn và Quảng
                    Cáo cũng như xây dựng được niềm tin, uy tín với các đối tác và khách hàng.
                </p>
                <p class="content__item content__text">
                    Với phương châm: "luôn làm tốt từ những việc nhỏ nhất để mang lại lợi ích tối đa cho khách
                    hàng” chính sự đảm bảo "Uy tín" đó tạo lên thương hiệu Ao Sen Đệ nhất trường tồn và phát triển.
                </p>
            </div>
        </article>

        <article class="article" id="phuong-cham-kinh-doanh">
            <h3 class="article__title">Phương châm kinh doanh</h3>
            <div class="article__content">
                <p class="content__item content__text">
                    Công ty Ao Sen Đệ nhất luôn đặt chữ tín lên hàng đầu, từ đó khách hàng biết đến và để Ao Sen Đệ
                    nhất được phục vụ nhiều hơn.Ngày nay có rất nhiều công ty hoạt động cùng lĩnh vực, in Ao Sen Đệ
                    nhất
                    chủ trương tạo ra sự khác biệt, với phương châm: "luôn làm tốt từ những việc nhỏ nhất", lấy sự
                    "thành công của khách hàng là thành công của Ao Sen Đệ nhất" Với phương châm này Ao Sen Đệ nhất
                    đã và đang từng bước phát triển vững chắc, tạo được sự tín nhiệm của khách hàng, dần khẳng định
                    được
                    mình và tạo được một vị thế trên thị trường thiết kế - in ấn - quảng cáo.
                </p>
            </div>
        </article>

        <article class="article" id="tam-nhin-su-menh">
            <h3 class="article__title">Tầm nhìn, sứ mệnh</h3>
            <div class="article__content">
                <p class="content__item content__text">
                    <div class="theme__text--strong">Tầm nhìn</div>
                    Đến năm 2020, Ao Sen Đệ nhất trở thành công ty hàng đầu tại Việt Nam trong ngành công nghiệp in
                    ấn, quảng cáo thông qua việc cung cấp các sản phẩm "chất lượng, giá thành cạnh tranh, thời gian
                    nhanh chóng".
                </p>
                <p class="content__item content__text">
                    <div class="theme__text--strong">Sứ mệnh</div>
                    Chung tay xây dựng và phát huy thương hiệu Việt.
                    Đem đến cho khách hàng những sản phẩm in có chất lượng tốt, dịch vụ hoàn hảo, thời gian nhanh
                    chóng với giá thành hợp lý nhất.
                    Tạo lập một môi trường làm việc mang lại hiệu quả cao nhất nhằm phát huy một cách toàn diện tài
                    năng của từng cán bộ, công nhân viên.
                </p>
            </div>
        </article>

        <article class="article" id="cam-ket">
            <h3 class="article__title">Cam kết</h3>
            <div class="article__content">
                <div class="container u-full-width card-row__container">
                    <div class="four columns card-row__card-item">
                        <i class="fas fa-thumbs-up card-item__logo"></i>
                        <div class="card-item__heading">
                            Dịch vụ hoàn hảo
                        </div>
                        <div class="card-item__description">
                            Khách hàng sẽ nhận được trải nghiệm tốt nhất về dịch vụ, từ chất lượng những bản in,
                            tới đóng gói và phong cách phục vụ tận tình, chu đáo của nhân viên chúng tôi.
                        </div>
                    </div>
                    <div class="four columns card-row__card-item">
                        <i class="fas fa-file-invoice-dollar card-item__logo"></i>
                        <div class="card-item__heading">
                            Giá cả cạnh tranh
                        </div>
                        <div class="card-item__description">
                            Chúng cam kết mang lại các sản phẩm chất lượng cao với giá thành cực kỳ tốt và cạnh tranh,
                            và đặc biệt là ổn định và ít bị ảnh hưởng bởi tác động tiêu cực của giá cả thị trường
                            chung.
                        </div>
                    </div>
                    <div class="four columns card-row__card-item">
                        <i class="fas fa-headset card-item__logo"></i>
                        <div class="card-item__heading">
                            Hỗ trợ nhiệt tình 18/7
                        </div>
                        <div class="card-item__description">
                            Dù là doanh nghiệp hay cá nhân sử dụng dịch vụ của chúng tôi, mọi khách hàng sẽ được hỗ trợ
                            nhiệt tình về sản phẩm, giá cả, các ưu đãi,... trong suốt 18 giờ trong mỗi ngày.
                        </div>
                    </div>
                </div>
            </div>
        </article>

        <article class="article" id="nguon-luc">
            <h3 class="article__title">Nguồn lực</h3>
            <div class="article__content">
                <div class="content__item content__text">
                    <div class="theme__text--strong">Nhân sự</div>
                    Ao Sen Đệ nhất xác định nguồn nhân lực chuyên nghiệp chính là nguồn lực quan trọng nhất, là
                    nhân tố thúc đẩy sự phát triển của công ty. Vậy nên Công ty Ao Sen Đệ nhất luôn chú trọng nâng
                    cao trình độ, kỹ năng làm việc cho cán bộ, công nhân viên, khuyến khích nhân viên phát huy khả năng
                    làm việc, tính sáng tạo của mỗi cá nhân, trong đó các họa sỹ thiết kế và các biên dịch viên… đều có
                    chuyên môn và có nhiều năm kinh nghiệm.
                </div>
                <div class="content__item content__text">
                    <div class="theme__text--strong">Kỹ thuật</div>
                    Ao Sen Đệ nhất chú trọng đầu tư máy móc cao cấp, chạy đa chủng loại từ máy in 4 màu: Mitsubishi
                    Daiya, máy 4 màu: Komori, máy 2 màu: Komori cùng với dây chuyền sản xuất sau in: máy cán, máy bế,
                    máy
                    làm khuôn, máy ép nhũ, máy phủ uv, máy dán phong bì, máy khoan, máy keo sách, khâu sách, máy gấp
                    dán, máy đóng lỗ lịch…, Ao Sen Đệ nhất trở thành công ty in ấn, quảng cáo hàng đầu Việt Nam mang
                    đến
                    cho khách hàng những sản phẩm: chất lượng cao, giá thành rẻ với thời gian nhanh nhất.
                </div>
            </div>
        </article>

        <article class="article" id="he-thong-nha-xuong">
            <h3 class="article__title">Hệ thống nhà xưởng</h3>
            <div class="article__content">
                <div class="content__item content__text">Một số ảnh chụp thực tế tại nhà xưởng:</div>
                <figure class="content__item content__figure">
                    <img src="assets/images/may-in.jpg" alt="Máy in Mitsubishi" class="figure__image">
                    <figcaption class="figure__caption">Hệ thống máy in Mitsubishi hiện đại</figcaption>
                </figure>
                <figure class="content__item content__figure">
                    <img src="assets/images/phong-van-hanh.JPG" alt="Phòng vận hành" class="figure__image">
                    <figcaption class="figure__caption">Phòng vận hành với các trang thiết bị hiện đại nhất,
                        kiểm soát vận hành của toàn bộ xưởng in</figcaption>
                </figure>
                <figure class="content__item content__figure">
                    <img src="assets/images/in-mau.jpg" alt="Máy in màu, in quảng cáo" class="figure__image">
                    <figcaption class="figure__caption">Khu in màu, in quảng cáo</figcaption>
                </figure>
                <figure class="content__item content__figure">
                    <img src="assets/images/kho-chua.jpg" alt="Kho chứa nguyên liệu và sản phẩm in ấn" class="figure__image">
                    <figcaption class="figure__caption">Kho chứa nguyên liệu và sản phẩm in ấn, đảm bảo an toàn, chống
                        lại các điều kiện tự nhiên khắc nghiệt</figcaption>
                </figure>
            </div>
        </article>

    </main>

    <!-- FOOTER -->
    <%@ include file="includes/footer.jsp" %>

    <script src="src/lib/jquery-3.3.1.min.js"></script>
    <script src="src/js/main.js"></script>
</body>

</html>