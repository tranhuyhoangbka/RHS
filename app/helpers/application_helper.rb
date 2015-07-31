module ApplicationHelper
  def link_to_add_fields name, f, association
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object,
      child_index: "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to "#",
      onclick: ("add_fields(this, \"#{association}\",
      \"#{escape_javascript(fields)}\")"),
      class: "btn btn-info add_nested_fields", remote: true do
        raw "<i class=\"glyphicon glyphicon-plus\"></i> " + name
    end
  end

  def image_tag_link adds_by_province
    if adds_by_province.images.first.present?
      image_tag adds_by_province.images.first.photo.small_thumb.url
    else
      image_tag Settings.images.house_image
    end
  end

  def link_to_avatar user
    link_to user_path(id: user.id) do
            image_tag user.avatar.present? ? user.avatar.url :
                                             Settings.user.avatar_default
    end
  end

  def link_to_count_comments review
    review.comments.any? ? link_to(pluralize(review.comments.size,
           t("review.comment")), review_comments_path(review), remote: true) :
           link_to("#{Settings.review.zero} #{t('review.comment')}",
           review_comments_path(review), remote: true)
  end
end
