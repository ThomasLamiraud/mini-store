class Order < ActiveRecord::Base

	belongs_to :customer, :class_name => 'User'
  belongs_to :provider, :class_name => 'User'

  belongs_to :advert

  def order_customer
    @order_customer ||= self.customer
  end

  def order_provider
    @order_provider ||= self.provider
  end

  def order_orderable
    @order_orderable ||= self.orderable
  end

end
