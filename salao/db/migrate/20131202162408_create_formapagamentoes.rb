class CreateFormapagamentoes < ActiveRecord::Migration
  def change
    create_table :formapagamentoes do |t|
      t.string :tipo

      t.timestamps
    end
  end
end
