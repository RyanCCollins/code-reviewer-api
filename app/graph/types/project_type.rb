ProjectType = GraphQL::ObjectType.define do
  name 'Project'
  description 'A single post entry returns a post with author, total votes and comments'
  # Expose fields associated with Post model
  field :id, types.ID, 'The id of this project'
  field :title, types.String, 'The title of this project'
  field :url, types.String, 'The URL of the project'
  field :description, types.String, 'The description of this project'
  field :slug, types.String, 'The slug of this project'
  field :comments_count,
        types.String,
        'The total number of comments on this project'
  field :created_at, types.String, 'The time at which this project was created'
  field :user, UserType, 'Owner of this project'
end
