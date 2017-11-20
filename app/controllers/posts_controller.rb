class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /posts
  # GET /posts.json
  def index
    @title = 'Posts'

    if params[:keywords].present?
      @keywords = params[:keywords]
      
      expr = @keywords.split.join(" & ")

      @posts = Post.where("to_tsvector('russian', title || ' ' || description) @@ to_tsquery(?)",
                          ActiveRecord::Base.connection.quote(expr))
                          .order(pub_date: :desc).paginate(page: params[:page])
    else
      @posts = Post.order(pub_date: :desc).paginate(page: params[:page])
    end

    respond_to do |format|
      format.js {render 'index', locals: {posts: @posts}}
      format.html
    end
  end

  def download
    Post.download_posts

    redirect_to action: :index
  end 

  def my_lent
    @title = 'My lent'
    @posts = current_user.posts.order(pub_date: :desc).paginate(page: params[:page])

    render 'posts/index'
  end 

  def settings
    @title = 'Settings'

    if params[:keywords].present?
      @keywords = params[:keywords].downcase
      
      @sources = Source.where("name like '%#{@keywords}%' or rus_name like '%#{@keywords}%'")
    else
      @sources = Source.all
    end

    respond_to do |format|
      format.js {render 'settings', locals: {sources: @sources}}
      format.html
    end
  end  

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :pub_date, :link)
    end
end
