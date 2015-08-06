class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    # @amount = 500

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => params[:amount],
      :description => 'Rails Stripe customer',
      :currency    => 'eur'
    )

    create_order(params[:advert], params[:amount])

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end


  def create_order(advert, price)
    @order = Order.new(provider_id: current_user.id, total_price: price)
    if @order.save
      redirect_to root_path, alert: 'Paiement effectué avec succès'
    else
      redirect_to root_path, alert: 'PB'
    end
  end
end
