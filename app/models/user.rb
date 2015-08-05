class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_many :orders_as_provider, :class_name => "Order", :foreign_key => :provider_id
  has_many :orders_as_customer, :class_name => "Order", :foreign_key => :customer_id

  validates :first_name, :last_name, :email, presence: true

  def set_default_role
    self.role ||= :user
  end

  def full_name
    self.first_name + " " + self.last_name
  end

  def get_roles
    return self.role
  end

  def is_admin?
    'admin'.in?(self.get_roles)
  end
end
