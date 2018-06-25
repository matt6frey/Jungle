# Jungle

A mini e-commerce application built with Rails 4.2. This App has Stripe Payments integrated into the checkout. Users can select items of their choice and make a mock purchase.


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Screenshots

<div>
  <img src="https://github.com/matt6frey/Jungle/blob/master/docs/jungle-1.png" width="48%" height="auto"  style="width:48%;">
  <img src="https://github.com/matt6frey/Jungle/blob/master/docs/jungle-2.png" width="48%" height="auto"  style="width:48%;">
</div>


## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe


## Bugs

* Admin dashboard page has no real mark-up or purpose at this point.
* Authentication for the Admin Pages area only fires once. Once cookie is set, any user has to the Admin pages.
