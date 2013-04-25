Feature: Adding an activity to a course
    As an instructor
    So that I can prompt the students to submit writing samples
    I want to add and edit activities

    Background:
        Given the following contexts exist:
            | context_label | context_title     |
            | TC101         | Test Course 101   |

        Given the following users exist:
            | email             | password  |
            | ralph@example.com | testpass  |
            | prof@example.com  | testpass  |
            | sally@example.com | testpass  |

        Given the following memberships exist:
            | user                  | context   | role      |
            | ralph@example.com     | TC101     | learner   |
            | prof@example.com      | TC101     | instructor|
            | sally@example.com     | TC101     | learner   |

    Scenario: Adding a new activity with a basic review type
        Given "prof@example.com" is logged in
        And I am on the context page for "TC101"
        And I click "Add a New Activity"
        And I fill in "prompt_title" with "Submit An Idea"
        And I fill in "prompt_body" with "Your idea should include good stuff"
        And I select the "basic_reviews" checkbox
        And I press "Create Prompt"
        Then I should see "Submit An Idea"
        And I click "Submit An Idea"
        Then I should see "Your idea should include good stuff"
        And I should see "Available review types: basic_reviews"

    Scenario: Editing an existing activity to use basic review type
        Given "prof@example.com" is logged in
        And I am on the context page for "TC101"
        And I click "Add a New Activity"
        And I fill in "prompt_title" with "Submit a cool thing"
        And I fill in "prompt_body" with "Your cool thing should be pretty cool"
        And I press "Create Prompt"
        Then I should see "Submit a cool thing"
        And I click "Submit a cool thing"
        Then I should see "Your cool thing should be pretty cool"
        And I should not see "Available review types:"
        And I click "[Edit]"
        And I select the "basic_reviews" checkbox
        And I press "Update Prompt"
        Then I should see "Available review types: basic_reviews"
