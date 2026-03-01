# Role: Senior Tester & BA Assistant
# Task: Initialize Project Structure & Start Sprint 9

## 1. Context & Setup
- Hãy đọc file `CLAUDE.md` trong root (hoặc tôi sẽ cung cấp nội dung) để hiểu tiêu chuẩn làm việc của tôi.
- Tôi đã setup sẵn MCP cho Linear và Figma. Hãy sử dụng chúng ngay bây giờ.
- Đây là thông tin Sprint hiện tại:
    * Linear Link: https://linear.app/hyper-yello/project/sprint-9-review-d487159f4098/overview
    * Figma Link: 
             - Customer: https://www.figma.com/design/NHEtR9gMAihroiQWZWiTKw/%F0%9F%9F%A1-Yello----for-Dev?node-id=2003-36477&m=dev
             - provider: https://www.figma.com/design/NHEtR9gMAihroiQWZWiTKw/%F0%9F%9F%A1-Yello----for-Dev?node-id=2003-48927&m=dev
             - admin: https://www.figma.com/design/NHEtR9gMAihroiQWZWiTKw/%F0%9F%9F%A1-Yello----for-Dev?node-id=2003-55372&m=dev
## 2. Execution Steps
Hãy thực hiện các bước sau một cách tuần tự:

### Bước 1: Khởi tạo Structure
- Tạo cấu trúc thư mục như đã định nghĩa: `/docs/business/`, `/docs/ui-ux/`, và đặc biệt là `/sprints/sprint-09/`.
- Trong `/sprints/sprint-09/`, tạo sẵn các file trống: `requirements.md`, `confirm-log.md`, và thư mục `/features/`.

### Bước 2: Thu thập dữ liệu (MCP)
- Sử dụng Linear MCP để quét tất cả các Ticket thuộc Sprint 9. 
- Sử dụng Figma MCP để xem các màn hình liên quan đến các Ticket đó.

### Bước 3: Tài liệu hóa & Viết Test Case
- Với mỗi Ticket tìm được:
    1. Cập nhật tóm tắt yêu cầu vào `/sprints/sprint-09/requirements.md`.
    2. Tạo file `.feature` trong `/sprints/sprint-09/features/` theo định dạng Cucumber.
    3. **YÊU CẦU QUAN TRỌNG:** Trong file `.feature`, phải có đầy đủ các Tags ở đầu Feature hoặc Scenario (ví dụ: @Sprint:9 @Ticket:HYP-123 @Priority:High @Role:Admin) để tôi có thể dùng script chuyển đổi sang Google Sheets sau này.
    4. Nội dung Scenario phải bao quát cả UI/UX (đối chiếu Figma) và Logic nghiệp vụ (đối chiếu Linear AC).

### Bước 4: Tổng kết
- Liệt kê danh sách các file đã tạo và tóm tắt những Ticket nào đã được xử lý.

Hãy bắt đầu bằng việc quét Linear để liệt kê danh sách các ticket trong Sprint 9 cho tôi xác nhận trước khi tạo file.