class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :sets
      t.integer :reps
      t.text :description
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
