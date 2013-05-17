class QuestionMailer < ActionMailer::Base
  default from: "team.ask.angie@gmail.com"

  def answer_notification(answer)
    @greeting = "Hi. Thanks for joining AskAngie!"
    @answer = answer
    @question_owner = answer.question.user

    mail to: @question_owner.email, bcc: "slicebo123@gmail.com", subject: "Somebody has responded to your question!"
  end
end
