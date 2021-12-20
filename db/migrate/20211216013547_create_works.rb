class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.references :user,          null: false, foreign_key: true
      t.string :cliant_name,       null: false
      t.text :job_description,     null: false
      t.date :calendar,            null: false
      t.string :work_place,        null: false
      t.integer :price,            null: false
      t.timestamps
    end
  end
end
