class RemoveDifficultyFromWorkouts < ActiveRecord::Migration[5.2]
  def change
    remove_column :workouts, :difficulty, :string
  end
end
