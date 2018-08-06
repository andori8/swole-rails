class Exercise < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :exercise_workouts
  has_many :workouts, through: :exercise_workouts
  validates :name, presence: true
  validates :sets, presence: true
  validates :reps, presence: true
  validates :description, presence: true
  validates :category_id, presence: true

  scope :specific_category, ->(category_id) { where("category_id = ?", category_id) }
end
