@Sprint:9 @Ticket:HYP-276 @Module:BusinessManagement @Platform:Web @Priority:Medium
Feature: [Admin][API] Integrate Data for Business Review Modal
  As an Admin
  I want the Review Modal to fetch and display real reviews from the API
  So that I can see accurate customer reviews and delete them when needed

  # Figma reference: node-id=2003-55372
  # API replaces mock data: review list (reviewer avatar, name, ★ rating, text content)
  # Delete action calls API; Save commits pending deletions

  Background:
    Given the Admin is logged in
    And the Admin is on the Business Management screen
    And the Business Review Modal UI (HYP-258) is implemented with mock data

  # ─── BUSINESS ID PASSING ──────────────────────────────────────────────────────

  @Role:Admin @Type:API-Integration
  Scenario: Correct businessId is passed to the modal when a row is selected
    Given the Business Management table shows multiple businesses
    When the Admin clicks "Review" on the row for "Tacos El Rey" (id="biz-001")
    Then the modal receives businessId="biz-001"
    And the API fetch for reviews is initiated using businessId="biz-001"
    And the modal title displays "Tacos El Rey Reviews"

  @Role:Admin @Type:API-Integration
  Scenario: Modal fetches fresh reviews on every open
    Given the Admin opens the modal for "Tacos El Rey" then closes it
    When the Admin opens the modal for "Tacos El Rey" again
    Then a new API fetch is triggered (not served from stale cache)
    And the latest review data is displayed

  # ─── DATA FETCHING & MAPPING ──────────────────────────────────────────────────

  @Role:Admin @Type:API-Integration
  Scenario: Real review data replaces mock data in the modal body
    Given the API returns a successful review list for businessId="biz-001"
    When the modal finishes loading
    Then the modal body shows real review items from the API response
    And no mock/placeholder review data remains visible

  @Role:Admin @Type:API-Integration
  Scenario: Review item fields map correctly from API response to UI
    Given the API returns a review list with fully populated review objects
    Then each review item in the modal displays the correct mapped fields:
      | API Field      | UI Element               |
      | reviewerName   | Bold name label          |
      | reviewerAvatar | Profile icon / avatar    |
      | rating         | ★ [number] prefix        |
      | content        | Review text body         |

  # ─── LOADING STATE ────────────────────────────────────────────────────────────

  @Role:Admin @Type:API-Integration
  Scenario: Skeleton UI is shown while review API call is in progress
    Given the modal has been opened
    When the API call is still in flight
    Then a loading skeleton is displayed inside the modal body

  @Role:Admin @Type:API-Integration
  Scenario: Skeleton is replaced by real review list when API responds
    Given the skeleton was displayed during fetch
    When the API returns a successful review list
    Then the skeleton disappears
    And the real review items are rendered

  # ─── DELETE REVIEW (API) ──────────────────────────────────────────────────────

  @Role:Admin @Type:API-Integration
  Scenario: Clicking Save after deleting a review calls the delete API
    Given the modal is open and shows reviews for businessId="biz-001"
    And the Admin clicks the Delete button on review with id="review-001"
    When the Admin clicks the "Save" button
    Then the delete API is called with reviewId="review-001"
    And the modal closes on success
    And the deleted review no longer appears if the modal is reopened

  @Role:Admin @Type:API-Integration
  Scenario: Multiple reviews can be deleted before saving
    Given the modal shows 3 reviews
    When the Admin deletes reviews 1 and 2 then clicks "Save"
    Then the delete API is called for both reviewId="review-001" and reviewId="review-002"
    And review 3 remains intact

  @Role:Admin @Type:API-Integration
  Scenario: Error toast shown when delete API fails
    Given the Admin clicks Delete and then Save
    When the delete API returns an error
    Then an error toast or message is displayed
    And the modal remains open
    And the review list is not changed

  # ─── EMPTY STATE ──────────────────────────────────────────────────────────────

  @Role:Admin @Type:API-Integration
  Scenario: Empty state shown when API returns zero reviews for the business
    Given the API returns an empty review list for the selected businessId
    When the modal finishes loading
    Then the empty state message is displayed inside the modal body
    And no review items are rendered

  # ─── ERROR STATE ──────────────────────────────────────────────────────────────

  @Role:Admin @Type:API-Integration
  Scenario: Error UI is shown when review fetch API fails
    Given the review list API call returns a server or network error
    When the modal attempts to load
    Then the error state UI is displayed inside the modal body

  # ─── NULL / UNDEFINED FIELD HANDLING ─────────────────────────────────────────

  @Role:Admin @Type:API-Integration
  Scenario: Modal handles reviews with missing optional fields without crashing
    Given the API returns review items where reviewerAvatar or content is null
    When the review list renders
    Then the modal displays without any runtime errors
    And missing avatar shows a default placeholder icon
    And missing content shows an empty text area (no crash)

  # ─── STATE CLEANUP ────────────────────────────────────────────────────────────

  @Role:Admin @Type:API-Integration
  Scenario: businessId is cleared from state when modal closes
    Given the modal is open with businessId="biz-001"
    When the Admin closes the modal via Cancel or X button
    Then businessId is cleared from the application state

  @Role:Admin @Type:API-Integration
  Scenario: Opening modal for a different business fetches different reviews
    Given the Admin opened the modal for "Tacos El Rey" (biz-001) then closed it
    When the Admin opens the modal for "Coffee Shop" (biz-002)
    Then the API is called with businessId="biz-002"
    And the modal shows "Coffee Shop Reviews" with biz-002's review data
    And no reviews from "Tacos El Rey" appear
