@Sprint:9 @Ticket:HYP-272 @Module:Review @Platform:Mobile @Priority:Medium
Feature: [Customer] Integrate API – Create Review (Rating + Content)
  As a Customer
  I want my review to be submitted to the server via API
  So that my feedback is saved and visible to others

  Background:
    Given the user is logged in as a Customer
    And the user is on the Create Review screen
    And the user has selected a star rating

  # ─── HAPPY PATH ───────────────────────────────────────────────────────────────

  @Role:Customer @Type:API-Integration
  Scenario: Submit review with rating only (minimum required)
    Given the user has selected 4 stars
    And no text content or media is added
    When the user taps the Submit button
    Then the API is called with payload: rating=4, content=null, imageUrls=[], videoUrls=[]
    And the API returns a success response
    And a success toast is displayed
    And the review form is reset to default state
    And the review list refreshes to show the new review

  @Role:Customer @Type:API-Integration
  Scenario: Submit review with rating and text content
    Given the user has selected 5 stars
    And the user has typed 200 characters of review content
    When the user taps the Submit button
    Then the API is called with payload: rating=5, content="<200-char text>", imageUrls=[], videoUrls=[]
    And the review is submitted successfully

  @Role:Customer @Type:API-Integration
  Scenario: Submit review with rating, images, and video
    Given the user has selected 3 stars
    And the user has uploaded 3 images and 1 video
    When the user taps the Submit button
    Then the API is called with the correct imageUrls (3 URLs) and videoUrls (1 URL)
    And the review is submitted successfully

  @Role:Customer @Type:API-Integration
  Scenario: Submit full review with all fields
    Given the user has selected 5 stars
    And typed 150 characters of content
    And uploaded 4 images and 1 video
    When the user taps the Submit button
    Then the API payload includes rating, content, 4 imageUrls, and 1 videoUrl
    And the review is submitted successfully

  # ─── CONTENT LENGTH VALIDATION ────────────────────────────────────────────────

  @Role:Customer @Type:API-Integration
  Scenario: Content is capped at MAX_CONTENT_TEXT_LENGTH (500 chars)
    Given the user has typed exactly 500 characters
    When the review is submitted
    Then the API payload content field contains exactly 500 characters
    And the submission is accepted

  # ─── SUBMIT BUTTON STATE ──────────────────────────────────────────────────────

  @Role:Customer @Type:API-Integration
  Scenario: Submit button is disabled while API call is in progress
    Given the user taps the Submit button
    When the API call is in flight
    Then the Submit button is visually disabled and cannot be tapped again
    And a loading indicator is shown

  # ─── SUCCESS FLOW ─────────────────────────────────────────────────────────────

  @Role:Customer @Type:API-Integration
  Scenario: Form resets after successful submission
    Given the review was submitted successfully
    Then the star rating is cleared to default (no stars selected)
    And the text content textarea is empty
    And all selected media are removed from the preview

  @Role:Customer @Type:API-Integration
  Scenario: Review list refreshes after successful submission
    Given the review was submitted successfully
    When the success toast is displayed
    Then the review list on the Business Profile reloads
    And the newly submitted review appears in the list

  # ─── ERROR HANDLING ───────────────────────────────────────────────────────────

  @Role:Customer @Type:API-Integration
  Scenario: Error toast shown when API returns an error
    Given the Submit API call fails due to a server or network error
    When the error response is received
    Then an error toast is displayed with a relevant message
    And the form data is preserved (not reset)
    And the Submit button is re-enabled

  @Role:Customer @Type:API-Integration
  Scenario: Submit button is re-enabled after API error
    Given the API call fails
    Then the Submit button becomes active again
    And the user can retry submitting the review
