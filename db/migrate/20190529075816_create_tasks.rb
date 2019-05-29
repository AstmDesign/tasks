class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :details
      t.datetime :deadline
      t.string :priority, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
