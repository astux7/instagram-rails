class CommentsController < ApplicationController
  def new
    @post = Post.find params[:post_id]
    @comment = Comment.new
  end

  def create
    @post = Post.find params[:post_id]
    @comment = Comment.create(params[:comment].permit(:text))
    @comment.post_id = @post.id
    if @comment.save
      redirect_to posts_path
    else
      render 'new'
    end
  end 
end
