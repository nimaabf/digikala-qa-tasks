Feature: Add to cart functionality

  Scenario: Add product to cart without login
    Given the user is on the Digikala homepage
    And the user closes the popup if it appears
    When the user searches for "گوشی موبایل"
    And the user clicks on the first product in the search results
    And the user switches to the product details tab
    And the user clicks the "اضافه به سبد" button
    Then the product should be added to the cart
    And the user should be able to proceed to the cart and checkout
