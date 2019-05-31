class Project < ApplicationRecord
  # DB Relations
  has_many :tasks, dependent: :destroy
  belongs_to :user

  # Validation
  validates :name, presence: true
end
