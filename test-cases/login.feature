Feature: Login functionality

  Scenario: Valid login should succeed
    Given the user is on the Digikala login page
    When the user enters a valid email
    And the user clicks the ورود button
    And the user enters a valid password
    And the user clicks the ورود button
    Then the user should see the profile icon, indicating successful login


