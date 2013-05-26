class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  before_save :ensure_authentication_token

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :validate_token
  # attr_accessible :title, :body

  #has_many :reports # dependent: :destroy

  has_many :venues

  def admin?
  	self.role == 0
  end

  def business?
    self.role == 2
  end

end
