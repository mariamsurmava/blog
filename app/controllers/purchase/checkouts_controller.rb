# frozen_string_literal: true

module Purchase
  class CheckoutsController < ApplicationController
    before_action :authenticate_user!

    def create
      price = params[:price_id]

      session = Stripe::Checkout::Session.create(
        customer: current_user.stripe_id,
        client_reference_id: current_user.id,
        success_url: "#{root_url}/success?session_id={CHECKOUT_SESSION_ID}",
        cancel_url: pricing_url,
        payment_method_types: ['card'],
        mode: 'subscription',
        customer_email: current_user.email,
        line_items: [{
          quantity: 1,
          price: price
        }]
      )
      current_user.payed = true
      current_user.save
      redirect_to session.url, allow_other_host: true
    end

    def success
      @customer =current_user
    end
  end
end
