class CreateTaskItems < ActiveRecord::Migration
  def change
    create_table :task_items do |t|
      t.string :task_name
      t.date :task_date
      t.string :task_note
      t.boolean :task_starred
      t.integer :user_id
      t.string :task_color

      t.timestamps
    end
  end
end
