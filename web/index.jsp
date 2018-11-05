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

<body>
    <%-- HEADER --%>
    <%@ include file="src/includes/header.jsp" %>

    <%-- NAVIGATION --%>
    <%@ include file="src/includes/nav.jsp" %>

    <%-- CONTENT --%>
    <section class="section" id="">
        <div class="container">
            <h2 class="section__title">Trang chủ</h2>

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


            <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, amet maxime, quo accusamus, aut
                necessitatibus incidunt ut odio possimus magni architecto nostrum cum dignissimos cupiditate. Aliquam
                voluptas quam delectus optio!</div>
            <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, amet maxime, quo accusamus, aut
                necessitatibus incidunt ut odio possimus magni architecto nostrum cum dignissimos cupiditate. Aliquam
                voluptas quam delectus optio!</div>
            <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, amet maxime, quo accusamus, aut
                necessitatibus incidunt ut odio possimus magni architecto nostrum cum dignissimos cupiditate. Aliquam
                voluptas quam delectus optio!</div>
            <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, amet maxime, quo accusamus, aut
                necessitatibus incidunt ut odio possimus magni architecto nostrum cum dignissimos cupiditate. Aliquam
                voluptas quam delectus optio!</div>
            <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, amet maxime, quo accusamus, aut
                necessitatibus incidunt ut odio possimus magni architecto nostrum cum dignissimos cupiditate. Aliquam
                voluptas quam delectus optio!</div>
            <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, amet maxime, quo accusamus, aut
                necessitatibus incidunt ut odio possimus magni architecto nostrum cum dignissimos cupiditate. Aliquam
                voluptas quam delectus optio!</div>
            <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, amet maxime, quo accusamus, aut
                necessitatibus incidunt ut odio possimus magni architecto nostrum cum dignissimos cupiditate. Aliquam
                voluptas quam delectus optio!</div>
            <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, amet maxime, quo accusamus, aut
                necessitatibus incidunt ut odio possimus magni architecto nostrum cum dignissimos cupiditate. Aliquam
                voluptas quam delectus optio!</div>
            <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, amet maxime, quo accusamus, aut
                necessitatibus incidunt ut odio possimus magni architecto nostrum cum dignissimos cupiditate. Aliquam
                voluptas quam delectus optio!</div>
            <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, amet maxime, quo accusamus, aut
                necessitatibus incidunt ut odio possimus magni architecto nostrum cum dignissimos cupiditate. Aliquam
                voluptas quam delectus optio!</div>
            <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, amet maxime, quo accusamus, aut
                necessitatibus incidunt ut odio possimus magni architecto nostrum cum dignissimos cupiditate. Aliquam
                voluptas quam delectus optio!</div>
            <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, amet maxime, quo accusamus, aut
                necessitatibus incidunt ut odio possimus magni architecto nostrum cum dignissimos cupiditate. Aliquam
                voluptas quam delectus optio!</div>
            <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, amet maxime, quo accusamus, aut
                necessitatibus incidunt ut odio possimus magni architecto nostrum cum dignissimos cupiditate. Aliquam
                voluptas quam delectus optio!</div>
            <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, amet maxime, quo accusamus, aut
                necessitatibus incidunt ut odio possimus magni architecto nostrum cum dignissimos cupiditate. Aliquam
                voluptas quam delectus optio!</div>
            <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, amet maxime, quo accusamus, aut
                necessitatibus incidunt ut odio possimus magni architecto nostrum cum dignissimos cupiditate. Aliquam
                voluptas quam delectus optio!</div>
        </div>
    </section>

    <!-- FOOTER -->
    <%@ include file="src/includes/footer.jsp" %>

    <script src="src/lib/jquery-3.3.1.min.js"></script>
    <script src="src/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="src/js/main.js"></script>
    <!-- Call the Owl initializer function -->
    <script>
        $(document).ready(function () {
            $(".owl-carousel").owlCarousel(
                {
                    items: 1,
                    loop: true,
                    margin: 10,
                    autoplay: true,
                    autoHeight: true
                }
            );
        });
    </script>
</body>

</html>