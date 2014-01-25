class PostsController < ApplicationController
  def new
    @post = Post.new
    render 'new'
  end

  def create
    @post = Post.new(params[:post].permit(:title))
    if @post.save
      redirect_to posts_path
    else
      reder 'new'
    end
  end

  def index
    @posts = Post.all
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to posts_path
  end

  def edit
    @post = Post.find params[:id]
    render 'edit'
  end

  def update
    @post = Post.find params[:id]
    if @post.update params[:post].permit(:title)
        redirect_to posts_path
    else
        render 'edit'
    end
  end

end
