class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.references :pessoa
      t.date :aniversario
      t.string :sexo , :limit=> 10
      t.text :obs

      t.timestamps
    end
  end
end
