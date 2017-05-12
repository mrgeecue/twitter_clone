class PostsController < ApplicationController
  def show
    @user = User.find_by(params[:user_id])
    @tweets = Post.all
  end

  def create
    @tweet = current_user.posts.new(post_params)
      if @tweet.save
        redirect_to '/posts/show'
      else
        flash[:error] = @tweet.errors.full_messages.to_s
        redirect_to 'posts/show'
      end
  end

  private
  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
