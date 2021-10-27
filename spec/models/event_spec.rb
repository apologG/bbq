require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:all) do
    @event = FactoryBot.build(:event)
  end
  
  context "valid Factory" do
    it "has a valid factory" do
      expect(@event).to be_valid
    end
  end

  context "check Validation" do 
    it {should validate_presence_of :title }
    it {should validate_presence_of :address }
    it {should validate_presence_of :datetime }
    it {should validate_presence_of :user } 
  end

  context 'associations' do
    it { should belong_to(:user).class_name('User') }
  end

  context 'pincode_valid?' do 
    it 'pincode is valid' do 
      @event.pincode_valid?('1234')
    end
  end
end
