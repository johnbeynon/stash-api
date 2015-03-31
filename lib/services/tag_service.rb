module TagService

  def self.resources_in_tag(tag)
    tag.tickets
  end

end
