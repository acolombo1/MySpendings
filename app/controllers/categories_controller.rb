class PostsController < ApplicationController
  def index
    @categories = current_user.categories
    @current_user = current_user
  end

  def show
    @current_user = current_user
    @category = Category.find(params[:id])
    @movements = @category.movements.order(Arel.sql('created_at DESC'))
  end

  def new
    category = Category.new
    render :new, locals: { category: }
  end

  def create
    category = Category.new(params.require(:category).permit(:name, :icon))
    category.author_id = current_user.id

    if category.save
      flash[:success] = 'Category created successfully'
      redirect_to "/categories/#{category.id}"
    else
      flash.now[:error] = 'Error: Category could not be saved'
      render :new, locals: { category: }, status: 422
    end
  end
end
