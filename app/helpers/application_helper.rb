module ApplicationHelper
  def session_nav
    render :partial => "application/session_navigation"#, :locals => {:user => user}
  end
end
