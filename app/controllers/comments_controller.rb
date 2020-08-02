class CommentsController < ApplicationController
  def create
  @book = Book.find(params[:book_id])
  @comment = @book.comments.new(comment_params)
  @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = @book.comments.find(params[:id])
    @comment.destroy
    redirect_to books_path
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
