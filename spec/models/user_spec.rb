require 'spec_helper'

describe User do
 
  describe "User Presence" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:gender) }
  end

  describe "User Relationships" do 
    it {should have_many(:answers)}
    it {should have_many(:questions)}
    it {should have_many(:votes)}
  end

  describe "User Contraints" do
    before do
      FactoryGirl.create(:user)
    end

    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:username) }
  end

end
