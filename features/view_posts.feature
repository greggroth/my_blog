Feature: View Posts
  In order to have a blog
  I should be able to view posts
  
  Scenario: Posts List
    Given I have posts titled Pizza, Breadsticks
    When I am on the posts page
    Then I should see "Pizza"
    And I should see "Breadsticks"
  
  Scenario: View a Post
    Given a post "Dogs" with content "Dogs are the best"
    And I am on the posts page
    When I click "Dogs"
    Then I should see "Dogs are the best"
    
  Scenario: Views posts by tags
    Given a post "Dogs" with content "Dogs are the best" is tagged as "animal"
    And a post "Chair" with content "all the better to sit on" is tagged as "furniture"
    And I am on the posts page
    When I click "animal"
    Then I should see "Dogs are the best"
    And I should not see "all the better to sit on"