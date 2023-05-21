class Select_Input extends HTMLElement {
    constructor() {
        super();
    }
    connectedCallback() {
        this.innerHTML = `<div class="selection">
            <div class="sub_content">
                <div class="filter">
                    <!-- Tạo thanh tìm kiếm -->
                    <div class="select-input">
                        <input type="text" id="input_bar" class="search-input_bar" placeholder="Chọn Size Giày" />
                        <ul class="select-input_list">
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">39</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">40</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">41</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">42</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">43</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">44</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">45</a>
                            </li>
                        </ul>

                        <!-- <select name="size" id="size">
                            <option value="choose-size">Chọn Size Giày</option>
                            <option value="39">38</option>
                            <option value="39">39</option>
                            <option value="40">40</option>
                            <option value="41">41</option>
                            <option value="41">42</option>
                        </select> -->
                    </div>

                    <div class="select-input">
                        <input type="text" id="input_bar" class="search-input_bar" placeholder="Khoảng Giá" />
                        <ul class="select-input_list">
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">Dưới 3 Triệu</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">Trên 3 Triệu</a>
                            </li>
                        </ul>
                        <!-- <select name="price" id="price">
                            <option value="choose-price">Khoảng Giá</option>
                            <option value="less-3">Dưới 3 Triệu</option>
                            <option value="than-3">Trên 3 Triệu</option>
                        </select> -->
                    </div>

                    <div class="select-input">
                        <input type="text" id="input_bar" class="search-input_bar" placeholder="Thương Hiệu" />
                        <ul class="select-input_list">
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">Nike</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">Adidas</a>
                            </li>
                        </ul>
                        <!-- <select name="brand" id="brand">
                            <option value="choose-brand">Khoảng Giá</option>
                            <option value="nike">Nike</option>
                            <option value="adidas">Adidas</option>
                        </select> -->
                    </div>

                    <div class="select-input">
                        <input type="text" id="input_bar" class="search-input_bar" placeholder="Phân Loại" />
                        <ul class="select-input_list">
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">Giày Đi Với Crush</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">Giày Thể Thao</a>
                            </li>
                        </ul>
                        <!-- <select name="classify" id="classify">
                            <option value="choose-classify">Thương Hiệu</option>
                            <option value="crush">Giày Đi Với Crush</option>
                            <option value="sport">Giày Thể Thao</option>
                        </select> -->
                    </div>

                    <div class="select-input">
                        <input type="text" id="input_bar" class="search-input_bar" placeholder="Sắp Xếp Theo" />
                        <ul class="select-input_list">
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">Giá Thấp Đến Cao</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">Giá Cao Đến Thấp</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">Giảm Giá Nhiều Nhất</a>
                            </li>
                        </ul>
                        <!-- <select name="sort" id="sort">
                            <option value="choose-sort">Sắp Xếp Theo</option>
                            <option value="crush">Giá Thấp Đến Cao</option>
                            <option value="sport">Giá Cao Đến Thấp</option>
                            <option value="sport">Giảm Giá Nhiều Nhất</option>
                        </select> -->
                    </div>

                    <div class="select-input select-input_last">
                        <a href="#!">
                            Tìm Kiếm Ngay
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>`;
    }
}

customElements.define("select_input-component", Select_Input);
