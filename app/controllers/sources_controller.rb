class SourcesController < ApplicationController
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
end
