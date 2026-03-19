# Yello — Bảng Tổng Hợp Tính Năng MVP (QC & Client Review)

> **Dự án:** Yello App
> **Phạm vi:** Mobile App (Customer + Provider) + Admin Website
> **Loại trừ:** Thanh toán, Tracking
> **Cập nhật:** 2026-03-17
> **Người lập:** QC Team

---

## 💡 Hướng dẫn cột

| Cột | Mô tả |
|-----|-------|
| **Platform** | Web (Admin) / Mobile (Customer) / Mobile (Provider) |
| **Module** | Nhóm chức năng / nhóm màn hình |
| **Tên Tính Năng** | Tên ngắn gọn của tính năng hoặc luồng cần test |
| **Mô Tả** | Tính năng này làm gì |
| **Luồng / Hành Trình Người Dùng** | Các bước để thực hiện tính năng |
| **Độ Ưu Tiên** | Cao / Trung bình / Thấp |
| **Trạng Thái** | Chưa Test / Đang Test / Passed / Failed |
| **Môi Trường** | Dev / Beta / Production |
| **Ghi Chú** | Mã lỗi, blocker, nhận xét |

> 💡 **Đề xuất thêm cột khi quản lý trên Excel:**
> - **Người Test** — người thực hiện test
> - **Ngày Test** — ngày thực hiện lần cuối
> - **Mã Lỗi** — tham chiếu đến Google Sheet hoặc ticket
> - **Sprint** — sprint tương ứng với tính năng

---

## 🌐 NỀN TẢNG: ADMIN (Web)

### Module: Đăng Nhập (Authentication)

| Platform | Module | Tên Tính Năng | Mô Tả | Luồng / Hành Trình Người Dùng | Độ Ưu Tiên | Trạng Thái | Môi Trường | Ghi Chú |
|----------|--------|---------------|-------|-------------------------------|------------|------------|------------|---------|
| Admin | Đăng Nhập | Đăng nhập | Admin đăng nhập bằng tên tài khoản và mật khẩu | Mở `/login` → Nhập username + password → Click Đăng nhập → Chuyển về Dashboard | Cao | Chưa Test | | |
| Admin | Đăng Nhập | Kiểm tra form | Hiển thị lỗi khi để trống hoặc nhập sai | Để trống các field → Submit → Hiển thị lỗi từng field | Cao | Chưa Test | | |
| Admin | Đăng Nhập | Bảo vệ route | Người dùng chưa đăng nhập bị chuyển về trang login | Truy cập route dashboard khi chưa đăng nhập → Redirect về `/login` | Cao | Chưa Test | | |
| Admin | Đăng Nhập | Tự động làm mới token | JWT token tự động được làm mới trước khi hết hạn | Đang dùng → Token sắp hết hạn → Tự động refresh → Phiên tiếp tục | Cao | Chưa Test | | |
| Admin | Đăng Nhập | Đăng xuất | Admin đăng xuất và xóa phiên làm việc | Click Đăng xuất trên sidebar → Xóa phiên → Chuyển về `/login` | Cao | Chưa Test | | |
| Admin | Đăng Nhập | Chặn quay lại | Không thể quay lại dashboard sau khi đăng xuất | Đăng xuất → Nhấn Back trên trình duyệt → Vẫn ở trang login | Cao | Chưa Test | | |

---

### Module: Giao Diện & Điều Hướng

| Platform | Module | Tên Tính Năng | Mô Tả | Luồng / Hành Trình Người Dùng | Độ Ưu Tiên | Trạng Thái | Môi Trường | Ghi Chú |
|----------|--------|---------------|-------|-------------------------------|------------|------------|------------|---------|
| Admin | Giao Diện & Điều Hướng | Sidebar — Desktop | Menu điều hướng chính với 5 mục, highlight mục đang active | Tải bất kỳ trang nào → Sidebar hiển thị → Mục đang active được highlight | Cao | Chưa Test | | |
| Admin | Giao Diện & Điều Hướng | Sidebar — Mobile | Sidebar thu gọn với nút hamburger trên thiết bị nhỏ | Thu nhỏ cửa sổ → Sidebar hiển thị icon → Nhấn hamburger → Sheet mở ra | Trung bình | Chưa Test | | |
| Admin | Giao Diện & Điều Hướng | Highlight route đang active | Mục menu được highlight khi đang ở trang tương ứng | Vào trang Users → Mục "User Management" được highlight trên sidebar | Cao | Chưa Test | | |
| Admin | Giao Diện & Điều Hướng | Tooltip sidebar thu gọn | Hover vào icon hiển thị tên menu | Sidebar thu gọn → Hover icon → Tooltip tên menu hiện ra | Thấp | Chưa Test | | |

---

### Module: Dashboard

| Platform | Module | Tên Tính Năng | Mô Tả | Luồng / Hành Trình Người Dùng | Độ Ưu Tiên | Trạng Thái | Môi Trường | Ghi Chú |
|----------|--------|---------------|-------|-------------------------------|------------|------------|------------|---------|
| Admin | Dashboard | Thẻ số liệu tổng quan | 4 thẻ: Tổng Users, Tổng Businesses, Đang chờ duyệt, Đang hoạt động | Tải Dashboard → 4 thẻ hiển thị đúng số liệu và icon | Cao | Chưa Test | | |
| Admin | Dashboard | Skeleton loading | Hiển thị skeleton khi đang tải dữ liệu | Vào Dashboard → Skeleton hiện → Dữ liệu tải xong thay thế | Trung bình | Chưa Test | | |
| Admin | Dashboard | Bảng tìm kiếm phổ biến | Bảng từ khóa tìm kiếm phổ biến kèm số lượt và số kết quả | Dashboard → Phần Popular Searches → Danh sách từ khóa hiển thị | Trung bình | Chưa Test | | |
| Admin | Dashboard | Phân trang bảng tìm kiếm | Chuyển trang trong bảng Popular Searches | Click Next/Prev → Trang tiếp theo tải đúng | Trung bình | Chưa Test | | |
| Admin | Dashboard | Xử lý lỗi & Retry | Hiển thị lỗi và nút Retry khi API thất bại | Mô phỏng lỗi mạng → Thông báo lỗi + nút Retry → Click Retry → Dữ liệu tải lại | Cao | Chưa Test | | |

---

### Module: Quản Lý Khách Hàng (Customers)

| Platform | Module | Tên Tính Năng | Mô Tả | Luồng / Hành Trình Người Dùng | Độ Ưu Tiên | Trạng Thái | Môi Trường | Ghi Chú |
|----------|--------|---------------|-------|-------------------------------|------------|------------|------------|---------|
| Admin | Quản Lý Khách Hàng | Bảng danh sách | Xem tất cả khách hàng với 6 cột: Tên, ID, Email, Vai trò, Ngày đăng ký, Trạng thái | Vào `/users/customers` → Bảng hiển thị đầy đủ | Cao | Chưa Test | | |
| Admin | Quản Lý Khách Hàng | Sắp xếp theo cột | Sắp xếp tăng/giảm theo bất kỳ cột nào | Click header cột → Dữ liệu sắp xếp lại → Click lần 2 → Đảo ngược | Cao | Chưa Test | | |
| Admin | Quản Lý Khách Hàng | Tìm kiếm khách hàng | Lọc theo tên hoặc email theo thời gian thực | Nhập vào ô tìm kiếm → Bảng lọc ngay khi gõ | Cao | Chưa Test | | |
| Admin | Quản Lý Khách Hàng | Phân trang | Chuyển trang, thay đổi số dòng mỗi trang | Click Next/Prev → Trang thay đổi; Chọn 20/50 dòng → Bảng cập nhật | Cao | Chưa Test | | |
| Admin | Quản Lý Khách Hàng | Kích hoạt tài khoản | Đổi khách hàng từ Suspended/Inactive sang Active | Click badge trạng thái → Popover → Chọn Active → Cập nhật ngay | Cao | Chưa Test | | |
| Admin | Quản Lý Khách Hàng | Tạm khóa tài khoản | Tạm khóa khách hàng đang active, yêu cầu xác nhận | Click badge → Chọn Suspended → Modal xác nhận → Xác nhận → Cập nhật | Cao | Chưa Test | | |
| Admin | Quản Lý Khách Hàng | Xóa khách hàng | Xóa vĩnh viễn tài khoản khách hàng | Click Xóa trong popover → Modal xác nhận → Xác nhận → Xóa khỏi danh sách | Cao | Chưa Test | | |
| Admin | Quản Lý Khách Hàng | Optimistic UI | Giao diện cập nhật ngay, rollback nếu API lỗi | Đổi trạng thái → Badge cập nhật ngay → Nếu lỗi → Khôi phục lại | Trung bình | Chưa Test | | |
| Admin | Quản Lý Khách Hàng | Thanh số liệu | Tổng hợp: Tổng, Active, Suspended, Inactive | Cuối trang → 4 thẻ số liệu → Cập nhật sau khi thay đổi trạng thái | Trung bình | Chưa Test | | |
| Admin | Quản Lý Khách Hàng | Xuất CSV | Xuất danh sách khách hàng theo khoảng thời gian | Click Xuất → Chọn ngày → Tải file CSV | Trung bình | Chưa Test | | |
| Admin | Quản Lý Khách Hàng | Empty state & lỗi | Hiển thị trạng thái trống hoặc thông báo lỗi | Không có dữ liệu → Hiển thị empty state; Lỗi API → Lỗi + Retry | Trung bình | Chưa Test | | |

---

### Module: Quản Lý Doanh Nghiệp (Businesses)

| Platform | Module | Tên Tính Năng | Mô Tả | Luồng / Hành Trình Người Dùng | Độ Ưu Tiên | Trạng Thái | Môi Trường | Ghi Chú |
|----------|--------|---------------|-------|-------------------------------|------------|------------|------------|---------|
| Admin | Quản Lý Doanh Nghiệp | Bảng danh sách | Xem tất cả doanh nghiệp: Tên, ID, Ngành, Rating, Ngày đăng ký, Trạng thái | Vào `/users/businesses` → Bảng hiển thị đầy đủ | Cao | Chưa Test | | |
| Admin | Quản Lý Doanh Nghiệp | Sắp xếp & Tìm kiếm | Sắp xếp theo cột; tìm kiếm theo tên hoặc ID | Click header để sắp xếp; nhập vào ô tìm kiếm để lọc | Cao | Chưa Test | | |
| Admin | Quản Lý Doanh Nghiệp | Phân trang | Chuyển trang, thay đổi số dòng mỗi trang | Tương tự phân trang trong Customers | Cao | Chưa Test | | |
| Admin | Quản Lý Doanh Nghiệp | Mở rộng dòng | Mở rộng dòng để xem Reviews, Lần hoạt động cuối, Subscription | Click tên doanh nghiệp → Dòng mở rộng → Hiển thị các số liệu | Trung bình | Chưa Test | | |
| Admin | Quản Lý Doanh Nghiệp | Đổi trạng thái (Suspend/Active) | Bật/tắt trạng thái doanh nghiệp | Click badge → Popover → Chọn → Xác nhận nếu tạm khóa | Cao | Chưa Test | | |
| Admin | Quản Lý Doanh Nghiệp | Modal đánh giá (Reviews) | Xem và xóa đánh giá của khách hàng cho doanh nghiệp | Click số Reviews → Modal mở → Duyệt đánh giá → Chọn → Xóa | Cao | Chưa Test | | |
| Admin | Quản Lý Doanh Nghiệp | Cuộn vô hạn trong Modal | Tải thêm đánh giá khi cuộn xuống trong modal | Cuộn xuống cuối modal Reviews → Tải thêm đánh giá | Trung bình | Chưa Test | | |
| Admin | Quản Lý Doanh Nghiệp | Xóa đánh giá | Chọn và xóa vĩnh viễn một hoặc nhiều đánh giá | Chọn đánh giá → Click Lưu → Modal xác nhận xóa → Xác nhận → Đã xóa | Cao | Chưa Test | | |
| Admin | Quản Lý Doanh Nghiệp | Thanh số liệu | Tổng hợp: Tổng doanh nghiệp, Active, Suspended | Cuối trang → 3 thẻ số liệu → Cập nhật sau khi thay đổi | Trung bình | Chưa Test | | |
| Admin | Quản Lý Doanh Nghiệp | Xuất CSV | Xuất danh sách doanh nghiệp theo khoảng thời gian | Click Xuất → Chọn ngày → Tải file CSV | Trung bình | Chưa Test | | |

---

### Module: Trung Tâm Xác Minh (Verification)

| Platform | Module | Tên Tính Năng | Mô Tả | Luồng / Hành Trình Người Dùng | Độ Ưu Tiên | Trạng Thái | Môi Trường | Ghi Chú |
|----------|--------|---------------|-------|-------------------------------|------------|------------|------------|---------|
| Admin | Xác Minh | Danh sách chờ duyệt | Xem doanh nghiệp đang chờ duyệt với các tab trạng thái | Vào `/verification` → 4 tab: Tất cả, Đang chờ, Đã duyệt, Từ chối | Cao | Chưa Test | | |
| Admin | Xác Minh | Lọc theo tab | Lọc danh sách theo trạng thái duyệt với badge số lượng | Click tab Đang chờ → Chỉ hiển thị doanh nghiệp đang chờ | Cao | Chưa Test | | |
| Admin | Xác Minh | Tìm kiếm & Sắp xếp | Tìm theo tên hoặc ID; sắp xếp theo cột | Nhập tên → Lọc kết quả; Click cột → Sắp xếp | Cao | Chưa Test | | |
| Admin | Xác Minh | Modal xem thông tin | Xem đầy đủ thông tin doanh nghiệp trước khi duyệt | Click Quản lý → Panel bên phải mở → Ảnh, tên, ngành, lịch, mô tả, media | Cao | Chưa Test | | |
| Admin | Xác Minh | Xem ảnh fullscreen | Xem ảnh/video doanh nghiệp dạng lightbox | Click thumbnail → Lightbox mở → Điều hướng next/prev → Đóng | Trung bình | Chưa Test | | |
| Admin | Xác Minh | Duyệt doanh nghiệp | Chấp thuận doanh nghiệp đang chờ bằng 1 click | Click Duyệt → Trạng thái cập nhật thành Đã duyệt trong bảng | Cao | Chưa Test | | |
| Admin | Xác Minh | Từ chối doanh nghiệp | Từ chối với lý do bắt buộc; lý do được lưu lại cho provider | Nhập lý do từ chối → Click Từ chối → Trạng thái cập nhật | Cao | Chưa Test | | |
| Admin | Xác Minh | Badge trạng thái | Màu sắc badge: Đang chờ=vàng, Đã duyệt=xanh, Từ chối=đỏ | Xem bất kỳ dòng nào → Badge hiển thị đúng màu | Cao | Chưa Test | | |

---

### Module: Quản Lý Thông Báo (Notifications)

| Platform | Module | Tên Tính Năng | Mô Tả | Luồng / Hành Trình Người Dùng | Độ Ưu Tiên | Trạng Thái | Môi Trường | Ghi Chú |
|----------|--------|---------------|-------|-------------------------------|------------|------------|------------|---------|
| Admin | Thông Báo | Tạo thông báo | Tạo push notification với tiêu đề, nội dung, đối tượng, vị trí | Vào `/notifications` → Điền form → Gửi | Cao | Chưa Test | | |
| Admin | Thông Báo | Gửi cho tất cả | Gửi cho toàn bộ người dùng, bỏ qua bộ lọc loại và vị trí | Bật toggle "Gửi cho tất cả" → Chỉ cần tiêu đề + nội dung → Gửi | Cao | Chưa Test | | |
| Admin | Thông Báo | Chọn đối tượng | Nhắm mục tiêu theo loại: Doanh nghiệp, Khách hàng, Provider | Chọn Loại người dùng → Dropdown Vị trí cập nhật tương ứng | Cao | Chưa Test | | |
| Admin | Thông Báo | Chọn vị trí | Nhắm mục tiêu doanh nghiệp theo địa điểm cụ thể | Chọn Doanh nghiệp → Chọn vị trí từ dropdown → Gửi | Cao | Chưa Test | | |
| Admin | Thông Báo | Kiểm tra form | Các field bắt buộc được kiểm tra trước khi gửi | Để trống tiêu đề hoặc nội dung → Submit → Lỗi hiển thị inline | Cao | Chưa Test | | |
| Admin | Thông Báo | Xác nhận & Gửi | Modal xác nhận trước khi gửi thông báo | Click Gửi → Modal xác nhận → Xác nhận → Thông báo được gửi | Cao | Chưa Test | | |
| Admin | Thông Báo | Retry khi lỗi | Nút Retry xuất hiện nếu gửi thất bại | Gửi thất bại → Nút Retry xuất hiện → Click → Gửi lại không cần xác nhận | Trung bình | Chưa Test | | |
| Admin | Thông Báo | Danh sách thông báo | Xem tất cả thông báo đã gửi theo tab | Cuộn xuống phần danh sách → Tab Tất cả/Active/Archived → Duyệt | Trung bình | Chưa Test | | |
| Admin | Thông Báo | Tìm kiếm thông báo | Lọc thông báo theo tiêu đề hoặc nội dung | Nhập vào ô tìm kiếm → Kết quả lọc theo thời gian thực | Trung bình | Chưa Test | | |
| Admin | Thông Báo | Lưu trữ thông báo | Chuyển thông báo sang trạng thái Đã lưu trữ | Click Lưu trữ → Thông báo chuyển sang tab Archived | Trung bình | Chưa Test | | |

---

### Module: Xử Lý Lỗi & Hệ Thống

| Platform | Module | Tên Tính Năng | Mô Tả | Luồng / Hành Trình Người Dùng | Độ Ưu Tiên | Trạng Thái | Môi Trường | Ghi Chú |
|----------|--------|---------------|-------|-------------------------------|------------|------------|------------|---------|
| Admin | Hệ Thống | Xử lý lỗi API | Tất cả trang xử lý lỗi API một cách thân thiện | Mô phỏng lỗi mạng → Thông báo lỗi + nút Retry hiện trên phần bị lỗi | Cao | Chưa Test | | |
| Admin | Hệ Thống | Skeleton loading | Tất cả nội dung bất đồng bộ hiển thị skeleton khi tải | Vào bất kỳ trang nào → Skeleton hiện → Dữ liệu thay thế | Cao | Chưa Test | | |
| Admin | Hệ Thống | Modal xác nhận | Tất cả hành động phá hủy dữ liệu yêu cầu xác nhận | Xóa hoặc tạm khóa → Modal xác nhận xuất hiện → Xác nhận hoặc Hủy | Cao | Chưa Test | | |
| Admin | Hệ Thống | Toast thông báo | Toast thành công/lỗi sau các thao tác của người dùng | Thực hiện thao tác → Toast hiện đúng vị trí → Tự tắt | Trung bình | Chưa Test | | |
| Admin | Hệ Thống | Giao diện responsive | Admin UI thích ứng với các kích thước màn hình khác nhau | Thu nhỏ trình duyệt → Layout điều chỉnh; bảng cuộn ngang trên màn nhỏ | Trung bình | Chưa Test | | |
| Admin | Hệ Thống | Xử lý route 404 | URL không tồn tại hiển thị trang 404 | Nhập URL không tồn tại → Trang 404 hiển thị | Thấp | Chưa Test | | |

---
---

## 📱 NỀN TẢNG: MOBILE (Customer)

### Module: Onboarding & Đăng Nhập

| Platform | Module | Tên Tính Năng | Mô Tả | Luồng / Hành Trình Người Dùng | Độ Ưu Tiên | Trạng Thái | Môi Trường | Ghi Chú |
|----------|--------|---------------|-------|-------------------------------|------------|------------|------------|---------|
| Mobile (Customer) | Onboarding | Splash Screen | Khởi tạo app với kiểm tra auto-login | Mở app → Splash → Nếu có token hợp lệ → Trang chủ; Không có → Đăng nhập | Cao | Chưa Test | | |
| Mobile (Customer) | Onboarding | Chọn Vai Trò | Người dùng chọn vai trò Customer hoặc Provider | Mở app lần đầu → Màn hình chọn vai trò → Chọn Customer hoặc Provider | Cao | Chưa Test | | |
| Mobile (Customer) | Onboarding | 3 Slide giới thiệu | Carousel giới thiệu tính năng app khi mở lần đầu | Lần đầu mở app → 3 slide với nút Next/Skip → Chuyển sang đăng nhập | Trung bình | Chưa Test | | |
| Mobile (Customer) | Đăng Nhập | Đăng ký tài khoản | Tạo tài khoản mới: tên, email, SĐT, mật khẩu, OTP | Tap Đăng ký → Nhập thông tin → Đặt mật khẩu → Xác minh OTP → Tạo xong | Cao | Chưa Test | | |
| Mobile (Customer) | Đăng Nhập | Đăng nhập | Đăng nhập bằng email và mật khẩu | Nhập email + mật khẩu → Submit → Chuyển về Trang chủ | Cao | Chưa Test | | |
| Mobile (Customer) | Đăng Nhập | Modal kích hoạt tài khoản | Xác nhận kích hoạt nếu tài khoản chưa được xác minh | Đăng nhập → Modal xuất hiện → Xác nhận → Tiếp tục | Cao | Chưa Test | | |
| Mobile (Customer) | Đăng Nhập | Quên mật khẩu | Đặt lại mật khẩu qua email hoặc OTP điện thoại | Tap Quên mật khẩu → Chọn phương thức → Nhập OTP → Mật khẩu mới → Thành công | Cao | Chưa Test | | |
| Mobile (Customer) | Đăng Nhập | Đăng xuất | Xác nhận đăng xuất và xóa phiên làm việc | Profile → Đăng xuất → Modal xác nhận → Chuyển về Đăng nhập | Cao | Chưa Test | | |

---

### Module: Trang Chủ (Home)

| Platform | Module | Tên Tính Năng | Mô Tả | Luồng / Hành Trình Người Dùng | Độ Ưu Tiên | Trạng Thái | Môi Trường | Ghi Chú |
|----------|--------|---------------|-------|-------------------------------|------------|------------|------------|---------|
| Mobile (Customer) | Trang Chủ | Header & Vị trí | Hiển thị vị trí hiện tại của người dùng + icon thông báo | Mở Trang chủ → Vị trí hiển thị trên header → Tap icon thông báo | Cao | Chưa Test | | |
| Mobile (Customer) | Trang Chủ | Doanh nghiệp gần đây | Danh sách doanh nghiệp gần vị trí người dùng nhất | Tải Trang chủ → Phần Nearby hiển thị doanh nghiệp sắp xếp theo khoảng cách | Cao | Chưa Test | | |
| Mobile (Customer) | Trang Chủ | Danh mục dịch vụ | Carousel danh mục ngành nghề để truy cập nhanh | Trang chủ → Cuộn phần Categories → Tap danh mục → Màn kết quả | Cao | Chưa Test | | |
| Mobile (Customer) | Trang Chủ | Phổ biến hiện tại | Phần doanh nghiệp đang trending trên trang chủ | Trang chủ → Phần Popular Now → Tap để xem chi tiết | Cao | Chưa Test | | |
| Mobile (Customer) | Trang Chủ | Pull-to-refresh | Làm mới toàn bộ nội dung trang chủ | Kéo xuống trên Trang chủ → Dữ liệu tải lại | Trung bình | Chưa Test | | |

---

### Module: Tìm Kiếm (Search)

| Platform | Module | Tên Tính Năng | Mô Tả | Luồng / Hành Trình Người Dùng | Độ Ưu Tiên | Trạng Thái | Môi Trường | Ghi Chú |
|----------|--------|---------------|-------|-------------------------------|------------|------------|------------|---------|
| Mobile (Customer) | Tìm Kiếm | Tìm kiếm với gợi ý | Gợi ý tên doanh nghiệp theo thời gian thực khi gõ | Tap thanh tìm kiếm → Gõ từ khóa → Gợi ý xuất hiện → Chọn kết quả | Cao | Chưa Test | | |
| Mobile (Customer) | Tìm Kiếm | Lịch sử tìm kiếm | Xem và xóa các tìm kiếm gần đây | Mở Tìm kiếm → Lịch sử hiển thị → Tap để dùng lại → Xóa từng mục | Trung bình | Chưa Test | | |
| Mobile (Customer) | Tìm Kiếm | Danh mục gợi ý | Phím tắt danh mục hiển thị trên màn hình tìm kiếm | Mở Tìm kiếm → Danh mục gợi ý hiển thị bên dưới | Trung bình | Chưa Test | | |
| Mobile (Customer) | Tìm Kiếm | Kết quả & cuộn vô hạn | Kết quả phân trang với tự động tải thêm khi cuộn | Tìm kiếm → Danh sách kết quả → Cuộn xuống dưới → Tải thêm | Cao | Chưa Test | | |
| Mobile (Customer) | Tìm Kiếm | Bộ lọc (Filters) | Lọc theo danh mục, phụ danh mục, khoảng cách, thời gian | Tap Lọc → Chọn tiêu chí → Áp dụng → Kết quả cập nhật | Cao | Chưa Test | | |
| Mobile (Customer) | Tìm Kiếm | Sắp xếp (Sort) | Sắp xếp kết quả theo gần nhất hoặc mới nhất | Tap Sắp xếp → Chọn tuỳ chọn → Kết quả sắp xếp lại | Cao | Chưa Test | | |
| Mobile (Customer) | Tìm Kiếm | Empty state | Hiển thị thông báo khi không có kết quả | Tìm kiếm từ không có kết quả → Hiển thị thông báo empty state | Trung bình | Chưa Test | | |

---

### Module: Gần Đây (Near Me)

| Platform | Module | Tên Tính Năng | Mô Tả | Luồng / Hành Trình Người Dùng | Độ Ưu Tiên | Trạng Thái | Môi Trường | Ghi Chú |
|----------|--------|---------------|-------|-------------------------------|------------|------------|------------|---------|
| Mobile (Customer) | Gần Đây | Chế độ bản đồ | Google Maps với marker doanh nghiệp và phân cụm | Mở Near Me → Bản đồ tải → Marker hiển thị → Tap marker → Popup xem trước | Cao | Chưa Test | | |
| Mobile (Customer) | Gần Đây | Chế độ danh sách | Danh sách doanh nghiệp có thể cuộn | Chuyển sang List view → Doanh nghiệp hiển thị dạng list theo khoảng cách | Cao | Chưa Test | | |
| Mobile (Customer) | Gần Đây | Chuyển đổi Bản đồ ↔ Danh sách | Chuyển đổi giữa chế độ bản đồ và danh sách | Tap nút chuyển đổi → View thay đổi giữa Map và List | Cao | Chưa Test | | |
| Mobile (Customer) | Gần Đây | Tìm kiếm trong vùng | Tìm kiếm trong khu vực bản đồ đang hiển thị | Pan/zoom bản đồ → Tap "Search This Area" → Marker cập nhật | Trung bình | Chưa Test | | |
| Mobile (Customer) | Gần Đây | Nút vị trí của tôi | Quay về vị trí GPS hiện tại của người dùng | Tap Vị trí của tôi → Bản đồ căn giữa về vị trí người dùng | Trung bình | Chưa Test | | |
| Mobile (Customer) | Gần Đây | Quyền vị trí | Yêu cầu và xử lý quyền truy cập vị trí thiết bị | Lần đầu dùng → Hiện thông báo xin quyền → Cho phép hoặc Từ chối → Xử lý cả hai | Cao | Chưa Test | | |
| Mobile (Customer) | Gần Đây | Chọn vị trí thủ công | Chọn thủ công khu vực tìm kiếm | Tap bộ chọn vị trí → Tìm kiếm/chọn khu vực → Kết quả cập nhật | Trung bình | Chưa Test | | |
| Mobile (Customer) | Gần Đây | Lọc & Sắp xếp trong Near Me | Áp dụng bộ lọc và sắp xếp trong Near Me | Tap Lọc/Sắp xếp → Chọn tuỳ chọn → Kết quả cập nhật trên bản đồ/danh sách | Trung bình | Chưa Test | | |

---

### Module: Chi Tiết Doanh Nghiệp

| Platform | Module | Tên Tính Năng | Mô Tả | Luồng / Hành Trình Người Dùng | Độ Ưu Tiên | Trạng Thái | Môi Trường | Ghi Chú |
|----------|--------|---------------|-------|-------------------------------|------------|------------|------------|---------|
| Mobile (Customer) | Chi Tiết DN | Thông tin doanh nghiệp | Chi tiết đầy đủ: tên, danh mục, rating, khoảng cách, giờ, mô tả | Tap bất kỳ doanh nghiệp → Màn chi tiết tải → Hiển thị đầy đủ | Cao | Chưa Test | | |
| Mobile (Customer) | Chi Tiết DN | Mở bản đồ chỉ đường | Tap địa chỉ để mở Google Maps chỉ đường | Tap địa chỉ → Google Maps mở với vị trí doanh nghiệp | Cao | Chưa Test | | |
| Mobile (Customer) | Chi Tiết DN | Gọi điện | Tap số điện thoại để gọi trực tiếp | Tap icon điện thoại → Ứng dụng gọi mở với số đã điền | Cao | Chưa Test | | |
| Mobile (Customer) | Chi Tiết DN | Nhắn tin với doanh nghiệp | Mở cuộc trò chuyện với doanh nghiệp | Tap nút Nhắn tin → Chuyển đến màn chat | Cao | Chưa Test | | |
| Mobile (Customer) | Chi Tiết DN | Gallery ảnh | Gallery cuộn ngang với nút "Xem tất cả" | Cuộn gallery → Tap ảnh → Xem fullscreen | Trung bình | Chưa Test | | |
| Mobile (Customer) | Chi Tiết DN | Phần đánh giá | Tóm tắt rating + 3 đánh giá mới nhất với link "Xem tất cả" | Xem phần reviews → Điểm TB + 3 đánh giá → Tap Xem tất cả | Cao | Chưa Test | | |
| Mobile (Customer) | Chi Tiết DN | Đánh giá & Nhận xét | Gửi đánh giá sao kèm nội dung và media | Tap Đánh giá → Chọn sao → Viết nhận xét → Upload ảnh/video → Gửi | Cao | Chưa Test | | |
| Mobile (Customer) | Chi Tiết DN | Có thể bạn cũng thích | Đề xuất các doanh nghiệp tương tự phía dưới | Cuộn xuống dưới → Phần gợi ý doanh nghiệp tương tự hiển thị | Thấp | Chưa Test | | |

---

### Module: Đánh Giá & Ảnh

| Platform | Module | Tên Tính Năng | Mô Tả | Luồng / Hành Trình Người Dùng | Độ Ưu Tiên | Trạng Thái | Môi Trường | Ghi Chú |
|----------|--------|---------------|-------|-------------------------------|------------|------------|------------|---------|
| Mobile (Customer) | Đánh Giá | Màn hình tất cả đánh giá | Toàn bộ đánh giá phân trang của doanh nghiệp | Tap "Xem tất cả đánh giá" → Danh sách đầy đủ → Cuộn để tải thêm | Trung bình | Chưa Test | | |
| Mobile (Customer) | Đánh Giá | Media trong đánh giá | Ảnh và video hiển thị trong nội dung đánh giá | Xem đánh giá → Thumbnail media → Tap để xem lớn | Trung bình | Chưa Test | | |
| Mobile (Customer) | Ảnh | Xem tất cả ảnh | Gallery fullscreen tất cả ảnh của doanh nghiệp | Tap "Xem tất cả ảnh" → Grid fullscreen → Tap ảnh → Zoom | Trung bình | Chưa Test | | |

---

### Module: Nhắn Tin (Messages)

| Platform | Module | Tên Tính Năng | Mô Tả | Luồng / Hành Trình Người Dùng | Độ Ưu Tiên | Trạng Thái | Môi Trường | Ghi Chú |
|----------|--------|---------------|-------|-------------------------------|------------|------------|------------|---------|
| Mobile (Customer) | Nhắn Tin | Danh sách cuộc trò chuyện | Hộp thư với tất cả cuộc trò chuyện và xem trước | Tap tab Tin nhắn → Danh sách cuộc trò chuyện → Badge chưa đọc | Cao | Chưa Test | | |
| Mobile (Customer) | Nhắn Tin | Tìm kiếm cuộc trò chuyện | Lọc cuộc trò chuyện theo tên hoặc từ khóa | Nhập vào thanh tìm kiếm trong Tin nhắn → Danh sách lọc | Trung bình | Chưa Test | | |
| Mobile (Customer) | Nhắn Tin | Chat thời gian thực | Gửi và nhận tin nhắn ngay lập tức qua Socket.io | Mở chat → Gõ tin nhắn → Gửi → Nhận theo thời gian thực | Cao | Chưa Test | | |
| Mobile (Customer) | Nhắn Tin | Bong bóng & trạng thái | Kiểu bong bóng tin nhắn phân biệt gửi/nhận + trạng thái | Tin nhắn hiển thị đúng bong bóng và chỉ báo đã gửi/đã đọc | Cao | Chưa Test | | |
| Mobile (Customer) | Nhắn Tin | Chỉ báo đang gõ | Hiển thị khi đối phương đang gõ tin nhắn | Bên kia đang gõ → Chỉ báo "Đang gõ..." xuất hiện | Trung bình | Chưa Test | | |
| Mobile (Customer) | Nhắn Tin | Tải tin nhắn cũ | Cuộn lên để tải lịch sử trò chuyện | Cuộn lên đầu trong chat → Tin nhắn cũ hơn được tải | Trung bình | Chưa Test | | |
| Mobile (Customer) | Nhắn Tin | Thử lại tin nhắn thất bại | Tùy chọn thử lại gửi khi thất bại | Gửi thất bại → Tùy chọn Thử lại hiển thị → Tap → Gửi lại | Trung bình | Chưa Test | | |

---

### Module: Thông Báo (Notifications)

| Platform | Module | Tên Tính Năng | Mô Tả | Luồng / Hành Trình Người Dùng | Độ Ưu Tiên | Trạng Thái | Môi Trường | Ghi Chú |
|----------|--------|---------------|-------|-------------------------------|------------|------------|------------|---------|
| Mobile (Customer) | Thông Báo | Danh sách thông báo | Xem tất cả thông báo nhận được với phân trang | Tap Thông báo → Danh sách hiển thị → Cuộn để tải thêm | Cao | Chưa Test | | |
| Mobile (Customer) | Thông Báo | Đánh dấu đã đọc | Đánh dấu từng thông báo hoặc tất cả là đã đọc | Tap thông báo → Đánh dấu đã đọc; Tap "Đánh dấu tất cả" → Tất cả xóa | Cao | Chưa Test | | |
| Mobile (Customer) | Thông Báo | Push notification | Nhận push notification khi app ở nền | App chạy nền → Push nhận được → Tap → Mở màn hình tương ứng | Cao | Chưa Test | | |
| Mobile (Customer) | Thông Báo | Banner trong app | Banner thông báo khi đang sử dụng app | App đang mở → Nhận thông báo → Banner trượt xuống phía trên | Trung bình | Chưa Test | | |
| Mobile (Customer) | Thông Báo | Badge trên tab | Số chưa đọc hiển thị trên icon tab Thông báo | Nhận thông báo → Số badge xuất hiện trên icon tab | Trung bình | Chưa Test | | |
| Mobile (Customer) | Thông Báo | Cài đặt thông báo | Bật/tắt push và email theo từng loại | Cài đặt → Tùy chọn thông báo → Bật/tắt → Lưu | Trung bình | Chưa Test | | |

---

### Module: Danh Mục & Khám Phá

| Platform | Module | Tên Tính Năng | Mô Tả | Luồng / Hành Trình Người Dùng | Độ Ưu Tiên | Trạng Thái | Môi Trường | Ghi Chú |
|----------|--------|---------------|-------|-------------------------------|------------|------------|------------|---------|
| Mobile (Customer) | Khám Phá | Tất cả danh mục | Dạng grid tất cả các danh mục dịch vụ | Tap Danh mục → Dạng grid → Tap bất kỳ → Kết quả danh mục | Trung bình | Chưa Test | | |
| Mobile (Customer) | Khám Phá | Kết quả theo danh mục | Doanh nghiệp lọc theo danh mục đã chọn với sắp xếp/lọc | Chọn danh mục → Danh sách kết quả → Lọc/Sắp xếp | Trung bình | Chưa Test | | |
| Mobile (Customer) | Khám Phá | Phổ biến hiện tại (Toàn bộ) | Danh sách đầy đủ doanh nghiệp đang trending | Tap "Xem tất cả" ở Popular Now → Danh sách đầy đủ với lọc/sắp xếp | Trung bình | Chưa Test | | |
| Mobile (Customer) | Khám Phá | Có thể bạn cũng thích (Toàn bộ) | Danh sách đầy đủ doanh nghiệp tương tự | Tap "Xem tất cả" ở You May Also Like → Danh sách đầy đủ | Thấp | Chưa Test | | |

---

### Module: Hồ Sơ & Cài Đặt

| Platform | Module | Tên Tính Năng | Mô Tả | Luồng / Hành Trình Người Dùng | Độ Ưu Tiên | Trạng Thái | Môi Trường | Ghi Chú |
|----------|--------|---------------|-------|-------------------------------|------------|------------|------------|---------|
| Mobile (Customer) | Hồ Sơ | Màn hình hồ sơ | Xem avatar, tên và menu cài đặt | Tap tab Hồ sơ → Thông tin và menu hiển thị | Cao | Chưa Test | | |
| Mobile (Customer) | Hồ Sơ | Chỉnh sửa ảnh đại diện | Thay ảnh đại diện qua camera hoặc thư viện | Tap avatar → Chọn Camera hoặc Thư viện → Cắt ảnh → Lưu | Cao | Chưa Test | | |
| Mobile (Customer) | Hồ Sơ | Cài đặt tài khoản | Sửa họ tên; xóa tài khoản | Hồ sơ → Cài đặt tài khoản → Sửa các field → Lưu hoặc Xóa tài khoản | Cao | Chưa Test | | |
| Mobile (Customer) | Hồ Sơ | Cài đặt mật khẩu | Đổi mật khẩu hiện tại | Hồ sơ → Cài đặt mật khẩu → Xác minh mật khẩu cũ → Mật khẩu mới → Lưu | Cao | Chưa Test | | |
| Mobile (Customer) | Hồ Sơ | Trợ giúp & Hỗ trợ | FAQ dạng accordion có thể mở rộng | Hồ sơ → Trợ giúp & Hỗ trợ → Duyệt các câu hỏi → Mở rộng/Thu gọn | Thấp | Chưa Test | | |
| Mobile (Customer) | Hồ Sơ | Điều khoản & Chính sách | Xem trang pháp lý qua WebView trong app | Hồ sơ → Điều khoản & Chính sách → WebView hiển thị nội dung HTML | Thấp | Chưa Test | | |

---
---

## 📱 NỀN TẢNG: MOBILE (Provider)

### Module: Trang Chủ Provider

| Platform | Module | Tên Tính Năng | Mô Tả | Luồng / Hành Trình Người Dùng | Độ Ưu Tiên | Trạng Thái | Môi Trường | Ghi Chú |
|----------|--------|---------------|-------|-------------------------------|------------|------------|------------|---------|
| Mobile (Provider) | Trang Chủ Provider | Dashboard | Thẻ thông tin doanh nghiệp + tin nhắn gần đây + đối thủ gần đây | Đăng nhập vai Provider → Trang chủ → Thẻ doanh nghiệp + tin nhắn + danh sách đối thủ | Cao | Chưa Test | | |
| Mobile (Provider) | Trang Chủ Provider | Nút thêm doanh nghiệp | Hiển thị gợi ý đăng ký nếu chưa có doanh nghiệp | Provider mới chưa có doanh nghiệp → Nút "Thêm doanh nghiệp" hiển thị | Cao | Chưa Test | | |
| Mobile (Provider) | Trang Chủ Provider | Tin nhắn gần đây | Xem trước các cuộc trò chuyện mới nhất từ khách hàng | Dashboard → Phần Tin nhắn gần đây → Tap để mở chat | Cao | Chưa Test | | |
| Mobile (Provider) | Trang Chủ Provider | Đối thủ gần đây | Doanh nghiệp cùng ngành ở gần | Dashboard → Phần Competitors Near You → Hiển thị danh sách | Trung bình | Chưa Test | | |

---

### Module: Đăng Ký & Quản Lý Doanh Nghiệp

| Platform | Module | Tên Tính Năng | Mô Tả | Luồng / Hành Trình Người Dùng | Độ Ưu Tiên | Trạng Thái | Môi Trường | Ghi Chú |
|----------|--------|---------------|-------|-------------------------------|------------|------------|------------|---------|
| Mobile (Provider) | Đăng Ký DN | Thiết lập hồ sơ | Nhập tên doanh nghiệp và upload ảnh đại diện | Luồng đăng ký → Phần 1 → Nhập tên + upload ảnh → Tiếp tục | Cao | Chưa Test | | |
| Mobile (Provider) | Đăng Ký DN | Thông tin liên hệ | Thêm số điện thoại và phương thức liên lạc ưu tiên | Phần 3 → SĐT + chọn Nhắn tin hoặc Gọi điện → Tiếp tục | Cao | Chưa Test | | |
| Mobile (Provider) | Đăng Ký DN | Địa chỉ & Bản đồ | Chọn địa chỉ doanh nghiệp qua Google Places | Phần 4 → Tìm địa chỉ → Ghim trên bản đồ → Xác nhận vị trí | Cao | Chưa Test | | |
| Mobile (Provider) | Đăng Ký DN | Giờ làm việc | Đặt giờ mở/đóng cửa từng ngày trong tuần | Phần 5 → Bật/tắt từng ngày → Đặt giờ → Tiếp tục | Cao | Chưa Test | | |
| Mobile (Provider) | Đăng Ký DN | Mô tả doanh nghiệp | Thêm mô tả về doanh nghiệp | Phần 6 → Viết mô tả → Tiếp tục | Cao | Chưa Test | | |
| Mobile (Provider) | Đăng Ký DN | Chọn danh mục | Chọn ngành nghề và phụ danh mục | Phần 7 → Duyệt và chọn danh mục + phụ danh mục | Cao | Chưa Test | | |
| Mobile (Provider) | Đăng Ký DN | Upload ảnh gallery | Upload ảnh gallery của doanh nghiệp | Phần 8 → Chọn ảnh từ thư viện → Upload | Cao | Chưa Test | | |
| Mobile (Provider) | Đăng Ký DN | Gửi duyệt | Nộp doanh nghiệp hoàn chỉnh để admin xét duyệt | Điền xong tất cả phần → Gửi → Trạng thái hiển thị Đang chờ | Cao | Chưa Test | | |
| Mobile (Provider) | Quản Lý DN | Trạng thái duyệt / từ chối | Xem trạng thái duyệt hiện tại và lý do từ chối (nếu có) | Đã nộp → Hiển thị trạng thái: Đang chờ / Đã duyệt / Từ chối + lý do | Cao | Chưa Test | | |
| Mobile (Provider) | Quản Lý DN | Chỉnh sửa thông tin | Sửa bất kỳ phần nào của hồ sơ doanh nghiệp | Doanh nghiệp đã đăng ký → Tap chỉnh sửa phần → Cập nhật → Lưu có xác nhận | Cao | Chưa Test | | |
| Mobile (Provider) | Quản Lý DN | Chỉnh sửa giờ làm việc | Cập nhật giờ mở cửa theo từng ngày | Chỉnh sửa doanh nghiệp → Giờ làm việc → Bật/Tắt/Sửa từng ngày → Lưu | Cao | Chưa Test | | |
| Mobile (Provider) | Quản Lý DN | Quản lý ảnh | Thêm, xóa, đặt làm primary, ghim/bỏ ghim ảnh | Ảnh doanh nghiệp → Thêm mới / Xóa / Đặt làm primary / Ghim | Trung bình | Chưa Test | | |
| Mobile (Provider) | Quản Lý DN | Trạng thái hiển thị | Bật/tắt hiển thị doanh nghiệp trên app | Hồ sơ → Trạng thái hiển thị → Bật/tắt → Xác nhận | Trung bình | Chưa Test | | |

---
---

## 📊 Tổng Hợp Độ Phủ Test

| Nền Tảng | Module | Tổng Tính Năng | Passed | Failed | Chưa Test |
|----------|--------|---------------|--------|--------|-----------|
| Admin | Đăng Nhập | 6 | | | 6 |
| Admin | Giao Diện & Điều Hướng | 4 | | | 4 |
| Admin | Dashboard | 5 | | | 5 |
| Admin | Quản Lý Khách Hàng | 11 | | | 11 |
| Admin | Quản Lý Doanh Nghiệp | 10 | | | 10 |
| Admin | Xác Minh | 8 | | | 8 |
| Admin | Thông Báo | 10 | | | 10 |
| Admin | Hệ Thống / Xử Lý Lỗi | 6 | | | 6 |
| Mobile (Customer) | Onboarding & Đăng Nhập | 8 | | | 8 |
| Mobile (Customer) | Trang Chủ | 5 | | | 5 |
| Mobile (Customer) | Tìm Kiếm | 7 | | | 7 |
| Mobile (Customer) | Gần Đây | 8 | | | 8 |
| Mobile (Customer) | Chi Tiết Doanh Nghiệp | 8 | | | 8 |
| Mobile (Customer) | Đánh Giá & Ảnh | 3 | | | 3 |
| Mobile (Customer) | Nhắn Tin | 7 | | | 7 |
| Mobile (Customer) | Thông Báo | 6 | | | 6 |
| Mobile (Customer) | Khám Phá | 4 | | | 4 |
| Mobile (Customer) | Hồ Sơ & Cài Đặt | 6 | | | 6 |
| Mobile (Provider) | Trang Chủ Provider | 4 | | | 4 |
| Mobile (Provider) | Đăng Ký Doanh Nghiệp | 9 | | | 9 |
| Mobile (Provider) | Quản Lý Doanh Nghiệp | 5 | | | 5 |
| **TỔNG** | | **149** | | | **149** |

---

## 📝 Nhật Ký Phiên Test

**Người Test:**
**Môi Trường:** `[ ] Dev  [ ] Beta  [ ] Production`
**Ngày Test:**
**Build / Phiên bản:**

### Lỗi Phát Hiện

| # | Nền Tảng | Module | Tính Năng | Mô Tả Lỗi | Mức Độ | Trạng Thái | Tham Chiếu |
|---|----------|--------|-----------|-----------|--------|------------|------------|
| | | | | | Nghiêm trọng / Cao / Trung bình / Thấp | Mở / Đã sửa / Không sửa | GSheet / Ticket |
