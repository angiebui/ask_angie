class AnswersController < ApplicationController
  before_filter :get_question

  def get_question
    @question = Question.find(params[:question_id])
  end

  def create
    @answer = @question.answers.new(params[:answer])
    if @answer.save
      redirect_to @question
    else
      "Error here"
    end
  end

end
