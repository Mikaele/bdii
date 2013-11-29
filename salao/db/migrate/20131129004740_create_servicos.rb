class CreateServicos < ActiveRecord::Migration
  def change
    create_table :servicos do |t|
      t.references :category
      t.string :nome
      t.float :preco
      t.text :descricao

      t.timestamps
    end
    add_index :servicos, :category_id
  end
end
