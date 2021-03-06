require 'rails_helper'

RSpec.describe Event, :type => :model do

  it 'has a valid factory' do
    expect(FactoryBot.create(:event)).to be_valid
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of :event_type }
    it { is_expected.to validates_datetime :start_time }
    it { should belong_to(:ticket) }
  end

  context 'model enums' do
    it { should define_enum_for(:event_type).
      with([:start, :pickup, :delivery, :stop]) }
  end
end