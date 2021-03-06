ViewerType = GraphQL::ObjectType.define do
  # Hack to support root queries
  name 'Viewer'
  description 'Support unassociated root queries that fetches collections.'
  interfaces [NodeIdentification.interface]

  # `id` exposes the UUID
  global_id_field :id
end

ViewerType.fields['current_user'] = CurrentUserField
