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
      flash[:danger] = "失敗しました。"
      render 'static_pages/home'
    end
  end

  def destroy
    Skill.find(params[:skill][:id]).destroy
    redirect_to current_user
  end

  # 時間追加
  def add
    @skill = Skill.find(params[:skill][:id])
    updated_total = @skill.total + params[:skill][:total].to_i
    @skill.update_attribute(:total, updated_total)
    redirect_to current_user
  end

  private

    def skill_params
      params.require(:skill).permit(:name, :total)
    end
end
