class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :body
      t.string :status, null: false, default: 'ongoing'

      t.timestamps
    end
  end
end
