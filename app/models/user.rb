class User < ActiveRecord::Base
	has_many :posts, foreign_key: :author_id
	has_many :comments, foreign_key: :commenter_id
	has_many :replies, foreign_key: :replier_id

  validates :username, presence: :true, uniqueness: :true,
  validates :email, presence: :true, uniqueness: :true
  validates :password,

  def password
    BCrypt::Password.new(self.password_hash)
  end

  def password=(input)
    self.password_hash = BCrypt::Password.create(input)
  end

  def self.authenticate(email, password_attempt)
    user = User.find_by(email: email)
    user if user.password == password_attempt
  end
end
