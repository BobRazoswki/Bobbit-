class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :like
      t.timestamps
    end
  end
end
