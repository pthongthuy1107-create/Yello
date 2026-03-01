@Sprint:9 @Ticket:HYP-270 @Module:Review @Platform:Mobile @Priority:Medium
Feature: [Customer] UI – Create Review (Rating + Content)
  As a Customer
  I want to submit a review with a star rating, text content, and optional media
  So that I can share my feedback about a business

  Background:
    Given the user is logged in as a Customer
    And the user is on the Create Review screen for a business

  # ─── STAR RATING ──────────────────────────────────────────────────────────────

  @Role:Customer @Type:UI
  Scenario: Star rating selector displays 5 tappable stars
    When the Create Review screen is opened
    Then a row of 5 star icons is displayed
    And all stars are empty/unselected by default

  @Role:Customer @Type:UI
  Scenario: Tapping a star selects that rating
    When the user taps the 4th star
    Then stars 1 through 4 are filled/highlighted
    And star 5 remains empty

  @Role:Customer @Type:UI
  Scenario: User can change rating by tapping a different star
    Given the user has selected 3 stars
    When the user taps the 5th star
    Then all 5 stars are filled/highlighted
    And the rating value updates to 5

  # ─── SUBMIT BUTTON VALIDATION ─────────────────────────────────────────────────

  @Role:Customer @Type:UI
  Scenario: Submit button is disabled when no rating is selected
    Given the user has not selected any star rating
    Then the Submit button is disabled and cannot be tapped

  @Role:Customer @Type:UI
  Scenario: Submit button becomes enabled after rating is selected
    When the user selects at least 1 star
    Then the Submit button becomes active and tappable

  @Role:Customer @Type:UI
  Scenario: Validation message shown when user attempts submit without rating
    Given the user has not selected a rating
    When the user attempts to submit the review
    Then a validation message is displayed indicating rating is required

  # ─── TEXT CONTENT ─────────────────────────────────────────────────────────────

  @Role:Customer @Type:UI
  Scenario: Textarea is optional and accepts up to 500 characters
    Given the user has selected a star rating
    When the user types a review text of 500 characters
    Then the textarea accepts all 500 characters
    And the character counter shows "500/500"

  @Role:Customer @Type:UI
  Scenario: Character counter updates as user types
    When the user types 120 characters in the review textarea
    Then the character counter displays "120/500"

  @Role:Customer @Type:UI
  Scenario: Textarea does not accept more than 500 characters
    When the user attempts to type 501 characters
    Then the textarea is limited to 500 characters
    And the character counter shows "500/500"

  # ─── MEDIA UPLOAD – IMAGES ────────────────────────────────────────────────────

  @Role:Customer @Type:UI
  Scenario: User can upload up to 4 images
    When the user selects 4 valid image files (jpg, png, webp, jpeg)
    Then all 4 images are shown as thumbnails in the media preview area

  @Role:Customer @Type:UI
  Scenario: User cannot upload more than 4 images
    Given the user has already selected 4 images
    When the user attempts to add a 5th image
    Then a validation message is shown indicating the 4-image limit is reached
    And the 5th image is not added

  @Role:Customer @Type:UI
  Scenario: Invalid image file type is rejected
    When the user attempts to upload a file with an unsupported type (e.g., .gif, .bmp)
    Then a validation error is displayed
    And the file is not added to the media list

  # ─── MEDIA UPLOAD – VIDEO ─────────────────────────────────────────────────────

  @Role:Customer @Type:UI
  Scenario: User can upload 1 video
    When the user selects 1 valid video file (mp4, mov)
    Then the video is shown as a thumbnail or preview in the media area

  @Role:Customer @Type:UI
  Scenario: User cannot upload more than 1 video
    Given the user has already selected 1 video
    When the user attempts to add a second video
    Then a validation message is shown indicating only 1 video is allowed
    And the second video is not added

  @Role:Customer @Type:UI
  Scenario: Invalid video file type is rejected
    When the user attempts to upload a file with an unsupported video type
    Then a validation error is displayed
    And the file is not added

  # ─── REMOVE MEDIA ─────────────────────────────────────────────────────────────

  @Role:Customer @Type:UI
  Scenario: User can remove a selected image
    Given the user has selected 2 images
    When the user taps the remove icon on the first image
    Then that image is removed from the media preview
    And only 1 image remains

  @Role:Customer @Type:UI
  Scenario: User can remove the selected video
    Given the user has selected 1 video
    When the user taps the remove icon on the video
    Then the video is removed from the media preview
    And the user can select a new video

  # ─── UPLOAD PROGRESS ──────────────────────────────────────────────────────────

  @Role:Customer @Type:UI
  Scenario: Upload progress indicator is shown during media upload
    Given the user has selected media files
    When the media upload is in progress
    Then an upload progress indicator (progress bar or spinner) is visible

  # ─── SUCCESS FEEDBACK ─────────────────────────────────────────────────────────

  @Role:Customer @Type:UI
  Scenario: Success feedback is shown after review is submitted
    Given the user has selected a star rating and tapped Submit
    When the review is submitted successfully
    Then a success toast or modal is displayed to the user
