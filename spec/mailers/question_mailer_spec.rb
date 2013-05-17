require "spec_helper"

describe QuestionMailer do
  describe "answer_notification" do

    before do 
      let(:user) { FactoryGirl.create(:user) }
      let(:answer) { FactoryGirl.create(:answer)}
      let(:question) { FactoryGirl.create(:question)}
      let(:mail) { QuestionMailer.answer_notification(answer) }
    end

    it "renders the headers" do
      mail.subject.should eq("Somebody has responded to your question!")
      mail.to.should eq([user.email])
      mail.from.should eq(["team.ask.angie@gmail.com"])
    end

    it "renders the body" do
      mail.body.encoded.should include("Somebody has responded to your question.")
    end
  end

end
