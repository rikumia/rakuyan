class CreateCostPdfs < ActiveRecord::Migration[6.0]
  def change
    create_table :cost_pdfs do |t|
      t.references :user,       null: false, foreign_key: true
      t.string :cliant_name,       null: false
      t.string :postal_code,       null: false
      t.string :address,           null: false
      t.string :company_name,      null: false
      t.string :tell,              null: false
      t.string :fax,               null: false
      t.date :delivery_date,       null: false
      t.string :delivery_location, null: false
      t.string :payment_terms,     null: false
      t.date :expiration_date,     null: false
      t.string :product_name,      null: false
      t.string :quantity,          null: false
      t.string :unit,              null: false
      t.string :unit_price,        null: false
      t.integer :money,            null: false
      t.string :remarks,           null: false
      t.integer :subtotal,         null: false
      t.integer :tax,              null: false
      t.integer :total,            null: false
      t.string :memo,              null: false
      t.timestamps
    end
  end
end
