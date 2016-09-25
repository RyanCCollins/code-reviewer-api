require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'should not be valid without a User' do
    expect(Project.new).to_not be_valid
  end
  it 'should be valid with valid attributes' do
    user_model = User.create(
      name: 'Ryan Collins',
      email: 'Admin@ryancollins.io',
      password: 'password'
    )
    expect(
      Project.create(
        slug: 'hello-world',
        user: user_model,
        url: 'helloworld.com'
      )
    ).to be_valid
  end
end
