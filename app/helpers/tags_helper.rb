module TagsHelper
  def all_tags
    Tag.all
  end

  def find_or_initialize_by_name(name)
    tag = Tag.find_by(name: name)

    if tag == nil
      tag = Tag.new(params.require(:tag).permit(:name))
      tag.save
    end

    tag
  end

  def generate_tags(article)
    topics = get_topics_from_api(article) # Get hash of topics from TextRazor api
  end
end
