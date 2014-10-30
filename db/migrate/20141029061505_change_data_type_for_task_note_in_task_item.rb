class ChangeDataTypeForTaskNoteInTaskItem < ActiveRecord::Migration
  def change
    change_column :task_items, :task_note, :text
  end
end
