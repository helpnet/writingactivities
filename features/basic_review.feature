Feature: Making a basic review
    As a learner
    So that I can provide structured feedback for other students
    I want to be able to add peer feedback to a submission

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
            | Test Assignment   | Submit something cool     |

        Given the following submissions exist:
            | user              | prompt            | body                      |
            | ralph@example.com | Test Assignment   | This is a great submission|

    Scenario: Adding basic evaluation
        Given "sally@example.com" is logged in
        Given I am on the context page for "TC101"
        And I click "Test Assignment"
        And I click "ralph@example.com"
        Then I should see "This is a great submission"
        And I should see "Basic Review"

