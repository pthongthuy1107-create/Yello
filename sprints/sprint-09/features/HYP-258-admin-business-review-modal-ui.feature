@Sprint:9 @Ticket:HYP-258 @Module:BusinessManagement @Platform:Web @Priority:Medium
Feature: [Admin][UI] Implement Business Review Modal
  As an Admin
  I want to open a Review Modal from the Business Management table
  So that I can view and delete customer reviews for a specific business

  # Figma reference: node-id=2003-55372 (User Management - Business / More Info)
  # Modal title format: "[Business Name] Reviews"
  # Subtitle: "Here you can review or delete customer reviews for this business listing."
  # Review item layout: Avatar | Name (bold) | ★ rating · review text | Delete button (red)
  # Footer: Cancel (gray) + Save (yellow)

  Background:
    Given the Admin is logged in
    And the Admin is on the Business Management screen (User Management > Businesses tab)
    And at least one business row is visible in the table

  # ─── TRIGGER ──────────────────────────────────────────────────────────────────

  @Role:Admin @Type:UI
  Scenario: "Review" button is visible in expanded business row
    When the Admin expands a business row in the table
    Then a "Review" button is visible inside the expanded row

  @Role:Admin @Type:UI
  Scenario: Clicking "Review" button opens the Business Review Modal
    Given the Admin has expanded a business row for "Tacos El Rey"
    When the Admin clicks the "Review" button
    Then the Business Review Modal opens as an overlay
    And the modal is visible on screen

  # ─── MODAL LAYOUT ─────────────────────────────────────────────────────────────

  @Role:Admin @Type:UI
  Scenario: Modal header shows business name and descriptive subtitle
    Given the Business Review Modal is open for "Tacos El Rey"
    Then the modal header displays the title "Tacos El Rey Reviews"
    And below the title the subtitle reads "Here you can review or delete customer reviews for this business listing."
    And an X close button is visible in the top-right corner of the modal

  @Role:Admin @Type:UI
  Scenario: Modal body displays list of review items with correct layout
    Given the Business Review Modal is open with mock data
    Then the modal body contains a scrollable list of review items
    And each review item displays:
      | Element       | Detail                                      |
      | Avatar        | Reviewer profile icon (orange user icon)    |
      | Reviewer name | Bold text, e.g. "Jason L."                  |
      | Rating + text | ★ [number] · [review text content]          |
      | Delete button | Red "Delete" button with trash icon on right|

  @Role:Admin @Type:UI
  Scenario: Modal footer displays Cancel and Save buttons
    Given the Business Review Modal is open
    Then the modal footer contains a "Cancel" button (gray/secondary style)
    And the modal footer contains a "Save" button (yellow/primary style)

  # ─── DELETE REVIEW ────────────────────────────────────────────────────────────

  @Role:Admin @Type:UI
  Scenario: Admin clicks Delete on a review item
    Given the Business Review Modal is open and shows multiple reviews
    When the Admin clicks the red "Delete" button on the first review item
    Then that review item is removed from the list in the modal
    And the remaining reviews are still displayed

  @Role:Admin @Type:UI
  Scenario: Admin clicks Save to confirm deletions
    Given the Admin has deleted one or more reviews in the modal
    When the Admin clicks the "Save" button
    Then the deletions are committed
    And the modal closes

  @Role:Admin @Type:UI
  Scenario: Admin clicks Cancel to discard deletions
    Given the Admin has deleted one or more reviews in the modal
    When the Admin clicks the "Cancel" button
    Then no deletions are applied
    And the modal closes

  # ─── LOADING STATE ────────────────────────────────────────────────────────────

  @Role:Admin @Type:UI
  Scenario: Loading skeleton is displayed while review data is being fetched
    Given the modal has been opened
    When the review data has not yet loaded
    Then a loading skeleton UI is displayed inside the modal body
    And the Cancel and Save buttons in the footer remain visible but disabled

  # ─── EMPTY STATE ──────────────────────────────────────────────────────────────

  @Role:Admin @Type:UI
  Scenario: Empty state is displayed when business has no reviews
    Given the selected business has zero customer reviews
    When the modal finishes loading
    Then an empty state message is shown inside the modal body
    And no review items are rendered

  # ─── ERROR STATE ──────────────────────────────────────────────────────────────

  @Role:Admin @Type:UI
  Scenario: Error state is displayed when review data fails to load
    Given the review data API returns an error
    When the modal finishes attempting to load
    Then an error state UI is displayed inside the modal body
    And a retry option or error message is shown

  # ─── CLOSE INTERACTIONS ───────────────────────────────────────────────────────

  @Role:Admin @Type:UI
  Scenario: Admin closes modal via the X button
    Given the Business Review Modal is open
    When the Admin clicks the X button in the modal header
    Then the modal closes
    And the Business Management table is visible again

  @Role:Admin @Type:UI
  Scenario: Admin closes modal by pressing the ESC key
    Given the Business Review Modal is open
    When the Admin presses the ESC key
    Then the modal closes

  # ─── STATE RESET ──────────────────────────────────────────────────────────────

  @Role:Admin @Type:UI
  Scenario: Modal resets when reopened for a different business
    Given the Admin previously opened the modal for "Tacos El Rey" then closed it
    When the Admin opens the modal for "Coffee Shop"
    Then the modal title shows "Coffee Shop Reviews"
    And the modal does not display any reviews from "Tacos El Rey"
    And the modal starts in a fresh loading state
