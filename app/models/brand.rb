class Brand < ActiveRecord::Base
  has_many :models, dependent: :destroy
end
