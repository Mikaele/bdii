class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.string :apelido
      t.text :endereco
      t.string :celular
      t.string :telefone
      t.string :email

      t.timestamps
    end
  end
end
