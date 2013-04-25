Feature: Reversing Sentences
    As a writer
    So that I can proofread sentences in isolation
    I want to isolate and reverse each sentence

    Scenario: Reversing sentences for one paragraph
        Given I am on the "reverse-sentences" page
        And I fill in "t" with "Researchers must not, however, overstate the assumption that all 'millennials' are equally proficient computer users. Research has shown that there is wide range of technology skills and abilities among students who have grown up with computers in their household based on race, class or other social distinctions (Jackson et al., 2008; Rainie, 2003). Mr. Ice Tea is a greate professor. I like him vs. Mrs. Steak."
        And I press "Submit"
        Then I should see html "<tr><td>I like him vs. Mrs. Steak.</td></tr>"
        And I should see html "<tr><td>Mr. Ice Tea is a greate professor. </td></tr>"
        And I should see html "<tr><td>Research has shown that there is wide range of technology skills and abilities among students who have grown up with computers in their household based on race, class or other social distinctions (Jackson et al. 2008; Rainie, 2003). </td></tr>"
        And I should see html "<tr><td>Researchers must not, however, overstate the assumption that all &#x27;millennials&#x27; are equally proficient computer users. </td></tr>"
