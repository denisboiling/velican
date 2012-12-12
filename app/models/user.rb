class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable, :confirmable

  after_create :admin_notify

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :phone, :address, :comment

  # TODO: is not secure
  attr_accessible :unconfirmed_email, :available

  scope :availables, where(available: true)
  scope :unavailables, where(available: false)

  validates :name, :email, presence: true

  def available!
    self.update_attribute(:available, true)
  end

  def admin_notify
    Notifier.new_customer_request(self).deliver
  end
end
