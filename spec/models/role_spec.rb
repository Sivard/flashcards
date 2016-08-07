require 'rails_helper'

RSpec.describe Role, type: :model do
  it 'create role' do
    card = Role.create(name: 'admin')
    expect(Role.count).to eq(1)
  end
end
