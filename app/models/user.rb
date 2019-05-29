class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validation
  validates :first_name, :last_name, :email, presence: true

  # Get full name
  def full_name
    first_name + ' ' + last_name
  end
end
