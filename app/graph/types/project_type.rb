ProjectType = GraphQL::ObjectType.define do
  name 'Project'
  description 'A single projects entry returns a project with author and comments'
  # Expose fields associated with Post model
  field :id, types.ID, 'The id of this project'
  field :title, types.String, 'The title of this project'
  field :url, types.String, 'The URL of the project'
  field :description, types.String, 'The description of this project'
  field :body, types.String, 'The body of the project code'
  field :slug, types.String, 'The slug of this project'
  field :created_at, types.String, 'The time at which this project was created'
  field :comments, types[CommentType], 'Comments associated with the project'
  field :user, UserType, 'Owner of this project'
end
