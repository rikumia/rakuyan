class CreateCliants < ActiveRecord::Migration[6.0]
  def change
    create_table :cliants do |t|
      t.references :user,         null: false, foreign_key: true
      t.string :cliant_name,      null: false
      t.string :email,            null: false
      t.string :tell,             null: false
      t.string :fax,              null: false
      t.string :address,          null: false
      t.timestamps
    end
  end
end
