class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :phone, :address, :comment

  scope :availables, where(available: true)
  scope :unavailables, where(available: false)

  validates :name, :email, presence: true

  def available!
    self.update_attribute(:available, true)
  end
end
