class QuestionMailer < ActionMailer::Base
  default from: "team.ask.angie@gmail.com"

  def answer_notification(answer)
    @answer = answer
    @question = answer.question.title
    @body = answer.body
    @question_owner = answer.question.user

    mail to: @question_owner.email, 
    bcc: "team.ask.angie@gmail.com", 
    subject: "Somebody has responded to your question!"
  end
end
