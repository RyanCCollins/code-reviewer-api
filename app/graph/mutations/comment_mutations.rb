# mutation createComment($project_id:ID!, $body:String!) {
#   CreateComment(input:{project_id:$project_id, body:$body}) {
#     project {
#       id
#     }
#   }
# }
module CommentMutations
  Create = GraphQL::Relay::Mutation.define do
    name 'CreateComment'
    description 'Create a comment'

    input_field :project_id, !types.ID
    input_field :body, !types.String

    return_field :commentEdge, CommentType.edge_type
    return_field :project, ProjectType

    resolve -> (inputs, ctx) {
      user = ctx[:current_user]
      project = Project.find_by_id(inputs[:project_id])
      comment = project.comments.create({
        body: inputs[:body],
        user: user
      })
      comments_connection = GraphQL::Relay::RelationConnection.new(
        project.comments,
        {}
      )
      edge = GraphQL::Relay::Edge.new(
        comment,
        comments_connection
      )
      {
        commentEdge: edge,
        project: project
      }
    }
  end
end
