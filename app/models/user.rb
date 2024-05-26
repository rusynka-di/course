class User < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
 
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable
  has_secure_password


  validates :email, presence: true, uniqueness: true
   
  has_one :profile, dependent: :destroy
  # after_create :create_profile

  before_save :downcase_nickname

  def downcase_nickname
    nickname.downcase!
  end

  # private
  
  # def create_profile
  #   Profile.create(user: self, body: '')
  # end
end
