class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :title, :time
  belongs_to :user, serializer: UserSerializer
end
