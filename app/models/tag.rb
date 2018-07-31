class Tag < ApplicationRecord
  def self.add_count(tag_names, tags)
    tags = tags || []
    tag_names.each do |tag_name|
      next if tags.include?(tag_name)
      tag = Tag.where(name: tag_name).first
      if tag
        tag[:cnt] = (tag[:cnt] == 0 || !tag[:cnt]) ? 1 : tag[:cnt] + 1
        tag.save
      else
        tag = Tag.new({name: tag_name, cnt: 1})
        tag.save
      end
    end
  end
end
