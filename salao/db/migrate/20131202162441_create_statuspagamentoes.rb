class CreateStatuspagamentoes < ActiveRecord::Migration
  def change
    create_table :statuspagamentoes do |t|
      t.string :tipo

      t.timestamps
    end
  end
end
