class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :status
      t.integer :price
      t.string :from
      t.string :to
      t.references :client, null: false, foreign_key: true
      t.references :taskman, null: true, foreign_key: true

      t.timestamps
    end
  end
end
