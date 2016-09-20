class Comment < ApplicationRecord
  belongs_to :article
  validates :commenter, presence: true
  validates :comment_text, presence: true
end
