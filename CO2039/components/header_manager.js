class Header_Manager extends HTMLElement {
    constructor() {
        super();
    }

    connectedCallback() {
        this.innerHTML = `
        <div class="content_1">
            <div class="sub_content">
                <div class="navbar">
                    <!-- Logo -->
                    <div class="wrap-left">
                        <a href="./index.jsp" class="logo">
                            <img src="./assets/img/logo.png" alt="Thợ Code Bán Giày" />
                        </a>
                        <!-- Navigation -->
                        <ul class="list">
                            <li>
                                <a href="index-manager.jsp">TỔNG QUAN</a>
                            </li>
                            <li>
                                <a href="warehouse.jsp">KHO HÀNG</a>
                            </li>
                            <li>
                                <a href="#!">BÁO CÁO</a>
                                <ul class="sub-list">
                                    <li>
                                        <a href="#!">Doanh Thu Thuần</a>
                                    </li>
                                    <li>
                                        <a href="#!">Lợi Nhuận</a>
                                    </li>
                                    <li>
                                        <a href="#!">Hàng Hóa</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#!">ĐỐI TÁC</a>
                                <ul class="sub-list">
                                    <li>
                                        <a href="users.jsp">Khách Hàng</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>`;
    }
}

customElements.define("header_manager-component", Header_Manager);
