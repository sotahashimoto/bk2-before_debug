class CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.comments.new(comment_params)
    @comment.book_id = @book.id
    @comment.save
    @comment = Comment.new
    @comments = @book.comments
    flash[:success] = "コメントしました"
  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = @book.comments.find(params[:id])
    @comments = @book.comments
    @comment.destroy
    @comment = Comment.new
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end