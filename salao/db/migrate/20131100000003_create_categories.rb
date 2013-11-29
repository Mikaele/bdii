class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end
end
