class SearchController < ApplicationController
  def search
  	# params[:option]で1userか2book判別
    @user_or_book = params[:option]
    @how_search = params[:choice]
    if @user_or_book == "1"
      # (params[:search])で検索フォームに入力したものを受け取る
      @users = User.search(params[:search], @user_or_book, @how_search)
    else
      @books = Book.search(params[:search], @user_or_book, @how_search)
    end
  end
end