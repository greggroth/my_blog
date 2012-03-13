Feature: Manage Posts
  In order to have a blog
  As an admin
  I should be able to edit posts
  
  Scenario: Admin can log in and view admin function
    Given an admin "The_Dude@gmail.com" has an account
    When I log in
    Then I should see "Signed in successfully"
    And I should see a link to "Logout"
    And I should see a link to "New Post"
    
  Scenario: Admin can create a new post
    Given an admin "admin@gmail.com" has an account
    And he is logged in
    When I am on the posts/new page
    And I fill in "post[title]" with "New Blog Post"
    And I fill in "post[body]" with "New Post Body"
    And I click button "Submit"
    Then I should see "New Blog Post"
    And I should see "New Post Body"