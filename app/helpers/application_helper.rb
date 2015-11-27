module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Ticketee").join(" - ")
      end
	end
  end
end

def only_admin &block
  block.call if current_user.try(:admin?)
end
