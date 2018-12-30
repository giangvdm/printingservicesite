<%@page import="Model.Request"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
    <title>Chi tiết yêu cầu liên hệ - Công ty In ấn Ao Sen đệ nhất photo</title>
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

<body data-page-name="manage-contact-request">
    <%-- HEADER --%>
    <%@ include file="includes/admin-header.jsp" %>

    <%-- NAVIGATION --%>
    <jsp:include page="/includes/admin-nav.jsp" />

    <%-- CONTENT --%>
    <main class="main-content container">
        <section class="section">
            <h2 class="main-content__title">Chi tiết yêu cầu liên hệ</h2>

            <%
                Request currentReq = (Request) request.getAttribute("contactRequest");
            %>

            <div class="info-card">
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Mã số</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">${requestScope.contactRequest.getId()}</div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Ngày giờ gửi</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">${requestScope.contactRequest.getSendDate()}</div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Họ và tên khách hàng</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">${requestScope.contactRequest.getCustomerName()}</div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Email</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">${requestScope.contactRequest.getEmail()}</div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Số điện thoại</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">${requestScope.contactRequest.getPhoneNumber()}</div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Nội dung liên hệ</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">${requestScope.contactRequest.getMessage()}</div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Trạng thái</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">
                            <%
                                if (currentReq.getStatus().equals("pending")) {
                            %>
                            Đang chờ
                            <%
                                } else {
                            %>
                            Đã xử lý
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Hành động</div>
                    </div>
                    <div class="eight columns">
                        <%
                            if (currentReq.getStatus().equals("pending")) { 
                        %>
                        <form class="action-form" action="ContactRequestCRUDServlet" method="GET">
                            <input type="hidden" name="action" value="change-status">
                            <input type="hidden" name="id" value="${requestScope.contactRequest.getId()}">
                            <input type="hidden" name="to" value="completed">
                            <button type="submit" class="action__button action__button--done" onclick="return confirm('Chuyển trạng thái cho bản ghi này?')">
                                <i class="fas fa-check"></i>
                            </button>
                        </form>
                        <% 
                            }
                            else if (currentReq.getStatus().equals("completed")) {
                        %>
                        <form class="action-form" action="ContactRequestCRUDServlet" method="GET">
                            <input type="hidden" name="action" value="change-status">
                            <input type="hidden" name="id" value="${requestScope.contactRequest.getId()}">
                            <input type="hidden" name="to" value="pending">
                            <button type="submit" class="action__button action__button--not-done" onclick="return confirm('Chuyển trạng thái cho bản ghi này?')">
                                <i class="fas fa-times"></i>
                            </button>
                        </form>
                        <%
                            }
                        %>
                        <form class="action-form" action="ContactRequestCRUDServlet" method="GET">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="${requestScope.contactRequest.getId()}">
                            <button type="submit" class="action__button action__button--delete" onclick="return confirm('Bạn có chắc muốn xóa bản ghi này?')">
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </form>
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