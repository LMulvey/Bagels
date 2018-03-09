require 'rails_helper'

RSpec.describe Event, :type => :model do

  it 'has a valid factory' do
    expect(FactoryBot.create(:event)).to be_valid
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of :status }
    it { is_expected.to validate_presence_of :address }
    it { is_expected.to validate_presence_of :event_type }
    it { is_expected.to validates_datetime :start_time }
    it { is_expected.to validates_datetime :stop_time }
  end

  context 'model enums' do
    it { should define_enum_for(:event_type).
      with([:start, :pickup, :delivery, :stop]) }
    it { should define_enum_for(:status).
      with([:active, :completed]) }

  end

end