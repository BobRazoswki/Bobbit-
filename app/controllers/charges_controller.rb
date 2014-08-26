class ChargesController < ApplicationController

  before_action :authenticate_user!, except: [:index]

def create
  # Amount in cents
  @post = Post.find(params[:post_id])
  @amount = @post.amount

  customer = Stripe::Customer.create(
    :email => 'example@stripe.com',
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => @post.title,
    :currency    => 'usd'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to root_path
end


end
