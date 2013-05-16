class QuestionMailer < ActionMailer::Base
  default from: "team.ask.angie@gmail.com"

  def answer_notification(answer)
    @greeting = "Hi. Thanks for joining AskAngie!"
    @answer = answer
    @text = answer.body
    @question_owner = answer.question.user
    @answer_owner = answer.user

    mail to: "angiebui@gmail.com", bcc: "slicebo123@gmail.com", subject: "Somebody has responded to your question!"
  end
end
