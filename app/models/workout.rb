class Workout < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :exercise_workouts
  has_many :exercises, through: :exercise_workouts

  validates :title, presence: true
  validates :time, presence: true
  validates :difficulty, presence: true
end
