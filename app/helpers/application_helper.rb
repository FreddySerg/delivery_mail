module ApplicationHelper
  def status_of number
    case number
    when 0 then 'started'
    when 1 then 'completed'
    end
  end

  def get_attach_of attach
    if attach.blank?
      'Without attachment'
    else
      content_tag(:a, 'Get attach', href: attach)
    end
  end
end
