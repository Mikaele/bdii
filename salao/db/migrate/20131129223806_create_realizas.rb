class CreateRealizas < ActiveRecord::Migration
  def change
    create_table :realizas do |t|
      t.date :data
      t.time :hora
      t.references :statuspagamento
      t.string :status , :default=>"0"
      t.string :obs
      t.references :cliente
      t.references :usuario
      t.references :servico

      t.timestamps
    end
    add_index :realizas, :cliente_id
    add_index :realizas, :usuario_id
    add_index :realizas, :servico_id
    add_index :realizas, :statuspagamento_id
  end
end
