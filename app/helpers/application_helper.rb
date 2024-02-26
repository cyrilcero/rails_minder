module ApplicationHelper
  def format_date(date)
    date.strftime("%B #{date.day.ordinalize}, %Y")
  end

  def remove_domain_from_email(email)
    email.gsub(/@.+$/, '')
  end
end
