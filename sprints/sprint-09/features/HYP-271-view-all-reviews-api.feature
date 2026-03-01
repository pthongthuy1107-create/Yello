@Sprint:9 @Ticket:HYP-271 @Module:Review @Platform:Mobile @Priority:Medium
Feature: [Customer | Provider] Integrate API – View All Reviews
  As a Customer or Provider
  I want the app to fetch reviews from the server
  So that I see real and up-to-date review data on the Business Profile

  Background:
    Given the user is logged in
    And the user is on a Business Profile page

  # ─── HAPPY PATH ───────────────────────────────────────────────────────────────

  @Role:Customer @Type:API-Integration
  Scenario: API returns review list and data is mapped to UI correctly
    Given the business has existing reviews on the server
    When the review list API call is made with the correct businessId
    Then the API returns a successful response with review data
    And each review item on screen shows the correct:
      | Field       | Source              |
      | Rating      | API rating field    |
      | Content     | API content field   |
      | Username    | API reviewer name   |
      | Avatar      | API reviewer avatar |
      | Created date| API createdAt field |
      | Media URLs  | API image/videoUrls |

  @Role:Provider @Type:API-Integration
  Scenario: Provider fetches and views the same review list (read-only)
    Given the user is logged in as a Provider
    And the business has existing reviews
    When the review list API call is made
    Then the API returns review data successfully
    And the data is displayed in read-only mode with no action buttons

  # ─── PAGINATION ───────────────────────────────────────────────────────────────

  @Role:Customer @Type:API-Integration
  Scenario: Pagination params are sent correctly in API request
    Given the review list is displaying page 1
    When the user navigates to page 2
    Then the API is called with the correct page/offset pagination params
    And the response returns the second set of reviews
    And the new reviews are appended or replace the current list correctly

  # ─── LOADING STATE ────────────────────────────────────────────────────────────

  @Role:Customer @Type:API-Integration
  Scenario: Loading state is shown while API call is in progress
    Given the review list API call has been initiated
    When the response has not yet returned
    Then the loading skeleton UI is displayed

  # ─── EMPTY RESPONSE ───────────────────────────────────────────────────────────

  @Role:Customer @Type:API-Integration
  Scenario: Empty state shown when API returns zero reviews
    Given the business has no reviews on the server
    When the review list API returns an empty array
    Then the empty state UI is displayed
    And no review items are rendered

  # ─── ERROR HANDLING ───────────────────────────────────────────────────────────

  @Role:Customer @Type:API-Integration
  Scenario: Error state shown when API call fails
    Given the review list API returns a network or server error
    When the review section tries to load
    Then the error state UI is displayed
    And a retry option is presented to the user

  @Role:Customer @Type:API-Integration
  Scenario: App does not crash when API response has missing optional fields
    Given the API returns review items where some optional fields are null
    When the response is mapped to the UI model
    Then the app renders review items without crashing
    And missing optional fields are gracefully handled (hidden or shown as placeholder)
