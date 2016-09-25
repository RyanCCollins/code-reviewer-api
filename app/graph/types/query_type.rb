# type Query {
#   feed: Project
#   project(id: ID!)
#   comment(id: ID!)
# }
QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The query root of this schema.'

  # Get Project by ID
  field :projectsFeed, types[ProjectType] do
    argument :limit, types.Int
    resolve -> (obj, args, ctx) {
      projects = Project.all
      args[:limit] && projects = projects.limit(args[:limit])
      projects
    }
  end
  field :project,
        ProjectType,
        field: FetchField.new(model: Project, type: ProjectType)
  field :comment,
        CommentType,
        field: FetchField.new(model: Comment, type: CommentType)
end
