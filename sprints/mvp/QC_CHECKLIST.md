# QC Feature Checklist — Yello Admin Panel

> **Dự án:** Yello Admin Panel
> **Tech Stack:** Next.js 15, React 19, GraphQL (Apollo), TanStack Table, React Hook Form + Zod, Tailwind CSS, Zustand
> **Cập nhật:** 2026-03-17
> **Hướng dẫn:** Đánh dấu `[x]` khi test pass, `[-]` khi skip/N/A, ghi chú lỗi vào cột **Ghi chú**

---

## Mục lục

1. [Authentication — Đăng nhập](#1-authentication--đăng-nhập)
2. [Layout & Navigation — Giao diện chung](#2-layout--navigation--giao-diện-chung)
3. [Dashboard — Tổng quan](#3-dashboard--tổng-quan)
4. [Quản lý Khách hàng (Customers)](#4-quản-lý-khách-hàng-customers)
5. [Quản lý Doanh nghiệp (Businesses)](#5-quản-lý-doanh-nghiệp-businesses)
6. [Trung tâm Xác minh (Verification Center)](#6-trung-tâm-xác-minh-verification-center)
7. [Thông báo (Notifications)](#7-thông-báo-notifications)
8. [Xử lý lỗi & Edge Cases chung](#8-xử-lý-lỗi--edge-cases-chung)

---

## 1. Authentication — Đăng nhập

**URL:** `/login`

### 1.1 Giao diện

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 1.1.1 | [ ] Trang login hiển thị đúng logo và tiêu đề "Welcome Back" | | |
| 1.1.2 | [ ] Hiển thị đúng 2 field: Username và Password | | |
| 1.1.3 | [ ] Field Password có icon ẩn/hiện mật khẩu hoạt động đúng | | |
| 1.1.4 | [ ] Button "Login" có màu vàng và hiển thị đúng | | |
| 1.1.5 | [ ] Layout responsive trên các màn hình khác nhau | | |

### 1.2 Validation — Username

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 1.2.1 | [ ] Submit form khi để trống Username → hiển thị lỗi "username required" | | |
| 1.2.2 | [ ] Nhập Username < 3 ký tự → hiển thị lỗi "username min length" | | |
| 1.2.3 | [ ] Nhập Username > 100 ký tự → không cho nhập thêm (maxLength=100) | | |
| 1.2.4 | [ ] Username có khoảng trắng đầu/cuối → tự động trim khi submit | | |

### 1.3 Validation — Password

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 1.3.1 | [ ] Submit form khi để trống Password → hiển thị lỗi "password required" | | |
| 1.3.2 | [ ] Nhập Password > 50 ký tự → không cho nhập thêm (maxLength=50) | | |

### 1.4 Luồng đăng nhập

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 1.4.1 | [ ] Đăng nhập thành công → redirect sang `/dashboard` | | |
| 1.4.2 | [ ] Đăng nhập sai thông tin → hiển thị toast lỗi "Login failed" | | |
| 1.4.3 | [ ] Button đổi sang trạng thái loading trong khi gọi API | | |
| 1.4.4 | [ ] Đã đăng nhập → truy cập `/login` bị redirect sang dashboard | | |
| 1.4.5 | [ ] Chưa đăng nhập → truy cập route dashboard bị redirect sang `/login` | | |

---

## 2. Layout & Navigation — Giao diện chung

### 2.1 Sidebar — Desktop

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 2.1.1 | [ ] Sidebar hiển thị logo Yello ở góc trên trái | | |
| 2.1.2 | [ ] Hiển thị đủ 5 menu item: Dashboard, User Management, Verification Center, Notifications, Logout | | |
| 2.1.3 | [ ] Menu item đang active được highlight (nền vàng nhạt + thanh vàng bên trái) | | |
| 2.1.4 | [ ] Click vào menu item → navigate đúng route | | |
| 2.1.5 | [ ] Hover menu item → đổi màu nền | | |
| 2.1.6 | [ ] Menu "User Management" active khi đang ở cả `/users/businesses` lẫn `/users/customers` | | |

### 2.2 Sidebar — Mobile

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 2.2.1 | [ ] Trên mobile: sidebar thu gọn chỉ hiển thị icon | | |
| 2.2.2 | [ ] Hiển thị nút hamburger ở góc trên trái khi sidebar đóng | | |
| 2.2.3 | [ ] Click nút hamburger → mở Sheet sidebar với đầy đủ tên menu | | |
| 2.2.4 | [ ] Click ra ngoài Sheet → đóng sidebar | | |
| 2.2.5 | [ ] Hover icon trên sidebar thu gọn → hiển thị tooltip tên menu | | |

### 2.3 Logout

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 2.3.1 | [ ] Click "Logout" → đăng xuất và redirect về `/login` | | |
| 2.3.2 | [ ] Sau khi logout → không thể truy cập lại dashboard bằng nút Back | | |

---

## 3. Dashboard — Tổng quan

**URL:** `/dashboard`

### 3.1 Overview Metrics (Thẻ số liệu tổng quan)

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 3.1.1 | [ ] Hiển thị đúng 4 thẻ metric: Total Users, Total Businesses, Pending Approval, Active Subscriptions | | |
| 3.1.2 | [ ] Mỗi thẻ hiển thị đúng icon, tiêu đề và giá trị số | | |
| 3.1.3 | [ ] Khi đang tải dữ liệu → hiển thị 4 skeleton cards | | |
| 3.1.4 | [ ] Khi dữ liệu không khả dụng (null) → hiển thị text "Data unavailable" thay vì số | | |
| 3.1.5 | [ ] Số liệu hiển thị đúng format (có dấu phân cách hàng nghìn) | | |

### 3.2 Popular Searches Table (Bảng tìm kiếm phổ biến)

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 3.2.1 | [ ] Hiển thị tiêu đề "Popular Searches" | | |
| 3.2.2 | [ ] Bảng hiển thị danh sách các từ khóa tìm kiếm | | |
| 3.2.3 | [ ] Khi đang tải → hiển thị skeleton rows | | |
| 3.2.4 | [ ] Pagination hoạt động: chuyển trang đúng | | |
| 3.2.5 | [ ] Khi không có dữ liệu → hiển thị empty state "No search found" | | |
| 3.2.6 | [ ] Khi lỗi API → hiển thị thông báo lỗi + nút Retry | | |
| 3.2.7 | [ ] Click Retry → gọi lại API và hiển thị dữ liệu | | |

---

## 4. Quản lý Khách hàng (Customers)

**URL:** `/users/customers`

### 4.1 Giao diện bảng

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 4.1.1 | [ ] Bảng hiển thị đủ 6 cột: Name, User ID, Email, Role, Registered, Status | | |
| 4.1.2 | [ ] Cột Name hiển thị avatar chữ cái + tên đầy đủ | | |
| 4.1.3 | [ ] Cột User ID hiển thị dạng `#12345` | | |
| 4.1.4 | [ ] Cột Email có thể hiển thị email dài (wrap text) | | |
| 4.1.5 | [ ] Cột Role hiển thị chữ in hoa chữ cái đầu (capitalize) | | |
| 4.1.6 | [ ] Cột Registered hiển thị ngày đăng ký đúng định dạng | | |
| 4.1.7 | [ ] Khi đang tải → hiển thị skeleton rows | | |
| 4.1.8 | [ ] Khi không có dữ liệu → hiển thị empty state | | |
| 4.1.9 | [ ] Khi lỗi API → hiển thị thông báo lỗi + nút Retry | | |

### 4.2 Sắp xếp (Sorting)

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 4.2.1 | [ ] Click header "Name" → sắp xếp A-Z, click lần 2 → Z-A | | |
| 4.2.2 | [ ] Click header "User ID" → sắp xếp tăng/giảm | | |
| 4.2.3 | [ ] Click header "Role" → sắp xếp tăng/giảm | | |
| 4.2.4 | [ ] Click header "Registered" → sắp xếp theo ngày | | |
| 4.2.5 | [ ] Click header "Status" → sắp xếp theo trạng thái | | |
| 4.2.6 | [ ] Icon mũi tên sorting hiển thị đúng hướng | | |

### 4.3 Tìm kiếm & Lọc

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 4.3.1 | [ ] Search box hiển thị placeholder "Search..." | | |
| 4.3.2 | [ ] Nhập từ khóa → bảng lọc đúng kết quả theo real-time | | |
| 4.3.3 | [ ] Xóa từ khóa tìm kiếm → hiển thị lại toàn bộ danh sách | | |
| 4.3.4 | [ ] Tìm kiếm không có kết quả → hiển thị empty state | | |

### 4.4 Phân trang (Pagination)

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 4.4.1 | [ ] Hiển thị thông tin: "Showing X-Y of Z" | | |
| 4.4.2 | [ ] Nút Previous/Next chuyển trang đúng | | |
| 4.4.3 | [ ] Dropdown thay đổi số hàng mỗi trang hoạt động | | |
| 4.4.4 | [ ] Trang đầu → nút Previous bị disabled | | |
| 4.4.5 | [ ] Trang cuối → nút Next bị disabled | | |
| 4.4.6 | [ ] Pagination ẩn khi không có dữ liệu | | |
| 4.4.7 | [ ] Khi đang load → pagination hiển thị skeleton | | |

### 4.5 Thay đổi trạng thái (Status Popover)

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 4.5.1 | [ ] Cột Status hiển thị badge màu: Active=xanh lá, Suspended=đỏ, Inactive=xám | | |
| 4.5.2 | [ ] Click vào badge Status → mở Popover với các lựa chọn | | |
| 4.5.3 | [ ] User Active: Popover hiển thị 2 option: "Active", "Suspended" | | |
| 4.5.4 | [ ] User Suspended: Popover hiển thị 2 option: "Active", "Suspended" | | |
| 4.5.5 | [ ] User Inactive: Popover chỉ hiển thị 1 option: "Active" | | |
| 4.5.6 | [ ] Click "Active" khi đang Active → không làm gì (option bị disabled/bỏ qua) | | |
| 4.5.7 | [ ] Click "Active" khi đang Suspended → đổi trạng thái ngay, không cần confirm | | |
| 4.5.8 | [ ] Click "Suspended" → mở Confirm Modal với tiêu đề xác nhận suspend | | |
| 4.5.9 | [ ] Confirm Modal: click "Confirm" → đổi trạng thái thành Suspended | | |
| 4.5.10 | [ ] Confirm Modal: click "Cancel" → đóng modal, giữ nguyên trạng thái | | |
| 4.5.11 | [ ] Khi đang gọi API → badge hiển thị trạng thái loading (disabled) | | |
| 4.5.12 | [ ] Click ra ngoài Popover → đóng Popover | | |

### 4.6 Xóa khách hàng (Delete)

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 4.6.1 | [ ] Trong Popover Status có nút "Delete" (icon thùng rác) phân cách bởi đường kẻ | | |
| 4.6.2 | [ ] Click "Delete" → đóng Popover, mở Confirm Delete Modal | | |
| 4.6.3 | [ ] Modal hiển thị tên khách hàng trong message xác nhận | | |
| 4.6.4 | [ ] Click "Delete" trong modal → xóa thành công, xóa khỏi danh sách | | |
| 4.6.5 | [ ] Click "Cancel" trong modal → đóng modal, không xóa | | |
| 4.6.6 | [ ] Khi đang xóa → nút Delete trong modal hiển thị loading | | |
| 4.6.7 | [ ] Xóa thành công → cập nhật metrics bar bên dưới | | |

### 4.7 Metrics Bar (thanh số liệu cuối trang)

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 4.7.1 | [ ] Hiển thị 4 thẻ: Total Users, Active, Suspended, Inactive | | |
| 4.7.2 | [ ] Số liệu phản ánh đúng data trong bảng hiện tại | | |
| 4.7.3 | [ ] Sau khi thay đổi status → metrics cập nhật đúng | | |

---

## 5. Quản lý Doanh nghiệp (Businesses)

**URL:** `/users/businesses`

### 5.1 Giao diện bảng

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 5.1.1 | [ ] Bảng hiển thị đủ 6 cột: Name, Business ID, Category, Rating, Registered, Status | | |
| 5.1.2 | [ ] Cột Name hiển thị icon mũi tên expand/collapse | | |
| 5.1.3 | [ ] Cột Business ID hiển thị dạng `#12345` | | |
| 5.1.4 | [ ] Cột Category hiển thị tên ngành | | |
| 5.1.5 | [ ] Cột Rating hiển thị điểm đánh giá (icon sao) | | |
| 5.1.6 | [ ] Khi đang tải → hiển thị skeleton rows | | |
| 5.1.7 | [ ] Khi không có dữ liệu → hiển thị empty state | | |
| 5.1.8 | [ ] Khi lỗi API → hiển thị thông báo lỗi + nút Retry | | |

### 5.2 Sắp xếp (Sorting)

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 5.2.1 | [ ] Click header "Name" → sắp xếp A-Z, click lần 2 → Z-A | | |
| 5.2.2 | [ ] Click header "Business ID" → sắp xếp tăng/giảm | | |
| 5.2.3 | [ ] Click header "Category" → sắp xếp theo tên ngành | | |
| 5.2.4 | [ ] Click header "Registered" → sắp xếp theo ngày | | |
| 5.2.5 | [ ] Click header "Status" → sắp xếp theo trạng thái | | |

### 5.3 Tìm kiếm & Lọc

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 5.3.1 | [ ] Search box hiển thị placeholder "Search by name or ID" | | |
| 5.3.2 | [ ] Tìm kiếm theo tên doanh nghiệp → đúng kết quả | | |
| 5.3.3 | [ ] Tìm kiếm theo Business ID → đúng kết quả | | |
| 5.3.4 | [ ] Không có kết quả → hiển thị empty state | | |

### 5.4 Phân trang

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 5.4.1 | [ ] Pagination hoạt động tương tự mục 4.4 | | |

### 5.5 Mở rộng dòng (Row Expansion)

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 5.5.1 | [ ] Click vào tên doanh nghiệp (hoặc icon mũi tên) → mở rộng hàng xuống | | |
| 5.5.2 | [ ] Row mở rộng hiển thị 3 metric: Reviews (số), Last Activity, Subscription | | |
| 5.5.3 | [ ] Click lần 2 → đóng row mở rộng | | |
| 5.5.4 | [ ] Nhiều row có thể mở rộng cùng lúc | | |
| 5.5.5 | [ ] Metric "Reviews" có gạch chân → có thể click | | |
| 5.5.6 | [ ] Click vào "Reviews" → mở Business Review Modal | | |

### 5.6 Thay đổi trạng thái Business

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 5.6.1 | [ ] Cột Status hiển thị badge: Active=xanh lá, Suspended=đỏ | | |
| 5.6.2 | [ ] Click badge → mở Popover với 2 option: Active, Suspended | | |
| 5.6.3 | [ ] Click "Suspended" → mở Confirm Modal với thông báo suspend business | | |
| 5.6.4 | [ ] Confirm → đổi trạng thái thành Suspended | | |
| 5.6.5 | [ ] Cancel → giữ nguyên trạng thái | | |
| 5.6.6 | [ ] Business Popover **KHÔNG** có nút Delete (khác với Customer) | | |

### 5.7 Business Review Modal

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 5.7.1 | [ ] Modal mở với tiêu đề "[Tên business] Reviews" | | |
| 5.7.2 | [ ] Hiển thị mô tả: "Here you can review or delete customer reviews..." | | |
| 5.7.3 | [ ] Danh sách reviews hiển thị với: avatar, tên người review, rating, comment | | |
| 5.7.4 | [ ] Review có ảnh đính kèm → hiển thị thumbnail | | |
| 5.7.5 | [ ] Review text dài → bị cắt ngắn, có nút expand | | |
| 5.7.6 | [ ] Click expand → hiển thị toàn bộ nội dung review | | |
| 5.7.7 | [ ] Click collapse → thu gọn lại | | |
| 5.7.8 | [ ] Cuộn xuống cuối danh sách → tự động load thêm (infinite scroll) | | |
| 5.7.9 | [ ] Khi đang load thêm → hiển thị skeleton review | | |
| 5.7.10 | [ ] Không có review → hiển thị empty state "No Reviews Yet" | | |
| 5.7.11 | [ ] Lỗi API → hiển thị thông báo lỗi + nút Retry | | |
| **Chọn & Xóa Review** | | | |
| 5.7.12 | [ ] Mỗi review có checkbox/nút để chọn xóa | | |
| 5.7.13 | [ ] Chọn review → badge số lượng hiển thị trên nút "Save" | | |
| 5.7.14 | [ ] Chọn nhiều review cùng lúc | | |
| 5.7.15 | [ ] Nút "Save" disabled khi chưa chọn review nào | | |
| 5.7.16 | [ ] Click "Save" khi đã chọn → mở Confirm Delete Modal | | |
| 5.7.17 | [ ] Modal confirm hiển thị số lượng review sẽ xóa | | |
| 5.7.18 | [ ] Confirm Delete → xóa review, reload danh sách | | |
| 5.7.19 | [ ] Cancel Delete Modal → đóng modal, không xóa | | |
| 5.7.20 | [ ] Khi đang xóa → nút confirm hiển thị loading | | |
| 5.7.21 | [ ] Xóa thành công → cập nhật số Reviews trong expanded row | | |
| **Đóng Modal** | | | |
| 5.7.22 | [ ] Click nút "Cancel" → đóng modal | | |
| 5.7.23 | [ ] Click vào overlay bên ngoài → đóng modal | | |
| 5.7.24 | [ ] Đóng modal → reset trạng thái (bỏ chọn tất cả review) | | |

### 5.8 Metrics Bar

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 5.8.1 | [ ] Hiển thị 3 thẻ: Total Businesses, Active, Suspended | | |
| 5.8.2 | [ ] Số liệu phản ánh đúng data sau khi thay đổi status | | |

---

## 6. Trung tâm Xác minh (Verification Center)

**URL:** `/verification`

### 6.1 Giao diện & Tabs

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 6.1.1 | [ ] Tiêu đề "Business Listing" hiển thị đúng | | |
| 6.1.2 | [ ] Hiển thị 4 tabs: All, Pending, Approved, Rejected | | |
| 6.1.3 | [ ] Mỗi tab hiển thị số lượng (badge indicator) | | |
| 6.1.4 | [ ] Tab đang active được highlight | | |
| 6.1.5 | [ ] Click tab → lọc bảng theo trạng thái tương ứng | | |

### 6.2 Giao diện bảng

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 6.2.1 | [ ] Bảng hiển thị đủ 5 cột: Name, Business ID, Date Submitted, Status, Actions | | |
| 6.2.2 | [ ] Cột Status hiển thị badge màu: Approved=xanh lá, Pending=vàng, Rejected=đỏ | | |
| 6.2.3 | [ ] Cột Actions hiển thị nút "Manage" | | |
| 6.2.4 | [ ] Khi đang tải → hiển thị skeleton rows | | |
| 6.2.5 | [ ] Khi không có dữ liệu → hiển thị "No businesses found" | | |
| 6.2.6 | [ ] Khi lỗi API → hiển thị thông báo lỗi + nút Retry | | |

### 6.3 Sắp xếp & Tìm kiếm

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 6.3.1 | [ ] Click header "Name" → sắp xếp A-Z / Z-A | | |
| 6.3.2 | [ ] Click header "Business ID" → sắp xếp tăng/giảm | | |
| 6.3.3 | [ ] Click header "Date Submitted" → sắp xếp theo ngày | | |
| 6.3.4 | [ ] Click header "Status" → sắp xếp theo trạng thái | | |
| 6.3.5 | [ ] Search box → lọc theo tên hoặc ID | | |
| 6.3.6 | [ ] Pagination hoạt động đúng | | |

### 6.4 Manage Business Modal

#### 6.4.1 Mở & Loading

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 6.4.1.1 | [ ] Click "Manage" → mở modal panel từ bên phải | | |
| 6.4.1.2 | [ ] Khi đang tải → hiển thị skeleton layout đầy đủ (image, content, buttons) | | |
| 6.4.1.3 | [ ] Khi lỗi API → hiển thị thông báo lỗi + nút Retry trong modal | | |

#### 6.4.2 Nội dung Business

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 6.4.2.1 | [ ] Tiêu đề modal và mô tả hiển thị đúng | | |
| 6.4.2.2 | [ ] Ảnh chính (primary image) của business hiển thị đúng | | |
| 6.4.2.3 | [ ] Khi không có ảnh → hiển thị ảnh mặc định | | |
| 6.4.2.4 | [ ] Badge ngành nghề (Industry) hiển thị góc trên phải ảnh | | |
| 6.4.2.5 | [ ] Tên business hiển thị đúng | | |
| 6.4.2.6 | [ ] Sub-industries hiển thị (nếu có), cách nhau bởi dấu phẩy | | |
| 6.4.2.7 | [ ] Địa chỉ hiển thị với icon MapPin | | |
| 6.4.2.8 | [ ] Khi không có địa chỉ → hiển thị "Not available" | | |

#### 6.4.3 Lịch hoạt động (Schedule)

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 6.4.3.1 | [ ] Section "Schedule" hiển thị tiêu đề | | |
| 6.4.3.2 | [ ] Các ngày có cùng giờ được gộp nhóm (vd: "Mon - Fri: 9:00 AM - 5:00 PM") | | |
| 6.4.3.3 | [ ] Ngày đóng cửa hiển thị "Closed" | | |
| 6.4.3.4 | [ ] Không có lịch → hiển thị "Not available" | | |
| 6.4.3.5 | [ ] Giờ hiển thị đúng định dạng AM/PM | | |

#### 6.4.4 Mô tả (About)

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 6.4.4.1 | [ ] Section "About" hiển thị mô tả của business | | |

#### 6.4.5 Media Gallery

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 6.4.5.1 | [ ] Section "Media" hiển thị thumbnails ảnh/video | | |
| 6.4.5.2 | [ ] Click thumbnail → mở lightbox xem ảnh lớn | | |
| 6.4.5.3 | [ ] Lightbox có thể điều hướng next/prev giữa các ảnh | | |
| 6.4.5.4 | [ ] Đóng lightbox → trở về modal | | |
| 6.4.5.5 | [ ] Không có media → section vẫn hiển thị (trống) | | |

#### 6.4.6 Approve / Reject (chỉ cho Pending)

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 6.4.6.1 | [ ] Business Pending → hiển thị 2 nút: "Approve" (xanh) và "Reject" (đỏ) | | |
| 6.4.6.2 | [ ] Business Approved/Rejected → **KHÔNG** hiển thị nút Approve/Reject | | |
| 6.4.6.3 | [ ] Click "Approve" → trực tiếp duyệt (không cần confirm) | | |
| 6.4.6.4 | [ ] Khi đang Approve → nút hiển thị loading, bị disabled | | |
| 6.4.6.5 | [ ] Approve thành công → cập nhật status trong bảng | | |
| 6.4.6.6 | [ ] Field "Request Changes" (textarea) hiển thị bên dưới | | |
| 6.4.6.7 | [ ] Click "Reject" khi textarea trống → hiển thị lỗi validation "required" | | |
| 6.4.6.8 | [ ] Nhập lý do reject > max length → hiển thị lỗi | | |
| 6.4.6.9 | [ ] Click "Reject" với lý do hợp lệ → gửi reject + lý do | | |
| 6.4.6.10 | [ ] Khi đang Reject → nút hiển thị loading | | |
| 6.4.6.11 | [ ] Reject thành công → cập nhật status trong bảng | | |

#### 6.4.7 Đóng Modal

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 6.4.7.1 | [ ] Click icon X → đóng modal | | |
| 6.4.7.2 | [ ] Modal có thể scroll khi nội dung dài | | |

---

## 7. Thông báo (Notifications)

**URL:** `/notifications`

### 7.1 Form Tạo Thông báo

#### 7.1.1 Giao diện

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 7.1.1.1 | [ ] Form hiển thị tiêu đề "Create Notification" | | |
| 7.1.1.2 | [ ] Hiển thị đầy đủ các field: Push to All, User Type, Location, Title, Message | | |
| 7.1.1.3 | [ ] Field Message hiển thị bộ đếm ký tự còn lại | | |

#### 7.1.2 Toggle "Push to All"

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 7.1.2.1 | [ ] Toggle mặc định OFF | | |
| 7.1.2.2 | [ ] Bật toggle ON → ẩn/disable field User Type và Location | | |
| 7.1.2.3 | [ ] Tắt toggle OFF → hiện lại field User Type và Location | | |

#### 7.1.3 Dropdown "User Type"

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 7.1.3.1 | [ ] Hiển thị 4 lựa chọn: Businesses, Customers, Providers, All | | |
| 7.1.3.2 | [ ] Mặc định chọn "Businesses" | | |
| 7.1.3.3 | [ ] Chọn loại khác → cập nhật dropdown Location | | |

#### 7.1.4 Dropdown "Location"

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 7.1.4.1 | [ ] Hiển thị khi User Type = "Businesses" | | |
| 7.1.4.2 | [ ] Danh sách location load từ API | | |
| 7.1.4.3 | [ ] Khi đang tải locations → hiển thị loading state | | |
| 7.1.4.4 | [ ] Chọn User Type khác Businesses → Location không bắt buộc | | |

#### 7.1.5 Field Title

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 7.1.5.1 | [ ] Submit khi Title trống → hiển thị lỗi "title required" | | |
| 7.1.5.2 | [ ] Nhập chỉ khoảng trắng → lỗi "title must not be empty" | | |
| 7.1.5.3 | [ ] Nhập quá max length → hiển thị lỗi max length | | |

#### 7.1.6 Field Message

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 7.1.6.1 | [ ] Submit khi Message trống → hiển thị lỗi "message required" | | |
| 7.1.6.2 | [ ] Nhập chỉ khoảng trắng → lỗi "message must not be empty" | | |
| 7.1.6.3 | [ ] Nhập quá max length → hiển thị lỗi max length | | |
| 7.1.6.4 | [ ] Bộ đếm ký tự cập nhật real-time khi nhập | | |

#### 7.1.7 Validation kết hợp

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 7.1.7.1 | [ ] Push to All = OFF, User Type trống → lỗi "user type required" | | |
| 7.1.7.2 | [ ] Push to All = OFF, Type = Businesses, Location trống → lỗi "location required" | | |
| 7.1.7.3 | [ ] Push to All = ON → không cần User Type và Location | | |

#### 7.1.8 Submit & Confirm

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 7.1.8.1 | [ ] Form hợp lệ, click "Send Notification" → mở Confirm Modal | | |
| 7.1.8.2 | [ ] Confirm Modal hiển thị tiêu đề và mô tả xác nhận | | |
| 7.1.8.3 | [ ] Click "Confirm" trong modal → gửi notification | | |
| 7.1.8.4 | [ ] Khi đang gửi → nút đổi sang "Sending..." và disabled | | |
| 7.1.8.5 | [ ] Gửi thành công → reset field Title và Message, giữ nguyên các field khác | | |
| 7.1.8.6 | [ ] Click "Cancel" trong modal → đóng modal, không gửi | | |

#### 7.1.9 Error & Retry

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 7.1.9.1 | [ ] Gửi thất bại → nút đổi sang dạng "Retry" màu đỏ nhạt | | |
| 7.1.9.2 | [ ] Click "Retry" → gửi lại không cần confirm lại | | |
| 7.1.9.3 | [ ] Retry thành công → nút trở về trạng thái bình thường | | |

### 7.2 Bảng Thông báo đã gửi

#### 7.2.1 Tabs

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 7.2.1.1 | [ ] Tiêu đề section "Latest Notifications" | | |
| 7.2.1.2 | [ ] Hiển thị các tabs: All, Active, Archived | | |
| 7.2.1.3 | [ ] Click tab → lọc đúng loại notification | | |

#### 7.2.2 Bảng

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 7.2.2.1 | [ ] Hiển thị đủ 6 cột: Title, Description, Type, Date, Total Views, Action | | |
| 7.2.2.2 | [ ] Cột Title có thể expand khi text dài | | |
| 7.2.2.3 | [ ] Cột Description có thể expand khi text dài | | |
| 7.2.2.4 | [ ] Cột Type hiển thị đúng label: "Sent to all users", "Sent to business", "Sent to customers", "Sent to providers" | | |
| 7.2.2.5 | [ ] Cột Date hiển thị định dạng "DD MMM, HH:MM AM/PM" | | |
| 7.2.2.6 | [ ] Cột Total Views hiển thị dạng "X%" | | |
| 7.2.2.7 | [ ] Cột Action hiển thị nút "Archive" | | |

#### 7.2.3 Tìm kiếm & Phân trang

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 7.2.3.1 | [ ] Search box hoạt động lọc notifications | | |
| 7.2.3.2 | [ ] Pagination hoạt động đúng | | |
| 7.2.3.3 | [ ] Empty state khi không có notification | | |
| 7.2.3.4 | [ ] Lỗi API → hiển thị thông báo + nút Retry | | |

#### 7.2.4 Archive Notification

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 7.2.4.1 | [ ] Click "Archive" → notification chuyển sang tab Archived | | |
| 7.2.4.2 | [ ] Sau archive → notification không còn trong tab Active | | |
| 7.2.4.3 | [ ] Tab "Archived" hiển thị notifications đã archive | | |

---

## 8. Xử lý lỗi & Edge Cases chung

### 8.1 Xử lý lỗi API

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 8.1.1 | [ ] Mất kết nối mạng → hiển thị thông báo lỗi phù hợp | | |
| 8.1.2 | [ ] API trả lỗi 5xx → hiển thị thông báo lỗi + nút Retry | | |
| 8.1.3 | [ ] Token hết hạn → tự động refresh token hoặc redirect về login | | |
| 8.1.4 | [ ] Retry sau lỗi → gọi lại API và load dữ liệu | | |

### 8.2 Loading States

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 8.2.1 | [ ] Tất cả trang đều có loading skeleton khi lần đầu load | | |
| 8.2.2 | [ ] Khi chuyển trang (pagination) → bảng hiển thị loading | | |
| 8.2.3 | [ ] Các nút action show loading state khi đang gọi API | | |

### 8.3 Responsive & UI

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 8.3.1 | [ ] Bảng dữ liệu có horizontal scroll khi màn hình nhỏ | | |
| 8.3.2 | [ ] Modal/Dialog hiển thị đúng trên mobile | | |
| 8.3.3 | [ ] Toast notifications hiển thị đúng vị trí | | |
| 8.3.4 | [ ] Không có lỗi console (error/warning) trong quá trình sử dụng | | |

### 8.4 Confirm Modals (chung)

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 8.4.1 | [ ] Mọi action destructive đều yêu cầu confirm | | |
| 8.4.2 | [ ] Nút "danger" trong confirm modal có màu đỏ | | |
| 8.4.3 | [ ] Nhấn Escape → đóng modal (không confirm) | | |
| 8.4.4 | [ ] Click overlay bên ngoài modal → đóng modal | | |

### 8.5 Navigation & Route

| # | Test Case | Kết quả | Ghi chú |
|---|-----------|---------|---------|
| 8.5.1 | [ ] URL `/` → redirect về `/dashboard` khi đã đăng nhập | | |
| 8.5.2 | [ ] Route không tồn tại → hiển thị trang 404 | | |
| 8.5.3 | [ ] Chuyển trang → cuộn lên đầu trang | | |
| 8.5.4 | [ ] URL `/users` → redirect về `/users/businesses` | | |

---

## Tóm tắt Thống kê Test

| Module | Tổng TC | Pass | Fail | Skip |
|--------|---------|------|------|------|
| 1. Authentication | 14 | | | |
| 2. Layout & Navigation | 12 | | | |
| 3. Dashboard | 14 | | | |
| 4. Customers | 30 | | | |
| 5. Businesses | 40 | | | |
| 6. Verification | 36 | | | |
| 7. Notifications | 37 | | | |
| 8. Error & Edge Cases | 20 | | | |
| **TỔNG** | **203** | | | |

---

## Ghi chú Tester

> _Điền thông tin môi trường test, version, ngày test, và các vấn đề phát hiện thêm bên dưới._

**Tester:**
**Môi trường:** `[ ] Dev  [ ] Staging  [ ] Beta`
**Ngày test:**
**Version/Build:**

### Bugs / Issues phát hiện thêm

| # | Module | Mô tả | Mức độ | Trạng thái |
|---|--------|-------|--------|------------|
| | | | `Critical / High / Medium / Low` | `Open / Fixed / Won't Fix` |
