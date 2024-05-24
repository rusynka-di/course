class User < ApplicationRecord
  has_secure_password

  has_many :questions, dependent: :destroy

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
