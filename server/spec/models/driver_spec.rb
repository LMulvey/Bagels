require 'rails_helper'

RSpec.describe Driver, :type => :model do

  it 'has a valid factory' do
    expect(FactoryBot.create(:driver)).to be_valid
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { should have_many(:tickets) }
  end
end