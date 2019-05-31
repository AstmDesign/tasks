class Task < ApplicationRecord
  # DB Relations
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :project

  # Validation
  validates :title, :deadline, presence: true
end
