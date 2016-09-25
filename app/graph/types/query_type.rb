QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The query root of this schema.'

  # Get Project by ID
  field :project, ProjectType do
    argument :id, !types.ID
    description 'Root object to get viewer related collections'
    resolve -> (obj, args, ctx) {
      Project.find(args['id'])
    }
  end
  field :comment, CommentType do
    argument :id, !types.ID
    description 'Root field to get comments'
    resolve -> (obj, args, ctx) {
      Comment.find(args['id'])
    }
  end
end
