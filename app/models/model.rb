class Model < ActiveRecord::Base
  belongs_to :brand
  has_many :adverts
end
