class CreateAcitivityItems < ActiveRecord::Migration
  def change
    create_table :acitivity_items do |t|
      t.string :activity_name
      t.date :activity_date
      t.time :starting_time
      t.time :ending_time
      t.string :activity_note
      t.boolean :activity_starred
      t.integer :calendar_user_id

      t.timestamps
    end
  end
end
