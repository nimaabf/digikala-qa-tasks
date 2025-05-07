Feature: Checkout Process

Scenario: Complete checkout with valid cart items
  Given the user has added products to the cart
  And the user is logged in
  When the user proceeds to checkout
  And selects a valid shipping address and payment method
  Then the order should be submitted successfully
  And a confirmation page should be shown
