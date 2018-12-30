<%@page import="DAO.OrderDAO"%>
<%@page import="Model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
    <title>Quản lý đơn hàng - Công ty In ấn Ao Sen đệ nhất photo</title>
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

<body data-page-name="manage-order">
    <%-- HEADER --%>
    <%@ include file="includes/admin-header.jsp" %>

    <%-- NAVIGATION --%>
    <jsp:include page="/includes/admin-nav.jsp" />

    <%-- CONTENT --%>

    <main class="main-content container" id="main-content">
        <h2 class="main-content__title">Quản lý đơn hàng</h2>

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
                        <p>Chuyển trạng thái đơn hàng thành công!</p>
                    </div>
                </div>
            </div>
            <%  
                }
            %>
            <%
                if ("edit-order".equalsIgnoreCase((String)request.getAttribute("action")) && "success".equalsIgnoreCase((String)request.getAttribute("status"))) {
            %>
            <div class="message_div">
                <div class="dialog__container dialog__container--success">
                    <div class="dialog__dismiss-button dialog__dismiss-button--success js-dialogDismissButton">
                        <i class="fas fa-times"></i>
                    </div>
                    <div class="dialog__content">
                        <p>Cập nhật thông tin đơn hàng thành công!</p>
                    </div>
                </div>
            </div>
            <%  
                }
            %>
            <%
                if ("delete-order".equalsIgnoreCase((String)request.getAttribute("action")) && "success".equalsIgnoreCase((String)request.getAttribute("status"))) {
            %>
            <div class="message_div">
                <div class="dialog__container dialog__container--success">
                    <div class="dialog__dismiss-button dialog__dismiss-button--success js-dialogDismissButton">
                        <i class="fas fa-times"></i>
                    </div>
                    <div class="dialog__content">
                        <p>Xóa đơn hàng thành công!</p>
                    </div>
                </div>
            </div>
            <%  
                }
            %>
        </div>

        <section class="section">
            <h3 class="main-content__sub-title">Đơn hàng đang chờ</h3>
            <%
                ArrayList<Order> pendingOrderList = OrderDAO.selectOrderByStatus("pending");
            %>

            <table class="crud-table" id="all-customers">
                <thead>
                    <tr>
                        <th>Mã số</th>
                        <th>Ngày đặt</th>
                        <th>Tên khách hàng</th>
                        <th>Mô tả</th>
                        <th>Thành tiền</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>

                    <% 
                        for (int i = 0; i < pendingOrderList.size(); i++) {
                            Order order = new Order();
                            order = pendingOrderList.get(i);
                    %>

                    <tr>
                        <td>
                            <%=order.getId()%>
                        </td>
                        <td>
                            <%=order.getDate()%>
                        </td>
                        <td>
                            <%=order.getCustomerName()%>
                        </td>
                        <td>
                            <%
                                String[] orderRequirement = order.getDescription().split(";");
                                String[] fullRequirement = new String[orderRequirement.length];
                                for(int j = 0 ; j < 9; j++){
                                    if(orderRequirement[j].split(":").length == 2){
                                        fullRequirement[j] = orderRequirement[j].split(":")[1];
                                    }
                                    else {
                                        fullRequirement[j] = "";
                                    }
                                    if (fullRequirement[j].equals("null") || fullRequirement[j].equals("")) fullRequirement[j] = "Không";
                                }
                                String stdDescription = "";
                                stdDescription += "Tổng số trang: " + fullRequirement[0] + ", ";
                                stdDescription += "Số bản: " + fullRequirement[1] + ", ";
                                stdDescription += "Số mặt in: " + fullRequirement[2] + ", ";
                                stdDescription += "Khổ giấy: " + fullRequirement[3] + ", ";
                                stdDescription += "Chất liệu giấy ruột: " + fullRequirement[4] + ", ";
                                stdDescription += "Đóng quyển: " + fullRequirement[5] + ", ";
                                stdDescription += "Quy cách: " + fullRequirement[6] + ", ";
                                stdDescription += "Chất liệu bìa: " + fullRequirement[7] + ", ";
                                stdDescription += "Yêu cầu khác: " + fullRequirement[8];
                            %>
                            <%= stdDescription %>
                        </td>
                        <td>
                            <%=order.getTotal()%>
                        </td>
                        <td>
                            <form class="action-form" action="OrderCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="view">
                                <input type="hidden" name="id" value="<%=order.getId()%>">
                                <button type="submit" class="action__button action__button--view">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </form>
                            <form class="action-form" action="OrderCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="change-status">
                                <input type="hidden" name="id" value="<%=order.getId()%>">
                                <input type="hidden" name="to" value="inprogress">
                                <button type="submit" class="action__button action__button--in-progress" onclick="return confirm('Duyệt và thực hiện đơn hàng?');">
                                    <i class="fas fa-clock"></i>
                                </button>
                            </form>
                            <form class="action-form" action="OrderCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="change-status">
                                <input type="hidden" name="id" value="<%=order.getId()%>">
                                <input type="hidden" name="to" value="cancelled">
                                <button type="submit" class="action__button action__button--cancel" onclick="return confirm('Hủy đơn hàng?');">
                                    <i class="fas fa-times"></i>
                                </button>
                            </form>
                            <form class="action-form" action="OrderCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="edit">
                                <input type="hidden" name="id" value="<%=order.getId()%>">
                                <button type="submit" class="action__button action__button--edit">
                                    <i class="fas fa-edit"></i>
                                </button>
                            </form>
                            <form class="action-form" action="OrderCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<%=order.getId()%>">
                                <button type="submit" class="action__button action__button--delete" onclick="return confirm('Xóa đơn hàng?');">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%
                        };
                    %>
                </tbody>
            </table>

        </section>

        <section class="section">
            <h3 class="main-content__sub-title">Đơn hàng đang thực hiện</h3>
            <%
                ArrayList<Order> inProgressOrderList = OrderDAO.selectOrderByStatus("inprogress");
            %>

            <table class="crud-table" id="all-customers">
                <thead>
                    <tr>
                        <th>Mã số</th>
                        <th>Ngày đặt</th>
                        <th>Tên khách hàng</th>
                        <th>Mô tả</th>
                        <th>Thành tiền</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>

                    <% 
                        for (int i = 0; i < inProgressOrderList.size(); i++) {
                            Order order = new Order();
                            order = inProgressOrderList.get(i);
                    %>

                    <tr>
                        <td>
                            <%=order.getId()%>
                        </td>
                        <td>
                            <%=order.getDate()%>
                        </td>
                        <td>
                            <%=order.getCustomerName()%>
                        </td>
                        <td>
                            <%
                                String[] orderRequirement = order.getDescription().split(";");
                                String[] fullRequirement = new String[orderRequirement.length];
                                for(int j = 0 ; j < 9; j++){
                                    if(orderRequirement[j].split(":").length == 2){
                                        fullRequirement[j] = orderRequirement[j].split(":")[1];
                                    }
                                    else {
                                        fullRequirement[j] = "";
                                    }
                                    if (fullRequirement[j].equals("null") || fullRequirement[j].equals("")) fullRequirement[j] = "Không";
                                }
                                String stdDescription = "";
                                stdDescription += "Tổng số trang: " + fullRequirement[0] + ", ";
                                stdDescription += "Số bản: " + fullRequirement[1] + ", ";
                                stdDescription += "Số mặt in: " + fullRequirement[2] + ", ";
                                stdDescription += "Khổ giấy: " + fullRequirement[3] + ", ";
                                stdDescription += "Chất liệu giấy ruột: " + fullRequirement[4] + ", ";
                                stdDescription += "Đóng quyển: " + fullRequirement[5] + ", ";
                                stdDescription += "Quy cách: " + fullRequirement[6] + ", ";
                                stdDescription += "Chất liệu bìa: " + fullRequirement[7] + ", ";
                                stdDescription += "Yêu cầu khác: " + fullRequirement[8];
                            %>
                            <%= stdDescription %>
                        </td>
                        <td>
                            <%=order.getTotal()%>
                        </td>
                        <td>
                            <form class="action-form" action="OrderCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="view">
                                <input type="hidden" name="id" value="<%=order.getId()%>">
                                <button type="submit" class="action__button action__button--view">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </form>
                            <form class="action-form" action="OrderCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="change-status">
                                <input type="hidden" name="id" value="<%=order.getId()%>">
                                <input type="hidden" name="to" value="completed">
                                <button type="submit" class="action__button action__button--done" onclick="return confirm('Hoàn thành đơn hàng?');">
                                    <i class="fas fa-check"></i>
                                </button>
                            </form>
                            <form class="action-form" action="OrderCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="change-status">
                                <input type="hidden" name="id" value="<%=order.getId()%>">
                                <input type="hidden" name="to" value="cancelled">
                                <button type="submit" class="action__button action__button--cancel" onclick="return confirm('Hủy đơn hàng?');">
                                    <i class="fas fa-times"></i>
                                </button>
                            </form>
                            <form class="action-form" action="OrderCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="edit">
                                <input type="hidden" name="id" value="<%=order.getId()%>">
                                <button type="submit" class="action__button action__button--edit">
                                    <i class="fas fa-edit"></i>
                                </button>
                            </form>
                            <form class="action-form" action="OrderCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<%=order.getId()%>">
                                <button type="submit" class="action__button action__button--delete" onclick="return confirm('Xóa đơn hàng?');">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%
                        };
                    %>
                </tbody>
            </table>

        </section>


        <section class="section">
            <h3 class="main-content__sub-title">Đơn hàng đã hoàn thành</h3>

            <%
                ArrayList<Order> completedOrderList = OrderDAO.selectOrderByStatus("completed");
            %>

            <table class="crud-table" id="all-customers">
                <thead>
                    <tr>
                        <th>Mã số</th>
                        <th>Ngày đặt</th>
                        <th>Tên khách hàng</th>
                        <th>Mô tả</th>
                        <th>Thành tiền</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>

                    <% 
                        for (int i = 0; i < completedOrderList.size(); i++) {
                            Order order = new Order();
                            order = completedOrderList.get(i);
                    %>

                    <tr>
                        <td>
                            <%=order.getId()%>
                        </td>
                        <td>
                            <%=order.getDate()%>
                        </td>
                        <td>
                            <%=order.getCustomerName()%>
                        </td>
                        <td>
                            <%
                                String[] orderRequirement = order.getDescription().split(";");
                                String[] fullRequirement = new String[orderRequirement.length];
                                for(int j = 0 ; j < 9; j++){
                                    if(orderRequirement[j].split(":").length == 2){
                                        fullRequirement[j] = orderRequirement[j].split(":")[1];
                                    }
                                    else {
                                        fullRequirement[j] = "";
                                    }
                                    if (fullRequirement[j].equals("null") || fullRequirement[j].equals("")) fullRequirement[j] = "Không";
                                }
                                String stdDescription = "";
                                stdDescription += "Tổng số trang: " + fullRequirement[0] + ", ";
                                stdDescription += "Số bản: " + fullRequirement[1] + ", ";
                                stdDescription += "Số mặt in: " + fullRequirement[2] + ", ";
                                stdDescription += "Khổ giấy: " + fullRequirement[3] + ", ";
                                stdDescription += "Chất liệu giấy ruột: " + fullRequirement[4] + ", ";
                                stdDescription += "Đóng quyển: " + fullRequirement[5] + ", ";
                                stdDescription += "Quy cách: " + fullRequirement[6] + ", ";
                                stdDescription += "Chất liệu bìa: " + fullRequirement[7] + ", ";
                                stdDescription += "Yêu cầu khác: " + fullRequirement[8];
                            %>
                            <%= stdDescription %>
                        </td>
                        <td>
                            <%=order.getTotal()%>
                        </td>
                        <td>
                            <form class="action-form" action="OrderCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="view">
                                <input type="hidden" name="id" value="<%=order.getId()%>">
                                <button type="submit" class="action__button action__button--view">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </form>
                            <form class="action-form" action="OrderCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="edit">
                                <input type="hidden" name="id" value="<%=order.getId()%>">
                                <button type="submit" class="action__button action__button--edit">
                                    <i class="fas fa-edit"></i>
                                </button>
                            </form>
                            <form class="action-form" action="OrderCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<%=order.getId()%>">
                                <button type="submit" class="action__button action__button--delete" onclick="return confirm('Xóa đơn hàng?');">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%
                        };
                    %>
                </tbody>
            </table>
        </section>

        <section class="section">
            <h3 class="main-content__sub-title">Đơn hàng đã hủy</h3>

            <%
                ArrayList<Order> cancelledOrderList = OrderDAO.selectOrderByStatus("cancelled");
            %>

            <table class="crud-table" id="all-customers">
                <thead>
                    <tr>
                        <th>Mã số</th>
                        <th>Ngày đặt</th>
                        <th>Tên khách hàng</th>
                        <th>Mô tả</th>
                        <th>Thành tiền</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>

                    <% 
                    for (int i = 0; i < cancelledOrderList.size(); i++) {
                        Order order = new Order();
                        order = cancelledOrderList.get(i);
                %>

                    <tr>
                        <td>
                            <%=order.getId()%>
                        </td>
                        <td>
                            <%=order.getDate()%>
                        </td>
                        <td>
                            <%=order.getCustomerName()%>
                        </td>
                        <td>
                            <%
                                String[] orderRequirement = order.getDescription().split(";");
                                String[] fullRequirement = new String[orderRequirement.length];
                                for(int j = 0 ; j < 9; j++){
                                    if(orderRequirement[j].split(":").length == 2){
                                        fullRequirement[j] = orderRequirement[j].split(":")[1];
                                    }
                                    else {
                                        fullRequirement[j] = "";
                                    }
                                    if (fullRequirement[j].equals("null") || fullRequirement[j].equals("")) fullRequirement[j] = "Không";
                                }
                                String stdDescription = "";
                                stdDescription += "Tổng số trang: " + fullRequirement[0] + ", ";
                                stdDescription += "Số bản: " + fullRequirement[1] + ", ";
                                stdDescription += "Số mặt in: " + fullRequirement[2] + ", ";
                                stdDescription += "Khổ giấy: " + fullRequirement[3] + ", ";
                                stdDescription += "Chất liệu giấy ruột: " + fullRequirement[4] + ", ";
                                stdDescription += "Đóng quyển: " + fullRequirement[5] + ", ";
                                stdDescription += "Quy cách: " + fullRequirement[6] + ", ";
                                stdDescription += "Chất liệu bìa: " + fullRequirement[7] + ", ";
                                stdDescription += "Yêu cầu khác: " + fullRequirement[8];
                            %>
                            <%= stdDescription %>
                        </td>
                        <td>
                            <%=order.getTotal()%>
                        </td>
                        <td>
                            <form class="action-form" action="OrderCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="view">
                                <input type="hidden" name="id" value="<%=order.getId()%>">
                                <button type="submit" class="action__button action__button--view">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </form>
                            <form class="action-form" action="OrderCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<%=order.getId()%>">
                                <button type="submit" class="action__button action__button--delete" onclick="return confirm('Xóa đơn hàng?');">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%
                    };
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