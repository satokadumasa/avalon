class Tag < ApplicationRecord
  def self.add_count(tag_names, tags)
    logger.debug "Tag.add_count tag_names:" + tag_names.inspect
    tag_names.each do |tag_name|
      next if tags.include?(tag_name)
      tag = Tag.where(name: tag_name).first
      if tag
        logger.debug "Tag.add_count update"
        tag[:cnt] = (tag[:cnt] == 0 || !tag[:cnt]) ? 1 : tag[:cnt] + 1
        tag.save
      else
        logger.debug "Tag.add_count add tag."
        tag = Tag.new({name: tag_name, cnt: 1})
        tag.save
      end
    end
  end
end
