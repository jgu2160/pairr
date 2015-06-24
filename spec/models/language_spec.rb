require 'rails_helper'

RSpec.describe Language, type: :model do
  let(:valid_language) { Language.create(name: "Ruby")}
  let(:invalid_language) { Language.create(name: nil)}

  it 'should be valid with a name' do
    expect(valid_language).to be_valid
  end

  it 'should be invalid without a name' do
    expect(invalid_language).not_to be_valid
  end
end
