class CreateServicos < ActiveRecord::Migration
  def change
    create_table :servicos do |t|
      t.references :categoria
      t.string :nome
      t.float :preco
      t.text :descricao

      t.timestamps
    end
    add_index :servicos, :categoria_id
  end
end
