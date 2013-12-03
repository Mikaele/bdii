class CreatePagamentos < ActiveRecord::Migration
  def change
    create_table :pagamentos do |t|
      t.date :data
      t.time :hora
      t.float :valor
      t.references :formapagamentoe
      t.references :cliente
      t.references :servico

      t.timestamps
    end
    add_index :pagamentos, :formapagamentoe_id
    add_index :pagamentos, :cliente_id
    add_index :pagamentos, :servico_id
  end
end
