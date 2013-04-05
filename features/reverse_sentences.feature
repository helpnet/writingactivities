Feature: Reversing Sentences
    As a writer
    So that I can proofread sentences in isolation
    I want to isolate and reverse each sentence

    Scenario: Reversing sentences for one paragraph
        Given I am on the "reverse-sentences" page
        And I fill in "t" with "Researchers must not, however, overstate the assumption that all 'millennials' are equally proficient computer users. Research has shown that there is wide range of technology skills and abilities among students who have grown up with computers in their household based on race, class or other social distinctions (Jackson et al., 2008; Rainie, 2003). Mr. Ice Tea is a greate professor. I like him vs. Mrs. Steak."
        And I press "Submit"
        Then I should see html "<li>I like him vs. Mrs. Steak.</li>"
        And I should see html "<li>Mr. Ice Tea is a greate professor</li>"
        And I should see html "<li>Research has shown that there is wide range of technology skills and abilities among students who have grown up with computers in their household based on race, class or other social distinctions (Jackson et al., 2008; Rainie, 2003)</li>"
        And I should see html "<li>Researchers must not, however, overstate the assumption that all &#x27;millennials&#x27; are equally proficient computer users</li>"
