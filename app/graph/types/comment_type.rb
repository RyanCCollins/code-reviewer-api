CommentType = GraphQL::ObjectType.define do
  name 'Comment'
  description 'A single comment for a project'
  field :id, types.ID, 'The ID of the comment'
  field :body, types.String, 'The body of the comment'
  field :created_at, types.String, 'The date the comment was created'
  field :user, UserType, 'Owner of the comment'
  field :project, ProjectType, 'Project that the comment belongs to'
end
