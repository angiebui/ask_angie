require 'spec_helper'

describe 'Question' do

  let(:question) { FactoryGirl.build(:question) }
  subject { question }

  describe "#index" do
    it "should show questions" do
      pending

    end
  end

  describe "#create" do

    context "with valid input" do
      it "creates a new Question and views it" do
        visit new_question_path

        expect {
          fill_in 'question_title', with: "Ruby Question"
          fill_in 'question_body', with: "what is ruby?"
          click_button 'ask question'
          }.to change(Question, :count).by(1)

          page.should have_content("Ruby Question")
          page.should have_content("what is ruby?")

        # as a user, submitting valid question input, we should enter Q into db, and see it 
      end
    end
  end

  context "with invalid input" do
    it "throws an error when not given the right fields" do
      visit new_question_path

    end
  end
end


