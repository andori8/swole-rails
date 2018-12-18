class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user, :workout

  belongs_to :user, serializer: UserSerializer
  belongs_to :workout, serializer: WorkoutSerializer
end
