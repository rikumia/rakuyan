class CreateQuotations < ActiveRecord::Migration[6.0]
  def change
    create_table :quotations do |t|
      t.references :cost_pdf,          null: false, foreign_key: true
      t.string :product_name,      null: false
      t.string :quantity,          null: false
      t.string :unit,              null: false
      t.string :unit_price,        null: false
      t.integer :money,            null: false
      t.string :remarks,           null: false
      t.timestamps
    end
  end
end
