require 'spec_helper'
require 'debugger'

describe 'Question', :js => true do

  let(:question) { FactoryGirl.build(:question) }

  describe "#index" do
    it "should show questions" do
      question.save
      visit root_path
      page.should have_content question.title
      page.should have_content question.body
      page.should have_content question.user.username.capitalize
    end
  end

  describe "#create" do

    let(:title) {"Valid Question - Title"}
    let(:body) {"Valid Question - Body"}

    before do #before defaults to (:each)
      User.create(username: "Tester", email: "test@test.com", password: "password", gender: 'male')
      Topic.create(title: 'Test')

      visit login_users_path

      fill_in 'user_username', with: "Tester" # user_username is id of form field
      fill_in 'user_password', with: "password"
      click_button 'Login!'
    end

    context "with valid input" do
      it "creates a new Question and view it" do
        visit new_question_path

        expect {
          fill_in 'question_title', with: title
          fill_in 'question_body', with: body
          click_button 'ask question'
          }.to change(Question, :count).by(1)

          page.should have_content(title.capitalize)
          page.should have_content(body.capitalize)
        end
      end


      context "with invalid input" do
        it "throws an error when not given the right fields" do
          visit new_question_path

          expect {
            fill_in 'question_title', with: title
            click_button 'ask question'
            }.to_not change(Question, :count)

            page.should have_content ("Not a valid question. Please try again.")
          end
        end

      end
    end


