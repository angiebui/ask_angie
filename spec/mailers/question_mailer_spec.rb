require "spec_helper"

describe QuestionMailer do
  describe "answer_notificiation" do
    let(:mail) { QuestionMailer.answer_notificiation }

    it "renders the headers" do
      mail.subject.should eq("Answer notificiation")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
