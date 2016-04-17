class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.string :title
      t.text :description
      t.integer :lesson_id

      t.timestamps null: false
    end
  end
end
