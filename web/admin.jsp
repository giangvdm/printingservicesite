<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
    <title>Trang Quản lý - Công ty In ấn Ao Sen đệ nhất photo</title>
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

<body data-page-name="home">
    <%-- HEADER --%>
    <%@ include file="includes/header.jsp" %>

    <%-- NAVIGATION --%>
    <jsp:include page="/includes/nav.jsp" />

    <%-- CONTENT --%>
    <main class="main-content container" id="main-content">
        <h2 class="main-content__title">Trang chủ</h2>

        
    </main>

    <!-- FOOTER -->
    <%@ include file="includes/footer.jsp" %>

    <script src="src/lib/jquery-3.3.1.min.js"></script>

</body>

</html>