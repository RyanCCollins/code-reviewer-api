require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'should not be valid without a body' do
    u = User.first
    p = Project.first
    expect(Comment.new(body: nil, user: u, project: p)).to_not be_valid
  end
  it 'should be valid with valid attributes' do
    u = User.create(
      name: 'Ryan Collins',
      email: 'admin@ryancollins.io',
      password: 'password'
    )
    p = Project.create(
      title: 'hehe',
      user: u
    )
    b = 'Hello world'
    expect(Comment.create(body: b, user: u, project: p)).to be_valid
  end
end
