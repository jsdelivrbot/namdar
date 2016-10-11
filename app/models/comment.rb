class Comment < ApplicationRecord
  belongs_to :article, counter_cache: true
  validates :commenter, presence: true
  validates :comment_text, presence: true
end
