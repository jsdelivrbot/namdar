class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags

  def add_tag(tag)
    return if tag == nil
    self.tags << tag unless self.tags.include? tag
  end

  def remove_tag(tag)
    return if tag == nil
    self.tags.delete(tag)
  end
end
