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

- [x] **SplashScreen** - Khởi tạo app, logic auto-login
- [x] **ChooseRoleScreen** - Chọn vai trò Customer hoặc Provider
- [x] **OnboardingScreen** - 3 slide giới thiệu (carousel + pagination dots)
- [x] **SignInScreen** - Đăng nhập email/password
- [x] **SignInScreen** - Link quên mật khẩu
- [x] **SignInScreen** - Modal xác nhận tài khoản
- [x] **SignUpScreen - Bước 1** - Nhập thông tin cá nhân
- [x] **SignUpScreen - Bước 2** - Đặt mật khẩu
- [x] **SignUpScreen - Bước 3** - Xác minh OTP email
- [~] **ForgotPasswordScreen** - Chọn phương thức khôi phục (email/phone)
- [x] **ForgotPasswordScreen** - Màn hình đặt lại mật khẩu
- [x] **ForgotPasswordScreen** - Màn hình thành công

---

### 2. Customer - Màn hình chính

#### 2.1 HomeScreen
- [x] Header hiển thị vị trí người dùng + nút thông báo
- [x] Search bar
- [x] Section "Nearby Businesses" (doanh nghiệp gần đây)
- [x] Section "Categories" (danh mục dịch vụ - carousel)
- [x] Section "Popular Now" (doanh nghiệp nổi bật)

#### 2.2 NearMeScreen - Map Mode
- [x] Google Maps với markers doanh nghiệp
- [x] Marker clustering
- [x] Popup chi tiết khi nhấn marker
- [x] Nút "Search This Area" sau khi filter bản đồ
- [x] Nút "My Location" quay về vị trí hiện tại
- [x] Xử lý quyền truy cập vị trí

#### 2.3 NearMeScreen - List Mode
- [x] Danh sách doanh nghiệp dạng list
- [x] Location picker modal (chọn khu vực tìm kiếm)
- [x] Bộ lọc & sắp xếp (persistent giữa các tab)
- [ ] Recent search dropdown
- [x] Chuyển đổi View (Map ↔ List)

#### 2.4 SearchScreen
- [x] Thanh tìm kiếm với autocomplete suggestions
- [x] Lịch sử tìm kiếm gần đây (có thể xóa từng mục)
- [x] Dịch vụ được đề xuất theo danh mục
- [x] Kết quả tìm kiếm với infinite scroll pagination
- [x] **FiltersModal** - Lọc theo Category, Subcategory, Distance, Available Time
- [x] **SortModal** - Sắp xếp theo Nearest / Newest
- [x] Empty state khi không có kết quả

#### 2.5 MessagesScreen
- [x] Danh sách cuộc hội thoại
- [x] Tìm kiếm/lọc conversations
- [x] Hiển thị tin nhắn cuối, trạng thái chưa đọc, timestamp
- [x] Pull-to-refresh + infinite scroll

#### 2.6 MessageDetailScreen (Chat)
- [x] Chat real-time với Socket.io
- [x] Message bubbles (gửi/nhận + trạng thái)
- [x] Typing indicators
- [x] Input gửi tin nhắn
- [x] Retry khi gửi thất bại
- [x] Infinite scroll tải tin nhắn cũ

#### 2.7 ProfileScreen (Customer)
- [x] Avatar (chỉnh sửa qua camera/gallery)
- [x] Thông tin: tên
- [x] Menu: Account Settings, Password Settings, Notification Preferences, Help & Support
- [x] Terms & Privacy (WebView modal)
- [x] Đăng xuất với confirmation modal

---

### 3. Business Detail & Reviews

#### 3.1 BusinessDetailScreen
- [x] Primary image
- [x] Thông tin: tên, rating, số review, khoảng cách, danh mục
- [x] Địa chỉ (nút mở Maps) + số điện thoại (nút gọi) + tin nhắn ("message" button để mở vào cuộc trò chuyện)
- [x] Lịch làm việc
- [x] Phần Giới thiệu (About)
- [x] Gallery ảnh (cuộn ngang + xem tất cả)
- [x] Reviews: tóm tắt rating + 3 review gần nhất
- [x] Section "You May Also Like" (đề xuất tương tự)
- [x] Form đánh giá & viết review

#### 3.2 AllReviewsScreen
- [x] Toàn bộ reviews của doanh nghiệp

#### 3.3 RateAndReviewSection
- [x] Chọn số sao (1-5)
- [x] Nhập nội dung review
- [x] Upload ảnh/video
- [x] Submit review

#### 3.4 ViewAllPhotoScreen
- [x] Gallery fullscreen của doanh nghiệp
- [x] Hỗ trợ zoom ảnh

---

### 4. Provider - Màn hình chính

#### 4.1 ProviderHomeScreen (Dashboard)
- [x] ServiceCard: thông tin doanh nghiệp + trạng thái
- [x] LastMessagesSection: tin nhắn gần đây từ khách hàng
- [x] Competitors near you: đề xuất doanh nghiệp đối thủ cùng ngành (provider đã và đang đăng ký business)
- [x] Businesses near you: đề xuất doanh nghiệp gần đây (provider chưa đăng ký business)

#### 4.2 BusinessRegisterScreen
- [x] Section 1 - Profile: Tên doanh nghiệp + upload avatar
- [ ] Section 2 - Rejection Notice: Hiển thị lý do bị từ chối (nếu có)
- [x] Section 3 - Primary Contact: Số điện thoại, phương thức (Message/Call)
- [x] Section 4 - Address: Location picker modal (Google Places)
- [x] Section 5 - Schedule: Editor lịch làm việc từng ngày
- [x] Section 6 - About: Mô tả doanh nghiệp
- [x] Section 7 - Category: Chọn ngành / danh mục
- [x] Section 8 - Photos: Upload ảnh gallery

#### 4.3 EditBusinessWorkingHoursScreen
- [x] Chỉnh sửa lịch làm việc từng ngày trong tuần
- [x] Time picker modal
- [x] Toggle mở/đóng từng ngày

#### 4.4 ProfileScreen (Provider)
- [x] Hiển thị tên doanh nghiệp & thông tin chủ sở hữu
- [x] **Visibility Status** - Bật/tắt hiển thị doanh nghiệp

---

### 5. Browse & Discovery

- [x] **AllCategoriesScreen** - Grid/list tất cả danh mục dịch vụ
- [x] **CategoryDetailScreen** - Doanh nghiệp trong một danh mục + filter & sort
- [x] **AllPopularNowScreen** - Danh sách đầy đủ doanh nghiệp nổi bật
- [x] **YouMayAlsoLikeScreen** - Đề xuất doanh nghiệp tương tự

---

### 6. Settings & Notifications

- [x] **AccountSettingScreen** - Chỉnh sửa tên, xóa tài khoản
- [x] **PasswordSettingsScreen** - Đổi mật khẩu (xác minh mật khẩu hiện tại)
- [x] **NotificationPreferencesScreen** - Toggle email & push notifications
- [x] **VisibilityStatusScreen** - Bật/tắt trạng thái hiển thị (Provider)
- [x] **HelpSupportScreen** - FAQ với collapsible items
- [x] **TermsPrivacyScreen** - WebView Terms & Privacy Policy
- [x] **NotificationScreen** - Danh sách thông báo + "Mark All as Read"

---

## 🌐 ADMIN WEBSITE

### 7. Authentication & Authorization

- [x] **Login** - Đăng nhập bằng email or Username/password
- [x] **Logout** - Đăng xuất và xóa session
- [x] **JWT Authentication** - Xác thực bằng token
- [x] **Protected Routes** - AuthGuard bảo vệ các route
- [x] **Auto Token Refresh** - Tự động refresh token khi hết hạn
- [x] **Session Management** - Quản lý session bằng cookies

---

### 8. Dashboard Overview

#### 8.1 Metrics Display
- [x] Tổng số người dùng (Total Users)
- [x] Tổng số doanh nghiệp (Total Businesses)
- [x] Số doanh nghiệp đang chờ approve

#### 8.2 Popular Searches Analytics
- [x] Danh sách từ khóa tìm kiếm phổ biến
- [x] Số lượt tìm kiếm mỗi từ khóa
- [x] Số kết quả trả về mỗi từ khóa
- [x] Phân trang

---

### 9. Notifications Management

#### 9.1 Tạo thông báo mới
- [x] Nhập tiêu đề thông báo
- [x] Nhập nội dung chi tiết
- [x] Chọn đối tượng nhận (All, Businesses, Customers, Providers)
- [x] Chọn địa điểm mục tiêu (đối tượng là businesses)
- [x] Chọn tất cả địa điểm hoặc một địa điểm cụ thể
- [x] Validation form
- [ ] Hiển thị kết quả thành công/thất bại

#### 9.2 Danh sách thông báo
- [x] Bảng xem tất cả thông báo
- [x] Lọc theo tab (All, Businesses, Customers, Providers)
- [x] Tìm kiếm theo tiêu đề hoặc nội dung
- [x] Sắp xếp theo ngày tạo
- [x] Hành động Archive thông báo
- [x] Phân trang
- [x] Empty state khi không có dữ liệu

#### 9.3 Chi tiết thông báo
- [x] Thời gian gửi
- [x] Trạng thái thông báo

---

### 10. Users Management

#### 10.1 Quản lý Businesses
- [x] Bảng xem tất cả doanh nghiệp
- [x] Tìm kiếm theo tên hoặc ID
- [x] Sắp xếp theo cột (tên, ID, Category, Rating, Ngày đăng ký, trạng thái)
- [x] Lọc theo trạng thái
- [x] Expandable rows xem chi tiết
- [x] Phân trang + chọn số mục/trang
- [x] Empty state
- [x] Toggle Active/Suspend + confirmation dialog
- [x] Optimistic UI + rollback khi lỗi
- [x] Xem tổng số reviews (clickable)

#### 10.2 Business Reviews (Modal)
- [x] Xem tất cả reviews của doanh nghiệp
- [x] Nội dung review (text, ảnh, video)
- [x] Thông tin người đánh giá (tên, avatar)
- [x] Hiển thị rating
- [x] Preview media + lightbox fullscreen
- [x] Xóa review + confirmation modal
- [x] Infinite scroll
- [x] Empty state

#### 10.3 Business Metrics
- [x] Tổng số doanh nghiệp
- [x] Số doanh nghiệp đang hoạt động
- [x] Số doanh nghiệp không hoạt động

#### 10.4 Export Businesses
- [x] Xuất dữ liệu ra CSV
- [x] Chọn khoảng thời gian (date range picker)
- [x] Validation khoảng thời gian
- [x] Download có xác thực

#### 10.5 Quản lý Customers
- [x] Bảng xem tất cả khách hàng
- [x] Tìm kiếm theo tên hoặc email
- [x] Sắp xếp theo cột (ID, tên, email, trạng thái, ngày)
- [x] Phân trang + chọn số mục/trang
- [x] Empty state
- [x] Chọn trạng thái (Active/Suspended) với popover UI
- [x] Confirmation trước khi thay đổi
- [x] Optimistic UI + rollback khi lỗi

#### 10.6 Customer Metrics
- [x] Tổng số khách hàng
- [x] Số khách hàng đang hoạt động
- [ ] Số khách hàng không hoạt động
- [ ] Số khách hàng mới trong tháng

#### 10.7 Export Customers
- [x] Xuất dữ liệu ra CSV
- [x] Chọn khoảng thời gian
- [x] Validation khoảng thời gian

#### 10.8 Navigation Users
- [x] Tab chuyển đổi giữa Businesses và Customers
- [ ] Highlight tab đang active
- [ ] Header dùng chung cho cả 2 tab

---

### 11. Verification Module

#### 11.1 Danh sách doanh nghiệp cần duyệt
- [x] Bảng xem tất cả doanh nghiệp chờ duyệt
- [x] Lọc theo tab (All, Pending, Approved, Rejected)
- [x] Hiển thị số lượng ở mỗi tab
- [x] Tìm kiếm theo tên doanh nghiệp
- [x] Sắp xếp theo cột
- [x] Phân trang + chọn số mục/trang
- [x] Cập nhật real-time
- [x] Empty state

#### 11.2 Modal xem thông tin doanh nghiệp
- [x] Tên doanh nghiệp
- [x] Mô tả doanh nghiệp
- [x] Thông tin liên hệ
- [x] Preview ảnh/media
- [x] Preview tài liệu
- [x] Thông tin chủ sở hữu
- [x] Ngày nộp đơn
- [x] Trạng thái hiện tại

#### 11.3 Hành động duyệt/từ chối
- [x] Nút Approve doanh nghiệp
- [x] Nút Reject doanh nghiệp
- [x] Confirmation dialog trước khi thực hiện
- [x] Loading state trong khi xử lý
- [x] Feedback thành công/thất bại

#### 11.4 Hiển thị trạng thái duyệt
- [x] Badge "Pending" (màu vàng)
- [x] Badge "Approved" (màu xanh)
- [x] Badge "Rejected" (màu đỏ)

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
