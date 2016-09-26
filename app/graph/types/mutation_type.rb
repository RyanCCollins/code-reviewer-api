MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :CreateProject, field: ProjectMutations::Create.field
  field :EditProject, field: ProjectMutations::Edit.field
  field :DestroyProject, field: ProjectMutations::Destroy.field

  field :CreateComment, field: CommentMutations::Create.field
end
