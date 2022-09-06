class PostsController < ApplicationController
  def new
    movement = Movement.new
    render :new, locals: { movement: }
  end

  def create
    movement = Movement.new(params.require(:movement).permit(:name, :amount, :category))
    movement.author_id = current_user.id

    CategoryMovement.new(movement:, category: movement.category)
    movement.author_id = current_user.id

    respond_to do |format|
      format.html do
        if post.save
          flash[:success] = 'Post created successfully'
          redirect_to "/users/#{current_user.id}/posts"
        else
          flash.now[:error] = 'Error: Post could not be saved'
          render :new, locals: { post: }, status: 422
        end
      end
    end
  end
end
