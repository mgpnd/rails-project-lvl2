# frozen_string_literal: true

module ApplicationHelper
  def error_class_for(entity, attribute)
    errors = entity.errors[attribute.to_s]
    return if errors.blank?

    'is-invalid'
  end

  def error_messages_for(entity, attribute)
    errors = entity.errors[attribute.to_s]
    return if errors.blank?

    errors.each { |e| concat(tag.p(class: 'invalid-feedback') { e }) }
    nil
  end

  def post_category_options
    PostCategory.all.map { |c| [c.name, c.id] }
  end
end
