class Admin::MembersController < ApplicationController
  
  def show
    @teams = Team.all
    @users = User.all
  end

  def update
    @member_ids = params[:member_ids]
    @users = User.all
    if !@member_ids.nil?
      @member_ids.each do |member_id|
        @users.each do |user|
          if user.id == member_id.to_i
            update_member user
          end
        end
      end
    end
    redirect_to :back
  end

  def update_member user
    user.not_validate_password = true
    if user.team_id == getTeamId
      user.update_attributes(team_id: nil)
    else
      user.update_attributes(team_id: getTeamId)
    end
    user.not_validate_password = false
  end

end