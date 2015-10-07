module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Ticketee").join(" - ")
      end
	end
  end

  def is_a_number?(n)
  	if n = /^\d+$/
  		true
  	else
  		false
  	end
  end
end
