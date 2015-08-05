class Advert < ActiveRecord::Base
	has_one :order
	belongs_to :model
end
