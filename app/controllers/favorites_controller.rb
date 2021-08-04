class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_to posts_path, notice: "You add #{favorite.post.user.name} post to your favorites posts"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to posts_path, notice: "You delete #{favorite.post.user.name} post to your favorites posts"
  end
end
