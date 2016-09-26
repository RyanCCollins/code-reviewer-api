# mutation createProject($title:String!, $body:String!, $url:String!, $description:String!) {
#   CreateProject(input:{ title:$title, body:$body, url:$url, description: $description }) {
#     project{
#       id
#       title
#       user {
#         id
#         name
#         avatar
#       }
#     }
#   }
# }
module ProjectMutations
  Create = GraphQL::Relay::Mutation.define do
    name 'CreateProject'
    description 'Create a project entry'

    input_field :title, !types.String
    input_field :url, !types.String
    input_field :description, types.String
    input_field :body, types.String

    return_field :project, ProjectType

    resolve -> (inputs, ctx) {
      user = ctx[:current_user]
      project = user.projects.create(
        title: inputs[:title],
        description: inputs[:description],
        body: inputs[:body],
        url: inputs[:url]
      )
      {
        project: project
      }
    }
  end
  Destroy = GraphQL::Relay::Mutation.define do
    name 'DestroyProject'
    description 'Delete a project'
    input_field :id, !types.ID

    return_field :deletedId, !types.ID
    resolve -> (input, _) {
      project = Project.find_by_id(input[:id])
      project.destroy
      {
        deletedId: input[:id]
      }
    }
  end
  Edit = GraphQL::Relay::Mutation.define do
    name 'EditProject'
    description 'Edit a project'

    input_field :id, !types.ID

    return_field :project, ProjectType

    resolve -> (input, _) {
      project = Project.find_by_id(input[:id])
      valid_inputs = inputs.instance_variable_get(:@argument_values).select {
        |k, _| project.respond_to? "#{k}="
      }.except('id')
      project.update(valid_inputs)
      {
        project: project
      }
    }
  end
end
