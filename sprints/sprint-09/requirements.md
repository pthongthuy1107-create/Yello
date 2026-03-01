# Sprint 9: Review — Requirements

> **Sprint Duration:** 2026-02-23 → 2026-03-06
> **Status:** In Progress | **Lead:** Nhan Phan
> **QA Scope:** 6 tickets — Mobile App (Customer/Provider) + Admin Web

---

## Tổng quan Sprint

Sprint 9 tập trung vào tính năng **Review (Đánh giá)** trên cả Mobile App và Admin Panel:

- **Customer (Mobile):** Xem danh sách review + Tạo review mới (rating, nội dung, ảnh, video)
- **Provider (Mobile):** Xem danh sách review — chỉ đọc, không thể reply/report ở MVP
- **Admin (Web):** Xem và xóa review của Business trong Business Management

---

## Chi tiết Tickets

### HYP-135 — [Customer | Provider] UI: View All Reviews
- **Platform:** Mobile App | **Role:** Customer, Provider | **Status:** Code Review
- **Figma:** [node-id=2003-49058](https://www.figma.com/design/NHEtR9gMAihroiQWZWiTKw/Yello----for-Dev?node-id=2003-49058&m=dev)

**Summary:** Customer và Provider xem toàn bộ review trên Business Profile. Provider chỉ đọc — không có nút reply/report.

**Acceptance Criteria:**
- Hiển thị review item: avatar, username, star rating, nội dung, media (ảnh/video), ngày tạo
- Pagination
- Loading skeleton state
- Error state UI
- Empty state (chưa có review)
- Provider KHÔNG thấy nút reply/report

---

### HYP-271 — [Customer | Provider] Integrate API: View All Reviews
- **Platform:** Mobile App | **Role:** Customer, Provider | **Status:** Code Review
- **Figma:** [node-id=2003-49058](https://www.figma.com/design/NHEtR9gMAihroiQWZWiTKw/Yello----for-Dev?node-id=2003-49058&m=dev)

**Summary:** Tích hợp API fetch review list. Xử lý đầy đủ: loading, error, empty, pagination.

**Acceptance Criteria:**
- Gọi API fetch review list thành công
- Map response → UI model chính xác
- Handle pagination params
- Loading state khi đang fetch
- Error state khi API fail
- Empty state khi response rỗng

---

### HYP-270 — [Customer] UI: Create Review (Rating + Content)
- **Platform:** Mobile App | **Role:** Customer | **Status:** In Progress
- **Figma:** [node-id=2003-36893](https://www.figma.com/design/NHEtR9gMAihroiQWZWiTKw/Yello----for-Dev?node-id=2003-36893)

**Summary:** Chỉ Customer submit review. Rating bắt buộc. Media tùy chọn: tối đa 4 ảnh + 1 video.

**Acceptance Criteria:**
- Star rating selector 1–5 sao (bắt buộc)
- Textarea với character counter (max 500 ký tự)
- Submit button disabled khi chưa chọn rating
- Validation message khi thiếu rating
- Success feedback (toast/modal)
- Upload tối đa 4 ảnh (jpg, png, webp, jpeg) và 1 video (mp4, mov, ...)
- Remove media đã chọn
- Validate file type và file size
- Upload progress indicator

---

### HYP-272 — [Customer] Integrate API: Create Review (Rating + Content)
- **Platform:** Mobile App | **Role:** Customer | **Status:** In Progress

**Summary:** Tích hợp API submit review. Sau thành công: show toast, reset form, refresh list.

**Acceptance Criteria:**
- Submit: rating (required), content (max 500 chars), image URLs, video URLs
- Disable submit button trong khi đang gửi
- Handle success: show success toast + reset form + refresh review list
- Handle error: show error toast
- MAX_CONTENT_TEXT_LENGTH = 500

---

### HYP-258 — [Admin][UI] Implement Business Review Modal
- **Platform:** Web (Admin Panel) | **Role:** Admin | **Status:** In Progress
- **Figma:** [node-id=2002-42451](https://www.figma.com/design/NHEtR9gMAihroiQWZWiTKw/Yello----for-Dev?node-id=2002-42451&m=dev)

**Summary:** Nút "Review" trong expanded row của Business Management mở modal. Modal dùng mock data, có đủ loading/empty/error state.

**Acceptance Criteria:**
- Nút "Review" trong expanded row → click → mở modal
- Modal layout: Header, Body, Footer đúng Figma
- Sections: Info, Documents, Status (mock data)
- Loading skeleton state
- Empty state & Error state
- Đóng modal: nút Close / click outside / ESC
- Modal reset state khi mở lại

---

### HYP-276 — [Admin][API] Integrate Data for Business Review Modal
- **Platform:** Web (Admin Panel) | **Role:** Admin | **Status:** In Progress

**Summary:** Thay mock data bằng data thực từ API. Modal nhận `businessId` từ row được chọn.

**Acceptance Criteria:**
- Modal nhận đúng `businessId` từ row được chọn
- Fetch fresh business data theo `businessId` khi modal mở
- `loading` → skeleton UI; `error` → error UI
- Map đúng các section: Info, Documents, Status
- Xử lý null/undefined — không crash UI
- Clear `businessId` khi modal đóng

---

## Figma References

| Role | Node | Link |
|------|------|------|
| Customer (main) | 2003-36477 | [Customer screens](https://www.figma.com/design/NHEtR9gMAihroiQWZWiTKw/Yello----for-Dev?node-id=2003-36477&m=dev) |
| Provider (main) | 2003-48927 | [Provider screens](https://www.figma.com/design/NHEtR9gMAihroiQWZWiTKw/Yello----for-Dev?node-id=2003-48927&m=dev) |
| Admin (main) | 2003-55372 | [Admin screens](https://www.figma.com/design/NHEtR9gMAihroiQWZWiTKw/Yello----for-Dev?node-id=2003-55372&m=dev) |
| Create Review | 2003-36893 | [HYP-270](https://www.figma.com/design/NHEtR9gMAihroiQWZWiTKw/Yello----for-Dev?node-id=2003-36893) |
| View Reviews | 2003-49058 | [HYP-135 / HYP-271](https://www.figma.com/design/NHEtR9gMAihroiQWZWiTKw/Yello----for-Dev?node-id=2003-49058&m=dev) |
| Admin Review Modal | 2002-42451 | [HYP-258 / HYP-276](https://www.figma.com/design/NHEtR9gMAihroiQWZWiTKw/Yello----for-Dev?node-id=2002-42451&m=dev) |
