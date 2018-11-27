class Admin::PostsController < ApplicationController
  # http_basic_authenticate_with name: 'admin', password: 'qwe', except: [:index, :show]
  before_action :authenticate_user!

  before_action :check_admin

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:success] = "Post has been created"
      redirect_to @post
    else
      flash.now[:danger] = "Post has not been created"
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:success] = "Post has been updated"
      redirect_to @post
    else
      flash.now[:danger] = "Post has not been updated"
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "Post has been deleted"
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

  def check_admin
    redirect_to root_path, alert: "You have no rights" unless current_user.admin
  end
end
