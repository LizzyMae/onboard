#this initializer set up our app with stripe gem
# secrets is a new thing in rails 4.1
Stripe.api_key = Rails.application.secrets.stripe_secret