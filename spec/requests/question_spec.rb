require 'spec_helper'
require 'debugger'

describe 'Question', :js => true do

  let(:question) { FactoryGirl.build(:question) }

  describe "#index" do
    it "should show questions" do
      visit 

    end
  end

  describe "#create" do

    before do #before defaults to (:each)
      User.create(username: "Tester", email: "test@test.com", password: "password", gender: 'male')
      visit login_users_path

      fill_in 'user_username', with: "Tester" # user_username is id of form field
      fill_in 'user_password', with: "password"
      click_button 'Login!'
    end

    context "with valid input" do
      it "creates a new Question and view it" do
        visit new_question_path

        expect {
          fill_in 'question_title', with: "Valid Question - Title"
          fill_in 'question_body', with: "Valid Question - Body"
          click_button 'ask question'
          }.to change(Question, :count).by(1)

          page.should have_content("Valid Question - Title")
          page.should have_content("Valid Question - Body")

        # as a user, submitting valid question input, we should enter Q into db, and see it 
      end
    end


    context "with invalid input" do
      it "throws an error when not given the right fields" do
        visit new_question_path

        expect {
          fill_in 'question_title', with: "Invalid Question - Title"
          click_button 'ask question'
          }.to_not change(Question, :count)

       page.should have_content ("Not a valid question. Please try again") ##currently will fail because user is not logged in, will give different error
     end
   end
 
 end
end


