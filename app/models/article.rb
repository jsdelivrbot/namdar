class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags

  def add_tag(tag)
    return if tag == nil or self.tags.include? tag

    self.tags << tag
    tag.update(:count => tag.count+1)
  end

  def remove_tag(tag)
    return if tag == nil or !self.tags.include? tag
    self.tags.delete(tag)
    if tag.count <= 1
      tag.destroy
    else
      tag.update(count: tag.count-1)
    end
  end
end
