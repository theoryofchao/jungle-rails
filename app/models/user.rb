class User < ActiveRecord::Base
  before_validation :downcase_stuff

  validates :first_name, :last_name, :email, :password_digest, presence: true
  validates :email, uniqueness: true
  has_many :reviews
  has_secure_password

  private
    def downcase_stuff
      if (self.email)
        self.email.downcase!
      end
    end

end
