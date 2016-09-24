CommentType = GraphQL::ObjectType.define do
  name "Comment"
  desciption 'A single comment for a project'
  field :id, types.ID, 'The ID of the comment'
  field :body, types.String, 'The body of the comment'
  field :created_at, types.String, 'The date the comment was created'
  field :votes_count, types.String, 'The total number of votes'
  field :user, UserType, 'Owner of the comment'
end
