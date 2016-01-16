class ProblemSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :lat, :line_id, :lng, :reason, :user_id

  def created_at
    object.created_at.to_s
  end
end
