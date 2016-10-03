module Concerns
  module TagsConcerns
    def upsert_tag_by_name(name)
      tag = Tag.find_by(name: name)

      if tag == nil
        tag = Tag.new(name: name)
        tag = tag.save ? tag : nil
      end

      tag
    end
  end
end
