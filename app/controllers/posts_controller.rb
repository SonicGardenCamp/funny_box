class PostsController < ApplicationController
  before_action :correct_user, only:[:destroy]
  before_action :entry_user, only:[:create]
  
  def create
    @group = Group.find(params[:post][:group_id])
    @post = @group.posts.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @group
    else
      render 'groups/show'
    end
  end
  
  
  def destroy
    @post = Post.find(params[:id])
    @group = @post.group
    @post.destroy
    redirect_to group_path(@group)
  end
  
  private
    def post_params
      params.require(:post).permit(:content, :group_id)
    end
    
    def correct_user
      @post = Post.find(params[:id])
      @group = @post.group
      @host_user  = User.find(@group.host_user_id)
      redirect_to(root_url, status: :see_other) unless current_user == @post.user || 
                                                       current_user ==  @host_user
    end
    
    def entry_user
      @group = Group.find(params[:post][:group_id])
      redirect_to(root_url, status: :see_other) unless @group.users.include?(current_user)
    end
  
end
