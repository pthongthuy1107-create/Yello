# YELLO APP — FEATURE & FUNCTION SUMMARY (QC Checklist)

> **Cập nhật:** 2026-03-17
> **Phiên bản:** React Native 0.81.4 / Expo SDK ~54.0
> **Vai trò người dùng:** Customer | Provider

---

## PHÂN VAI TRÒ NGƯỜI DÙNG

- [ ] Chọn vai trò khi đăng ký: **Customer** hoặc **Provider**

---

## ONBOARDING & AUTH

### Onboarding
- [ ] Màn hình onboarding 3 slide giới thiệu app
- [ ] Nút "Next" / "Skip" giữa các slide
- [ ] Chuyển sang màn auth sau khi hoàn tất

### Đăng ký (Sign Up)
- [ ] Nhập First Name, Last Name, Email, Phone Number
- [ ] Nhập mật khẩu + xác nhận mật khẩu
- [ ] Toggle ẩn/hiện mật khẩu
- [ ] Xác minh tài khoản qua mã OTP (Email/SMS)
- [ ] Resend code khi OTP hết hạn

### Đăng nhập (Sign In)
- [ ] Đăng nhập bằng Email + Mật khẩu
- [ ] Toggle ẩn/hiện mật khẩu
- [ ] Hiển thị lỗi khi sai thông tin
- [ ] Modal xác nhận kích hoạt tài khoản

### Quên mật khẩu (Reset Password)
- [ ] Chọn phương thức khôi phục: Email hoặc SMS
- [ ] Gửi mã xác minh
- [ ] Nhập mã xác minh
- [ ] Nhập mật khẩu mới + xác nhận
- [ ] Màn hình thông báo đặt lại thành công

### Đăng xuất (Logout)
- [ ] Modal xác nhận trước khi đăng xuất

---

## CUSTOMER — TRANG CHỦ (Home)

- [ ] Header hiển thị vị trí hiện tại + icon thông báo
- [ ] Thanh tìm kiếm (Search bar), bấm vào dẫn đến màn Search
- [ ] Section **Nearby** — danh sách doanh nghiệp gần vị trí hiện tại
- [ ] Section **Categories** — các danh mục ngành nghề nhanh
- [ ] Section **Popular Now** — các doanh nghiệp đang trending
- [ ] Pull-to-refresh toàn trang chủ

---

## CUSTOMER — TÌM KIẾM (Search)

- [ ] Ô tìm kiếm với autocomplete gợi ý tên doanh nghiệp
- [ ] Hiển thị lịch sử tìm kiếm gần đây
- [ ] Hiển thị danh mục/dịch vụ gợi ý
- [ ] Kết quả tìm kiếm phân trang (load more khi scroll)
- [ ] Hiển thị số lượng kết quả
- [ ] Lọc kết quả (**Filters Modal**): ngành, trạng thái mở cửa, xếp hạng
- [ ] Sắp xếp kết quả (**Sort Modal**): theo khoảng cách, rating, mới nhất
- [ ] Trạng thái empty state khi không có kết quả

---

## CUSTOMER — GẦN ĐÂY (Near Me)

- [ ] Chuyển đổi giữa **Map View** và **List View**
- [ ] Bản đồ hiển thị marker doanh nghiệp
- [ ] Bấm vào marker hiện popup preview doanh nghiệp
- [ ] Tìm kiếm trong vùng bản đồ hiện tại
- [ ] Modal chọn vị trí thủ công
- [ ] Lọc và sắp xếp
- [ ] Xin quyền truy cập vị trí thiết bị

---

## CUSTOMER — CHI TIẾT DOANH NGHIỆP (Business Detail)

- [ ] Ảnh hero / carousel
- [ ] Tên, danh mục, rating, khoảng cách
- [ ] Địa chỉ — bấm vào mở Google Maps
- [ ] Nút liên hệ (Gọi điện / Nhắn tin)
- [ ] Lịch làm việc (Working Hours)
- [ ] Mô tả về doanh nghiệp (About)
- [ ] Gallery ảnh — bấm xem fullscreen
- [ ] Xem toàn bộ ảnh (View All Photos)
- [ ] 3 đánh giá mới nhất + nút "View All Reviews"
- [ ] Section "You May Also Like" (gợi ý tương tự)
- [ ] Gửi đánh giá / Rating
- [ ] Pull-to-refresh

---

## CUSTOMER — ĐÁNH GIÁ (Reviews)

- [ ] Danh sách toàn bộ đánh giá, phân trang
- [ ] Hiển thị avatar, tên người dùng, rating, nội dung, thời gian
- [ ] Ảnh/video đính kèm trong đánh giá
- [ ] Pull-to-refresh

---

## CUSTOMER — ẢNH DOANH NGHIỆP (Photos)

- [ ] Grid tất cả ảnh của doanh nghiệp
- [ ] Xem ảnh fullscreen
- [ ] (Provider) Đặt ảnh làm primary
- [ ] (Provider) Pin/Unpin ảnh
- [ ] (Provider) Xóa ảnh
- [ ] (Provider) Thêm ảnh mới

---

## CUSTOMER — DANH MỤC (Categories)

- [ ] Danh sách tất cả danh mục (All Categories) dạng grid
- [ ] Bấm vào danh mục → danh sách doanh nghiệp theo danh mục
- [ ] Lọc, sắp xếp, phân trang trong danh mục

---

## CUSTOMER — PHỔ BIẾN (Popular Now)

- [ ] Toàn bộ danh sách doanh nghiệp phổ biến
- [ ] Lọc, sắp xếp, phân trang

---

## NHẮN TIN (Messages)

- [ ] Danh sách cuộc trò chuyện (Inbox) với preview tin nhắn cuối
- [ ] Avatar người dùng / doanh nghiệp
- [ ] Hiển thị badge tin chưa đọc
- [ ] Tìm kiếm trong danh sách chat
- [ ] Pull-to-refresh, load more

### Chi tiết cuộc trò chuyện (Chat Detail)
- [ ] Danh sách tin nhắn (inverted list)
- [ ] Bong bóng tin nhắn phân biệt gửi/nhận
- [ ] Trạng thái đã đọc / chưa đọc
- [ ] Hiển thị ảnh trong tin nhắn
- [ ] Typing indicator
- [ ] Ô nhập tin nhắn + nút gửi
- [ ] Load more khi scroll lên
- [ ] Real-time nhận tin nhắn qua Socket
- [ ] Retry khi gửi thất bại
- [ ] Auto-scroll xuống tin mới nhất

---

## THÔNG BÁO (Notifications)

- [ ] Danh sách thông báo, phân trang
- [ ] Đánh dấu một thông báo là đã đọc
- [ ] Đánh dấu tất cả là đã đọc
- [ ] Pull-to-refresh
- [ ] Nhận thông báo real-time qua Socket
- [ ] In-app notification banner (ForegroundNotification)
- [ ] Badge count trên icon tab

### Cài đặt thông báo (Notification Preferences)
- [ ] Toggle bật/tắt Push Notification theo loại
- [ ] Lưu cài đặt
- [ ] Mở cài đặt thiết bị khi chưa cấp quyền

---

## PROVIDER — TRANG CHỦ DOANH NGHIỆP

- [ ] Hiển thị thông tin doanh nghiệp (nếu đã đăng ký)
- [ ] Nút "Thêm doanh nghiệp" (nếu chưa đăng ký)
- [ ] Section tin nhắn gần đây
- [ ] Section đối thủ gần đây (Competitors Near)
- [ ] Modal chọn vị trí
- [ ] Pull-to-refresh

---

## PROVIDER — ĐĂNG KÝ / QUẢN LÝ DOANH NGHIỆP

- [ ] Upload ảnh đại diện doanh nghiệp
- [ ] Nhập tên và mô tả doanh nghiệp
- [ ] Chọn ngành nghề (Category + Subcategory)
- [ ] Nhập địa chỉ với bản đồ picker
- [ ] Thêm liên hệ (SĐT, Email, Website)
- [ ] Upload ảnh gallery doanh nghiệp
- [ ] Cài đặt lịch làm việc (Working Hours)
- [ ] Upload video phản hồi khách hàng
- [ ] Chỉnh sửa từng mục qua modal riêng
- [ ] Lưu / Hủy thay đổi với xác nhận
- [ ] Hiển thị trạng thái duyệt / từ chối (Approval/Rejection)

### Chỉnh sửa giờ làm việc (Edit Working Hours)
- [ ] Bật/tắt từng ngày trong tuần
- [ ] Chọn giờ mở/đóng cửa
- [ ] Validation giờ hợp lệ

### Visibility Status
- [ ] Toggle ẩn/hiện doanh nghiệp trên app
- [ ] Liên hệ hỗ trợ

---

## PROFILE & TÀI KHOẢN

- [ ] Hiển thị avatar, tên người dùng, tên doanh nghiệp (nếu có)
- [ ] Upload/thay đổi ảnh đại diện (từ Camera hoặc Thư viện)
- [ ] Pull-to-refresh
- [ ] Menu dẫn đến: Account Settings, Password, Notifications, Help, Terms

### Account Settings
- [ ] Chỉnh sửa First Name, Last Name
- [ ] Email hiển thị (read-only)
- [ ] Xóa tài khoản (có modal xác nhận)

### Password Settings
- [ ] Nhập mật khẩu hiện tại
- [ ] Nhập mật khẩu mới + xác nhận
- [ ] Toggle ẩn/hiện mật khẩu

### Add New Address
- [ ] Tìm kiếm địa chỉ với Google Places autocomplete
- [ ] Bản đồ chọn vị trí
- [ ] Nút "Vị trí của tôi"
- [ ] Nhập thủ công: Line 1, Line 2, City, State, Postal Code

### Help & Support
- [ ] FAQ dạng accordion (expand/collapse)
- [ ] Nút liên hệ hỗ trợ

### Terms & Privacy Policy
- [ ] Render nội dung HTML từ API
- [ ] Hiển thị ngày cập nhật

---

## HỆ THỐNG & KỸ THUẬT

- [ ] Đa ngôn ngữ (i18n)
- [ ] Real-time WebSocket (tin nhắn + thông báo)
- [ ] Xử lý mất mạng (toast lỗi, giữ cache)
- [ ] Token refresh tự động (JWT)
- [ ] Upload lên AWS S3 (ảnh, video)
- [ ] Google Places API (tìm kiếm địa chỉ)
- [ ] Push Notification (Expo Push)
- [ ] Offline cache (Apollo + Redux Persist)
- [ ] Kiểm tra quyền: Location, Camera, Photo Library
- [ ] Loading overlay toàn màn hình
- [ ] Tab bar với badge thông báo
- [ ] Deep link navigation

---

## TỔNG KẾT

| Hạng mục | Số lượng |
|---|---|
| Màn hình | 35+ |
| Vai trò người dùng | 2 (Customer / Provider) |
| GraphQL Operations | ~40 |
| Custom Hooks | 20+ |
| Components | 30+ |

**Công nghệ chính:** React Native 0.81.4 · Expo SDK 54 · Apollo GraphQL · Redux · Socket.io · AWS S3 · Google Places API · Expo Router
