class SkillsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]

  def new
    @skill = current_user.skills.build
  end

  def create
    @skill = current_user.skills.build(skill_params)
    @skill.update_attribute(:total, 0)
    if @skill.save
      flash[:success] = "Skill added!"
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def skill_params
      params.require(:skill).permit(:name, :total)
    end
end
