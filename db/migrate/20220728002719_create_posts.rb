class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :start_day
      t.string :finish_day
      t.string :all_day
      t.text :memo

      t.timestamps
    end
  end
end
