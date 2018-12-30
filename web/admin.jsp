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
    <link rel="stylesheet" type="text/css" href="src/css/admin-main.css">
</head>

<body data-page-name="home">
    <!-- Not logged in -->
    <%
        if(session.getAttribute("loggedIn") == null) {
    %>
    <main class="main-content container">
        <%-- LOGIN FORM --%>
        <section class="section">
            <h1 class="main-content__title">Đăng nhập Quản trị viên</h1>

            <div class="row">
                <%
                    if("error".equalsIgnoreCase((String)request.getAttribute("status"))){
                %>
                <div class="message_div">
                    <div class="dialog__container dialog__container--error">
                        <div class="dialog__dismiss-button dialog__dismiss-button-error js-dialogDismissButton">
                            <i class="fas fa-times"></i>
                        </div>
                        <div class="dialog__content">
                            <p>Tên đăng nhập hoặc mật khẩu không chính xác</p>
                        </div>
                    </div>
                </div>
                <%  
                    }    
                %>

            </div>

            <form action="LoginServlet" method="POST" class="form" id="login-form">
                <input type="hidden" name="user-type" value="admin">
                <fieldset>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label" for="username">Tên tài khoản</label>
                        </div>
                        <div class="seven columns">
                            <input type="text" id="username" name="username" required>
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label" for="password">Mật khẩu</label>
                        </div>
                        <div class="seven columns">
                            <input type="password" id="password" name="password" required>
                        </div>
                    </div>
                    <!-- <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label" for="remember-login">Ghi nhớ đăng nhập</label>
                        </div>
                        <div class="seven columns">
                            <input type="checkbox" name="remember-login" id="remember-login">
                        </div>
                    </div> -->
                </fieldset>
                <div class="row form__line-wrapper">
                    <div class="six columns form__button-container">
                        <input class="form__button form__button--submit" type="submit" value="Đăng nhập" id="submit-button">
                    </div>
                    <div class="six columns form__button-container">
                        <input class="form__button form__button--reset" type="reset" value="Điền lại" id="reset-button">
                    </div>
                </div>
            </form>
        </section>

    </main>
    <%
        }
    %>

    <!-- Admin logged in -->
    <%
        if(session.getAttribute("loggedIn") != null) {
    %>

    <%@page import="Model.User"%>
    <%@page import="DAO.UserDAO"%>
    <%@page import="Model.Request"%>
    <%@page import="DAO.RequestDAO"%>
    <%@page import="DAO.OrderDAO"%>
    <%@page import="Model.Order"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="Utilities.Utils"%>

    <%-- HEADER --%>
    <%@ include file="includes/admin-header.jsp" %>

    <%-- NAVIGATION --%>
    <jsp:include page="/includes/admin-nav.jsp" />

    <%-- CONTENT --%>

    <main class="main-content container" id="main-content">
        <h2 class="main-content__title">Bảng điều khiển</h2>

        <section class="section">
            <h3 class="main-content__sub-title">Thống kê tài khoản khách hàng</h3>

            <%
                ArrayList<User> userList = UserDAO.getUser(10);
            %>

            <table class="crud-table" id="all-customers">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên đăng nhập</th>
                        <th>Họ và tên</th>
                        <th>Email</th>
                        <th>Số điện thoại</th>
                        <th>Địa chỉ</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>

                    <% 
                        for (int i = 0; i < userList.size(); i++) {
                        User customer = new User();
                        customer = userList.get(i);
                    %>

                    <tr>
                        <td>
                            <%=customer.getId()%>
                        </td>
                        <td>
                            <%=customer.getUserName()%>
                        </td>
                        <td>
                            <%=customer.getFullname()%>
                        </td>
                        <td>
                            <%=customer.getEmail()%>
                        </td>
                        <td>
                            <%=customer.getPhoneNumber()%>
                        </td>
                        <td>
                            <%=customer.getAddress()%>
                        </td>
                        <td>
                            <form class="action-form" action="CustomerCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="edit">
                                <input type="hidden" name="id" value="<%=customer.getId()%>">
                                <button type="submit" class="action__button action__button--edit">
                                    <i class="fas fa-edit"></i>
                                </button>
                            </form>
                            <form class="action-form" action="CustomerCRUDServlet" method="GET">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<%=customer.getId()%>">
                                <button type="submit" class="action__button action__button--delete" onclick="return confirm('Bạn có chắc muốn xóa bản ghi này?')">
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
            <h3 class="main-content__sub-title">Đơn hàng đang chờ</h3>
            <%
                ArrayList<Order> pendingOrderList = OrderDAO.selectPendingOrders(10);
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
            <h3 class="main-content__sub-title">Yêu cầu đang chờ</h3>

            <%
                    ArrayList<Request> pendingRequestList = RequestDAO.getPendingRequests(5);
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
    </main>

    <!-- FOOTER -->
    <%@ include file="includes/admin-footer.jsp" %>
    <%
        }
    %>

    <script src="src/lib/jquery-3.3.1.min.js"></script>
    <script src="src/js/main.js"></script>

</body>

</html>