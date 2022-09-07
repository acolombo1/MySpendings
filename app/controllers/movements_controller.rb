class MovementsController < ApplicationController
  before_action :authenticate_user!
  def new
    movement = Movement.new
    render :new, locals: { movement: }
  end

  def create
    movement = Movement.new(params.require(:movement).permit(:name, :amount))
    movement.author_id = current_user.id

    if movement.valid?
      if Category.where(name: movement.category).nil?
        flash.now[:error] = 'Error: Category not found'
        render :new, locals: { movement: }, status: 422
      else
        category_movement = CategoryMovement.new(movement:, category: movement.category)
        category_movement.author_id = current_user.id
        category_movement.save
        flash[:success] = "Movement created successfully in category #{movement.category}"
        return if Category.where(name: movement.category2).nil?

        category_movement = CategoryMovement.new(movement:, category: movement.category2)
        category_movement.author_id = current_user.id
        flash[:success] = "Added to #{movement.category2} category" if category_movement.save
        return if Category.where(name: movement.category3).nil?

        category_movement = CategoryMovement.new(movement:, category: movement.category3)
        category_movement.author_id = current_user.id
        flash[:success] = "Added to #{movement.category3} category" if category_movement.save
        redirect_to "/categories/#{movement.category.id}"
      end
    else
      flash.now[:error] = 'Error: Movement could not be saved'
      render :new, locals: { movement: }, status: 422
    end
  end
end
