class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories
  end

  def show
    @category = Category.find(params[:category_id])
    @movements = @category.movements.order(Arel.sql('created_at DESC'))
  end

  def new
    category = Category.new
    render :new, locals: { category: }
  end

  def create
    category = Category.new(params.require(:category).permit(:name, :icon))
    category.author_id = current_user.id
    found = Category.where(name: category.name, author_id: category.author_id)
    if found != []
      flash.now[:error] = 'Error: Category with that name already exists'
      render :new, locals: { category: }, status: 422
    elsif category.save
      flash[:success] = 'Category created successfully'
      redirect_to "/categories/#{category.id}"
    else
      flash.now[:error] = 'Error: Category could not be saved'
      render :new, locals: { category: }, status: 422
    end
  end
end
