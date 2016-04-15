class CreateLections < ActiveRecord::Migration
  def change
    create_table :lections do |t|
      t.string :title
      t.text :text
      t.text :links

      t.timestamps null: false
    end
  end
end
