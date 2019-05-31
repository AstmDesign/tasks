class User < ApplicationRecord
  # DB Relations
  has_many :projects, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy

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
