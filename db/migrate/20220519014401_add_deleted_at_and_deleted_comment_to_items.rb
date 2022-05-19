class AddDeletedAtAndDeletedCommentToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :deleted_at, :datetime
    add_index :items, :deleted_at
    add_column :items, :deleted_comment, :string
  end
end
