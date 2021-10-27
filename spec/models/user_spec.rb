require 'rails_helper'

RSpec.describe User do

  before(:all) do 
    @user = FactoryBot.build(:user)
  end

  context "valid Factory" do
    it "has a valid factory" do
      expect(@user).to be_valid
    end
  end

  context 'validations check' do
    it { should validate_presence_of :email }
  end

  context 'associations' do
    it { should have_many(:events).class_name('Event') }
  end
  
  context 'set_name' do 
    it 'should set user name' do 
      @user.name.present?
    end
  end
end
