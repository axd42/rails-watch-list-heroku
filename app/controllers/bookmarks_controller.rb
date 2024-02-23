class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = List.find(params[:list_id])
    if @bookmark.save
      redirect_to @bookmark.list
    else
      @list = List.find(params[:list_id])
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to @bookmark.list, status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
