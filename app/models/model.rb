class Model < ActiveRecord::Base
  belongs_to :brand, dependent: :delete
  has_many :adverts, dependent: :destroy
end
