class Comment < ApplicationRecord
  # DB Relations
  has_many :comment_files, dependent: :destroy
  belongs_to :user
  belongs_to :task

  # Validation
  validates :comment, presence: true
end
