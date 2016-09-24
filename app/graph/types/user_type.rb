UserType = GraphQL::ObjectType.define do
  name "User"
  desciption "A user entry, returning basic user information"
  field :id, types.ID, "This id of this user"
  field :name, types.String, "The name of this user"
  field :email, types.String,  "The email of this user"
  field :created_at, types.String,  "The date this user created an account"
end
