class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates_presence_of :body, :user_id, :project_id
end
