<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>
    <nav class="navigation" id="navigation">
        <div class="container u-full-width">
            <ul class="navigation__nav-list">
                <li data-item-name="home" class="nav-list__item">
                    <a href="admin.jsp"><i class="fas fa-columns nav-list__icon"></i><span class="nav-list__text">
                            &nbsp;Bảng điều khiển</span></a>
                </li>
                <li data-item-name="manage-customer" class="nav-list__item">
                    <a href="manage-customer.jsp"><i class="fas fa-user nav-list__icon"></i><span class="nav-list__text">
                            &nbsp;Quản lý Tài khoản khách hàng</span></a>
                </li>
                <li data-item-name="manage-order" class="nav-list__item">
                    <a href="manage-order.jsp"><i class="fas fa-receipt nav-list__icon"></i><span class="nav-list__text">
                            &nbsp;Quản lý Đơn hàng</span></a>
                </li>
                <li data-item-name="manage-contact-request" class="nav-list__item">
                    <a href="manage-contact-request.jsp"><i class="fas fa-address-card nav-list__icon"></i><span class="nav-list__text">
                            &nbsp;Quản lý Yêu cầu liên hệ</span></a>
                </li>
                <li data-item-name="manage-admin" class="nav-list__item">
                    <a href="admin-account.jsp"><i class="fas fa-user-tie nav-list__icon"></i><span class="nav-list__text">
                            &nbsp;Xin chào <span class="session__username">người dùng</span></span></a>
                </li>
            </ul>
        </div>
    </nav>
</body>