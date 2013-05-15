require 'spec_helper'

describe Question do

  let(:question) { FactoryGirl.build(:question) }
  subject { question }


  describe "#index" do
    it "should show questions" do
      pending

    end
  end

  describe "#create" do
    context "with valid input" do
      it "creates a new Question" do
        pending

      end
    end

    context "with invalid input" do
      it "throws an error when not given the right fields" do
        pending

      end
    end
  end
end
