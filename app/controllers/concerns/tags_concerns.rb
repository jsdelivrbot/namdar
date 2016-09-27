module Concerns
  module TagsConcerns
    def find_or_initialize_by_name(name)
      tag = Tag.find_by(name: name)

      if tag == nil
        tag = Tag.new(name: name)
        tag.save
      end

      tag
    end
  end
end
