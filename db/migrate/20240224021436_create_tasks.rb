class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description
      t.boolean :completed, default: false
      t.datetime :target_completion_date
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
