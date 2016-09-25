class Project < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates_presence_of :body, :user_id, :slug
end
