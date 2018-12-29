<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>
    <nav class="navigation" id="navigation">
        <div class="container u-full-width">
            <ul class="navigation__nav-list">
                <li data-item-name="home" class="nav-list__item">
                    <a href="index.jsp"><i class="fas fa-home nav-list__icon"></i><span class="nav-list__text">&nbsp;Trang
                            chủ</span></a>
                </li>
                <li data-item-name="about" class="nav-list__item">
                    <a href="about.jsp"><i class="fas fa-address-card nav-list__icon"></i><span class="nav-list__text">
                            &nbsp;Giới thiệu</span></a>
                </li>
                <li data-item-name="pricing" class="nav-list__item">
                    <a href="pricing.jsp"><i class="fas fa-dollar-sign nav-list__icon"></i><span class="nav-list__text">&nbsp;Báo
                            giá</span></a>
                </li>
                <li data-item-name="order" class="nav-list__item">
                    <a href="order.jsp"><i class="fas fa-receipt nav-list__icon"></i><span class="nav-list__text">&nbsp;Đặt
                            hàng</span></a>
                </li>
                <li data-item-name="contact" class="nav-list__item">
                    <a href="contact.jsp"><i class="fas fa-phone nav-list__icon"></i><span class="nav-list__text">&nbsp;Liên
                            hệ</span></a>
                </li>

                <%
                    if(session.getAttribute("loggedIn") == null) {
                %>
                <li data-item-name="account" class="nav-list__item">
                    <a href="login.jsp"><i class="fas fa-user nav-list__icon"></i><span class="nav-list__text">&nbsp;Tài
                            khoản</span></a>
                </li>
                <%  
                   }    
                %>

                <%
                    if(session.getAttribute("loggedIn") != null){
                %>
                <li data-item-name="account" class="nav-list__item">
                    <a href="account.jsp"><i class="fas fa-user nav-list__icon"></i><span class="nav-list__text">
                        &nbsp;Xin chào <span class="session__username">${sessionScope.currentUser.getFullname()}</span>
                    </span></a>
                </li>
                <%  
                   }    
                %>
            </ul>
        </div>
    </nav>
</body>