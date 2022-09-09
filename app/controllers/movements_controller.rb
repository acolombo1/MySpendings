class MovementsController < ApplicationController
  before_action :authenticate_user!
  def new
    movement = Movement.new
    @category = Category.find(params[:category_id])
    render :new, locals: { movement: }
  end

  def create
    myhash = params.require(:movement).permit(:name, :amount, :category, :category2, :category3)
    movement = Movement.new(name: myhash['name'], amount: myhash['amount'])
    movement.author_id = current_user.id
    if movement.save
      add_to_category(myhash, movement)
    else
      flash.now[:error] = 'Error: Movement could not be saved'
      render :new, locals: { movement: }, status: 422
    end
  end

  def add_to_category(myhash, movement)
    category = Category.where(name: myhash['category'], author_id: current_user.id).first
    if category == []
      flash[:error] = "Error: Category #{category.name} not found"
      redirect_to '/categories'
    else
      category_movement = CategoryMovement.new(movement:, category:)
      category_movement.author_id = current_user.id
      if category_movement.save
        flash[:success] = "Movement created successfully in category #{category.name}."
      else
        flash[:error] = "Movement could not be saved in category #{category.name}."
      end
      add_to_category2(myhash, movement)
      add_to_category3(myhash, movement)
      redirect_to "/categories/#{category.id}"
    end
  end

  def add_to_category2(myhash, movement)
    return if myhash['category2'] == ''

    category2 = Category.where(name: myhash['category2'], author: current_user)
    if category2 == []
      flash[:error] = "But: Category #{myhash['category2']} not found"
    else
      category_movement = CategoryMovement.new(movement:, category: category2)
      category_movement.author_id = current_user.id
      flash[:success] = "Added to #{category2.name} category" if category_movement.save
    end
  end

  def add_to_category3(myhash, movement)
    return if myhash['category3'] == ''

    category3 = Category.where(name: myhash['category3'], author: current_user)
    if category3 == []
      flash[:error] = "But: Category #{myhash['category3']} not found"
    else
      category_movement = CategoryMovement.new(movement:, category: category3)
      category_movement.author_id = current_user.id
      flash[:success] = "Added to #{category3.name} category" if category_movement.save
    end
  end
end
