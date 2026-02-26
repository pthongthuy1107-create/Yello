# Yello App - Project Summary

> Generated: 2026-02-25

## Tổng quan dự án

**Yello** là ứng dụng marketplace mobile kết nối khách hàng với các nhà cung cấp dịch vụ địa phương. Hỗ trợ iOS và Android với hai vai trò người dùng: **Customer** (khách hàng) và **Provider** (nhà cung cấp dịch vụ).

**Tech Stack:**
- React Native 0.81.4 + Expo SDK 54, React 19.1.0
- Apollo Client 4.0.7 (GraphQL), Redux Toolkit
- React Native Reanimated 4.1, Socket.io (real-time)
- Firebase Remote Config, Expo Notifications, React Native Maps
- TypeScript strict mode, i18next (đa ngôn ngữ)
- Package manager: pnpm

---

## Screens & Tính năng

### 1. Authentication & Onboarding

| Screen | Mô tả |
|--------|-------|
| `SplashScreen` | Khởi tạo app, logic auto-login |
| `ChooseRoleScreen` | Chọn vai trò Customer hoặc Provider |
| `OnboardingScreen` | 3 slide giới thiệu app (carousel + pagination dots) |
| `SignInScreen` | Đăng nhập email/password, link quên mật khẩu, modal xác nhận tài khoản |
| `SignUpScreen` (3 bước) | Nhập thông tin → Đặt mật khẩu → Xác minh OTP email |
| `ForgotPasswordScreen` | Chọn phương thức khôi phục (email/phone) → Đặt lại mật khẩu → Màn hình thành công |

---

### 2. Customer - Màn hình chính (Bottom Tabs)

#### HomeScreen
- Header hiển thị vị trí và nút thông báo
- Search bar
- Section **Nearby Businesses** (doanh nghiệp gần đây)
- Section **Categories** (danh mục dịch vụ - carousel)
- Section **Popular Now** (doanh nghiệp nổi bật)

#### NearMeScreen
- **Chế độ Map**: Google Maps với markers doanh nghiệp
  - Marker clustering
  - Popup chi tiết khi nhấn marker
  - Nút "Search This Area" sau khi pan bản đồ
  - Nút "My Location" để quay về vị trí hiện tại
  - Xử lý quyền truy cập vị trí
- **Chế độ List**: Danh sách doanh nghiệp dạng bảng
- Location picker modal (chọn khu vực tìm kiếm)
- Bộ lọc & sắp xếp (persistent giữa các tab)
- Recent search dropdown
- Chuyển đổi View (Map ↔ List)

#### SearchScreen
- Thanh tìm kiếm với autocomplete suggestions
- Lịch sử tìm kiếm gần đây (có thể xóa từng mục)
- Dịch vụ được đề xuất theo danh mục
- Kết quả tìm kiếm với pagination vô hạn
- **FiltersModal**: Lọc theo Category, Subcategory, Distance, Available Time
- **SortModal**: Sắp xếp theo Rating / Distance / Name / Newest
- Empty state khi không có kết quả

#### MessagesScreen
- Danh sách cuộc hội thoại
- Tìm kiếm/lọc conversations
- Hiển thị: tin nhắn cuối, trạng thái chưa đọc, timestamp
- Pull-to-refresh, infinite scroll

#### MessageDetailScreen (Chat)
- Chat real-time với socket.io
- Message bubbles (tin nhắn gửi/nhận, trạng thái)
- Typing indicators
- Input gửi tin nhắn
- Retry khi gửi thất bại
- Infinite scroll tải tin nhắn cũ

#### ProfileScreen (Customer)
- Avatar (có thể chỉnh sửa qua camera/gallery)
- Thông tin: tên, email, số điện thoại
- Menu: Account Settings, Password Settings, Notification Preferences, Help & Support
- Terms & Privacy (WebView modal)
- Đăng xuất với confirmation modal

---

### 3. Business Detail & Reviews

#### BusinessDetailScreen
- Hero image
- Thông tin: tên, rating, số review, khoảng cách, danh mục
- Địa chỉ (nút mở Maps), số điện thoại (nút gọi)
- Lịch làm việc
- Phần Giới thiệu (About)
- Gallery ảnh (cuộn ngang, xem tất cả)
- Reviews (tóm tắt rating + 3 review gần nhất)
- "You May Also Like" (đề xuất doanh nghiệp tương tự)
- Form đánh giá & viết review

#### AllReviewsScreen
- Toàn bộ reviews của một doanh nghiệp
- FlatList với performance optimization

#### RateAndReviewSection
- Chọn số sao (1-5)
- Nhập nội dung review
- Upload ảnh/video
- Submit review

#### ViewAllPhotoScreen
- Gallery fullscreen của doanh nghiệp
- Hỗ trợ zoom ảnh

---

### 4. Provider - Màn hình chính

#### ProviderHomeScreen (Dashboard)
- ServiceCard: thông tin doanh nghiệp của provider + trạng thái
- LastMessagesSection: các tin nhắn gần đây từ khách hàng
- Popular Now: đề xuất doanh nghiệp trong cùng ngành

#### BusinessRegisterScreen (Đăng ký doanh nghiệp)
Multi-section form:
1. **Profile**: Tên doanh nghiệp, upload avatar
2. **Rejection Notice**: Hiển thị lý do bị từ chối (nếu có)
3. **Primary Contact**: Số điện thoại, phương thức (Message/Call)
4. **Address**: Location picker modal (Google Places)
5. **Schedule**: Editor lịch làm việc từng ngày
6. **About**: Mô tả doanh nghiệp
7. **Category**: Chọn ngành / danh mục
8. **Photos**: Upload ảnh gallery doanh nghiệp

#### EditBusinessWorkingHoursScreen
- Chỉnh sửa lịch làm việc từng ngày trong tuần
- Time picker modal
- Toggle mở/đóng từng ngày

#### ProfileScreen (Provider)
- Hiển thị tên doanh nghiệp & thông tin chủ sở hữu
- Menu bổ sung: **Visibility Status** (bật/tắt hiển thị doanh nghiệp)

---

### 5. Browse & Discovery

| Screen | Mô tả |
|--------|-------|
| `AllCategoriesScreen` | Grid/list tất cả danh mục dịch vụ |
| `CategoryDetailScreen` | Doanh nghiệp trong một danh mục, có filter & sort |
| `AllPopularNowScreen` | Danh sách đầy đủ doanh nghiệp nổi bật |
| `YouMayAlsoLikeScreen` | Đề xuất doanh nghiệp tương tự |

---

### 6. Settings & Preferences

| Screen | Mô tả |
|--------|-------|
| `AccountSettingScreen` | Chỉnh sửa tên, xóa tài khoản |
| `PasswordSettingsScreen` | Đổi mật khẩu (xác minh mật khẩu hiện tại) |
| `NotificationPreferencesScreen` | Toggle email & push notifications |
| `VisibilityStatusScreen` | Bật/tắt trạng thái hiển thị (Provider) |
| `HelpSupportScreen` | FAQ với collapsible items |
| `TermsPrivacyScreen` | WebView hiển thị Terms & Privacy Policy |
| `AddNewAddressScreen` | Thêm địa chỉ mới |
| `NotificationScreen` | Danh sách thông báo, "Mark All as Read" |

---

## Components Tái sử dụng

### Navigation & Layout
- **TabBar**: Bottom tab navigation (Home, NearMe, Messages, Profile + ProviderHome cho provider)
- **ScreenHeader / ScreenHeaderWithInfo / ScreenHeaderWithChat / HomeHeader**: Các loại header

### UI Components (`src/components/ui/`)
- **Avatar**: Ảnh đại diện với fallback initials
- **Button**: Nút bấm (primary/secondary)
- **Card**: Container nhóm nội dung
- **CustomImage / CustomImageWithKey**: Render ảnh với loading states
- **EmptyState**: Trạng thái trống cho list/data
- **TextInput**: Input có validation
- **Text/CustomText**: Typography component
- **SafeAreaWrapper**: Container safe area
- **FloatingBackButton**: Nút back dạng floating overlay
- **PopularNowSection**: Carousel doanh nghiệp trending
- **HorizontalBusinessCard / VerticalBusinessCard**: Card doanh nghiệp 2 layout
- **CategoryCard**: Card danh mục
- **CustomBusinessList**: List doanh nghiệp tái sử dụng với filter/sort
- **Switch**: Toggle component

### Modals
- **FiltersModal**: Lọc đa cấp (Category, Subcategory, Distance, Time)
- **SortModal**: Tùy chọn sắp xếp
- **ConfirmModal**: Dialog xác nhận Yes/No
- **LocationPickerModal**: Google Places autocomplete
- **ImageFullscreenViewer**: Xem ảnh fullscreen có zoom
- **WebViewModal**: Hiển thị web content
- **GlobalSupportModal / SupportModal**: Modal hỗ trợ trong app

### Global / System Components
- **SocketInitializer**: Khởi tạo socket.io
- **NotificationInitializer**: Khởi tạo push notifications
- **ForegroundNotification**: Hiển thị notification khi app đang mở
- **RequestPermission**: Xử lý permission (camera, location, notifications)
- **GlobalLoadingOverlay**: Loading indicator toàn màn hình
- **StatusBarAlert**: Thông báo trên status bar
- **NetworkErrorToastService**: Toast báo lỗi mạng

---

## Custom Hooks

| Hook | Chức năng |
|------|-----------|
| `useAuth` | Đăng nhập/đăng xuất, token management, auto-login |
| `useSearchBusinesses` | **Gold standard** - search phân trang, deduplication, isMountedRef |
| `useLocation` | Quyền vị trí, lấy tọa độ thiết bị |
| `useNotifications` | Fetch notifications, mark as read, unread count |
| `useI18n` | Hook dịch thuật i18next |
| `useStorage` | AsyncStorage + MMKV wrapper |
| `useUploadAvatar` | Upload avatar lên S3 |
| `useUploadPhotos` | Upload nhiều ảnh, theo dõi tiến độ |
| `useRecentSearches` | Lịch sử tìm kiếm (lưu/xóa) |
| `useUserRole` | Kiểm tra role Customer/Provider |
| `useNetworkStatus` | Theo dõi kết nối mạng |
| `useTextTruncation` | Truncate text với "read more/show less" |
| `useBadgeSync` | Đồng bộ badge số thông báo trên icon app |
| `useFirebaseRemoteConfig` | Lấy feature flags từ Firebase |

---

## Services

| Service | Chức năng |
|---------|-----------|
| `ApolloClientService` | Setup Apollo Client, interceptors, auth token injection |
| `SocketService` | Socket.io connection, real-time messaging & notifications |
| `StorageService` | Lưu trữ local (AsyncStorage + MMKV) |
| `TokenRefreshService` | JWT token refresh, lifecycle management |
| `NetworkRetryService` | Retry requests thất bại, exponential backoff |
| `NetworkErrorToastService` | Hiển thị toast lỗi mạng |
| `GooglePlacesService` | Google Places API, address autocomplete |
| `FirebaseRemoteConfig` | Firebase config & feature flags |

---

## GraphQL API

### Business
- `BUSINESS_DETAIL_QUERY`: Chi tiết doanh nghiệp (info, rating, reviews, images, schedule)
- `NEARBY_BUSINESSES_QUERY`: Doanh nghiệp gần vị trí, có pagination
- `SEARCH_BUSINESSES_QUERY`: Tìm kiếm với filters, pagination
- `AUTOCOMPLETE_BUSINESSES_QUERY`: Gợi ý tên doanh nghiệp
- Mutations: Tạo/cập nhật doanh nghiệp, upload ảnh, cập nhật lịch

### Messaging
- `CONVERSATION_MESSAGES_QUERY`: Tin nhắn trong conversation, cursor pagination
- `SEND_MESSAGE_MUTATION`: Gửi tin nhắn
- `MARK_AS_READ_MUTATION`: Đánh dấu đã đọc

### Notifications
- `MY_NOTIFICATIONS_QUERY`: Danh sách thông báo, pagination
- `UNREAD_NOTIFICATION_COUNT_QUERY`: Số thông báo chưa đọc
- `MY_NOTIFICATION_PREFERENCES_QUERY`: Cài đặt thông báo
- `UPDATE_NOTIFICATION_PREFERENCES_MUTATION`: Cập nhật cài đặt
- `MARK_NOTIFICATION_AS_READ_MUTATION`: Đánh dấu đã đọc

### Authentication
- `PROFILE_QUERY`: Thông tin user hiện tại
- `CHECK_AVAILABILITY_QUERY`: Kiểm tra email/phone đã tồn tại
- `LOGIN_MUTATION` / `SIGN_UP_MUTATION` / `VERIFY_CODE_MUTATION`
- `UPDATE_PASSWORD_MUTATION` / `DELETE_ACCOUNT_MUTATION`
- `UPLOAD_AVATAR_MUTATION`

### Reviews
- `CREATE_REVIEW_MUTATION`: Tạo review (rating, text, ảnh/video)
- `UPDATE_REVIEW_MUTATION`: Chỉnh sửa review

### Profile
- `UPDATE_PROFILE_MUTATION`: Cập nhật tên, email, phone, avatar

---

## Utilities

| Utility | Chức năng |
|---------|-----------|
| `businessUtils` | Format rating, giờ làm việc, khoảng cách, trạng thái doanh nghiệp |
| `scheduleUtils` | Format lịch làm việc, kiểm tra đang mở cửa |
| `timeUtils` | Format timestamp, thời gian tương đối ("2 giờ trước") |
| `addressUtils` | Format địa chỉ, geocoding helpers |
| `filterUtils` | Xây dựng filter object cho API, clear filters |
| `searchUtils` | Parse search query, format filters |
| `conversationUtils` | Format metadata conversation |
| `notificationUtils` | Format loại notification, xử lý routing |
| `validation` | Validate email, phone, password |
| `stringUtils` | Truncate, capitalize, format strings |
| `colorUtils` | Chuyển đổi màu sắc |
| `arrayUtils` | Deduplication, filtering mảng |
| `uploadUtils` | Validate file size, nén ảnh |
| `deviceUtils` | Device info, responsive breakpoints |
| `routeUtils` | Tạo route, parse deep links |
| `userRole` | Kiểm tra role, access control |
| `platform` | Phát hiện iOS/Android |

---

## Constants & Configuration

- **`screenKeys.ts`**: Route paths tất cả màn hình
- **`colors.ts`**: Theme colors (primary, neutral, success, error)
- **`fontSizes.ts`** / **`fonts.ts`**: Typography scale
- **`spacing.ts`**: Margin/padding constants
- **`shadows.ts`**: Định nghĩa shadows
- **`globalStyles.ts`**: Global styles
- **`filterData.ts`**: Dữ liệu bộ lọc (distance ranges, time slots)
- **`roles.ts`**: CUSTOMER, PROVIDER role definitions
- **`storageKeys.ts`**: Keys lưu trữ local
- **`errorCodes.ts`**: Mapping error codes API

---

## Redux State Management

- **Redux Toolkit** cho state management toàn cục
- **Slices**: auth, user, notifications
- **Selectors**: Truy cập cached data (categories, user data)
- Cache strategy: Fetch once → persist trong Redux để tái sử dụng

---

## Internationalization (i18n)

- Toàn bộ text hiển thị người dùng khai báo trong `src/localize/locales/en.json`
- Namespace: `auth.*`, `home.*`, `search.*`, `nearMe.*`, `messages.*`, `notification.*`, `business.*`, `provider.register.*`, `profile.*`, `common.*`
- Sẵn sàng hỗ trợ đa ngôn ngữ

---

## So sánh tính năng theo Role

| Tính năng | Customer | Provider |
|-----------|----------|----------|
| Browse doanh nghiệp | ✅ | - |
| Tìm kiếm / bộ lọc | ✅ | - |
| Map view (Near Me) | ✅ | - |
| Xem chi tiết doanh nghiệp | ✅ | ✅ |
| Viết review | ✅ | - |
| Nhắn tin real-time | ✅ | ✅ |
| Thông báo | ✅ | ✅ |
| Hồ sơ cá nhân | ✅ | ✅ |
| Đăng ký doanh nghiệp | - | ✅ |
| Quản lý thông tin doanh nghiệp | - | ✅ |
| Chỉnh sửa giờ làm việc | - | ✅ |
| Visibility Status | - | ✅ |
| Xem Popular Businesses | ✅ | ✅ |
| Browse theo danh mục | ✅ | - |

---

## Cấu trúc thư mục

```
src/
├── app/                        # Expo Router navigation (file-based routing)
│   ├── (auth)/                 # Auth screens
│   ├── (protected)/            # Authenticated screens
│   └── (tabs)/                 # Bottom tab screens
├── screens/                    # ~40 full-page implementations
│   ├── Home/
│   ├── Search/
│   ├── NearMe/
│   ├── Messages/ + MessageDetail/
│   ├── Profile/
│   ├── BusinessDetail/
│   ├── BusinessRegister/
│   ├── ProviderHome/
│   ├── Notification/
│   ├── AllReviewsScreen/
│   ├── [Auth screens]          # SignIn, SignUp, ForgotPassword...
│   └── [Settings screens]      # AccountSetting, PasswordSettings...
├── components/                 # ~50 reusable UI components
│   ├── ui/                     # Basic UI primitives
│   ├── navigation/             # TabBar
│   └── [Feature components]    # Modals, Cards, Lists...
├── hooks/                      # ~15 custom hooks
├── services/                   # Apollo, Socket, Storage, Firebase
├── graphql/                    # Queries & mutations by domain
│   ├── business/
│   ├── search/
│   ├── message/
│   ├── notification/
│   └── auth/
├── utils/                      # ~17 utility modules
├── constants/                  # Config, theme, route keys
├── types/                      # TypeScript interfaces
├── localize/                   # i18next translations
├── redux/                      # Redux state management
└── res/                        # SVG icons, static resources
```

---

## Highlights kiến trúc

- **File-based routing** với Expo Router (cấu trúc folder = navigation)
- **Hooks-first** tách biệt business logic khỏi UI
- **Apollo Client** với caching `cache-and-network` (stale-while-revalidate)
- **Real-time** qua Socket.io (chat, notifications)
- **Push notifications** với Expo + Firebase
- **Location-aware** qua Expo Location + Google Maps
- **React Compiler enabled** (không cần `useMemo`/`useCallback` thủ công)
- **Pagination pattern chuẩn**: `useLazyQuery` + `isMountedRef` + deduplication
