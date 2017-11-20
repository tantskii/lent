class SourceUsersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @source = Source.find(params[:source_id])

    current_user.add_source(@source)

    respond_to do |format|
      format.js { render 'create', locals: {source: @source}}
      format.html { redirect_to posts_settings_path }
    end
  end

  def destroy
    @source = Source.find(params[:source_id])

    current_user.delete_source(@source)

    respond_to do |format|
      format.js { render 'destroy', locals: {source: @source}}
      format.html { redirect_to posts_settings_path }
    end
  end

  private

  def source_user_params
    params.require(:source_user).permit(:source_id)
  end
end
