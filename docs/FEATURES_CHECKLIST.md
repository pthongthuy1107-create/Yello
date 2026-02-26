# Yellow Admin Panel - Features Checklist

> **Purpose**: This checklist is designed for QC and Client teams to track progress and validate features of the Yellow Admin Panel.
> **Created**: 2026-02-26
> **Version**: 1.0.0

---

## 📊 Project Overview

- **Tech Stack**: Next.js 15, React 19, TypeScript, GraphQL (Apollo Client)
- **UI Framework**: Radix UI + Tailwind CSS
- **Form Handling**: React Hook Form + Zod
- **State Management**: Zustand + Apollo Cache

---

## 1. 🔐 Authentication & Authorization

- [ ] **Login** - User login with email/password
- [ ] **Logout** - User logout and clear session
- [ ] **JWT Authentication** - Token-based authentication
- [ ] **Protected Routes** - AuthGuard protecting routes
- [ ] **Auto Token Refresh** - Automatic token refresh on expiration
- [ ] **Session Management** - Session management with cookies

---

## 2. 📈 Dashboard Overview Module

### 2.1 Metrics Display
- [ ] **Total Users** - Display total number of users
- [ ] **Total Businesses** - Display total number of businesses
- [ ] **Total Searches** - Display total number of searches
- [ ] **Active Users** - Display number of active users
- [ ] **Real-time Refresh** - Real-time data refresh capability

### 2.2 Popular Searches Analytics
- [ ] **Search Terms List** - List of popular search keywords
- [ ] **Search Count** - Number of searches per keyword
- [ ] **Results Found** - Number of results found per keyword
- [ ] **Column Sorting** - Sort columns (term, searches, results)
- [ ] **Page Size Selector** - Select items per page (10, 20, 50, 100)
- [ ] **Search Function** - Search within results
- [ ] **Pagination** - Data pagination

---

## 3. 🔔 Notifications Management Module

### 3.1 Create New Notification
- [ ] **Title Input** - Enter notification title
- [ ] **Message/Body** - Enter detailed message content
- [ ] **Audience Type Selection** - Select target audience (All, Businesses, Customers, Providers)
- [ ] **Location Targeting** - Select locations to receive notification
- [ ] **Multiple Locations** - Select multiple locations at once
- [ ] **Form Validation** - Validate input data
- [ ] **Success/Error Feedback** - Display success/error results

### 3.2 Notifications List
- [ ] **View All Table** - View all notifications in table format
- [ ] **Tab Filtering** - Filter by tabs (All, Active, Archived)
- [ ] **Search** - Search by title or message
- [ ] **Column Sorting** - Sort columns
- [ ] **Archive Action** - Archive notification
- [ ] **Pagination** - Pagination controls
- [ ] **Page Size Selector** - Select items per page
- [ ] **Real-time Updates** - Real-time data updates
- [ ] **Empty State** - Display empty state when no data

### 3.3 Notification Details
- [ ] **Sent Date/Time** - Display sent timestamp
- [ ] **Audience Badge** - Badge showing audience type
- [ ] **Location Info** - Location targeting information
- [ ] **Status Indicator** - Notification status

---

## 4. 👥 Users Management Module

### 4.1 Businesses Management

#### 4.1.1 Business Listing
- [ ] **View All Table** - View all businesses in table
- [ ] **Search** - Search by name or ID
- [ ] **Column Sorting** - Sort columns (ID, name, status, date)
- [ ] **Status Filter** - Filter and update status
- [ ] **Expandable Rows** - Expand row to view details
- [ ] **Pagination** - Pagination controls
- [ ] **Page Size Selector** - Select items per page
- [ ] **Real-time Updates** - Real-time data updates
- [ ] **Empty State** - Display empty state when no data

#### 4.1.2 Business Status Management
- [ ] **Active/Inactive Toggle** - Toggle status
- [ ] **Status Change Confirmation** - Confirm status change
- [ ] **Optimistic UI** - Immediate UI update
- [ ] **Error Rollback** - Rollback on error

#### 4.1.3 Business Details (Expanded Row)
- [ ] **Total Reviews Count** - Number of reviews (clickable)
- [ ] **Last Activity** - Last activity timestamp
- [ ] **Subscription Tier** - Current subscription tier
- [ ] **View Profile Button** - Button to view detailed profile

#### 4.1.4 Business Reviews Modal
- [ ] **View All Reviews** - View all reviews for business
- [ ] **Review Content** - Display text, images, videos
- [ ] **Reviewer Info** - Reviewer information (name, avatar)
- [ ] **Rating Display** - Display review rating
- [ ] **Review Date** - Review date/time
- [ ] **Media Preview** - Preview images/videos
- [ ] **Media Lightbox** - View fullscreen images/videos
- [ ] **Delete Review** - Delete review functionality
- [ ] **Delete Confirmation** - Modal to confirm deletion
- [ ] **Reviews Pagination** - Paginate reviews
- [ ] **Empty State** - Display when no reviews

#### 4.1.5 Business Metrics Dashboard
- [ ] **Total Count** - Total number of businesses
- [ ] **Active Count** - Number of active businesses
- [ ] **Inactive Count** - Number of inactive businesses
- [ ] **New This Month** - New businesses this month

#### 4.1.6 Export Functionality
- [ ] **Export to CSV** - Export data to CSV
- [ ] **Date Range Picker** - Select date range for export
- [ ] **From Date Selector** - Select start date
- [ ] **To Date Selector** - Select end date
- [ ] **Date Validation** - Validate date range
- [ ] **Authenticated Download** - Download with authentication

### 4.2 Customers Management

#### 4.2.1 Customer Listing
- [ ] **View All Table** - View all customers in table
- [ ] **Search** - Search by name or email
- [ ] **Column Sorting** - Sort columns (ID, name, email, status, date)
- [ ] **Status Filter** - Filter and update status
- [ ] **Pagination** - Pagination controls
- [ ] **Page Size Selector** - Select items per page
- [ ] **Real-time Updates** - Real-time data updates
- [ ] **Empty State** - Display empty state when no data

#### 4.2.2 Customer Status Management
- [ ] **Status Selection** - Select status (Active/Inactive/Suspended)
- [ ] **Popover UI** - Popover interface for status selection
- [ ] **Change Confirmation** - Confirm before changing
- [ ] **Optimistic UI** - Immediate UI update
- [ ] **Error Rollback** - Rollback on error

#### 4.2.3 Customer Metrics Dashboard
- [ ] **Total Count** - Total number of customers
- [ ] **Active Count** - Number of active customers
- [ ] **Inactive Count** - Number of inactive customers
- [ ] **New This Month** - New customers this month

#### 4.2.4 Export Functionality
- [ ] **Export to CSV** - Export data to CSV
- [ ] **Date Range Picker** - Select date range for export
- [ ] **From Date Selector** - Select start date
- [ ] **To Date Selector** - Select end date
- [ ] **Date Validation** - Validate date range
- [ ] **Authenticated Download** - Download with authentication

### 4.3 User Navigation
- [ ] **Tab Navigation** - Switch between Businesses and Customers
- [ ] **Active Tab Indicator** - Highlight active tab
- [ ] **Shared Header** - Shared header for both tabs
- [ ] **Export Section** - Export section in header

---

## 5. ✅ Verification Module

### 5.1 Business Verification Workflow

#### 5.1.1 Verification Listing
- [ ] **View All Table** - View all businesses requiring verification
- [ ] **Tab Filtering** - Filter by tabs (All, Pending, Approved, Rejected)
- [ ] **Tab Count Indicators** - Display count in each tab
- [ ] **Search** - Search by business name
- [ ] **Column Sorting** - Sort columns
- [ ] **Pagination** - Pagination controls
- [ ] **Page Size Selector** - Select items per page
- [ ] **Real-time Updates** - Real-time data updates
- [ ] **Empty State** - Display empty state when no data

#### 5.1.2 Manage Business Modal
- [ ] **Business Info** - Business information
- [ ] **Business Name** - Business name
- [ ] **Description** - Business description
- [ ] **Contact Info** - Contact information
- [ ] **Images/Media Preview** - Preview images/media
- [ ] **Documents Preview** - Preview documents
- [ ] **Owner Info** - Owner information
- [ ] **Submission Date** - Submission date
- [ ] **Status Indicator** - Current status

#### 5.1.3 Verification Actions
- [ ] **Approve Button** - Button to approve business
- [ ] **Reject Button** - Button to reject business
- [ ] **Confirmation Dialog** - Dialog to confirm action
- [ ] **Loading States** - Display loading during processing
- [ ] **Success/Error Feedback** - Feedback on result
- [ ] **Optimistic UI** - Immediate UI update
- [ ] **Error Rollback** - Rollback on error

#### 5.1.4 Verification Status Display
- [ ] **Pending Badge** - Pending status badge
- [ ] **Approved Badge** - Approved status badge
- [ ] **Rejected Badge** - Rejected status badge
- [ ] **Color-coded Indicators** - Color-coded status indicators

---

## 6. ⚙️ System Features

### 6.1 GraphQL Integration
- [ ] **Apollo Client Config** - Apollo Client configuration
- [ ] **Typed Operations** - Typed GraphQL operations
- [ ] **Query Hooks** - Hooks for data fetching
- [ ] **Mutation Hooks** - Hooks for data updates
- [ ] **Optimistic UI** - Optimistic UI updates
- [ ] **Cache Management** - Apollo cache management
- [ ] **Error Handling** - GraphQL error handling
- [ ] **Network Status** - Network status indicators

### 6.2 Form Handling & Validation
- [ ] **React Hook Form** - React Hook Form integration
- [ ] **Zod Validation** - Schema validation with Zod
- [ ] **Field Validation** - Individual field validation
- [ ] **Form Validation** - Complete form validation
- [ ] **Error Messages** - Display error messages
- [ ] **Submit Disabled** - Disable submit when invalid
- [ ] **Form Reset** - Reset form to initial state
- [ ] **Debug Mode** - Debug mode for development

### 6.3 Table & Data Display
- [ ] **TanStack Table** - TanStack Table integration
- [ ] **Virtual Scrolling** - Virtual scrolling for performance
- [ ] **Column Sorting** - Sort columns (asc/desc)
- [ ] **Fixed Headers** - Fixed table headers
- [ ] **Responsive Design** - Responsive table design
- [ ] **Row Selection** - Row selection capability
- [ ] **Expandable Rows** - Expandable rows
- [ ] **Custom Cell Renderers** - Custom cell rendering
- [ ] **Loading Skeletons** - Skeleton loading states
- [ ] **Error States with Retry** - Error states with retry option

### 6.4 Pagination System
- [ ] **Page Size Selector** - Select items per page (10, 20, 50, 100)
- [ ] **Current Page Display** - Display current page
- [ ] **Total Count** - Display total items count
- [ ] **Previous/Next** - Previous/Next navigation
- [ ] **First/Last Page** - First/Last page navigation
- [ ] **Page Number Display** - Display "X of Y"
- [ ] **Disabled States** - Disabled states at boundaries
- [ ] **Responsive Controls** - Responsive pagination controls

### 6.5 UI Components Library
- [ ] **Button** - Button component with variants
- [ ] **Input Fields** - Text, password input fields
- [ ] **Textarea** - Textarea component
- [ ] **Select/Dropdown** - Select component
- [ ] **Dialog/Modal** - Dialog component
- [ ] **Popover** - Popover component
- [ ] **Tooltip** - Tooltip component
- [ ] **Badge** - Badge component
- [ ] **Card** - Card component
- [ ] **Switch/Toggle** - Switch component
- [ ] **Label** - Label component
- [ ] **Empty State** - Empty state component
- [ ] **Loading State** - Loading state component
- [ ] **Skeleton** - Skeleton component
- [ ] **Status Indicator** - Status indicator component
- [ ] **Search Input** - Search input component
- [ ] **Metric Card** - Metric card component
- [ ] **Toast Notifications** - Toast notifications with Sonner
- [ ] **Sheet/Drawer** - Sheet/Drawer component

### 6.6 Media Handling
- [ ] **CustomImage Component** - Image with lazy loading
- [ ] **CustomVideo Component** - Video with controls
- [ ] **Media Preview** - Thumbnail preview
- [ ] **Media Lightbox** - Lightbox viewer
- [ ] **Fullscreen View** - Fullscreen view
- [ ] **Multiple Media** - Support multiple images/videos
- [ ] **Error Handling** - Media error handling
- [ ] **Fallback Images** - Fallback on error

### 6.7 Navigation & Layout
- [ ] **Sidebar Navigation** - Dashboard sidebar
- [ ] **Dashboard Header** - Header with user info
- [ ] **Breadcrumb** - Breadcrumb navigation
- [ ] **Active Route Highlight** - Highlight current route
- [ ] **Responsive Layout** - Responsive layout
- [ ] **Mobile Sidebar** - Mobile-friendly sidebar
- [ ] **Scroll to Top** - Auto scroll to top on route change

### 6.8 Internationalization (i18n)
- [ ] **Multi-language Context** - Multi-language support context
- [ ] **Translation Keys** - Translation keys for all UI text
- [ ] **Language Switching** - Dynamic language switching
- [ ] **Date/Time Localization** - Date/time localization
- [ ] **Number Formatting** - Number formatting by locale

### 6.9 Error Handling & Retry
- [ ] **Global Error Boundary** - Global error boundary
- [ ] **Retry Button** - Retry button component
- [ ] **Error Messages** - Display error messages
- [ ] **Network Errors** - Network error handling
- [ ] **GraphQL Errors** - GraphQL error handling
- [ ] **Toast for Errors** - Toast notifications for errors
- [ ] **Auto Retry** - Automatic retry on failure

### 6.10 Performance Optimizations
- [ ] **React 19 Compiler** - React 19 with compiler
- [ ] **Next.js 15 Turbopack** - Next.js 15 with Turbopack
- [ ] **Code Splitting** - Code splitting by route
- [ ] **Lazy Loading** - Lazy load components
- [ ] **Virtual Scrolling** - Virtual scrolling for lists
- [ ] **Memoized Components** - Memoized components
- [ ] **Optimistic Updates** - Optimistic UI updates
- [ ] **Debounced Search** - Debounced search inputs

### 6.11 Utilities & Helpers
- [ ] **Date Formatting** - Date formatting utilities
- [ ] **Time Formatting** - Time formatting utilities
- [ ] **String Manipulation** - String manipulation utilities
- [ ] **Cookie Management** - Cookie management utilities
- [ ] **Error Handlers** - Error handler utilities
- [ ] **CSV Export** - CSV export utilities
- [ ] **Axios Interceptors** - Axios with interceptors
- [ ] **API Configuration** - API configuration

---

## 7. 🛠️ Development & Code Quality

### 7.1 Code Quality Tools
- [ ] **ESLint** - ESLint configuration
- [ ] **Prettier** - Code formatting
- [ ] **TypeScript Strict** - TypeScript strict mode
- [ ] **Husky Hooks** - Pre-commit hooks
- [ ] **Lint-staged** - Lint staged files
- [ ] **Commitlint** - Validate commit messages

### 7.2 GraphQL Tooling
- [ ] **GraphQL Codegen** - Code generation
- [ ] **Typed Documents** - Typed document nodes
- [ ] **Schema Types** - Auto-generate schema types
- [ ] **Operation Types** - Auto-generate operation types
- [ ] **Watch Mode** - Watch mode for development

### 7.3 Project Structure
- [ ] **Folder Organization** - Clear folder structure
- [ ] **Module Architecture** - Modular architecture
- [ ] **Shared Components** - Shared components library
- [ ] **Type Definitions** - Complete type definitions
- [ ] **Custom Hooks** - Custom React hooks
- [ ] **Utility Functions** - Utility functions
- [ ] **Context Providers** - Context providers
- [ ] **GraphQL Operations** - Organized GraphQL operations

---

## 📝 Notes for QC & Client

### Testing Priority
1. **Critical Features (P0)**: Authentication, CRUD operations, Data display
2. **High Priority (P1)**: Search, Filter, Sort, Pagination
3. **Medium Priority (P2)**: Export, Media handling, Error handling
4. **Nice-to-have (P3)**: Animations, Tooltips, Empty states

### Browser Compatibility
- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

### Responsive Breakpoints
- Mobile: < 640px
- Tablet: 640px - 1024px
- Desktop: > 1024px

### Performance Metrics
- First Contentful Paint: < 1.5s
- Time to Interactive: < 3s
- Largest Contentful Paint: < 2.5s

---

**Total**: 150+ features implemented and require testing

**Status Legend**:
- [ ] Not tested/verified
- [x] Tested and passed
- [~] Has issues requiring fixes
