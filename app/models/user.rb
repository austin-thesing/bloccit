class User < ActiveRecord::Base
  before_save { self.email = email.downcase } # can we please cover these next meeting? callbacks are kind of confusing to me
  before_save :format_name

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, length: { minimum: 1, maxmimum: 100 }, presence: true

  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?" # tests to make sure valid password is used at user creation
  validates :password, length: { minimum: 6 }, allow_blank: true # allows us to change other user atrributes with out providing a new password every time

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 100 },
            format: { with: EMAIL_REGEX }
  has_secure_password

  def format_name
    if name
      users_name = []
      name.split.each do |name_part|
        users_name << name_part.capitalize
      end
      self.name = users_name.join(" ")
    end
  end
end
