Feature: Adding a submission to a prompt
    As a learner
    So that I can practice writing
    I want to be able to add my submission to the prompt

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

        Given the following prompts exist:
            | title             | body                      |
            | "Test Assignment  | "Submit something cool"   |


    Scenario: Adding a new submission to the prompt
        Given "ralph@example.com" is logged in
        And I am on the context page for "TC101"
        And I click "Test Assignment"
        And I click "Submit a Draft"
        And I fill in "submission_body" with "Nullam quis risus eget urna mollis ornare vel eu leo."
        And I press "Create Submission"
        Then I should see "Nullam quis risus eget urna mollis ornare vel eu leo."
        And I should see "Peer Feedback"
        And I click "<< Back"
        Then I should see "You Already Submitted"
        And I should see "ralph@example.com" listed under Drafts
