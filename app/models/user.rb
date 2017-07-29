class User < ApplicationRecord

  def upercase_name(name)
  s = name.to_s.split(" ")
  cap = []
    s.each  do | i |
      cap << i.capitalize
    end
  final = cap.join(" ")
  end

  before_save { self.email = email.downcase if email.present? }

  before_save { self.name = upercase_name(name) }

  validates :name, length: {minimum: 1, maximum:100 }, presence: true

  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

  has_secure_password

end
