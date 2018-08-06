class Workout < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :exercise_workouts
  has_many :exercises, through: :exercise_workouts
end
