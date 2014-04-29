module ApplicationHelper

  @@team_id = nil

  def full_title (page_title)
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def setTeamId team_id
    @@team_id = team_id
  end

  def getTeamId
    @@team_id
  end
end
