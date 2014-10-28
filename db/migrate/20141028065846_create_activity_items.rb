class CreateActivityItems < ActiveRecord::Migration
  def change
    create_table :activity_items do |t|
      t.string :activity_item
      t.date :activity_date
      t.time :starting_time
      t.time :ending_time
      t.string :activity_note
      t.boolean :activity_starred
      t.integer :user_id
      t.string :activity_color

      t.timestamps
    end
  end
end
