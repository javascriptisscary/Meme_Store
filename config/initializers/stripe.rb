if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_Z8UnZRbuW7aaTpz7pU7dinGV',
    :secret_key => 'sk_test_krcMFajuqNNehm7bjG10pm8w'
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_Z8UnZRbuW7aaTpz7pU7dinGV',
    :secret_key => 'sk_test_krcMFajuqNNehm7bjG10pm8w'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]