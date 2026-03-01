@Sprint:9 @Ticket:HYP-135 @Module:Review @Platform:Mobile @Priority:Medium
Feature: [Customer | Provider] UI – View All Reviews
  As a Customer or Provider
  I want to see all reviews on a Business Profile page
  So that I can read customer feedback about that business

  Background:
    Given the user is logged in
    And the user navigates to a Business Profile page that has existing reviews

  # ─── HAPPY PATH ───────────────────────────────────────────────────────────────

  @Role:Customer @Type:UI
  Scenario: Customer sees the review list with full review item layout
    Given the business has at least one review
    When the review list loads successfully
    Then each review item displays:
      | Field        | Detail                        |
      | Avatar       | Reviewer's profile picture    |
      | Username     | Reviewer's display name       |
      | Star rating  | 1–5 stars filled/empty icons  |
      | Content      | Review text (if provided)     |
      | Media        | Attached images and/or video  |
      | Created date | Date review was submitted     |

  @Role:Provider @Type:UI
  Scenario: Provider sees review list in read-only mode
    Given the user is logged in as a Provider
    And the business has at least one review
    When the review list loads successfully
    Then the review list is displayed
    And there is NO reply button on any review item
    And there is NO report button on any review item

  @Role:Customer @Type:UI
  Scenario: Review item with no media still displays correctly
    Given a review exists with rating and text content but no images or video
    When the review list loads
    Then the review item displays without a media section
    And all other fields (avatar, username, rating, content, date) are visible

  @Role:Customer @Type:UI
  Scenario: Review item displays multiple images
    Given a review has 4 attached images and no video
    When the review list loads
    Then the review item shows up to 4 image thumbnails in the media section

  @Role:Customer @Type:UI
  Scenario: Review item displays an attached video
    Given a review has 1 attached video
    When the review list loads
    Then the review item shows the video player or thumbnail in the media section

  # ─── PAGINATION ───────────────────────────────────────────────────────────────

  @Role:Customer @Type:UI
  Scenario: Pagination is displayed when review count exceeds page limit
    Given the business has more reviews than a single page can display
    When the review list loads
    Then a pagination control is visible at the bottom of the list

  @Role:Customer @Type:UI
  Scenario: Navigating to next page loads more reviews
    Given the review list is on page 1
    When the user taps the "Next" pagination control
    Then the next set of reviews is displayed
    And the page indicator updates accordingly

  # ─── LOADING STATE ────────────────────────────────────────────────────────────

  @Role:Customer @Type:UI
  Scenario: Loading skeleton is shown while review list is fetching
    Given the review list has not yet loaded
    When the page is waiting for the API response
    Then a loading skeleton UI is displayed in place of the review items

  # ─── EMPTY STATE ──────────────────────────────────────────────────────────────

  @Role:Customer @Type:UI
  Scenario: Empty state is shown when the business has no reviews
    Given the business has zero reviews
    When the review list loads
    Then an empty state message or illustration is displayed
    And no review items are shown

  # ─── ERROR STATE ──────────────────────────────────────────────────────────────

  @Role:Customer @Type:UI
  Scenario: Error state is shown when the review list fails to load
    Given the API returns an error when fetching reviews
    When the review section tries to load
    Then an error state UI is displayed
    And a retry option is available to the user

  
