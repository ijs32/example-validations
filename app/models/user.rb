class EmailValidator < ActiveModel::Validator
  def validate(user)
    if user.email.exclude? ("@") 
      user.errors.add :base, "Does not contain @ sign"
    end
  end
end

class User < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates_with EmailValidator
end
