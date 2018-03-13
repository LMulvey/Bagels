require 'rails_helper'

RSpec.describe Ticket, :type => :model do

  it 'has a valid factory' do
    expect(FactoryBot.create(:ticket)).to be_valid
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :status }
    it { is_expected.to validates_datetime :start_time }
    it { is_expected.to validates_datetime :completed_time }
    it { should belong_to(:driver) }
    it { should have_many(:events) }
  end

  context 'model enums' do
    it { should define_enum_for(:status).
      with([:active, :completed]) }

  end

end