<%@page import="DAO.OrderDAO"%>
<%@page import="Model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
    <title>Chi tiết đơn hàng - Công ty In ấn Ao Sen đệ nhất photo</title>
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

<body data-page-name="manage-order">
    <%-- HEADER --%>
    <%@ include file="includes/customer-header.jsp" %>

    <%-- NAVIGATION --%>
    <jsp:include page="/includes/customer-nav.jsp" />

    <%-- CONTENT --%>
    <%
            Order order = (Order)request.getAttribute("order");
            String[] orderRequirement = order.getDescription().split(";");
        %>
    <main class="main-content container">
        <section class="section">
            <h2 class="main-content__title">Thông tin đơn hàng</h2>

            <div class="info-card">
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Mã đơn hàng</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">
                            <%=order.getId()%>
                        </div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Ngày giờ gửi</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">
                            <%=order.getDate()%>
                        </div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Trạng thái</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">
                            <%
                                if (order.getStatus().trim().equals("pending")) {
                            %>
                            Đang chờ
                            <%
                                }
                                else if (order.getStatus().trim().equals("inprogress")) {
                            %>
                            Đang thực hiện
                            <%
                                }
                                else if (order.getStatus().trim().equals("completed")) {
                            %>
                            Hoàn thành
                            <%
                                }
                                else {
                            %>
                            Đã hủy
                            <%
                                } // end if
                            %>
                        </div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">File cần in</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">
                            <%=order.getFilename()%>
                        </div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Tổng số trang</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">
                            <%=orderRequirement[0].split(":")[1]%>
                        </div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Số bản</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">
                            <%=orderRequirement[1].split(":")[1]%>
                        </div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Số mặt in</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">
                            <%=orderRequirement[2].split(":")[1]%>
                        </div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Khổ giấy</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">
                            <%=orderRequirement[3].split(":")[1]%>
                        </div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Chất liệu ruột</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">
                            <%=orderRequirement[4].split(":")[1]%>
                        </div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Đóng quyển</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">
                            <%=orderRequirement[5].split(":")[1]%>
                        </div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Quy cách</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">
                            <%=orderRequirement[6].split(":")[1]%>
                        </div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Chất liệu bìa</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">
                            <%=orderRequirement[7].split(":")[1]%>
                        </div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Yêu cầu khác</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">
                            <%
                                if (orderRequirement[8].split(":").length == 2) {
                            %>
                            <%=orderRequirement[8].split(":")[1]%>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>

                <hr>

                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Họ và tên</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">
                            <%= order.getCustomerName() %>
                        </div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Email</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">
                            <%= order.getCustomerEmail() %>
                        </div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Số điện thoại</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">
                            <%= order.getCustomerPhone() %>
                        </div>
                    </div>
                </div>
                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Địa chỉ</div>
                    </div>
                    <div class="eight columns">
                        <div class="info-card__text">
                            <%= order.getCustomerAddress() %>
                        </div>
                    </div>
                </div>

                <%
                    if (order.getStatus().trim().equals("pending")) {
                %>
                <hr>

                <div class="row info-card__line-wrapper">
                    <div class="four columns">
                        <div class="info-card__label theme__text--bold">Hành động</div>
                    </div>
                    <div class="eight columns">
                        <form class="action-form" action="CustomerCancelOrder" method="GET">
                            <input type="hidden" name="id" value="<%=order.getId()%>">
                            <button type="submit" class="action__button action__button--cancel" onclick="return confirm('Hủy đơn hàng?');">
                                <i class="fas fa-times"></i>
                            </button>
                        </form>
                    </div>
                </div>
                <%
                    }
                %>
        </section>
    </main>

    <!-- FOOTER -->
    <%@ include file="includes/customer-footer.jsp" %>

    <script src="src/lib/jquery-3.3.1.min.js"></script>
    <script src="src/js/main.js"></script>
    <script src="src/js/universal-form.js"></script>

</body>

</html>