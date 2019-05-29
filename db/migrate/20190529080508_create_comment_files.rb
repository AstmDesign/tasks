class CreateCommentFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_files do |t|
      t.references :comment, foreign_key: true
      t.attachment :file

      t.timestamps
    end
  end
end
