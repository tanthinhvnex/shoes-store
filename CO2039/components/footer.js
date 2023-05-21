class Footer extends HTMLElement {
    constructor() {
        super();
    }
    connectedCallback() {
        this.innerHTML = `
        <div>
            <a href="https://www.facebook.com/ttvnex/">
                <i class="icon_messenger fa-brands fa-facebook-messenger"></i>
            </a>
        </div>
        <footer class="footer">
        <div class="sub_content">
            <div class="left">
                <ul class="list">
                    <li class="list_item">
                        <a href="./no-content.html">THÔNG TIN VỀ CÔNG TY</a>
                    </li>
                    <li class="list_item">
                        <a href="./no-content.html">Giới thiệu</a>
                    </li>
                    <li class="list_item">
                        <a href="./no-content.html">Cơ hội nghề nghiệp</a>
                    </li>
                    <li class="list_item">
                        <a href="./no-content.html">Tin tức</a>
                    </li>
                </ul>
                <ul class="list">
                    <li class="list_item">
                        <a href="./no-content.html">HỖ TRỢ KHÁCH HÀNG</a>
                    </li>
                    <li class="list_item">
                        <a href="./no-content.html">Chăm sóc khách hàng</a>
                    </li>
                    <li class="list_item">
                        <a href="./no-content.html">Thanh toán</a>
                    </li>
                    <li class="list_item">
                        <a href="./no-content.html">Hướng dẫn mua hàng</a>
                    </li>
                </ul>
                <ul class="list">
                    <li class="list_item">
                        <a href="./no-content.html">CHÍNH SÁCH</a>
                    </li>
                    <li class="list_item">
                        <a href="./no-content.html">Chế độ bảo hành</a>
                    </li>
                    <li class="list_item">
                        <a href="./no-content.html">Chính sách đổi hàng</a>
                    </li>
                    <li class="list_item">
                        <a href="./no-content.html">Bảo mật thông tin</a>
                    </li>
                    <li class="list_item">
                        <a href="./no-content.html">Chính sách giao nhận</a>
                    </li>
                </ul>
            </div>
            <div class="right">
                <ul class="list">
                    <li class="list_item">
                        <a href="./no-content.html"><i class="fa-brands fa-twitter"></i></a>
                    </li>
                    <li class="list_item">
                        <a href="https://www.facebook.com/ttvnex/"><i class="fa-brands fa-facebook"></i></a>
                    </li>
                    <li class="list_item">
                        <a href="./no-content.html"><i class="fa-brands fa-youtube"></i></a>
                    </li>
                    <li class="list_item">
                        <a href="./no-content.html"><i class="fa-brands fa-square-instagram"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </footer>`;
    }
}

customElements.define("footer-component", Footer);
