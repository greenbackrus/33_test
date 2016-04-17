class CreateLections < ActiveRecord::Migration
  def change
    create_table :lections do |t|
      t.text :text
      t.text :links
      t.integer :lesson_id

      t.timestamps null: false
    end
  end
end
