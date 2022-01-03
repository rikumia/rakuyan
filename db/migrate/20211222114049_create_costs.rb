class CreateCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :costs do |t|
      t.references :user,         null: false, foreign_key: true
      t.string :cliant_name,      null: false
      t.date :calendar,           null: false
      t.integer :sales,           null: false
      t.integer :cost,            null: false
      t.integer :profit,          null: false
      t.integer :profit_rate,             null: false
      t.timestamps
    end
  end
end
