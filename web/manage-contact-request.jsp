<%@page import="Model.Request"%>
<%@page import="DAO.RequestDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Utilities.Utils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
    <title>Quản lý yêu cầu liên hệ - Công ty In ấn Ao Sen đệ nhất photo</title>
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

    <main class="main-content container" id="main-content">
        <h2 class="main-content__title">Quản lý yêu cầu liên hệ</h2>

        <div class="row">
            <%
                if ("change-status".equalsIgnoreCase((String)request.getAttribute("action")) && "success".equalsIgnoreCase((String)request.getAttribute("status"))) {
            %>
            <div class="message_div">
                <div class="dialog__container dialog__container--success">
                    <div class="dialog__dismiss-button dialog__dismiss-button--success js-dialogDismissButton">
                        <i class="fas fa-times"></i>
                    </div>
                    <div class="dialog__content">
                        <p>Cập nhật yêu cầu liên hệ thành công!</p>
                    </div>
                </div>
            </div>
            <%  
                }
            %>
            <%
                if ("delete-request".equalsIgnoreCase((String)request.getAttribute("action")) && "success".equalsIgnoreCase((String)request.getAttribute("status"))) {
            %>
            <div class="message_div">
                <div class="dialog__container dialog__container--success">
                    <div class="dialog__dismiss-button dialog__dismiss-button--success js-dialogDismissButton">
                        <i class="fas fa-times"></i>
                    </div>
                    <div class="dialog__content">
                        <p>Xóa yêu cầu liên hệ thành công!</p>
                    </div>
                </div>
            </div>
            <%  
                }
            %>
        </div>

        <section class="section">
            <h3 class="main-content__sub-title">Yêu cầu đang chờ</h3>

            <%
                ArrayList<Request> pendingRequestList = RequestDAO.getAllPendingRequests();
            %>

            <table class="crud-table" id="all-customers">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Ngày gửi</th>
                        <th>Tên khách hàng</th>
                        <th>Email</th>
                        <th>Số điện thoại</th>
                        <th>Nội dung</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (int i = 0; i < pendingRequestList.size(); i++) {
                            Request contactRequest = new Request();
                            contactRequest = pendingRequestList.get(i);
                    %>
                    <tr>
                        <td>
                            <%= contactRequest.getId() %>
                        </td>
                        <td>
                            <%= contactRequest.getSendDate() %>
                        </td>
                        <td>
                            <%= contactRequest.getCustomerName() %>
                        </td>
                        <td>
                            <%= contactRequest.getEmail() %>
                        </td>
                        <td>
                            <%= contactRequest.getPhoneNumber() %>
                        </td>
                        <td>
                            <%= Utils.ellipsize(contactRequest.getMessage(), 15) %>
                        </td>
                        <td>
                            <form class="action-form" action="ContactRequestCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="view">
                                <input type="hidden" name="id" value="<%=contactRequest.getId()%>">
                                <button type="submit" class="action__button action__button--view">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </form>
                            <form class="action-form" action="ContactRequestCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="change-status">
                                <input type="hidden" name="id" value="<%=contactRequest.getId()%>">
                                <input type="hidden" name="to" value="completed">
                                <button type="submit" class="action__button action__button--done" onclick="return confirm('Chuyển trạng thái cho bản ghi này?')">
                                    <i class="fas fa-check"></i>
                                </button>
                            </form>
                            <form class="action-form" action="ContactRequestCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<%=contactRequest.getId()%>">
                                <button type="submit" class="action__button action__button--delete" onclick="return confirm('Bạn có chắc muốn xóa bản ghi này?')">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </section>

        <section class="section">
            <h3 class="main-content__sub-title">Yêu cầu đã xử lý</h3>

            <%
                ArrayList<Request> completedRequestList = RequestDAO.getAllCompletedRequests();
            %>

            <table class="crud-table" id="all-customers">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Ngày gửi</th>
                        <th>Tên khách hàng</th>
                        <th>Email</th>
                        <th>Số điện thoại</th>
                        <th>Nội dung</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (int i = 0; i < completedRequestList.size(); i++) {
                            Request contactRequest = new Request();
                            contactRequest = completedRequestList.get(i);
                    %>
                    <tr>
                        <td>
                            <%= contactRequest.getId() %>
                        </td>
                        <td>
                            <%= contactRequest.getSendDate() %>
                        </td>
                        <td>
                            <%= contactRequest.getCustomerName() %>
                        </td>
                        <td>
                            <%= contactRequest.getEmail() %>
                        </td>
                        <td>
                            <%= contactRequest.getPhoneNumber() %>
                        </td>
                        <td>
                            <%= Utils.ellipsize(contactRequest.getMessage(), 15) %>
                        </td>
                        <td>
                            <form class="action-form" action="ContactRequestCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="view">
                                <input type="hidden" name="id" value="<%=contactRequest.getId()%>">
                                <button type="submit" class="action__button action__button--view">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </form>
                            <form class="action-form" action="ContactRequestCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="change-status">
                                <input type="hidden" name="id" value="<%=contactRequest.getId()%>">
                                <input type="hidden" name="to" value="pending">
                                <button type="submit" class="action__button action__button--not-done" onclick="return confirm('Chuyển trạng thái cho bản ghi này?')">
                                    <i class="fas fa-times"></i>
                                </button>
                            </form>
                            <form class="action-form" action="ContactRequestCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<%=contactRequest.getId()%>">
                                <button type="submit" class="action__button action__button--delete" onclick="return confirm('Bạn có chắc muốn xóa bản ghi này?')">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </section>
    </main>

    <!-- FOOTER -->
    <%@ include file="includes/admin-footer.jsp" %>

    <script src="src/lib/jquery-3.3.1.min.js"></script>
    <script src="src/js/main.js"></script>

</body>

</html>