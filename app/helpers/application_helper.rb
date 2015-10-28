module ApplicationHelper
  def form_group_tag(errors, &block) # takes an array > errors and a proc &block which is a block we can use like a variable
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end
end
