Feature:Invalid Login functionality

  Scenario: Invalid login should show error
    Given the user is on the Digikala login page
    When the user enters a valid email
    And the user clicks the ورود button
    And the user enters an invalid password
    And the user clicks the ورود button
    Then the user should see the error message "اطلاعات کاربری نادرست است"