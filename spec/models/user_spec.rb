require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_user) { User.create(username: "Ruby")}
  let(:invalid_user) { User.create(username: nil)}

  it 'should be valid with a name' do
    expect(valid_user).to be_valid
  end

  it 'should be invalid without a name' do
    expect(invalid_user).not_to be_valid
  end

  it 'should have many languages' do
    expect(valid_user).to respond_to(:languages)
    expect(valid_user.languages.class).to eq(Language::ActiveRecord_Associations_CollectionProxy)
  end
end
