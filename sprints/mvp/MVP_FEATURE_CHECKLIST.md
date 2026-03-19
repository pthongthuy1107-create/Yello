# Yello — MVP Feature Checklist (QC & Client Review)

> **Project:** Yello App
> **Scope:** Mobile App (Customer + Provider) + Admin Website
> **Excluded:** Payment, Tracking
> **Updated:** 2026-03-17
> **Prepared by:** QC Team

---

## 💡 Column Guide

| Column | Description |
|--------|-------------|
| **Platform** | Web (Admin) / Mobile (Customer) / Mobile (Provider) |
| **Module** | Functional group / screen group |
| **Feature Name** | Short name of the testable feature or flow |
| **Description** | What the feature does |
| **Flow / User Journey** | Step-by-step path to reach and complete the feature |
| **Priority** | High / Medium / Low |
| **Status** | Not Test / Testing / Passed / Failed |
| **Test Env** | Dev / Beta / Production (tick all that apply) |
| **Note** | Bug ID, blocker, comment |

> 💡 **Suggested extra columns when tracking in Excel:**
> - **Tester** — who executed this test
> - **Test Date** — date of last test run
> - **Bug ID** — linked bug reference (Google Sheet row or ticket)
> - **Sprint** — sprint where this feature was introduced

---

## 🌐 PLATFORM: ADMIN (Web)

### Module: Authentication

| Platform | Module | Feature Name | Description | Flow / User Journey | Priority | Status | Test Env | Note |
|----------|--------|--------------|-------------|---------------------|----------|--------|----------|------|
| Admin | Authentication | Login | Admin logs in with username and password | Open `/login` → Enter username + password → Click Login → Redirect to Dashboard | High | Not Test | | |
| Admin | Authentication | Form Validation | Show errors for empty/invalid fields | Leave fields empty → Submit → Error messages appear per field | High | Not Test | | |
| Admin | Authentication | Auth Guard | Unauthenticated users are redirected to login | Access protected route without login → Redirect to `/login` | High | Not Test | | |
| Admin | Authentication | Auto Token Refresh | JWT token refreshed automatically before expiry | Stay logged in → Token expires → Auto-refresh → Session continues | High | Not Test | | |
| Admin | Authentication | Logout | Admin logs out and session is cleared | Click Logout in sidebar → Session cleared → Redirect to `/login` | High | Not Test | | |
| Admin | Authentication | Back Navigation Block | Cannot return to dashboard after logout | Logout → Press browser Back → Still on login page | High | Not Test | | |

---

### Module: Layout & Navigation

| Platform | Module | Feature Name | Description | Flow / User Journey | Priority | Status | Test Env | Note |
|----------|--------|--------------|-------------|---------------------|----------|--------|----------|------|
| Admin | Layout & Navigation | Sidebar — Desktop | Main sidebar with 5 menu items, active highlight | Load any page → Sidebar visible → Active item highlighted | High | Not Test | | |
| Admin | Layout & Navigation | Sidebar — Mobile | Collapsible icon sidebar with hamburger toggle | Resize to mobile → Icon sidebar shown → Tap hamburger → Sheet opens | Medium | Not Test | | |
| Admin | Layout & Navigation | Active Route Highlight | Menu item highlights when on its page | Navigate to Users → "User Management" item highlighted in sidebar | High | Not Test | | |
| Admin | Layout & Navigation | Sidebar Tooltips | Hover on collapsed icon shows menu name tooltip | Collapsed sidebar → Hover icon → Tooltip appears | Low | Not Test | | |

---

### Module: Dashboard

| Platform | Module | Feature Name | Description | Flow / User Journey | Priority | Status | Test Env | Note |
|----------|--------|--------------|-------------|---------------------|----------|--------|----------|------|
| Admin | Dashboard | Overview Metrics | 4 metric cards: Total Users, Total Businesses, Pending Approval, Active Subscriptions | Load Dashboard → 4 cards shown with correct numbers and icons | High | Not Test | | |
| Admin | Dashboard | Metrics Loading State | Skeleton cards while data is loading | Navigate to Dashboard → Skeleton shown → Data loads in | Medium | Not Test | | |
| Admin | Dashboard | Popular Searches Table | Table of top search keywords with counts and result counts | Dashboard → Popular Searches section → Keywords + counts displayed | Medium | Not Test | | |
| Admin | Dashboard | Popular Searches Pagination | Navigate through pages of search data | Click Next/Prev in Popular Searches → Correct page loads | Medium | Not Test | | |
| Admin | Dashboard | Error & Retry | API error shows message and Retry button | Simulate API failure → Error state + Retry button → Click Retry → Reloads | High | Not Test | | |

---

### Module: Customers Management

| Platform | Module | Feature Name | Description | Flow / User Journey | Priority | Status | Test Env | Note |
|----------|--------|--------------|-------------|---------------------|----------|--------|----------|------|
| Admin | Customers | Customer List Table | View all customers with 6 columns: Name, User ID, Email, Role, Registered, Status | Navigate to `/users/customers` → Table displays all customers | High | Not Test | | |
| Admin | Customers | Sort by Column | Sort table by any column (A-Z, newest, status) | Click column header → Rows reorder → Click again to reverse | High | Not Test | | |
| Admin | Customers | Search Customers | Filter customers by name or email in real-time | Type in search box → Table filters as you type | High | Not Test | | |
| Admin | Customers | Pagination | Navigate pages, change rows per page | Click Next/Prev → Page changes; Select 20/50 per page → Table updates | High | Not Test | | |
| Admin | Customers | Status — Activate | Change Suspended/Inactive customer to Active | Click status badge → Popover → Select Active → Status updates immediately | High | Not Test | | |
| Admin | Customers | Status — Suspend | Suspend an active customer with confirmation | Click status badge → Select Suspended → Confirm modal → Status updated | High | Not Test | | |
| Admin | Customers | Delete Customer | Permanently remove a customer account | Click Delete in popover → Confirm modal → Customer removed from list | High | Not Test | | |
| Admin | Customers | Optimistic UI | UI updates immediately, rolls back on API error | Change status → Badge updates instantly → On failure, rolls back | Medium | Not Test | | |
| Admin | Customers | Customer Metrics Bar | Summary counts: Total, Active, Suspended, Inactive | Bottom of page → 4 metric cards → Update after status changes | Medium | Not Test | | |
| Admin | Customers | Export to CSV | Export customer list filtered by date range | Click Export → Pick date range → Download CSV file | Medium | Not Test | | |
| Admin | Customers | Empty & Error States | Show empty state or error message when applicable | No data → Empty state shown; API error → Error + Retry | Medium | Not Test | | |

---

### Module: Businesses Management

| Platform | Module | Feature Name | Description | Flow / User Journey | Priority | Status | Test Env | Note |
|----------|--------|--------------|-------------|---------------------|----------|--------|----------|------|
| Admin | Businesses | Business List Table | View all businesses: Name, ID, Category, Rating, Registered, Status | Navigate to `/users/businesses` → Table displays all businesses | High | Not Test | | |
| Admin | Businesses | Sort & Search | Sort by columns; search by name or ID | Click header to sort; type in search box to filter | High | Not Test | | |
| Admin | Businesses | Pagination | Navigate pages, change rows per page | Same as Customers pagination behavior | High | Not Test | | |
| Admin | Businesses | Row Expansion | Expand row to see Reviews count, Last Activity, Subscription | Click business row → Expands below → Metrics shown | Medium | Not Test | | |
| Admin | Businesses | Status — Suspend / Activate | Toggle business Active or Suspended | Click status badge → Popover → Select → Confirm if Suspending | High | Not Test | | |
| Admin | Businesses | Business Reviews Modal | View all customer reviews for a business; delete reviews | Click Reviews count → Modal opens → Browse reviews → Select → Delete | High | Not Test | | |
| Admin | Businesses | Reviews Infinite Scroll | Load more reviews as user scrolls in modal | Scroll to bottom of Reviews modal → More reviews load | Medium | Not Test | | |
| Admin | Businesses | Delete Review | Select and permanently remove one or more reviews | Check reviews → Click Save → Confirm delete modal → Reviews removed | High | Not Test | | |
| Admin | Businesses | Business Metrics Bar | Summary: Total Businesses, Active, Suspended | Bottom of page → 3 metric cards → Update after changes | Medium | Not Test | | |
| Admin | Businesses | Export to CSV | Export business list by date range | Click Export → Pick date range → Download CSV | Medium | Not Test | | |

---

### Module: Verification Center

| Platform | Module | Feature Name | Description | Flow / User Journey | Priority | Status | Test Env | Note |
|----------|--------|--------------|-------------|---------------------|----------|--------|----------|------|
| Admin | Verification | Verification List | View businesses pending approval, with status tabs | Navigate to `/verification` → 4 tabs: All, Pending, Approved, Rejected | High | Not Test | | |
| Admin | Verification | Tab Filter | Filter list by approval status with count badges | Click Pending tab → Only pending businesses shown; count badge updated | High | Not Test | | |
| Admin | Verification | Search & Sort | Search by business name or ID; sort by column | Type name → Filter results; click column → Sort | High | Not Test | | |
| Admin | Verification | Manage Business Modal | View full business details before approving or rejecting | Click Manage → Side panel opens → Image, name, category, schedule, about, media | High | Not Test | | |
| Admin | Verification | Media Lightbox | View business photos/videos fullscreen with navigation | Click photo thumbnail → Lightbox opens → Navigate next/prev → Close | Medium | Not Test | | |
| Admin | Verification | Approve Business | One-click approval for a pending business | Click Approve → Status updates to Approved in list | High | Not Test | | |
| Admin | Verification | Reject Business | Reject with mandatory reason; reason saved for provider | Enter rejection reason → Click Reject → Status updates to Rejected | High | Not Test | | |
| Admin | Verification | Approval Status Badges | Color-coded status: Pending=yellow, Approved=green, Rejected=red | View any business row → Badge shown in correct color | High | Not Test | | |

---

### Module: Notifications Management

| Platform | Module | Feature Name | Description | Flow / User Journey | Priority | Status | Test Env | Note |
|----------|--------|--------------|-------------|---------------------|----------|--------|----------|------|
| Admin | Notifications | Create Notification Form | Create push notification with title, message, audience, location | Navigate to `/notifications` → Fill form → Send | High | Not Test | | |
| Admin | Notifications | Push to All Toggle | Send to all users ignoring type/location filters | Toggle ON → User Type and Location fields hidden → Fill title + message → Send | High | Not Test | | |
| Admin | Notifications | Audience Targeting | Target by user type: Businesses, Customers, Providers | Select User Type → Location dropdown updates accordingly | High | Not Test | | |
| Admin | Notifications | Location Targeting | Target businesses in a specific location | Select Businesses → Choose location from dropdown → Send | High | Not Test | | |
| Admin | Notifications | Form Validation | Required fields validated before sending | Leave title or message empty → Submit → Inline errors shown | High | Not Test | | |
| Admin | Notifications | Confirm & Send | Confirmation modal before sending notification | Click Send → Confirm modal → Confirm → Notification sent | High | Not Test | | |
| Admin | Notifications | Retry on Failure | Retry button shown if send fails | Send fails → Retry button appears → Click → Resend without confirm | Medium | Not Test | | |
| Admin | Notifications | Notification List | View all sent notifications in table with tabs | Scroll to list section → All/Active/Archived tabs → Browse | Medium | Not Test | | |
| Admin | Notifications | Search Notifications | Filter notifications by title or content | Type in search box → Results filter in real-time | Medium | Not Test | | |
| Admin | Notifications | Archive Notification | Move a notification to Archived state | Click Archive → Notification moves to Archived tab | Medium | Not Test | | |

---

### Module: Error Handling & System

| Platform | Module | Feature Name | Description | Flow / User Journey | Priority | Status | Test Env | Note |
|----------|--------|--------------|-------------|---------------------|----------|--------|----------|------|
| Admin | System | API Error Handling | All pages handle API failures gracefully | Simulate network error → Error message + Retry shown on affected section | High | Not Test | | |
| Admin | System | Loading Skeletons | All async content shows skeleton while loading | Navigate to any page → Skeleton layout shown before data | High | Not Test | | |
| Admin | System | Confirm Modals | All destructive actions require explicit confirmation | Any delete or suspend action → Modal appears → Confirm or Cancel | High | Not Test | | |
| Admin | System | Toast Notifications | Success/error toasts for user-triggered actions | Perform action → Toast appears at correct position → Auto-dismisses | Medium | Not Test | | |
| Admin | System | Responsive Layout | Admin UI adapts to different screen sizes | Resize browser → Layout adjusts; tables scroll horizontally on small screens | Medium | Not Test | | |
| Admin | System | 404 Route Handling | Unknown routes show a 404 page | Enter unknown URL → 404 page displayed | Low | Not Test | | |

---
---

## 📱 PLATFORM: MOBILE (Customer)

### Module: Onboarding & Authentication

| Platform | Module | Feature Name | Description | Flow / User Journey | Priority | Status | Test Env | Note |
|----------|--------|--------------|-------------|---------------------|----------|--------|----------|------|
| Mobile (Customer) | Onboarding | Splash Screen | App initializes with auto-login check | Open app → Splash screen → Auto-login if token valid → Home or Login | High | Not Test | | |
| Mobile (Customer) | Onboarding | Choose Role | User selects Customer or Provider role | First open → Choose Role screen → Tap Customer or Provider | High | Not Test | | |
| Mobile (Customer) | Onboarding | Intro Slides | 3-slide carousel introducing app features | First launch → 3 slides with Next/Skip → Proceed to Auth | Medium | Not Test | | |
| Mobile (Customer) | Authentication | Sign Up | Register account: name, email, phone, password, OTP | Tap Sign Up → Fill info → Set password → Verify OTP → Account ready | High | Not Test | | |
| Mobile (Customer) | Authentication | Sign In | Log in with email and password | Enter email + password → Submit → Redirect to Home | High | Not Test | | |
| Mobile (Customer) | Authentication | Account Activation Modal | Confirm account activation if unverified | Sign in → Modal appears → Confirm → Proceed | High | Not Test | | |
| Mobile (Customer) | Authentication | Forgot Password | Reset password via email or phone OTP | Tap Forgot Password → Choose method → Enter OTP → New password → Success screen | High | Not Test | | |
| Mobile (Customer) | Authentication | Logout | Confirm logout and clear session | Profile → Logout → Confirm modal → Redirect to Login | High | Not Test | | |

---

### Module: Home

| Platform | Module | Feature Name | Description | Flow / User Journey | Priority | Status | Test Env | Note |
|----------|--------|--------------|-------------|---------------------|----------|--------|----------|------|
| Mobile (Customer) | Home | Location Header | Shows user's current location + notification icon | Open Home → Location displayed in header → Tap notification icon | High | Not Test | | |
| Mobile (Customer) | Home | Nearby Businesses | Businesses closest to the user's current location | Home loads → Nearby section shows distance-sorted businesses | High | Not Test | | |
| Mobile (Customer) | Home | Categories Carousel | Quick-access service categories | Scroll Categories section → Tap category → Results screen | High | Not Test | | |
| Mobile (Customer) | Home | Popular Now | Trending businesses highlighted on home screen | Home → Popular Now section → Tap to open business detail | High | Not Test | | |
| Mobile (Customer) | Home | Pull-to-Refresh | Refresh all home content | Pull down on Home screen → Data reloads | Medium | Not Test | | |

---

### Module: Search

| Platform | Module | Feature Name | Description | Flow / User Journey | Priority | Status | Test Env | Note |
|----------|--------|--------------|-------------|---------------------|----------|--------|----------|------|
| Mobile (Customer) | Search | Search with Autocomplete | Real-time suggestions as user types | Tap search bar → Type keyword → Suggestions appear → Select | High | Not Test | | |
| Mobile (Customer) | Search | Recent Search History | Shows last searches; each can be deleted | Open Search → History shown → Tap to reuse → Delete individual items | Medium | Not Test | | |
| Mobile (Customer) | Search | Suggested Categories | Category shortcuts shown on search screen | Open Search → Suggested categories visible | Medium | Not Test | | |
| Mobile (Customer) | Search | Search Results | Paginated results with infinite scroll | Type and search → Results list → Scroll down → More load | High | Not Test | | |
| Mobile (Customer) | Search | Filters Modal | Filter results by category, subcategory, distance, availability | Tap Filter icon → Select options → Apply → Results update | High | Not Test | | |
| Mobile (Customer) | Search | Sort Modal | Sort results by nearest or newest | Tap Sort → Choose option → Results reorder | High | Not Test | | |
| Mobile (Customer) | Search | Empty State | No results shown when search returns nothing | Search term with no results → Empty state message shown | Medium | Not Test | | |

---

### Module: Near Me

| Platform | Module | Feature Name | Description | Flow / User Journey | Priority | Status | Test Env | Note |
|----------|--------|--------------|-------------|---------------------|----------|--------|----------|------|
| Mobile (Customer) | Near Me | Map View | Google Maps with clustered business markers | Open Near Me → Map loads → Markers shown → Tap marker → Preview popup | High | Not Test | | |
| Mobile (Customer) | Near Me | List View | Businesses in a scrollable list | Toggle to List view → Businesses listed with distance | High | Not Test | | |
| Mobile (Customer) | Near Me | Map ↔ List Toggle | Switch between map and list view | Tap toggle button → View changes between Map and List | High | Not Test | | |
| Mobile (Customer) | Near Me | Search This Area | Trigger search in the currently visible map area | Pan/zoom map → Tap "Search This Area" → Markers update | Medium | Not Test | | |
| Mobile (Customer) | Near Me | My Location Button | Return map to user's current location | Tap My Location → Map centers on user's GPS position | Medium | Not Test | | |
| Mobile (Customer) | Near Me | Location Permission | Request and handle device location access | First use → Permission prompt → Grant or Deny → Handle both | High | Not Test | | |
| Mobile (Customer) | Near Me | Location Picker Modal | Manually select a search area | Tap location picker → Search/select area → Results update | Medium | Not Test | | |
| Mobile (Customer) | Near Me | Filter & Sort in Near Me | Apply filters and sorting within Near Me | Tap Filter/Sort → Select options → Results update on map/list | Medium | Not Test | | |

---

### Module: Business Detail

| Platform | Module | Feature Name | Description | Flow / User Journey | Priority | Status | Test Env | Note |
|----------|--------|--------------|-------------|---------------------|----------|--------|----------|------|
| Mobile (Customer) | Business Detail | Business Info | Full details: name, category, rating, distance, hours, about | Tap any business → Detail screen loads → All info displayed | High | Not Test | | |
| Mobile (Customer) | Business Detail | Open in Maps | Tap address to open Google Maps for directions | Tap address → Google Maps opens with business location | High | Not Test | | |
| Mobile (Customer) | Business Detail | Call Business | Tap phone number to initiate a call | Tap phone icon → Phone dialer opens with number | High | Not Test | | |
| Mobile (Customer) | Business Detail | Message Business | Open conversation with the business | Tap Message button → Navigates to chat screen | High | Not Test | | |
| Mobile (Customer) | Business Detail | Photo Gallery | Horizontal scrollable gallery with "View All" | Scroll gallery → Tap photo → Fullscreen view | Medium | Not Test | | |
| Mobile (Customer) | Business Detail | Reviews Section | Rating summary + 3 latest reviews with "View All" link | View reviews section → Star avg + 3 reviews shown → Tap View All | High | Not Test | | |
| Mobile (Customer) | Business Detail | Rate & Review | Submit a star rating with review text and media | Tap Rate → Select stars → Write text → Upload photo/video → Submit | High | Not Test | | |
| Mobile (Customer) | Business Detail | You May Also Like | Similar businesses recommended below | Scroll to bottom → Similar businesses section shown | Low | Not Test | | |

---

### Module: Reviews & Photos

| Platform | Module | Feature Name | Description | Flow / User Journey | Priority | Status | Test Env | Note |
|----------|--------|--------------|-------------|---------------------|----------|--------|----------|------|
| Mobile (Customer) | Reviews | All Reviews Screen | Paginated list of all reviews for a business | Tap "View All Reviews" → Full list → Scroll to load more | Medium | Not Test | | |
| Mobile (Customer) | Reviews | Review Media | Photos and videos displayed within reviews | View review → Media thumbnail shown → Tap to expand | Medium | Not Test | | |
| Mobile (Customer) | Photos | View All Photos | Fullscreen gallery of all business images | Tap "View All Photos" → Fullscreen grid → Tap image → Zoom | Medium | Not Test | | |

---

### Module: Messages

| Platform | Module | Feature Name | Description | Flow / User Journey | Priority | Status | Test Env | Note |
|----------|--------|--------------|-------------|---------------------|----------|--------|----------|------|
| Mobile (Customer) | Messages | Conversation List | Inbox showing all conversations with preview | Tap Messages tab → Conversations listed → Unread badge shown | High | Not Test | | |
| Mobile (Customer) | Messages | Search Conversations | Filter conversations by name or keyword | Type in search bar in Messages → List filters | Medium | Not Test | | |
| Mobile (Customer) | Messages | Real-time Chat | Send and receive messages instantly via Socket.io | Open chat → Type → Send → Receive in real-time | High | Not Test | | |
| Mobile (Customer) | Messages | Message Bubbles & Status | Sent/received bubble styles + read/unread status | Messages show correct bubble styles and delivery/read indicators | High | Not Test | | |
| Mobile (Customer) | Messages | Typing Indicator | Shows when the other party is typing | Other user types → "Typing..." indicator appears | Medium | Not Test | | |
| Mobile (Customer) | Messages | Load Older Messages | Scroll up to load chat history | Scroll to top of chat → Older messages load | Medium | Not Test | | |
| Mobile (Customer) | Messages | Retry Failed Message | Retry sending a failed message | Send fails → Retry option shown → Tap → Message resent | Medium | Not Test | | |

---

### Module: Notifications

| Platform | Module | Feature Name | Description | Flow / User Journey | Priority | Status | Test Env | Note |
|----------|--------|--------------|-------------|---------------------|----------|--------|----------|------|
| Mobile (Customer) | Notifications | Notification List | View all received notifications with pagination | Tap Notifications → List shown → Scroll to load more | High | Not Test | | |
| Mobile (Customer) | Notifications | Mark as Read | Mark individual or all notifications as read | Tap notification → Marked read; Tap "Mark All as Read" → All cleared | High | Not Test | | |
| Mobile (Customer) | Notifications | Real-time Push | Receive push notifications when app is in background | App backgrounded → Push arrives → Tap → Opens relevant screen | High | Not Test | | |
| Mobile (Customer) | Notifications | In-app Banner | Foreground notification banner shown while using app | App open → Notification received → Banner slides in at top | Medium | Not Test | | |
| Mobile (Customer) | Notifications | Tab Badge Count | Unread count shown on Notifications tab icon | Receive notification → Badge number appears on tab | Medium | Not Test | | |
| Mobile (Customer) | Notifications | Notification Preferences | Toggle push/email notifications per type | Settings → Notification Preferences → Toggle → Save | Medium | Not Test | | |

---

### Module: Categories & Discovery

| Platform | Module | Feature Name | Description | Flow / User Journey | Priority | Status | Test Env | Note |
|----------|--------|--------------|-------------|---------------------|----------|--------|----------|------|
| Mobile (Customer) | Discovery | All Categories | Full grid of all service categories | Tap Categories → Grid view → Tap any → Category results | Medium | Not Test | | |
| Mobile (Customer) | Discovery | Category Results | Businesses filtered by selected category with sort/filter | Select category → Results list → Filter / Sort | Medium | Not Test | | |
| Mobile (Customer) | Discovery | Popular Now (Full List) | Complete list of trending businesses | Tap "See All" on Popular Now → Full list with filter/sort | Medium | Not Test | | |
| Mobile (Customer) | Discovery | You May Also Like (Full List) | Full list of similar businesses | Tap "See All" on You May Also Like → Full list | Low | Not Test | | |

---

### Module: Profile & Settings

| Platform | Module | Feature Name | Description | Flow / User Journey | Priority | Status | Test Env | Note |
|----------|--------|--------------|-------------|---------------------|----------|--------|----------|------|
| Mobile (Customer) | Profile | Profile Screen | View avatar, name, and settings menu | Tap Profile tab → Info and menu displayed | High | Not Test | | |
| Mobile (Customer) | Profile | Edit Avatar | Change profile photo via camera or gallery | Tap avatar → Choose Camera or Library → Crop → Save | High | Not Test | | |
| Mobile (Customer) | Profile | Account Settings | Edit first/last name; delete account | Profile → Account Settings → Edit fields → Save or Delete account | High | Not Test | | |
| Mobile (Customer) | Profile | Password Settings | Change current password | Profile → Password Settings → Verify current → New password → Save | High | Not Test | | |
| Mobile (Customer) | Profile | Help & Support | FAQ with collapsible accordion items | Profile → Help & Support → Browse FAQ items → Expand/collapse | Low | Not Test | | |
| Mobile (Customer) | Profile | Terms & Privacy Policy | View legal pages via in-app WebView | Profile → Terms & Privacy → WebView renders HTML content from API | Low | Not Test | | |

---
---

## 📱 PLATFORM: MOBILE (Provider)

### Module: Provider Home & Dashboard

| Platform | Module | Feature Name | Description | Flow / User Journey | Priority | Status | Test Env | Note |
|----------|--------|--------------|-------------|---------------------|----------|--------|----------|------|
| Mobile (Provider) | Provider Home | Dashboard | Business info card + recent messages + competitor suggestions | Login as Provider → Home → Business card + messages + competitor list | High | Not Test | | |
| Mobile (Provider) | Provider Home | Add Business CTA | Prompt to register business if none exists | New provider with no business → "Add Business" button shown on home | High | Not Test | | |
| Mobile (Provider) | Provider Home | Recent Messages | Preview of latest customer conversations | Dashboard → Last Messages section → Tap to open chat | High | Not Test | | |
| Mobile (Provider) | Provider Home | Competitors Near You | Businesses in the same category nearby | Dashboard → Competitors section → Shows similar registered businesses | Medium | Not Test | | |

---

### Module: Business Registration & Management

| Platform | Module | Feature Name | Description | Flow / User Journey | Priority | Status | Test Env | Note |
|----------|--------|--------------|-------------|---------------------|----------|--------|----------|------|
| Mobile (Provider) | Business Registration | Profile Setup | Set business name and upload avatar | Register flow → Section 1 → Enter name + upload photo → Next | High | Not Test | | |
| Mobile (Provider) | Business Registration | Primary Contact | Add phone number and preferred contact method | Section 3 → Phone + choose Message or Call → Next | High | Not Test | | |
| Mobile (Provider) | Business Registration | Address & Map | Select business address using Google Places | Section 4 → Search address → Pin on map → Confirm location | High | Not Test | | |
| Mobile (Provider) | Business Registration | Working Hours | Set open/close times for each day of the week | Section 5 → Toggle days on/off → Set hours → Next | High | Not Test | | |
| Mobile (Provider) | Business Registration | About / Description | Add a business description | Section 6 → Write description → Next | High | Not Test | | |
| Mobile (Provider) | Business Registration | Category Selection | Choose industry and sub-category | Section 7 → Browse and select category + subcategory | High | Not Test | | |
| Mobile (Provider) | Business Registration | Photo Upload | Upload gallery photos for the business | Section 8 → Select photos from library → Upload | High | Not Test | | |
| Mobile (Provider) | Business Registration | Submit for Review | Submit completed business for admin approval | All sections filled → Submit → Status shows Pending | High | Not Test | | |
| Mobile (Provider) | Business Management | Approval / Rejection Status | View current approval status and rejection reason | Business submitted → Status shown: Pending / Approved / Rejected + reason | High | Not Test | | |
| Mobile (Provider) | Business Management | Edit Business Info | Edit any section after registration | Registered business → Tap edit section → Update → Save with confirmation | High | Not Test | | |
| Mobile (Provider) | Business Management | Edit Working Hours | Update opening hours per day | Business edit → Working Hours → Toggle/Edit each day → Save | High | Not Test | | |
| Mobile (Provider) | Business Management | Photo Management | Add, remove, set primary, pin/unpin photos | Business photos → Add new / Delete / Set as primary / Pin | Medium | Not Test | | |
| Mobile (Provider) | Business Management | Visibility Status | Toggle business on/off visibility in the app | Profile → Visibility Status → Toggle → Confirmed | Medium | Not Test | | |

---
---

## 📊 Test Coverage Summary

| Platform | Module | Total Features | Passed | Failed | Not Test |
|----------|--------|---------------|--------|--------|----------|
| Admin | Authentication | 6 | | | 6 |
| Admin | Layout & Navigation | 4 | | | 4 |
| Admin | Dashboard | 5 | | | 5 |
| Admin | Customers | 11 | | | 11 |
| Admin | Businesses | 10 | | | 10 |
| Admin | Verification | 8 | | | 8 |
| Admin | Notifications | 10 | | | 10 |
| Admin | System / Error Handling | 6 | | | 6 |
| Mobile (Customer) | Onboarding & Auth | 8 | | | 8 |
| Mobile (Customer) | Home | 5 | | | 5 |
| Mobile (Customer) | Search | 7 | | | 7 |
| Mobile (Customer) | Near Me | 8 | | | 8 |
| Mobile (Customer) | Business Detail | 8 | | | 8 |
| Mobile (Customer) | Reviews & Photos | 3 | | | 3 |
| Mobile (Customer) | Messages | 7 | | | 7 |
| Mobile (Customer) | Notifications | 6 | | | 6 |
| Mobile (Customer) | Discovery | 4 | | | 4 |
| Mobile (Customer) | Profile & Settings | 6 | | | 6 |
| Mobile (Provider) | Provider Home | 4 | | | 4 |
| Mobile (Provider) | Business Registration | 9 | | | 9 |
| Mobile (Provider) | Business Management | 5 | | | 5 |
| **TOTAL** | | **149** | | | **149** |

---

## 📝 Test Session Log

**Tester:**
**Environment:** `[ ] Dev  [ ] Beta  [ ] Production`
**Date:**
**Build / Version:**

### Bugs Found

| # | Platform | Module | Feature | Description | Severity | Status | Ref |
|---|----------|--------|---------|-------------|----------|--------|-----|
| | | | | | Critical / High / Medium / Low | Open / Fixed / Won't Fix | GSheet / Ticket |
