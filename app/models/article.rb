class Article < ApplicationRecord
  has_many :comment, dependent: :destroy
end
