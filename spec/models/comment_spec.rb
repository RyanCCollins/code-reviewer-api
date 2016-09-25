require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'should not be valid without a body' do
    expect(Comment.new(body: nil, user: nil, project: nil)).to_not be_valid
  end
end
