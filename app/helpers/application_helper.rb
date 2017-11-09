module ApplicationHelper
  def errors_for(object)
    if object.errors.any?
      content_tag(:div, class: "alert alert-error") do
        concat(content_tag(:p) do
          concat "Woops! There #{object.errors.count > 1 ? "are" : "is"} #{pluralize(object.errors.count, "error")}:"
        end)
        concat(content_tag(:ul) do
          object.errors.full_messages.each do |msg|
            concat content_tag(:li, msg)
          end
        end)
      end
    end
  end
end
