class CreateCategoryMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :category_movements do |t|

      t.timestamps
    end
    add_reference(:category_movements, :category, foreign_key: { to_table: :categories })
    add_reference(:category_movements, :movement, foreign_key: { to_table: :movements })
    add_reference(:category_movements, :author, foreign_key: { to_table: :users })
  end
end
