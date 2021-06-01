class HomeController < ApplicationController
  def index
    if (current_user)
      @teams = Team.where('id = ?', current_user.team_id)
      @projects = Project.where('team_id = ?', current_user.team_id)
    
      @activities = PublicActivity::Activity.order("created_at DESC").where(owner_id: current_user.id, owner_type: "User")
      
    end
  end
end
