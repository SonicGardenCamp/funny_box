class Groups::PostsController <  Groups::BaseController
  before_action :set_post, only: %i[destroy]
  before_action :deletable!, only: %i[destroy]
  before_action :require_participating!, only: %i[create]

  def create
    @post = @group.posts.new(post_params)
    @post.user = current_user
    if @post.save_and_touch
      redirect_to @group
    else
      render 'groups/show'
    end
  end

  def destroy
    @post.destroy
    redirect_to group_path(@group)
  end

  private
    def set_post
      @post = @group.posts.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content)
    end

    def deletable!
      redirect_to(root_url, status: :see_other) unless @post.deletable?(current_user)
    end

    def require_participating!
      redirect_to(root_url, status: :see_other) unless @group.participating?(current_user)
    end
end
