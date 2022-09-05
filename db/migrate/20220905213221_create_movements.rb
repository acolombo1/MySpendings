class CreateMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :movements do |t|
      t.string :name
      t.decimal :amount
      t.timestamps
    end
    add_reference(:movements, :author, foreign_key: { to_table: :users })
  end
end
