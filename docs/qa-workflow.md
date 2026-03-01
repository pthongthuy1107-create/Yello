# QA Workflow — Yello Project
> Sử dụng Claude Code + Linear MCP + Figma MCP

---

## Cách dùng

Copy đúng prompt bên dưới vào Claude Code. Claude sẽ tự động thực hiện toàn bộ quy trình.

**Yêu cầu:** MCP đã active (`linear` + `figma-desktop` trong `.mcp.json`).

---

## PROMPT 1 — Khởi tạo Sprint mới

```
Tôi là BA/Tester của dự án Yello. Hãy đọc CLAUDE.md để nắm chuẩn làm việc.

Khởi tạo Sprint [SỐ SPRINT] với thông tin sau:
- Linear Project: [LINK LINEAR PROJECT]
- Figma Customer: [LINK FIGMA CUSTOMER]
- Figma Provider: [LINK FIGMA PROVIDER]
- Figma Admin: [LINK FIGMA ADMIN]

Thực hiện tuần tự:
1. Tạo cấu trúc thư mục: /sprints/sprint-[XX]/features/ + requirements.md + confirm-log.md
2. Dùng Linear MCP quét TẤT CẢ tickets trong project trên → liệt kê ra cho tôi xác nhận scope
3. Sau khi tôi confirm scope, với MỖI ticket trong scope:
   a. Fetch full detail từ Linear MCP
   b. Fetch Figma design node liên quan (nếu có link trong ticket)
   c. Cập nhật requirements.md
   d. Tạo file [TICKET-ID]-[slug].feature với đầy đủ tags:
      @Sprint:[N] @Ticket:[ID] @Module:[X] @Platform:[Mobile|Web] @Priority:[X] @Role:[X] @Type:[UI|API-Integration]
4. Tổng kết danh sách files đã tạo

Bắt đầu bằng bước quét Linear và liệt kê tickets.
```

---

## PROMPT 2 — Update khi Figma/UI thay đổi

```
Ticket [TICKET-ID] vừa có cập nhật UI từ Figma.

Hãy thực hiện:
1. Dùng Linear MCP lấy lại full description của [TICKET-ID] (có thể có link Figma mới)
2. Dùng Figma MCP đọc node design mới: [FIGMA-LINK hoặc node-id]
3. So sánh với nội dung hiện tại trong file:
   /sprints/sprint-[XX]/features/[TICKET-ID]-*.feature
4. Cập nhật các scenario bị ảnh hưởng (thêm/sửa/xóa) theo UI mới
5. Giữ nguyên các scenario logic/API không bị ảnh hưởng
6. Tóm tắt những thay đổi đã thực hiện

File cần cập nhật: /sprints/sprint-[XX]/features/[TICKET-ID]-*.feature
```

---

## PROMPT 3 — Update khi khách hàng comment/yêu cầu mới trong ticket

```
Ticket [TICKET-ID] vừa có comment mới từ khách hàng hoặc requirement thay đổi.

Hãy thực hiện:
1. Dùng Linear MCP fetch lại toàn bộ issue [TICKET-ID] bao gồm comments
2. Xác định những thay đổi so với yêu cầu ban đầu:
   - Requirement mới được thêm vào
   - Requirement bị thay đổi / loại bỏ
   - Acceptance Criteria được cập nhật
3. Cập nhật /sprints/sprint-[XX]/requirements.md phần tương ứng
4. Cập nhật /sprints/sprint-[XX]/features/[TICKET-ID]-*.feature:
   - Thêm scenario mới nếu có AC mới
   - Sửa scenario hiện có nếu AC thay đổi
   - Đánh dấu @Deprecated hoặc xóa scenario nếu AC bị loại bỏ
5. Ghi nhận vào /sprints/sprint-[XX]/confirm-log.md:
   | [Ngày hôm nay] | [TICKET-ID] | [Tóm tắt thay đổi] | [Tên người confirm] | |
6. Tóm tắt delta (những gì đã thêm/sửa/xóa)
```

---

## PROMPT 4 — Sync toàn bộ Sprint (khi có nhiều thay đổi)

```
Sprint [SỐ SPRINT] có nhiều cập nhật. Hãy sync lại toàn bộ scope.

Scope hiện tại: [TICKET-ID-1], [TICKET-ID-2], [TICKET-ID-3], ...

Với từng ticket trong scope:
1. Dùng Linear MCP fetch lại full issue (description + comments + status)
2. So sánh với requirements.md và .feature file hiện tại
3. Nếu có thay đổi → cập nhật file tương ứng
4. Nếu không có thay đổi → ghi "No change"

Sau khi xong tất cả, liệt kê:
- Tickets có thay đổi và những gì đã cập nhật
- Tickets không có thay đổi
```

---

## PROMPT 5 — Thêm ticket mới vào Sprint đang chạy

```
Thêm ticket [TICKET-ID] vào Sprint [SỐ SPRINT].

Hãy thực hiện:
1. Dùng Linear MCP fetch full detail [TICKET-ID]
2. Xác định Figma link trong ticket (nếu có) → fetch design
3. Cập nhật /sprints/sprint-[XX]/requirements.md: thêm section mới cho ticket này
4. Tạo file mới: /sprints/sprint-[XX]/features/[TICKET-ID]-[slug].feature
   - Đầy đủ tags: @Sprint:[N] @Ticket:[ID] @Module @Platform @Priority @Role @Type
   - Bao gồm: Happy path, Loading/Empty/Error state, Validation, Edge cases
5. Tóm tắt file đã tạo và số scenarios
```

---

## Cấu trúc thư mục chuẩn

```
sprints/
└── sprint-[XX]/
    ├── requirements.md       ← Spec tổng hợp từ Linear
    ├── confirm-log.md        ← Nhật ký xác nhận khách hàng
    └── features/
        ├── [HYP-XXX]-[slug].feature
        └── ...

docs/
├── business/                 ← Quy trình nghiệp vụ (Mermaid)
├── ui-ux/                    ← Figma references
└── qa-workflow.md            ← File này
```

---

## Tags chuẩn (bắt buộc trong mọi .feature file)

| Tag | Giá trị hợp lệ | Nguồn |
|-----|----------------|-------|
| `@Sprint:N` | Số sprint | Thủ công |
| `@Ticket:HYP-XXX` | ID ticket Linear | Linear |
| `@Module:X` | Review, Notification, BusinessManagement, ... | Linear / Figma |
| `@Platform:X` | Mobile, Web | Linear label |
| `@Priority:X` | Urgent, High, Medium, Low | Linear priority |
| `@Role:X` | Customer, Provider, Admin | Nội dung ticket |
| `@Type:X` | UI, API-Integration, E2E | Loại test |

---

## Quy tắc đặt tên file .feature

```
[TICKET-ID]-[module]-[feature]-[type].feature

Ví dụ:
HYP-270-create-review-ui.feature
HYP-271-view-all-reviews-api.feature
HYP-258-admin-business-review-modal-ui.feature
```

---

## Checklist trước khi commit

- [ ] `requirements.md` đã cập nhật đầy đủ cho tất cả tickets trong scope
- [ ] Mỗi ticket có đúng 1 file `.feature`
- [ ] Mỗi `.feature` file có đủ tags ở đầu Feature và/hoặc Scenario
- [ ] Có đủ các scenario: Happy path, Loading, Empty, Error, Validation
- [ ] `confirm-log.md` ghi nhận các thay đổi từ khách hàng
