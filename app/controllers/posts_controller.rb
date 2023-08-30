class PostsController < ApplicationController
  
  def create
    @group = Group.find(params[:post][:group_id])
    @post = @group.posts.new(post_params)
    @post.user = User.find(rand(1..2))
    if @post.save
      redirect_to @group
    else
      # エラーハンドリング
      render 'groups/show'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @group = @post.group
    @post.destroy

    redirect_to group_path(@group), notice: 'Message deleted!'
  end
  
  private
    def post_params
      params.require(:post).permit(:content, :group_id)
    end
end
