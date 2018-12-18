class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :title, :time
  belongs_to :user, serializer: UserSerializer
  has_many :comments, serializer: CommentSerializer
end
