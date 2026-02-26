# Yello - MVP Features Checklist

> **Phạm vi**: Mobile App (Customer + Provider) + Admin Website
> **Loại trừ**: Payment, Tracking
> **Ngày tạo**: 2026-02-26

---

## Legend
- [ ] Chưa làm
- [x] Hoàn thành
- [~] Đang làm / Có vấn đề

---

## 📱 MOBILE APP

### 1. Authentication & Onboarding

- [ ] **SplashScreen** - Khởi tạo app, logic auto-login
- [ ] **ChooseRoleScreen** - Chọn vai trò Customer hoặc Provider
- [ ] **OnboardingScreen** - 3 slide giới thiệu (carousel + pagination dots)
- [ ] **SignInScreen** - Đăng nhập email/password
- [ ] **SignInScreen** - Link quên mật khẩu
- [ ] **SignInScreen** - Modal xác nhận tài khoản
- [ ] **SignUpScreen - Bước 1** - Nhập thông tin cá nhân
- [ ] **SignUpScreen - Bước 2** - Đặt mật khẩu
- [ ] **SignUpScreen - Bước 3** - Xác minh OTP email
- [ ] **ForgotPasswordScreen** - Chọn phương thức khôi phục (email/phone)
- [ ] **ForgotPasswordScreen** - Màn hình đặt lại mật khẩu
- [ ] **ForgotPasswordScreen** - Màn hình thành công

---

### 2. Customer - Màn hình chính

#### 2.1 HomeScreen
- [ ] Header hiển thị vị trí người dùng + nút thông báo
- [ ] Search bar
- [ ] Section "Nearby Businesses" (doanh nghiệp gần đây)
- [ ] Section "Categories" (danh mục dịch vụ - carousel)
- [ ] Section "Popular Now" (doanh nghiệp nổi bật)

#### 2.2 NearMeScreen - Map Mode
- [ ] Google Maps với markers doanh nghiệp
- [ ] Marker clustering
- [ ] Popup chi tiết khi nhấn marker
- [ ] Nút "Search This Area" sau khi pan bản đồ
- [ ] Nút "My Location" quay về vị trí hiện tại
- [ ] Xử lý quyền truy cập vị trí

#### 2.3 NearMeScreen - List Mode
- [ ] Danh sách doanh nghiệp dạng bảng
- [ ] Location picker modal (chọn khu vực tìm kiếm)
- [ ] Bộ lọc & sắp xếp (persistent giữa các tab)
- [ ] Recent search dropdown
- [ ] Chuyển đổi View (Map ↔ List)

#### 2.4 SearchScreen
- [ ] Thanh tìm kiếm với autocomplete suggestions
- [ ] Lịch sử tìm kiếm gần đây (có thể xóa từng mục)
- [ ] Dịch vụ được đề xuất theo danh mục
- [ ] Kết quả tìm kiếm với infinite scroll pagination
- [ ] **FiltersModal** - Lọc theo Category, Subcategory, Distance, Available Time
- [ ] **SortModal** - Sắp xếp theo Rating / Distance / Name / Newest
- [ ] Empty state khi không có kết quả

#### 2.5 MessagesScreen
- [ ] Danh sách cuộc hội thoại
- [ ] Tìm kiếm/lọc conversations
- [ ] Hiển thị tin nhắn cuối, trạng thái chưa đọc, timestamp
- [ ] Pull-to-refresh + infinite scroll

#### 2.6 MessageDetailScreen (Chat)
- [ ] Chat real-time với Socket.io
- [ ] Message bubbles (gửi/nhận + trạng thái)
- [ ] Typing indicators
- [ ] Input gửi tin nhắn
- [ ] Retry khi gửi thất bại
- [ ] Infinite scroll tải tin nhắn cũ

#### 2.7 ProfileScreen (Customer)
- [ ] Avatar (chỉnh sửa qua camera/gallery)
- [ ] Thông tin: tên, email, số điện thoại
- [ ] Menu: Account Settings, Password Settings, Notification Preferences, Help & Support
- [ ] Terms & Privacy (WebView modal)
- [ ] Đăng xuất với confirmation modal

---

### 3. Business Detail & Reviews

#### 3.1 BusinessDetailScreen
- [ ] Hero image
- [ ] Thông tin: tên, rating, số review, khoảng cách, danh mục
- [ ] Địa chỉ (nút mở Maps) + số điện thoại (nút gọi)
- [ ] Lịch làm việc
- [ ] Phần Giới thiệu (About)
- [ ] Gallery ảnh (cuộn ngang + xem tất cả)
- [ ] Reviews: tóm tắt rating + 3 review gần nhất
- [ ] Section "You May Also Like" (đề xuất tương tự)
- [ ] Form đánh giá & viết review

#### 3.2 AllReviewsScreen
- [ ] Toàn bộ reviews của doanh nghiệp
- [ ] FlatList với performance optimization

#### 3.3 RateAndReviewSection
- [ ] Chọn số sao (1-5)
- [ ] Nhập nội dung review
- [ ] Upload ảnh/video
- [ ] Submit review

#### 3.4 ViewAllPhotoScreen
- [ ] Gallery fullscreen của doanh nghiệp
- [ ] Hỗ trợ zoom ảnh

---

### 4. Provider - Màn hình chính

#### 4.1 ProviderHomeScreen (Dashboard)
- [ ] ServiceCard: thông tin doanh nghiệp + trạng thái
- [ ] LastMessagesSection: tin nhắn gần đây từ khách hàng
- [ ] Popular Now: đề xuất doanh nghiệp cùng ngành

#### 4.2 BusinessRegisterScreen
- [ ] Section 1 - Profile: Tên doanh nghiệp + upload avatar
- [ ] Section 2 - Rejection Notice: Hiển thị lý do bị từ chối (nếu có)
- [ ] Section 3 - Primary Contact: Số điện thoại, phương thức (Message/Call)
- [ ] Section 4 - Address: Location picker modal (Google Places)
- [ ] Section 5 - Schedule: Editor lịch làm việc từng ngày
- [ ] Section 6 - About: Mô tả doanh nghiệp
- [ ] Section 7 - Category: Chọn ngành / danh mục
- [ ] Section 8 - Photos: Upload ảnh gallery

#### 4.3 EditBusinessWorkingHoursScreen
- [ ] Chỉnh sửa lịch làm việc từng ngày trong tuần
- [ ] Time picker modal
- [ ] Toggle mở/đóng từng ngày

#### 4.4 ProfileScreen (Provider)
- [ ] Hiển thị tên doanh nghiệp & thông tin chủ sở hữu
- [ ] **Visibility Status** - Bật/tắt hiển thị doanh nghiệp

---

### 5. Browse & Discovery

- [ ] **AllCategoriesScreen** - Grid/list tất cả danh mục dịch vụ
- [ ] **CategoryDetailScreen** - Doanh nghiệp trong một danh mục + filter & sort
- [ ] **AllPopularNowScreen** - Danh sách đầy đủ doanh nghiệp nổi bật
- [ ] **YouMayAlsoLikeScreen** - Đề xuất doanh nghiệp tương tự

---

### 6. Settings & Notifications

- [ ] **AccountSettingScreen** - Chỉnh sửa tên, xóa tài khoản
- [ ] **PasswordSettingsScreen** - Đổi mật khẩu (xác minh mật khẩu hiện tại)
- [ ] **NotificationPreferencesScreen** - Toggle email & push notifications
- [ ] **VisibilityStatusScreen** - Bật/tắt trạng thái hiển thị (Provider)
- [ ] **HelpSupportScreen** - FAQ với collapsible items
- [ ] **TermsPrivacyScreen** - WebView Terms & Privacy Policy
- [ ] **NotificationScreen** - Danh sách thông báo + "Mark All as Read"

---

## 🌐 ADMIN WEBSITE

### 7. Authentication & Authorization

- [ ] **Login** - Đăng nhập bằng email/password
- [ ] **Logout** - Đăng xuất và xóa session
- [ ] **JWT Authentication** - Xác thực bằng token
- [ ] **Protected Routes** - AuthGuard bảo vệ các route
- [ ] **Auto Token Refresh** - Tự động refresh token khi hết hạn
- [ ] **Session Management** - Quản lý session bằng cookies

---

### 8. Dashboard Overview

#### 8.1 Metrics Display
- [ ] Tổng số người dùng (Total Users)
- [ ] Tổng số doanh nghiệp (Total Businesses)
- [ ] Tổng số lượt tìm kiếm (Total Searches)
- [ ] Số người dùng đang hoạt động (Active Users)
- [ ] Real-time data refresh

#### 8.2 Popular Searches Analytics
- [ ] Danh sách từ khóa tìm kiếm phổ biến
- [ ] Số lượt tìm kiếm mỗi từ khóa
- [ ] Số kết quả trả về mỗi từ khóa
- [ ] Sắp xếp theo cột (term, searches, results)
- [ ] Chọn số mục mỗi trang (10, 20, 50, 100)
- [ ] Tìm kiếm trong kết quả
- [ ] Phân trang

---

### 9. Notifications Management

#### 9.1 Tạo thông báo mới
- [ ] Nhập tiêu đề thông báo
- [ ] Nhập nội dung chi tiết
- [ ] Chọn đối tượng nhận (All, Businesses, Customers, Providers)
- [ ] Chọn địa điểm mục tiêu
- [ ] Chọn nhiều địa điểm cùng lúc
- [ ] Validation form
- [ ] Hiển thị kết quả thành công/thất bại

#### 9.2 Danh sách thông báo
- [ ] Bảng xem tất cả thông báo
- [ ] Lọc theo tab (All, Active, Archived)
- [ ] Tìm kiếm theo tiêu đề hoặc nội dung
- [ ] Sắp xếp theo cột
- [ ] Hành động Archive thông báo
- [ ] Phân trang + chọn số mục/trang
- [ ] Cập nhật real-time
- [ ] Empty state khi không có dữ liệu

#### 9.3 Chi tiết thông báo
- [ ] Thời gian gửi
- [ ] Badge loại đối tượng nhận
- [ ] Thông tin địa điểm mục tiêu
- [ ] Trạng thái thông báo

---

### 10. Users Management

#### 10.1 Quản lý Businesses
- [ ] Bảng xem tất cả doanh nghiệp
- [ ] Tìm kiếm theo tên hoặc ID
- [ ] Sắp xếp theo cột (ID, tên, trạng thái, ngày)
- [ ] Lọc theo trạng thái
- [ ] Expandable rows xem chi tiết
- [ ] Phân trang + chọn số mục/trang
- [ ] Cập nhật real-time
- [ ] Empty state
- [ ] Toggle Active/Inactive + confirmation dialog
- [ ] Optimistic UI + rollback khi lỗi
- [ ] Xem tổng số reviews (clickable)
- [ ] Thời gian hoạt động cuối cùng
- [ ] Nút xem profile chi tiết

#### 10.2 Business Reviews (Modal)
- [ ] Xem tất cả reviews của doanh nghiệp
- [ ] Nội dung review (text, ảnh, video)
- [ ] Thông tin người đánh giá (tên, avatar)
- [ ] Hiển thị rating
- [ ] Ngày/giờ review
- [ ] Preview media + lightbox fullscreen
- [ ] Xóa review + confirmation modal
- [ ] Phân trang reviews
- [ ] Empty state

#### 10.3 Business Metrics
- [ ] Tổng số doanh nghiệp
- [ ] Số doanh nghiệp đang hoạt động
- [ ] Số doanh nghiệp không hoạt động
- [ ] Số doanh nghiệp mới trong tháng

#### 10.4 Export Businesses
- [ ] Xuất dữ liệu ra CSV
- [ ] Chọn khoảng thời gian (date range picker)
- [ ] Validation khoảng thời gian
- [ ] Download có xác thực

#### 10.5 Quản lý Customers
- [ ] Bảng xem tất cả khách hàng
- [ ] Tìm kiếm theo tên hoặc email
- [ ] Sắp xếp theo cột (ID, tên, email, trạng thái, ngày)
- [ ] Lọc theo trạng thái
- [ ] Phân trang + chọn số mục/trang
- [ ] Cập nhật real-time
- [ ] Empty state
- [ ] Chọn trạng thái (Active/Inactive/Suspended) với popover UI
- [ ] Confirmation trước khi thay đổi
- [ ] Optimistic UI + rollback khi lỗi

#### 10.6 Customer Metrics
- [ ] Tổng số khách hàng
- [ ] Số khách hàng đang hoạt động
- [ ] Số khách hàng không hoạt động
- [ ] Số khách hàng mới trong tháng

#### 10.7 Export Customers
- [ ] Xuất dữ liệu ra CSV
- [ ] Chọn khoảng thời gian
- [ ] Validation khoảng thời gian
- [ ] Download có xác thực

#### 10.8 Navigation Users
- [ ] Tab chuyển đổi giữa Businesses và Customers
- [ ] Highlight tab đang active
- [ ] Header dùng chung cho cả 2 tab

---

### 11. Verification Module

#### 11.1 Danh sách doanh nghiệp cần duyệt
- [ ] Bảng xem tất cả doanh nghiệp chờ duyệt
- [ ] Lọc theo tab (All, Pending, Approved, Rejected)
- [ ] Hiển thị số lượng ở mỗi tab
- [ ] Tìm kiếm theo tên doanh nghiệp
- [ ] Sắp xếp theo cột
- [ ] Phân trang + chọn số mục/trang
- [ ] Cập nhật real-time
- [ ] Empty state

#### 11.2 Modal xem thông tin doanh nghiệp
- [ ] Tên doanh nghiệp
- [ ] Mô tả doanh nghiệp
- [ ] Thông tin liên hệ
- [ ] Preview ảnh/media
- [ ] Preview tài liệu
- [ ] Thông tin chủ sở hữu
- [ ] Ngày nộp đơn
- [ ] Trạng thái hiện tại

#### 11.3 Hành động duyệt/từ chối
- [ ] Nút Approve doanh nghiệp
- [ ] Nút Reject doanh nghiệp
- [ ] Confirmation dialog trước khi thực hiện
- [ ] Loading state trong khi xử lý
- [ ] Feedback thành công/thất bại
- [ ] Optimistic UI + rollback khi lỗi

#### 11.4 Hiển thị trạng thái duyệt
- [ ] Badge "Pending" (màu vàng)
- [ ] Badge "Approved" (màu xanh)
- [ ] Badge "Rejected" (màu đỏ)
- [ ] Color-coded status indicators

---

### 12. System & Infrastructure (Admin)

#### 12.1 GraphQL Integration
- [ ] Apollo Client configuration
- [ ] Typed GraphQL operations
- [ ] Query & mutation hooks
- [ ] Optimistic UI updates
- [ ] Cache management
- [ ] Error handling
- [ ] Network status indicators

#### 12.2 Form Handling
- [ ] React Hook Form integration
- [ ] Zod schema validation
- [ ] Hiển thị lỗi từng trường
- [ ] Disable submit khi form không hợp lệ
- [ ] Reset form

#### 12.3 Table & Data Display
- [ ] TanStack Table integration
- [ ] Sắp xếp cột (asc/desc)
- [ ] Fixed headers
- [ ] Expandable rows
- [ ] Loading skeletons
- [ ] Error states + retry

#### 12.4 Pagination System
- [ ] Chọn số mục/trang (10, 20, 50, 100)
- [ ] Hiển thị trang hiện tại + tổng số mục
- [ ] Previous/Next navigation
- [ ] First/Last page
- [ ] Disabled states ở biên

#### 12.5 Navigation & Layout
- [ ] Sidebar navigation
- [ ] Dashboard header với thông tin user
- [ ] Breadcrumb navigation
- [ ] Highlight route đang active
- [ ] Responsive layout (mobile/tablet/desktop)

#### 12.6 Error Handling
- [ ] Global error boundary
- [ ] Retry button
- [ ] Toast thông báo lỗi mạng / GraphQL
- [ ] Auto retry on failure

#### 12.7 Media Handling
- [ ] Image với lazy loading + fallback
- [ ] Video với controls
- [ ] Thumbnail preview
- [ ] Lightbox fullscreen viewer
- [ ] Hỗ trợ nhiều ảnh/video

---

## 📊 Thống kê tổng quan

| Hạng mục | Số tính năng |
|----------|-------------|
| Mobile - Auth & Onboarding | 12 |
| Mobile - Customer | 34 |
| Mobile - Business Detail & Reviews | 14 |
| Mobile - Provider | 14 |
| Mobile - Browse & Discovery | 4 |
| Mobile - Settings & Notifications | 7 |
| Admin - Authentication | 6 |
| Admin - Dashboard | 11 |
| Admin - Notifications | 17 |
| Admin - Users Management | 28 |
| Admin - Verification | 16 |
| Admin - System & Infrastructure | 30 |
| **TỔNG** | **~193** |

---

## Ưu tiên MVP

### P0 - Critical (phải có trước khi launch)
- Auth flow hoàn chỉnh (cả mobile lẫn admin)
- Business registration & verification workflow
- Customer browse, search, business detail
- Real-time messaging
- Provider dashboard + business management
- Admin: User management + Business approval

### P1 - High Priority
- Near Me (Map + List)
- Reviews & Ratings
- Push notifications
- Admin: Notifications management
- Admin: Dashboard metrics

### P2 - Medium Priority
- Export CSV
- Popular searches analytics
- Help & Support, FAQ
- i18n (nếu cần đa ngôn ngữ từ đầu)

### P3 - Nice to have
- Animations, empty states
- Performance optimizations (virtual scrolling, etc.)
- Debug mode
