class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :reports # dependent: :destroy
  has_secure_password

  before_save {|user| user.email = email.downcase}
  before_save :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
  			format: {with: VALID_EMAIL_REGEX},
  			uniqueness: {case_sensitive:false}
  validates :password, presence: true, lenght: {minimum: 6}
  validates :password_confirmation, presence: true

  def create_remember_token
  	self.remember_me = SecureRandom.urlsafe_base64
  end

end
