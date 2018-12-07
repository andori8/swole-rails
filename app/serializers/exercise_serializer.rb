class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :sets, :reps, :description, :category_id

  belongs_to :user, serializer: ExerciseUserSerializer	
end
