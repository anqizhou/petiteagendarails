class ChangeDataTypeForActivityNoteInActivityItem < ActiveRecord::Migration
  def change
    change_column :activity_items, :activity_note, :text
  end
end
