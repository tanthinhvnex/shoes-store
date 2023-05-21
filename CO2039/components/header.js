class Header extends HTMLElement {
    constructor() {
        super();
    }

    connectedCallback() {
        this.innerHTML = `
    <div class="content_1">
    <div class="sub_content">
        <div class="navbar">
            <!-- Logo -->
            <a href="./index.html" class="logo">
                <img src="./assets/img/logo.png" alt="Thợ Code Bán Giày" />
            </a>
            <!-- Navigation -->
            <ul class="list">
                <li>
                    <a href="#!"><i>THƯƠNG HIỆU</i></a>
                    <ul class="sub-list">
                        <li>
                            <a href="./nike-all.html">Nike</a>
                        </li>
                        <li>
                            <a href="./adidas-all.html">Adidas</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#!"><i>PHÂN LOẠI</i></a>
                    <ul class="sub-list">
                        
                        <li>
                            <a href="#!">Giày đi với crush</a>
                        </li>
                        <li>
                            <a href="#!">Giày đi chơi</a>
                        </li>
                        
                    </ul>
                </li>
                <li>
                    <a href="#!"><i>KHUYẾN MÃI</i></a>
                </li>
                <li>
                    <a href="#!"><i>SẢN PHẨM MỚI</i></a>
                </li>
                <li>
                    <a href="#!"><i>HỖ TRỢ</i></a>
                </li>
            </ul>
            <!-- Searchbar -->
            <div class="header_search">
                <input type="text" class="header_search-input" placeholder="Tìm kiếm sản phẩm" />
                <button class="header_search-btn">
                    <i class="header_search-btn-icon fa-solid fa-magnifying-glass"></i>
                </button>
            </div>
            <!-- Action -->
            <div class="action">
                <a href="./login.html" class="action-btn">
                    <i class="fa-regular fa-user"></i>
                </a>
                <div class="header_cart">
                    <div class="header_cart-wrap">
                        <a href="./cart.html" class="action-btn cart">
                            <i class="header_cart-icon fa-solid fa-cart-plus"></i>
                            <span class="header_cart-notice">3</span>
                        </a>
                        <!--No cart: header_cart-list--no-cart -->
                        <div class="header_cart-list">
                            <img src="./assets/img/no_cart.jpg" alt="" class="header_cart-no-cart-img" />
                            <div class="header_cart-list-no-cart-msg">Chưa Có Sản Phẩm</div>

                            <!-- Cart Cart Cart -->
                            <h4 class="header_cart-heading">Sản Phẩm Đã Thêm</h4>
                            <ul class="header_cart-list-item">
                                <!-- Cart item -->
                                <li>
                                    <div class="header_cart-anchor header_cart-item">
                                        <div class="img-wrap">
                                            <img
                                                src="./assets/img/air force 1.jpg"
                                                alt="air force 1"
                                                class="header_cart-img" />
                                        </div>
                                        <div class="header_cart-item-info">
                                            <div class="header_cart-item-head">
                                                <a href="./cart.html" class="header_cart-item-name">AIR FORCE 1</a>
                                                <div class="header_cart-item-head">
                                                    <span class="header_cart-item-price">3.200.000đ</span>
                                                    <span class="header_cart-item-multiply">x</span>
                                                    <span class="header_cart-item-qnt">1</span>
                                                </div>
                                            </div>
                                            <div class="header_cart-item-body">
                                                <span class="header_cart-item-description">
                                                    Size Giày: 41
                                                </span>
                                                <!-- <span class="header_cart-item-remove">Xóa</span> -->
                                                <a href="#!" class="header_cart-item-remove">Xóa</a>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="header_cart-anchor header_cart-item">
                                        <div class="img-wrap">
                                            <img
                                                src="./assets/img/adidas ultra 4dfwd.jpg"
                                                alt="adidas ultra 4dfwd"
                                                class="header_cart-img" />
                                        </div>
                                        <div class="header_cart-item-info">
                                            <div class="header_cart-item-head">
                                                <a href="./cart.html" class="header_cart-item-name">
                                                    ADIDAS ULTRA 4DFWD
                                                </a>
                                                <div class="header_cart-item-head">
                                                    <span class="header_cart-item-price">5.800.000đ</span>
                                                    <span class="header_cart-item-multiply">x</span>
                                                    <span class="header_cart-item-qnt">1</span>
                                                </div>
                                            </div>
                                            <div class="header_cart-item-body">
                                                <span class="header_cart-item-description">
                                                    Size Giày: 43
                                                </span>
                                                <a href="#!" class="header_cart-item-remove">Xóa</a>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="header_cart-anchor header_cart-item">
                                        <div class="img-wrap">
                                            <img
                                                src="./assets/img/nike air max excee.jpeg"
                                                alt="nike air max"
                                                class="header_cart-img" />
                                        </div>
                                        <div class="header_cart-item-info">
                                            <div class="header_cart-item-head">
                                                <a href="./cart.html" class="header_cart-item-name"
                                                    >NIKE AIR MAX EXCEE
                                                </a>                                                
                                                <div class="header_cart-item-head">
                                                    <span class="header_cart-item-price">2.900.000đ</span>
                                                    <span class="header_cart-item-multiply">x</span>
                                                    <span class="header_cart-item-qnt">1</span>
                                                </div>
                                            </div>
                                            <div class="header_cart-item-body">
                                                <span class="header_cart-item-description">
                                                    Size Giày: 39
                                                </span>
                                                <a href="#!" class="header_cart-item-remove">Xóa</a>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <a href="#!" class="header_cart-view-cart action-btn"> Xem Giỏ Hàng </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>`;
    }
}

customElements.define("header-component", Header);
