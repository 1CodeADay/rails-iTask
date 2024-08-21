class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.text :description
      t.string :position
      t.string :destination
      t.references :client, null: false, foreign_key: true
      t.references :taskman, null: false, foreign_key: true

      t.timestamps
    end
  end
end
