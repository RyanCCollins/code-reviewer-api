require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should be valid with valid attributes' do
    user_model = User.create(
      name: 'Ryan Collins',
      email: 'Admin@ryancollins.io',
      password: 'password'
    )
    expect(user_model).to be_valid
  end
end
