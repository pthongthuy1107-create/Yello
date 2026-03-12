# Yello - MVP Features Checklist

> **Scope**: Mobile App (Customer + Provider) + Admin Website
> **Excluded**: Payment, Tracking
> **Created**: 2026-02-26

---

## Legend
- [ ] Not started
- [x] Completed
- [~] In progress / Has issues

---

## 📱 MOBILE APP

### 1. Authentication & Onboarding

- [x] **SplashScreen** - App initialization, auto-login logic
- [x] **ChooseRoleScreen** - Select role: Customer or Provider
- [x] **OnboardingScreen** - 3 intro slides (carousel + pagination dots)
- [x] **SignInScreen** - Login with email/password
- [x] **SignInScreen** - Forgot password link
- [x] **SignInScreen** - Account confirmation modal
- [x] **SignUpScreen - Step 1** - Enter personal information
- [x] **SignUpScreen - Step 2** - Set password
- [x] **SignUpScreen - Step 3** - Email OTP verification
- [~] **ForgotPasswordScreen** - Select recovery method (email/phone)
- [x] **ForgotPasswordScreen** - Reset password screen
- [x] **ForgotPasswordScreen** - Success screen

---

### 2. Customer - Main Screens

#### 2.1 HomeScreen
- [x] Header displaying user location + notification button
- [x] Search bar
- [x] "Nearby Businesses" section
- [x] "Categories" section (service categories - carousel)
- [x] "Popular Now" section (featured businesses)

#### 2.2 NearMeScreen - Map Mode
- [x] Google Maps with business markers
- [x] Marker clustering
- [x] Detail popup when tapping a marker
- [x] "Search This Area" button after filtering the map
- [x] "My Location" button to return to current location
- [x] Location permission handling

#### 2.3 NearMeScreen - List Mode
- [x] Business list view
- [x] Location picker modal (select search area)
- [x] Filter & sort (persistent across tabs)
- [ ] Recent search dropdown
- [x] View toggle (Map ↔ List)

#### 2.4 SearchScreen
- [x] Search bar with autocomplete suggestions
- [x] Recent search history (deletable per item)
- [x] Suggested services by category
- [x] Search results with infinite scroll pagination
- [x] **FiltersModal** - Filter by Category, Subcategory, Distance, Available Time
- [x] **SortModal** - Sort by Nearest / Newest
- [x] Empty state when no results found

#### 2.5 MessagesScreen
- [x] Conversation list
- [x] Search/filter conversations
- [x] Display last message, unread status, timestamp
- [x] Pull-to-refresh + infinite scroll

#### 2.6 MessageDetailScreen (Chat)
- [x] Real-time chat with Socket.io
- [x] Message bubbles (sent/received + status)
- [x] Typing indicators
- [x] Message input
- [x] Retry on send failure
- [x] Infinite scroll to load older messages

#### 2.7 ProfileScreen (Customer)
- [x] Avatar (edit via camera/gallery)
- [x] Information: name
- [x] Menu: Account Settings, Password Settings, Notification Preferences, Help & Support
- [x] Terms & Privacy (WebView modal)
- [x] Logout with confirmation modal

---

### 3. Business Detail & Reviews

#### 3.1 BusinessDetailScreen
- [x] Primary image
- [x] Info: name, rating, review count, distance, category
- [x] Address (open Maps button) + phone (call button) + message button (opens conversation)
- [x] Working hours
- [x] About section
- [x] Photo gallery (horizontal scroll + view all)
- [x] Reviews: rating summary + 3 most recent reviews
- [x] "You May Also Like" section (similar recommendations)
- [x] Rating & review form

#### 3.2 AllReviewsScreen
- [x] All reviews for the business

#### 3.3 RateAndReviewSection
- [x] Star rating (1–5)
- [x] Review text input
- [x] Photo/video upload
- [x] Submit review

#### 3.4 ViewAllPhotoScreen
- [x] Fullscreen gallery for the business
- [x] Zoom support

---

### 4. Provider - Main Screens

#### 4.1 ProviderHomeScreen (Dashboard)
- [x] ServiceCard: business info + status
- [x] LastMessagesSection: recent messages from customers
- [x] Competitors near you: suggested competing businesses in the same category (provider has registered a business)
- [x] Businesses near you: suggested nearby businesses (provider has not registered a business)

#### 4.2 BusinessRegisterScreen
- [x] Section 1 - Profile: Business name + avatar upload
- [ ] Section 2 - Rejection Notice: Display rejection reason (if any)
- [x] Section 3 - Primary Contact: Phone number, contact method (Message/Call)
- [x] Section 4 - Address: Location picker modal (Google Places)
- [x] Section 5 - Schedule: Working hours editor per day
- [x] Section 6 - About: Business description
- [x] Section 7 - Category: Select industry / category
- [x] Section 8 - Photos: Gallery photo upload

#### 4.3 EditBusinessWorkingHoursScreen
- [x] Edit working hours for each day of the week
- [x] Time picker modal
- [x] Toggle open/closed per day

#### 4.4 ProfileScreen (Provider)
- [x] Display business name & owner information
- [x] **Visibility Status** - Toggle business visibility

---

### 5. Browse & Discovery

- [x] **AllCategoriesScreen** - Grid/list of all service categories
- [x] **CategoryDetailScreen** - Businesses in a category + filter & sort
- [x] **AllPopularNowScreen** - Full list of featured businesses
- [x] **YouMayAlsoLikeScreen** - Similar business recommendations

---

### 6. Settings & Notifications

- [x] **AccountSettingScreen** - Edit name, delete account
- [x] **PasswordSettingsScreen** - Change password (verify current password)
- [x] **NotificationPreferencesScreen** - Toggle email & push notifications
- [x] **VisibilityStatusScreen** - Toggle visibility status (Provider)
- [x] **HelpSupportScreen** - FAQ with collapsible items
- [x] **TermsPrivacyScreen** - WebView Terms & Privacy Policy
- [x] **NotificationScreen** - Notification list + "Mark All as Read"

---

## 🌐 ADMIN WEBSITE

### 7. Authentication & Authorization

- [x] **Login** - Sign in with email or username/password
- [x] **Logout** - Sign out and clear session
- [x] **JWT Authentication** - Token-based authentication
- [x] **Protected Routes** - AuthGuard protecting routes
- [x] **Auto Token Refresh** - Automatically refresh token on expiry
- [x] **Session Management** - Session management via cookies

---

### 8. Dashboard Overview

#### 8.1 Metrics Display
- [x] Total Users
- [x] Total Businesses
- [x] Businesses pending approval

#### 8.2 Popular Searches Analytics
- [x] List of popular search keywords
- [x] Search count per keyword
- [x] Result count per keyword
- [x] Pagination

---

### 9. Notifications Management

#### 9.1 Create New Notification
- [x] Enter notification title
- [x] Enter notification body
- [x] Select target audience (All, Businesses, Customers, Providers)
- [x] Select target location (for business audience)
- [x] Select all locations or a specific location
- [x] Form validation
- [ ] Display success/failure result

#### 9.2 Notification List
- [x] Table view of all notifications
- [x] Filter by tab (All, Businesses, Customers, Providers)
- [x] Search by title or content
- [x] Sort by created date
- [x] Archive notification action
- [x] Pagination
- [x] Empty state when no data

#### 9.3 Notification Detail
- [x] Send timestamp
- [x] Notification status

---

### 10. Users Management

#### 10.1 Businesses Management
- [x] Table view of all businesses
- [x] Search by name or ID
- [x] Sort by column (name, ID, Category, Rating, Registration date, status)
- [x] Filter by status
- [x] Expandable rows for details
- [x] Pagination + items per page selection
- [x] Empty state
- [x] Toggle Active/Suspend + confirmation dialog
- [x] Optimistic UI + rollback on error
- [x] View total reviews (clickable)

#### 10.2 Business Reviews (Modal)
- [x] View all reviews for a business
- [x] Review content (text, photos, video)
- [x] Reviewer info (name, avatar)
- [x] Display rating
- [x] Media preview + lightbox fullscreen
- [x] Delete review + confirmation modal
- [x] Infinite scroll
- [x] Empty state

#### 10.3 Business Metrics
- [x] Total businesses
- [x] Active businesses
- [x] Inactive businesses

#### 10.4 Export Businesses
- [x] Export data to CSV
- [x] Select date range (date range picker)
- [x] Date range validation
- [x] Authenticated download

#### 10.5 Customers Management
- [x] Table view of all customers
- [x] Search by name or email
- [x] Sort by column (ID, name, email, status, date)
- [x] Pagination + items per page selection
- [x] Empty state
- [x] Select status (Active/Suspended) with popover UI
- [x] Confirmation before changes
- [x] Optimistic UI + rollback on error

#### 10.6 Customer Metrics
- [x] Total customers
- [x] Active customers
- [ ] Inactive customers
- [ ] New customers this month

#### 10.7 Export Customers
- [x] Export data to CSV
- [x] Select date range
- [x] Date range validation

#### 10.8 Users Navigation
- [x] Tab switch between Businesses and Customers
- [ ] Highlight active tab
- [ ] Shared header for both tabs

---

### 11. Verification Module

#### 11.1 Pending Business List
- [x] Table view of all businesses pending approval
- [x] Filter by tab (All, Pending, Approved, Rejected)
- [x] Display count per tab
- [x] Search by business name
- [x] Sort by column
- [x] Pagination + items per page selection
- [x] Real-time updates
- [x] Empty state

#### 11.2 Business Info Modal
- [x] Business name
- [x] Business description
- [x] Contact information
- [x] Photo/media preview
- [x] Document preview
- [x] Owner information
- [x] Submission date
- [x] Current status

#### 11.3 Approve / Reject Actions
- [x] Approve business button
- [x] Reject business button
- [x] Confirmation dialog before action
- [x] Loading state during processing
- [x] Success/failure feedback

#### 11.4 Approval Status Display
- [x] "Pending" badge (yellow)
- [x] "Approved" badge (green)
- [x] "Rejected" badge (red)


## MVP Priority

### P0 - Critical (must have before launch)
- Complete auth flow (mobile + admin)
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
- CSV export
- Popular searches analytics
- Help & Support, FAQ
- i18n (if multi-language needed from the start)

### P3 - Nice to have
- Animations, empty states
- Performance optimizations (virtual scrolling, etc.)
- Debug mode
