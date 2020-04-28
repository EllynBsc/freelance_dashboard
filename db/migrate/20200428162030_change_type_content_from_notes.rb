class ChangeTypeContentFromNotes < ActiveRecord::Migration[5.2]
  def change
    change_column :notes, :content, :text
  end
end
