module ApplicationHelper
  def title
    base_title = "Head Shot Augmented Reality Phone Game"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
