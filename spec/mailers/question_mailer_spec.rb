require "spec_helper"

describe QuestionMailer do
  describe "answer_notification" do

    let(:answer) { FactoryGirl.create(:answer)}
    let(:mail) { QuestionMailer.answer_notification(answer) }
    
    it "renders the headers" do
      mail.subject.should eq("Somebody has responded to your question!")
      mail.to.should eq([answer.question.user.email])
      mail.from.should eq(["team.ask.angie@gmail.com"])
    end

    it "renders the body" do
      mail.body.encoded.should include("Somebody has responded to your question")
    end
  end

end
