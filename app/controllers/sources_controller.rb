class SourcesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def new
    @source = Source.new
  end

  def create
    new_source = Source.new(post_params)

    if new_source.save
      redirect_to posts_settings_path
    else
      render 'sources/new'
    end 
  end

  private

  def post_params
    params.require(:source).permit(:name, :rus_name, :link)
  end

  def check_admin
    redirect_to root_path unless current_user.is_admin
  end
end
