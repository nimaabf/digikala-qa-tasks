Feature: Product search

  Scenario: Search for a product by name
    Given the user is on the homepage
    When the user enters "گوشی موبایل" in the search box
    And the user presses the "Enter" key
    Then the user should see a list of products related to "گوشی موبایل"