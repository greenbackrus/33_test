class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.integer :week
      t.integer :discipline_id

      t.timestamps null: false
    end
  end
end
