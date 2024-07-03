class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])

  end

  # POST /machines or /machines.json
  def create
    @post = Post.new(post_params.merge(creator_id: current_user[:id]))

    if @post.save
      redirect_to root_url, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
   params.require(:post).permit(:title, :body, :category_id)
  end
end
